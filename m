Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 716471090D8
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 16:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbfKYPP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 10:15:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57443 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728399AbfKYPP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 10:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574694955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FZC4Tpkk+CwwwL93QU1+o+P6o/ZYTmixyeklL1zRZCY=;
        b=gAgopknFzMapF6Ud3+nITuCrxdO6Qez4j2xf2AnoJN+qOmyxPtARiIyGPebVOXAONuek2F
        H4V5ENFfrv4DWPmfC5MM7fRHtpMnelkJ5hXFNe0GvqA80Mil9xApWF1JeDtsiXZkx/7Ayp
        oWAQYWQ0yMzvFXWbAXmzEDyn8oiiP74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-cvZ0gjUlPAqUKcag45LBpg-1; Mon, 25 Nov 2019 10:15:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B31DDB60;
        Mon, 25 Nov 2019 15:15:50 +0000 (UTC)
Received: from ming.t460p (ovpn-8-17.pek2.redhat.com [10.72.8.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7621001B05;
        Mon, 25 Nov 2019 15:15:39 +0000 (UTC)
Date:   Mon, 25 Nov 2019 23:15:35 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans Holmberg <Hans.Holmberg@wdc.com>,
        Kernel development list <linux-kernel@vger.kernel.org>
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Message-ID: <20191125151535.GA8044@ming.t460p>
References: <BYAPR04MB58167B95AF6B7CDB39D24C52E7780@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CAOsYWL3NkDw6iK3q81=5L-02w=VgPF_+tYvfgnTihgCcwKgA+g@mail.gmail.com>
 <20191109222828.GA30568@ming.t460p>
 <fa3b0cf1f88e42e1200101bccbc797e4e7778d58.camel@unipv.it>
 <20191123072726.GC25356@ming.t460p>
 <a9ffcca93657cbbb56819fd883c474a702423b41.camel@unipv.it>
 <20191125035437.GA3806@ming.t460p>
 <bf47a6c620b847fa9e27f8542eb761529f3e0381.camel@unipv.it>
 <20191125102928.GA20489@ming.t460p>
 <e5093535c60fd5dff8f92b76dcd52a1030938f62.camel@unipv.it>
MIME-Version: 1.0
In-Reply-To: <e5093535c60fd5dff8f92b76dcd52a1030938f62.camel@unipv.it>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: cvZ0gjUlPAqUKcag45LBpg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 25, 2019 at 03:58:34PM +0100, Andrea Vai wrote:
> Il giorno lun, 25/11/2019 alle 18.29 +0800, Ming Lei ha scritto:
> > On Mon, Nov 25, 2019 at 11:11:00AM +0100, Andrea Vai wrote:
> > > Il giorno lun, 25/11/2019 alle 11.54 +0800, Ming Lei ha scritto:
> > > > On Sat, Nov 23, 2019 at 04:44:55PM +0100, Andrea Vai wrote:
> > > > > Il giorno sab, 23/11/2019 alle 15.28 +0800, Ming Lei ha
> > scritto:
> > > > > >=20
> > > > > > Please post the log of 'lsusb -v', and I will try to make a
> > > > patch
> > > > > > for
> > > > > > addressing the issue.
> > > > >=20
> > > > > attached,
> > > >=20
> > > > Please apply the attached patch, and re-build & install & reboot
> > > > kernel.
> > > >=20
> > > > This time, please don't switch io scheduler.
> > >=20
> > > # patch -p1 < usb.patch outputs:
> > >=20
> > > (Stripping trailing CRs from patch; use --binary to disable.)
> > > patching file block/blk-mq.c
> > > Hunk #1 succeeded at 1465 (offset 29 lines).
> > > Hunk #2 succeeded at 3061 (offset 13 lines).
> > > (Stripping trailing CRs from patch; use --binary to disable.)
> > > patching file drivers/scsi/scsi_lib.c
> > > Hunk #1 succeeded at 1902 (offset -37 lines).
> > > (Stripping trailing CRs from patch; use --binary to disable.)
> > > patching file drivers/usb/storage/scsiglue.c
> > > Hunk #1 succeeded at 651 (offset -10 lines).
> > > (Stripping trailing CRs from patch; use --binary to disable.)
> > > patching file include/linux/blk-mq.h
> > > Hunk #1 succeeded at 226 (offset -162 lines).
> > > (Stripping trailing CRs from patch; use --binary to disable.)
> > > patching file include/scsi/scsi_host.h
> > > patch unexpectedly ends in middle of line
> > > patch unexpectedly ends in middle of line
> > >=20
> > > Just to be sure I have to go on, is this correct? Sounds like an
> > error
> > > but I don't know if it is important.
> >=20
> > Looks there is small conflict, however it has been fixed by patch,
> > so
> > it is correct, please go on your test.
>=20
> Done, it still fails (2000 seconds or more to copy 1GB) :-(
>=20
> cat /sys/block/sdf/queue/scheduler outputs:
> [mq-deadline] none
>=20
> What to try next?

1) cat /sys/kernel/debug/block/$DISK/hctx0/flags

note: replace $DISK with disk name of your usb drive, such as, if it is
/dev/sdb, pass $DISK as sdb.

2) echo 128 > /sys/block/$DISK/queue/nr_requests and run your copy 1GB
test again.


Thanks,=20
Ming

