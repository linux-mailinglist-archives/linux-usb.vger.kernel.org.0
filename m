Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0A34784C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 05:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfFQDEH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jun 2019 23:04:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45350 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727464AbfFQDEH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 Jun 2019 23:04:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 97BA4308621C;
        Mon, 17 Jun 2019 03:04:06 +0000 (UTC)
Received: from localhost (ovpn-8-18.pek2.redhat.com [10.72.8.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 64D211001B2E;
        Mon, 17 Jun 2019 03:03:53 +0000 (UTC)
From:   Ming Lei <ming.lei@redhat.com>
To:     linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>,
        Christoph Hellwig <hch@lst.de>, Jim Gill <jgill@vmware.com>,
        Cathy Avery <cavery@redhat.com>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Brian King <brking@us.ibm.com>,
        James Smart <james.smart@broadcom.com>,
        "Juergen E . Fischer" <fischer@norbit.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-usb@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Benjamin Block <bblock@linux.ibm.com>,
        Ming Lei <ming.lei@redhat.com>
Subject: [PATCH V4 00/16] use sg helper to operate scatterlist
Date:   Mon, 17 Jun 2019 11:03:33 +0800
Message-Id: <20190617030349.26415-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 17 Jun 2019 03:04:07 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Scsi MQ makes a large static allocation for the first scatter gather
list chunk for the driver to use.  This is a performance headache we'd
like to fix by reducing the size of the allocation to a 2 element
array.  Doing this will break the current guarantee that any driver
using SG_ALL doesn't need to use the scatterlist iterators and can get
away with directly dereferencing the array.  Thus we need to update all
drivers to use the scatterlist iterators and remove direct indexing of
the scatterlist array before reducing the initial scatterlist
allocation size in SCSI.

So convert drivers to use scatterlist helper.

There are two types of direct access on scatterlist in SCSI drivers:

1) operate on the scatterlist via scsi_sglist(scmd) directly, then one
local variable of 'struct scatterlist *' is involved.

2) scsi_sglist(scmd) is stored to cmd->SCp.buffer and the scatterlist is
used via cmd->SCp.buffer.

The following coccinelle semantic patch is developed for finding the
above two types of direct scatterlist uses:

	@@ struct scatterlist *p; @@
	(
	- ++p
	+ p = sg_next(p)
	|
	- p++
	+ p = sg_next(p)
	|
	- p = p + 1
	+ p = sg_next(p)
	|
	- p += 1
	+ p = sg_next(p)
	|
	- --p
	+ p = sg_non_exist_prev(p)
	|
	- p--
	+ p = sg_non_exist_prev(p)
	|
	- p = p - 1
	+ p = sg_non_exist_prev(p)
	|
	- p -= 1
	+ p = sg_non_exist_prev(p)
	)
	
	@@
	struct scatterlist *p;
	expression data != 0;
	@@
	- p[data]
	+ '!!!!!!use sg iterator helper!!!!!!'
	
	@@
	struct scatterlist[] p;
	expression data != 0;
	@@
	- p[data]
	+ '!!!!!!use sg iterator helper!!!!!!'
	
	
	@@ struct scsi_cmnd *scmd; @@
	(
	-	scmd->SCp.buffer++
	+	scmd->SCp.buffer = sg_next(scmd->SCp.buffer)
	|
	-	++scmd->SCp.buffer
	+	scmd->SCp.buffer = sg_next(scmd->SCp.buffer)
	|
	-	scmd->SCp.buffer += 1
	+	scmd->SCp.buffer = sg_next(scmd->SCp.buffer)
	|
	-	scmd->SCp.buffer = scmd->SCp.buffer + 1
	+	scmd->SCp.buffer = sg_next(scmd->SCp.buffer)
	|
	-	scmd->SCp.buffer--
	+	scmd->SCp.buffer = sg_no_exit_prev(scmd->SCp.buffer)
	|
	-	--scmd->SCp.buffer
	+	scmd->SCp.buffer = sg_no_exit_prev(scmd->SCp.buffer)
	|
	-	scmd->SCp.buffer -= 1
	+	scmd->SCp.buffer = sg_no_exit_prev(scmd->SCp.buffer)
	|
	-	scmd->SCp.buffer = scmd->SCp.buffer - 1
	+	scmd->SCp.buffer = sg_no_exit_prev(scmd->SCp.buffer)
	)
	
	@@
	struct scsi_cmnd *scmd;
	expression data != 0;
	@@
	- scmd->SCp.buffer[data]
	+ '!!!!!!use sg iterator helper!!!!!!'


The 1st 10 patches are for handling type #1, and the other 6 patches
for handling type #2, and all the 16 are found by the above coccinelle
semantic patch.

V4:
	- fix building failure on pmcraid's conversion 
	- improve the coccinelle semantic patch to cover both two types of
	scatterlist direct use
	- driver 'staging: rtsx' is covered

V3:
	- update commit log and cover letter, most of words are from
	James Bottomley	

V2:
	- use coccinelle semantic patch for finding direct sgl uses from
	scsi command(9 drivers found)
	- run 'git grep -E "SCp.buffer"' to find direct sgl uses
	from SCp.buffer(6 drivers are found)


Finn Thain (1):
  NCR5380: Support chained sg lists

Ming Lei (15):
  scsi: vmw_pscsi: use sg helper to operate scatterlist
  scsi: advansys: use sg helper to operate scatterlist
  scsi: lpfc: use sg helper to operate scatterlist
  scsi: mvumi: use sg helper to operate scatterlist
  scsi: ipr: use sg helper to operate scatterlist
  scsi: pmcraid: use sg helper to operate scatterlist
  usb: image: microtek: use sg helper to operate scatterlist
  staging: unisys: visorhba: use sg helper to operate scatterlist
  staging: rtsx: use sg helper to operate scatterlist
  s390: zfcp_fc: use sg helper to operate scatterlist
  scsi: aha152x: use sg helper to operate scatterlist
  scsi: imm: use sg helper to operate scatterlist
  scsi: pcmcia: nsp_cs: use sg helper to operate scatterlist
  scsi: ppa: use sg helper to operate scatterlist
  scsi: wd33c93: use sg helper to operate scatterlist

 drivers/s390/scsi/zfcp_fc.c                   |  4 +-
 drivers/scsi/NCR5380.c                        | 41 ++++++++----------
 drivers/scsi/advansys.c                       |  2 +-
 drivers/scsi/aha152x.c                        | 42 +++++++++----------
 drivers/scsi/imm.c                            |  2 +-
 drivers/scsi/ipr.c                            | 28 +++++++------
 drivers/scsi/lpfc/lpfc_nvmet.c                |  3 +-
 drivers/scsi/mvumi.c                          |  9 ++--
 drivers/scsi/pcmcia/nsp_cs.c                  |  4 +-
 drivers/scsi/pmcraid.c                        | 14 +++----
 drivers/scsi/ppa.c                            |  2 +-
 drivers/scsi/vmw_pvscsi.c                     |  2 +-
 drivers/scsi/wd33c93.c                        |  2 +-
 drivers/staging/rts5208/rtsx_transport.c      |  4 +-
 .../staging/unisys/visorhba/visorhba_main.c   |  9 ++--
 drivers/usb/image/microtek.c                  | 20 ++++-----
 drivers/usb/image/microtek.h                  |  2 +-
 17 files changed, 90 insertions(+), 100 deletions(-)

-- 
2.20.1

