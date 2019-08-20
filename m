Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2171B969E9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 22:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730843AbfHTUAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 16:00:22 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37080 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730839AbfHTUAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 16:00:22 -0400
Received: (qmail 8410 invoked by uid 2102); 20 Aug 2019 16:00:21 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Aug 2019 16:00:21 -0400
Date:   Tue, 20 Aug 2019 16:00:21 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jiri Kosina <jikos@kernel.org>
cc:     andreyknvl@google.com, <gustavo@embeddedor.com>,
        <hdanton@sina.com>, <syzkaller-bugs@googlegroups.com>,
        <linux-input@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] HID: USB: Fix general protection fault caused by Logitech
 driver
In-Reply-To: <Pine.LNX.4.44L0.1908151333220.1343-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1908201557220.1573-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer found a general protection fault in the HID subsystem:

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 3715 Comm: syz-executor.3 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:__pm_runtime_resume+0x49/0x180 drivers/base/power/runtime.c:1069
Code: ed 74 d5 fe 45 85 ed 0f 85 9a 00 00 00 e8 6f 73 d5 fe 48 8d bd c1 02  
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48  
89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 fe 00 00 00
RSP: 0018:ffff8881d99d78e0 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000020 RCX: ffffc90003f3f000
RDX: 0000000416d8686d RSI: ffffffff82676841 RDI: 00000020b6c3436a
RBP: 00000020b6c340a9 R08: ffff8881c6d64800 R09: fffffbfff0e84c25
R10: ffff8881d99d7940 R11: ffffffff87426127 R12: 0000000000000004
R13: 0000000000000000 R14: ffff8881d9b94000 R15: ffffffff897f9048
FS:  00007f047f542700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30f21000 CR3: 00000001ca032000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  pm_runtime_get_sync include/linux/pm_runtime.h:226 [inline]
  usb_autopm_get_interface+0x1b/0x50 drivers/usb/core/driver.c:1707
  usbhid_power+0x7c/0xe0 drivers/hid/usbhid/hid-core.c:1234
  hid_hw_power include/linux/hid.h:1038 [inline]
  hidraw_open+0x20d/0x740 drivers/hid/hidraw.c:282
  chrdev_open+0x219/0x5c0 fs/char_dev.c:413
  do_dentry_open+0x497/0x1040 fs/open.c:778
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3ff0 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1070
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

It turns out the fault was caused by a bug in the HID Logitech driver,
which violates the requirement that every pathway calling
hid_hw_start() must also call hid_hw_stop().  This patch fixes the bug
by making sure the requirement is met.

Reported-and-tested-by: syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---

[as1909]


 drivers/hid/hid-lg.c    |   10 ++++++----
 drivers/hid/hid-lg4ff.c |    1 -
 2 files changed, 6 insertions(+), 5 deletions(-)

Index: usb-devel/drivers/hid/hid-lg.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg.c
+++ usb-devel/drivers/hid/hid-lg.c
@@ -818,7 +818,7 @@ static int lg_probe(struct hid_device *h
 
 		if (!buf) {
 			ret = -ENOMEM;
-			goto err_free;
+			goto err_stop;
 		}
 
 		ret = hid_hw_raw_request(hdev, buf[0], buf, sizeof(cbuf),
@@ -850,9 +850,12 @@ static int lg_probe(struct hid_device *h
 		ret = lg4ff_init(hdev);
 
 	if (ret)
-		goto err_free;
+		goto err_stop;
 
 	return 0;
+
+err_stop:
+	hid_hw_stop(hdev);
 err_free:
 	kfree(drv_data);
 	return ret;
@@ -863,8 +866,7 @@ static void lg_remove(struct hid_device
 	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
 	if (drv_data->quirks & LG_FF4)
 		lg4ff_deinit(hdev);
-	else
-		hid_hw_stop(hdev);
+	hid_hw_stop(hdev);
 	kfree(drv_data);
 }
 
Index: usb-devel/drivers/hid/hid-lg4ff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg4ff.c
+++ usb-devel/drivers/hid/hid-lg4ff.c
@@ -1477,7 +1477,6 @@ int lg4ff_deinit(struct hid_device *hid)
 		}
 	}
 #endif
-	hid_hw_stop(hid);
 	drv_data->device_props = NULL;
 
 	kfree(entry);

