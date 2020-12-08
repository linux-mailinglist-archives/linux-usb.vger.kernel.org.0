Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2812D2F08
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730332AbgLHQFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 11:05:07 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44535 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730068AbgLHQFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:05:07 -0500
Received: (qmail 1300062 invoked by uid 1000); 8 Dec 2020 11:04:25 -0500
Date:   Tue, 8 Dec 2020 11:04:25 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        legousb-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, starblue@users.sourceforge.net,
        syzkaller-bugs@googlegroups.com
Subject: Re: general protection fault in tower_disconnect
Message-ID: <20201208160425.GA1298255@rowland.harvard.edu>
References: <0000000000008c4f0f05b5f29682@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000008c4f0f05b5f29682@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 03:53:16AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    08a02f95 USB: add RESET_RESUME quirk for Snapscan 1212
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=1435927b500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d24ee9ecd7ce968e
> dashboard link: https://syzkaller.appspot.com/bug?extid=9be25235b7a69b24d117
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15145f07500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b99413500000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com
> 
> usb 1-1: USB disconnect, device number 2
> general protection fault, probably for non-canonical address 0xdffffc0000000013: 0000 [#1] SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000098-0x000000000000009f]
> CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.10.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:tower_disconnect+0x53/0x360 drivers/usb/misc/legousbtower.c:848
> Code: 03 80 3c 02 00 0f 85 15 03 00 00 48 8b ab a8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd 98 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 06 0f 8e 7b 02 00 00 48 c7 c6 40 07 bb 87 48
> RSP: 0018:ffffc9000007f7c0 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: ffff888117ec0000 RCX: ffffffff8381f807
> RDX: 0000000000000013 RSI: ffffffff83bab792 RDI: 0000000000000098
> RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff898cc4ef
> R10: 0000000000000002 R11: 0000000000000000 R12: ffff888117ec0090
> R13: ffff888117ec0078 R14: ffff888117ec0030 R15: ffff888117ec0098
> FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f557af47550 CR3: 00000001090f3000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
>  __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1154
>  device_release_driver_internal drivers/base/dd.c:1185 [inline]
>  device_release_driver+0x26/0x40 drivers/base/dd.c:1208
>  bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
>  device_del+0x502/0xec0 drivers/base/core.c:3115
>  usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
>  usb_disconnect.cold+0x27d/0x780 drivers/usb/core/hub.c:2218
>  hub_port_connect drivers/usb/core/hub.c:5074 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
>  port_event drivers/usb/core/hub.c:5509 [inline]
>  hub_event+0x1c8a/0x42d0 drivers/usb/core/hub.c:5591
>  process_one_work+0x933/0x1520 kernel/workqueue.c:2272
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
>  kthread+0x38c/0x460 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
> Modules linked in:
> ---[ end trace 5aeb1d199be5d5f2 ]---
> RIP: 0010:tower_disconnect+0x53/0x360 drivers/usb/misc/legousbtower.c:848
> Code: 03 80 3c 02 00 0f 85 15 03 00 00 48 8b ab a8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd 98 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 06 0f 8e 7b 02 00 00 48 c7 c6 40 07 bb 87 48
> RSP: 0018:ffffc9000007f7c0 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: ffff888117ec0000 RCX: ffffffff8381f807
> RDX: 0000000000000013 RSI: ffffffff83bab792 RDI: 0000000000000098
> RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff898cc4ef
> R10: 0000000000000002 R11: 0000000000000000 R12: ffff888117ec0090
> R13: ffff888117ec0078 R14: ffff888117ec0030 R15: ffff888117ec0098
> FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f557af47550 CR3: 00000001090f3000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

This is a simple thinko.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing 08a02f95

Index: usb-devel/drivers/usb/misc/legousbtower.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/legousbtower.c
+++ usb-devel/drivers/usb/misc/legousbtower.c
@@ -797,7 +797,7 @@ static int tower_probe(struct usb_interf
 				      &get_version_reply,
 				      sizeof(get_version_reply),
 				      1000, GFP_KERNEL);
-	if (!result) {
+	if (result) {
 		dev_err(idev, "get version request failed: %d\n", result);
 		retval = result;
 		goto error;

