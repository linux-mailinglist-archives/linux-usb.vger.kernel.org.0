Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897FE2C14DE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 20:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgKWTxI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 14:53:08 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45215 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731141AbgKWTxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 14:53:08 -0500
Received: (qmail 720239 invoked by uid 1000); 23 Nov 2020 14:53:07 -0500
Date:   Mon, 23 Nov 2020 14:53:07 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
Cc:     linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: memory leak in hub_event
Message-ID: <20201123195307.GA720000@rowland.harvard.edu>
References: <20201123193230.GA718753@rowland.harvard.edu>
 <000000000000e9843a05b4cb6330@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000e9843a05b4cb6330@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 11:42:11AM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> memory leak in usb_set_configuration
> 
> BUG: memory leak
> unreferenced object 0xffff888125a13400 (size 1024):
>   comm "kworker/0:3", pid 8164, jiffies 4294944436 (age 13.610s)
>   hex dump (first 32 bytes):
>     08 c7 84 25 81 88 ff ff 08 c7 84 25 81 88 ff ff  ...%.......%....
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<0000000042c26fbc>] kmalloc include/linux/slab.h:552 [inline]
>     [<0000000042c26fbc>] kzalloc include/linux/slab.h:664 [inline]
>     [<0000000042c26fbc>] usb_set_configuration+0x18c/0xb90 drivers/usb/core/message.c:1987
>     [<00000000df7c22fc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<00000000dbc03c2e>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293

Okay, that looks like the original bug report, so this spot was bad.  
Here's another try, about halfway between the first two.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4d02da97

Index: usb-devel/drivers/media/usb/gspca/gspca.c
===================================================================
--- usb-devel.orig/drivers/media/usb/gspca/gspca.c
+++ usb-devel/drivers/media/usb/gspca/gspca.c
@@ -1489,6 +1489,7 @@ int gspca_dev_probe2(struct usb_interfac
 	}
 
 	gspca_dev->v4l2_dev.release = gspca_release;
+// Good
 	ret = v4l2_device_register(&intf->dev, &gspca_dev->v4l2_dev);
 	if (ret)
 		goto out;
@@ -1518,6 +1519,7 @@ int gspca_dev_probe2(struct usb_interfac
 	q->min_buffers_needed = 2;
 	q->lock = &gspca_dev->usb_lock;
 	ret = vb2_queue_init(q);
+	ret = -EIO;
 	if (ret)
 		goto out;
 	gspca_dev->vdev.queue = q;
@@ -1530,6 +1532,7 @@ int gspca_dev_probe2(struct usb_interfac
 	if (ret < 0)
 		goto out;
 	ret = sd_desc->init(gspca_dev);
+// Bad
 	if (ret < 0)
 		goto out;
 	if (sd_desc->init_controls)
