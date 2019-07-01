Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E862345211
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 04:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfFNCx4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 22:53:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52646 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfFNCx4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Jun 2019 22:53:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C52D53082E06;
        Fri, 14 Jun 2019 02:53:55 +0000 (UTC)
Received: from localhost (ovpn-8-21.pek2.redhat.com [10.72.8.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 560B14E6C5;
        Fri, 14 Jun 2019 02:53:46 +0000 (UTC)
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
Subject: [PATCH V3 04/15] scsi: mvumi: use sg helper to operate scatterlist
Date:   Fri, 14 Jun 2019 10:53:05 +0800
Message-Id: <20190614025316.7360-5-ming.lei@redhat.com>
In-Reply-To: <20190614025316.7360-1-ming.lei@redhat.com>
References: <20190614025316.7360-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 14 Jun 2019 02:53:55 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the scatterlist iterators and remove direct indexing of the
scatterlist array.

This way allows us to pre-allocate one small scatterlist, which can be
chained with one runtime allocated scatterlist if the pre-allocated one
isn't enough for the whole request.

Reviewed-by: Ewan D. Milne <emilne@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/scsi/mvumi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index a5410615edac..0022cd31500a 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -211,8 +211,7 @@ static int mvumi_make_sgl(struct mvumi_hba *mhba, struct scsi_cmnd *scmd,
 	unsigned int sgnum = scsi_sg_count(scmd);
 	dma_addr_t busaddr;
 
-	sg = scsi_sglist(scmd);
-	*sg_count = dma_map_sg(&mhba->pdev->dev, sg, sgnum,
+	*sg_count = dma_map_sg(&mhba->pdev->dev, scsi_sglist(scmd), sgnum,
 			       scmd->sc_data_direction);
 	if (*sg_count > mhba->max_sge) {
 		dev_err(&mhba->pdev->dev,
@@ -222,12 +221,12 @@ static int mvumi_make_sgl(struct mvumi_hba *mhba, struct scsi_cmnd *scmd,
 			     scmd->sc_data_direction);
 		return -1;
 	}
-	for (i = 0; i < *sg_count; i++) {
-		busaddr = sg_dma_address(&sg[i]);
+	scsi_for_each_sg(scmd, sg, *sg_count, i) {
+		busaddr = sg_dma_address(sg);
 		m_sg->baseaddr_l = cpu_to_le32(lower_32_bits(busaddr));
 		m_sg->baseaddr_h = cpu_to_le32(upper_32_bits(busaddr));
 		m_sg->flags = 0;
-		sgd_setsz(mhba, m_sg, cpu_to_le32(sg_dma_len(&sg[i])));
+		sgd_setsz(mhba, m_sg, cpu_to_le32(sg_dma_len(sg)));
 		if ((i + 1) == *sg_count)
 			m_sg->flags |= 1U << mhba->eot_flag;
 
-- 
2.20.1

