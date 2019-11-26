Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583761097D7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 03:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKZCdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 21:33:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52673 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727307AbfKZCdN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 21:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574735592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RbRdWBhJ4blUfXgXJEf9JYkRJ6P4wp0pBcRs6Ey3L2A=;
        b=grBvN1nBwOl2XSc1CBqT3/vd32FnMiKBvYkbCqBQh0E6J1ICWB+Agf4wdvH24ovca7MHXB
        /ijBJTRaVW/tpekC0JbVRhTz4g0Nro4TWRZsJWaYGMzW5DlTGttD7S4n5MxtYrz7R8RnVJ
        r0JLqKekVWts2IB2pQ0tPZiEjt0prME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-ATDMGVSrPGWP4Ti-y8ZjIw-1; Mon, 25 Nov 2019 21:33:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153B5100550D;
        Tue, 26 Nov 2019 02:33:08 +0000 (UTC)
Received: from ming.t460p (ovpn-8-20.pek2.redhat.com [10.72.8.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A0C95C1D8;
        Tue, 26 Nov 2019 02:32:57 +0000 (UTC)
Date:   Tue, 26 Nov 2019 10:32:53 +0800
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
Message-ID: <20191126023253.GA24501@ming.t460p>
References: <20191109222828.GA30568@ming.t460p>
 <fa3b0cf1f88e42e1200101bccbc797e4e7778d58.camel@unipv.it>
 <20191123072726.GC25356@ming.t460p>
 <a9ffcca93657cbbb56819fd883c474a702423b41.camel@unipv.it>
 <20191125035437.GA3806@ming.t460p>
 <bf47a6c620b847fa9e27f8542eb761529f3e0381.camel@unipv.it>
 <20191125102928.GA20489@ming.t460p>
 <e5093535c60fd5dff8f92b76dcd52a1030938f62.camel@unipv.it>
 <20191125151535.GA8044@ming.t460p>
 <0876e232feace900735ac90d27136288b54dafe1.camel@unipv.it>
MIME-Version: 1.0
In-Reply-To: <0876e232feace900735ac90d27136288b54dafe1.camel@unipv.it>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ATDMGVSrPGWP4Ti-y8ZjIw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 25, 2019 at 07:51:33PM +0100, Andrea Vai wrote:
> Il giorno lun, 25/11/2019 alle 23.15 +0800, Ming Lei ha scritto:
> > On Mon, Nov 25, 2019 at 03:58:34PM +0100, Andrea Vai wrote:
> >=20
> > [...]
> >=20
> > > What to try next?
> >=20
> > 1) cat /sys/kernel/debug/block/$DISK/hctx0/flags
> result:
>=20
> alloc_policy=3DFIFO SHOULD_MERGE|2
>=20
> >=20
> >=20
> > 2) echo 128 > /sys/block/$DISK/queue/nr_requests and run your copy
> > 1GB
> > test again.
>=20
> done, and still fails. What to try next?

I just run 256M cp test to one USB storage device on patched kernel,
and WRITE data IO is really in ascending order. The filesystem is ext4,
and mount without '-o sync'. From previous discussion, looks that is
exactly your test setting. The order can be observed via the following scri=
pt:

#!/bin/sh
MAJ=3D$1
MIN=3D$2
MAJ=3D$(( $MAJ << 20 ))
DEV=3D$(( $MAJ | $MIN ))
/usr/share/bcc/tools/trace -t -C \
  't:block:block_rq_issue (args->dev =3D=3D '$DEV') "%s %d %d", args->rwbs,=
 args->sector, args->nr_sector'

$MAJ & $MIN can be retrieved via lsblk for your USB storage disk.

So I think we need to check if the patch is applied correctly first.

If your kernel tree is managed via git, please post 'git diff'.
Otherwise, share us your kernel version, and I will send you one
backported patch on the kernel version.

Meantime, you can collect IO order log via the above script as you did last
time, then send us the log.

Thanks,
Ming

