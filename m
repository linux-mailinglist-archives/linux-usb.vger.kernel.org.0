Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3EA5A3004
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 21:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344542AbiHZTbj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 15:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344651AbiHZTbf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 15:31:35 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AD5E5E01E6
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 12:31:32 -0700 (PDT)
Received: (qmail 48553 invoked by uid 1000); 26 Aug 2022 15:31:32 -0400
Date:   Fri, 26 Aug 2022 15:31:32 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Rondreis <linhaoguo86@gmail.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Prevent nested device-reset calls
Message-ID: <YwkflDxvg0KWqyZK@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Automatic kernel fuzzing revealed a recursive locking violation in
usb-storage:

============================================
WARNING: possible recursive locking detected
5.18.0 #3 Not tainted
--------------------------------------------
kworker/1:3/1205 is trying to acquire lock:
ffff888018638db8 (&us_interface_key[i]){+.+.}-{3:3}, at:
usb_stor_pre_reset+0x35/0x40 drivers/usb/storage/usb.c:230

but task is already holding lock:
ffff888018638db8 (&us_interface_key[i]){+.+.}-{3:3}, at:
usb_stor_pre_reset+0x35/0x40 drivers/usb/storage/usb.c:230

...

stack backtrace:
CPU: 1 PID: 1205 Comm: kworker/1:3 Not tainted 5.18.0 #3
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
<TASK>
__dump_stack lib/dump_stack.c:88 [inline]
dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
print_deadlock_bug kernel/locking/lockdep.c:2988 [inline]
check_deadlock kernel/locking/lockdep.c:3031 [inline]
validate_chain kernel/locking/lockdep.c:3816 [inline]
__lock_acquire.cold+0x152/0x3ca kernel/locking/lockdep.c:5053
lock_acquire kernel/locking/lockdep.c:5665 [inline]
lock_acquire+0x1ab/0x520 kernel/locking/lockdep.c:5630
__mutex_lock_common kernel/locking/mutex.c:603 [inline]
__mutex_lock+0x14f/0x1610 kernel/locking/mutex.c:747
usb_stor_pre_reset+0x35/0x40 drivers/usb/storage/usb.c:230
usb_reset_device+0x37d/0x9a0 drivers/usb/core/hub.c:6109
r871xu_dev_remove+0x21a/0x270 drivers/staging/rtl8712/usb_intf.c:622
usb_unbind_interface+0x1bd/0x890 drivers/usb/core/driver.c:458
device_remove drivers/base/dd.c:545 [inline]
device_remove+0x11f/0x170 drivers/base/dd.c:537
__device_release_driver drivers/base/dd.c:1222 [inline]
device_release_driver_internal+0x1a7/0x2f0 drivers/base/dd.c:1248
usb_driver_release_interface+0x102/0x180 drivers/usb/core/driver.c:627
usb_forced_unbind_intf+0x4d/0xa0 drivers/usb/core/driver.c:1118
usb_reset_device+0x39b/0x9a0 drivers/usb/core/hub.c:6114


This turned out not to be an error in usb-storage but rather a nested
device reset attempt.  That is, as the rtl8712 driver was being
unbound from a composite device in preparation for an unrelated USB
reset (that driver does not have pre_reset or post_reset callbacks),
its ->remove routine called usb_reset_device() -- thus nesting one
reset call within another.

Performing a reset as part of disconnect processing is a questionable
practice at best.  However, the bug report points out that the USB
core does not have any protection against nested resets.  Adding a
reset_in_progress flag and testing it will prevent such errors in the
future.

Reported-and-tested-by: Rondreis <linhaoguo86@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/CAB7eexKUpvX-JNiLzhXBDWgfg2T9e9_0Tw4HQ6keN==voRbP0g@mail.gmail.com/

---


[as1985]


 drivers/usb/core/hub.c |   10 ++++++++++
 include/linux/usb.h    |    2 ++
 2 files changed, 12 insertions(+)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -6038,6 +6038,11 @@ re_enumerate:
  * the reset is over (using their post_reset method).
  *
  * Return: The same as for usb_reset_and_verify_device().
+ * However, if a reset is already in progress (for instance, if a
+ * driver doesn't have pre_ or post_reset() callbacks, and while
+ * being unbound or re-bound during the ongoing reset its disconnect()
+ * or probe() routine tries to perform a second, nested reset), the
+ * routine returns -EINPROGRESS.
  *
  * Note:
  * The caller must own the device lock.  For example, it's safe to use
@@ -6071,6 +6076,10 @@ int usb_reset_device(struct usb_device *
 		return -EISDIR;
 	}
 
+	if (udev->reset_in_progress)
+		return -EINPROGRESS;
+	udev->reset_in_progress = 1;
+
 	port_dev = hub->ports[udev->portnum - 1];
 
 	/*
@@ -6135,6 +6144,7 @@ int usb_reset_device(struct usb_device *
 
 	usb_autosuspend_device(udev);
 	memalloc_noio_restore(noio_flag);
+	udev->reset_in_progress = 0;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(usb_reset_device);
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -575,6 +575,7 @@ struct usb3_lpm_parameters {
  * @devaddr: device address, XHCI: assigned by HW, others: same as devnum
  * @can_submit: URBs may be submitted
  * @persist_enabled:  USB_PERSIST enabled for this device
+ * @reset_in_progress: the device is being reset
  * @have_langid: whether string_langid is valid
  * @authorized: policy has said we can use it;
  *	(user space) policy determines if we authorize this device to be
@@ -662,6 +663,7 @@ struct usb_device {
 
 	unsigned can_submit:1;
 	unsigned persist_enabled:1;
+	unsigned reset_in_progress:1;
 	unsigned have_langid:1;
 	unsigned authorized:1;
 	unsigned authenticated:1;
