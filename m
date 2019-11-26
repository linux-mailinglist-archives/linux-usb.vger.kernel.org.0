Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB2C109C40
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 11:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfKZKZS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 05:25:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20164 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727768AbfKZKZS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Nov 2019 05:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574763917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DaWDAOiOvm1/YuatM0Zm+zYO/Zj5fXF1Y2yglnyRyKk=;
        b=D30O1Lo01Ef8viunxgAznO4K4GgYHcL5GPoYSnupebpNw3nOQPtxBjPDsCOLwWp87FgAL7
        jzX+vE1xYWHAuYfUoPFd9qLln2skI79ynCGrIcUJxDjr+6iWW6Td21E4WIB+Px+oCpyG1g
        njVPgCxLHO45ChW+p60hp9N8W8TuFFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-B9I-nkRBN26Q1LXyScDyCA-1; Tue, 26 Nov 2019 05:25:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625A0106B69D;
        Tue, 26 Nov 2019 10:25:09 +0000 (UTC)
Received: from ming.t460p (ovpn-8-18.pek2.redhat.com [10.72.8.18])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F3110246E3;
        Tue, 26 Nov 2019 10:24:59 +0000 (UTC)
Date:   Tue, 26 Nov 2019 18:24:54 +0800
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
Message-ID: <20191126102454.GC32135@ming.t460p>
References: <a9ffcca93657cbbb56819fd883c474a702423b41.camel@unipv.it>
 <20191125035437.GA3806@ming.t460p>
 <bf47a6c620b847fa9e27f8542eb761529f3e0381.camel@unipv.it>
 <20191125102928.GA20489@ming.t460p>
 <e5093535c60fd5dff8f92b76dcd52a1030938f62.camel@unipv.it>
 <20191125151535.GA8044@ming.t460p>
 <0876e232feace900735ac90d27136288b54dafe1.camel@unipv.it>
 <20191126023253.GA24501@ming.t460p>
 <0598fe2754bf0717d81f7e72d3e9b3230c608cc6.camel@unipv.it>
 <20191126091533.GB32135@ming.t460p>
MIME-Version: 1.0
In-Reply-To: <20191126091533.GB32135@ming.t460p>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: B9I-nkRBN26Q1LXyScDyCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 26, 2019 at 05:15:33PM +0800, Ming Lei wrote:
> On Tue, Nov 26, 2019 at 08:46:07AM +0100, Andrea Vai wrote:
> > Il giorno mar, 26/11/2019 alle 10.32 +0800, Ming Lei ha scritto:
> > > On Mon, Nov 25, 2019 at 07:51:33PM +0100, Andrea Vai wrote:
> > > > Il giorno lun, 25/11/2019 alle 23.15 +0800, Ming Lei ha scritto:
> > > > > On Mon, Nov 25, 2019 at 03:58:34PM +0100, Andrea Vai wrote:
> > > > >=20
> > > > > [...]
> > > > >=20
> > > > > > What to try next?
> > > > >=20
> > > > > 1) cat /sys/kernel/debug/block/$DISK/hctx0/flags
> > > > result:
> > > >=20
> > > > alloc_policy=3DFIFO SHOULD_MERGE|2
> > > >=20
> > > > >=20
> > > > >=20
> > > > > 2) echo 128 > /sys/block/$DISK/queue/nr_requests and run your
> > > copy
> > > > > 1GB
> > > > > test again.
> > > >=20
> > > > done, and still fails. What to try next?
> > >=20
> > > I just run 256M cp test
> >=20
> > I would like to point out that 256MB is a filesize that usually don't
> > trigger the issue (don't know if it matters, sorry).
>=20
> OK.
>=20
> I tested 256M because IO timeout is often triggered in case of
> qemu-ehci, and it is a long-term issue. When setting up the disk
> via xhci-qemu, the max request size is increased to 1MB from 120KB,
> and IO pattern changed too. When the disk is connected via uhci-qemu,
> the transfer is too slow(1MB/s) because max endpoint size is too small.
>=20
> However, I just waited 16min and collected all the 1GB IO log by
> connecting disk over uhci-qemu, but the sector of each data IO
> is still in order.
>=20
> >=20
> > Another info I would provide is about another strange behavior I
> > noticed: yesterday I ran the test two times (as usual with 1GB
> > filesize) and took 2370s, 1786s, and a third test was going on when I
> > stopped it. Then I started another set of 100 trials and let them run
> > tonight, and the first 10 trials were around 1000s, then gradually
> > decreased to ~300s, and finally settled around 200s with some trials
> > below 70-80s. This to say, times are extremely variable and for the
> > first time I noticed a sort of "performance increase" with time.
>=20
> The 'cp' test is buffered IO, can you reproduce it every time by
> running copy just after fresh mount on the USB disk?
>=20
> >=20
> > >  to one USB storage device on patched kernel,
> > > and WRITE data IO is really in ascending order. The filesystem is
> > > ext4,
> > > and mount without '-o sync'. From previous discussion, looks that is
> > > exactly your test setting. The order can be observed via the
> > > following script:
> > >=20
> > > #!/bin/sh
> > > MAJ=3D$1
> > > MIN=3D$2
> > > MAJ=3D$(( $MAJ << 20 ))
> > > DEV=3D$(( $MAJ | $MIN ))
> > > /usr/share/bcc/tools/trace -t -C \
> > >   't:block:block_rq_issue (args->dev =3D=3D '$DEV') "%s %d %d", args-
> > > >rwbs, args->sector, args->nr_sector'
> > >=20
> > > $MAJ & $MIN can be retrieved via lsblk for your USB storage disk.
> > >=20
> > > So I think we need to check if the patch is applied correctly first.
> > >=20
> > > If your kernel tree is managed via git,
> > yes it is,
> >=20
> > >  please post 'git diff'.
> > attached. Is it correctly patched? thanks.
>=20
> Yeah, it should be correct except for the change on __blk_mq_delay_run_hw=
_queue()
> is duplicated.
>=20
> >=20
> >=20
> > > Otherwise, share us your kernel version,
> > btw, is 5.4.0+
> >=20
> > >  and I will send you one
> > > backported patch on the kernel version.
> > >=20
> > > Meantime, you can collect IO order log via the above script as you
> > > did last
> > > time, then send us the log.
> >=20
> > ok, will try; is it just required to run it for a short period of time
> > (say, some seconds) during the copy, or should I run it before the
> > beginning (or before the mount?), and terminate it after the end of
> > the copy? (Please note that in the latter case a large amount of time
> > (and data, I suppose) would be involved, because, as said, to be sure
> > the problem triggers I have to use a large file... but we can try to
> > better understand and tune this. If it can help, you can get an ods
> > file with the complete statistic at [1] (look at the "prove_nov19"
> > sheet)).
>=20
> The data won't be very big, each line covers 120KB, and ~10K line
> is enough for cover 1GB transfer. Then ~300KB compressed file should
> hold all the trace.

Also use the following trace script this time:

#!/bin/sh

MAJ=3D$1
MIN=3D$2
MAJ=3D$(( $MAJ << 20 ))
DEV=3D$(( $MAJ | $MIN ))

/usr/share/bcc/tools/trace -t -C \
    't:block:block_rq_issue (args->dev =3D=3D '$DEV') "%s %d %d", args->rwb=
s, args->sector, args->nr_sector' \
    't:block:block_rq_insert (args->dev =3D=3D '$DEV') "%s %d %d", args->rw=
bs, args->sector, args->nr_sector'


Thanks,
Ming

