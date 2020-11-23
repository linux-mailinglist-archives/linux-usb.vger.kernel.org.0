Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA94C2C1483
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 20:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgKWTcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 14:32:32 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56525 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729388AbgKWTcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 14:32:31 -0500
Received: (qmail 719559 invoked by uid 1000); 23 Nov 2020 14:32:30 -0500
Date:   Mon, 23 Nov 2020 14:32:30 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: memory leak in hub_event
Message-ID: <20201123193230.GA718753@rowland.harvard.edu>
References: <CAAeHK+z0Lb_5zw-fQF6AXLzL=+P6kizOJ7yu=t4SP_5UPK66kg@mail.gmail.com>
 <00000000000031907005b4ca944b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000031907005b4ca944b@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[CC list trimmed.  I assume most people don't care about the boring 
debugging details.]

On Mon, Nov 23, 2020 at 10:44:06AM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> memory leak in rxrpc_lookup_local
> 
> write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
> write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
> BUG: memory leak
> unreferenced object 0xffff888117824d00 (size 256):
>   comm "syz-executor.6", pid 8896, jiffies 4294943994 (age 432.900s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 0a 00 00 00 00 00 ad 17 81 88 ff ff  ................
>   backtrace:
>     [<0000000069b066ee>] kmalloc include/linux/slab.h:552 [inline]
>     [<0000000069b066ee>] kzalloc include/linux/slab.h:664 [inline]
>     [<0000000069b066ee>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
>     [<0000000069b066ee>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
>     [<0000000085db7132>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
>     [<00000000a2a77c59>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
>     [<0000000086f4a248>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126

I don't know what all this rxrpc or afs stuff is about, but it doesn't 
seem to have anything to do with gspca.  So it's a good bet that the 
patch bailed out before the unreleased reference was acquired.

Let's try another spot.  Binary search should find the right place 
quickly enough.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4d02da97

Index: usb-devel/drivers/media/usb/gspca/gspca.c
===================================================================
--- usb-devel.orig/drivers/media/usb/gspca/gspca.c
+++ usb-devel/drivers/media/usb/gspca/gspca.c
@@ -1489,6 +1489,8 @@ int gspca_dev_probe2(struct usb_interfac
 	}
 
 	gspca_dev->v4l2_dev.release = gspca_release;
+//	ret = -EIO;
+//	goto out;
 	ret = v4l2_device_register(&intf->dev, &gspca_dev->v4l2_dev);
 	if (ret)
 		goto out;
@@ -1530,6 +1532,7 @@ int gspca_dev_probe2(struct usb_interfac
 	if (ret < 0)
 		goto out;
 	ret = sd_desc->init(gspca_dev);
+	ret = -EIO;
 	if (ret < 0)
 		goto out;
 	if (sd_desc->init_controls)

