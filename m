Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A78855858
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 22:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfFYUD7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 16:03:59 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46568 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726393AbfFYUD7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 16:03:59 -0400
Received: (qmail 9013 invoked by uid 2102); 25 Jun 2019 16:03:58 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jun 2019 16:03:58 -0400
Date:   Tue, 25 Jun 2019 16:03:58 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Remove usbfs_mutex
Message-ID: <Pine.LNX.4.44L0.1906251600270.1493-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 4a2a8a2cce86 ("usbfs: private mutex for open, release, and
remove") is now obsolete.  The commit was created back when we had
to handle both usbfs device nodes and the old usbdevfs filesystem
(/proc/bus/usb/), but usbdevfs no longer exists.

This means there's no longer any need to hold a mutex during two
separate removal operations (and thus during an entire notifier chain
call).  Furthermore, the one remaining remove/release pair doesn't
race with open thanks to the synchronization provided by the device
model core in bus_find_device().  Remove and release don't race with
each other because they both run with the device lock held.

The upshot is that usbfs_mutex isn't needed any more.  This patch
removes it entirely.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1904]


 drivers/usb/core/devio.c  |    9 ---------
 drivers/usb/core/notify.c |    3 ---
 drivers/usb/core/usb.h    |    1 -
 3 files changed, 13 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -48,9 +48,6 @@
 #define USB_DEVICE_MAX			(USB_MAXBUS * 128)
 #define USB_SG_SIZE			16384 /* split-size for large txs */
 
-/* Mutual exclusion for removal, open, and release */
-DEFINE_MUTEX(usbfs_mutex);
-
 struct usb_dev_state {
 	struct list_head list;      /* state list */
 	struct usb_device *dev;
@@ -979,15 +976,9 @@ static int usbdev_open(struct inode *ino
 
 	ret = -ENODEV;
 
-	/* Protect against simultaneous removal or release */
-	mutex_lock(&usbfs_mutex);
-
 	/* usbdev device-node */
 	if (imajor(inode) == USB_DEVICE_MAJOR)
 		dev = usbdev_lookup_by_devt(inode->i_rdev);
-
-	mutex_unlock(&usbfs_mutex);
-
 	if (!dev)
 		goto out_free_ps;
 
Index: usb-devel/drivers/usb/core/notify.c
===================================================================
--- usb-devel.orig/drivers/usb/core/notify.c
+++ usb-devel/drivers/usb/core/notify.c
@@ -53,11 +53,8 @@ void usb_notify_add_device(struct usb_de
 
 void usb_notify_remove_device(struct usb_device *udev)
 {
-	/* Protect against simultaneous usbfs open */
-	mutex_lock(&usbfs_mutex);
 	blocking_notifier_call_chain(&usb_notifier_list,
 			USB_DEVICE_REMOVE, udev);
-	mutex_unlock(&usbfs_mutex);
 }
 
 void usb_notify_add_bus(struct usb_bus *ubus)
Index: usb-devel/drivers/usb/core/usb.h
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.h
+++ usb-devel/drivers/usb/core/usb.h
@@ -169,7 +169,6 @@ extern const struct attribute_group *usb
 extern const struct attribute_group *usb_interface_groups[];
 
 /* usbfs stuff */
-extern struct mutex usbfs_mutex;
 extern struct usb_driver usbfs_driver;
 extern const struct file_operations usbfs_devices_fops;
 extern const struct file_operations usbdev_file_operations;

