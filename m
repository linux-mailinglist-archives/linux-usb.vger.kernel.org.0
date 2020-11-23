Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D23F2C16F3
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 21:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgKWUiz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 15:38:55 -0500
Received: from netrider.rowland.org ([192.131.102.5]:57203 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727847AbgKWUiz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 15:38:55 -0500
Received: (qmail 721577 invoked by uid 1000); 23 Nov 2020 15:38:53 -0500
Date:   Mon, 23 Nov 2020 15:38:53 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
Cc:     linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: memory leak in hub_event
Message-ID: <20201123203853.GB720000@rowland.harvard.edu>
References: <20201123195307.GA720000@rowland.harvard.edu>
 <000000000000b1a48005b4cba75e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000b1a48005b4cba75e@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 12:01:08PM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> memory leak in usb_set_configuration
> 
> BUG: memory leak
> unreferenced object 0xffff88812695d400 (size 1024):
>   comm "kworker/1:2", pid 3876, jiffies 4294944657 (age 14.950s)
>   hex dump (first 32 bytes):
>     c8 ee 8d 26 81 88 ff ff c8 ee 8d 26 81 88 ff ff  ...&.......&....
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000e23bdd53>] kmalloc include/linux/slab.h:552 [inline]
>     [<00000000e23bdd53>] kzalloc include/linux/slab.h:664 [inline]
>     [<00000000e23bdd53>] usb_set_configuration+0x18c/0xb90 drivers/usb/core/message.c:1987
>     [<0000000075483a2c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<00000000e7052b0c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293

Also bad.  That doesn't leave many possibilities.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4d02da97

Index: usb-devel/drivers/media/usb/gspca/gspca.c
===================================================================
--- usb-devel.orig/drivers/media/usb/gspca/gspca.c
+++ usb-devel/drivers/media/usb/gspca/gspca.c
@@ -1489,7 +1489,9 @@ int gspca_dev_probe2(struct usb_interfac
 	}
 
 	gspca_dev->v4l2_dev.release = gspca_release;
+// Good
 	ret = v4l2_device_register(&intf->dev, &gspca_dev->v4l2_dev);
+	ret = -EIO;
 	if (ret)
 		goto out;
 	gspca_dev->present = true;
@@ -1518,6 +1520,7 @@ int gspca_dev_probe2(struct usb_interfac
 	q->min_buffers_needed = 2;
 	q->lock = &gspca_dev->usb_lock;
 	ret = vb2_queue_init(q);
+// Bad
 	if (ret)
 		goto out;
 	gspca_dev->vdev.queue = q;
