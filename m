Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361E868F3B9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 17:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjBHQsD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 11:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjBHQsC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 11:48:02 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B375038B54
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 08:48:01 -0800 (PST)
Received: (qmail 739602 invoked by uid 1000); 8 Feb 2023 11:48:00 -0500
Date:   Wed, 8 Feb 2023 11:48:00 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y+PSQIiE5nhCZfoy@rowland.harvard.edu>
References: <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
 <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
 <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu>
 <Y9mAYH7L/CcTTSw6@kroah.com>
 <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
 <Y+KP0N73jE3PJVZ4@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+KP0N73jE3PJVZ4@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 12:52:16PM -0500, Alan Stern wrote:
> On Tue, Feb 07, 2023 at 09:25:55AM +0100, Troels Liebe Bentsen wrote:
> > Hi again,
> > 
> > Did a bit more testing and found another lock that would be nice to remove,
> > the /dev/bus/usb/$BUS/$DEV file for the hub is also locked:
> > 
> > Bus 003 Device 016: ID 1a40:0201 Terminus Technology Inc. FE 2.1 7-port Hub
> > 
> > strace lsusb -v
> > ...
> > openat(AT_FDCWD, "/dev/bus/usb/003/016", O_RDWR|O_CLOEXEC...
> > 
> > The openat can not be canceled from userspace and even kill -9 won't stop
> > the process until the descriptor read times out.
> 
> Yes, that really should be an interruptible lock.  In fact, all the 
> locks connected with usbfs should be interruptible.
> 
> However, it can't be eliminated entirely.  This is a case where two 
> things end up being mutually exclusive with each other because they both 
> need to be mutually exclusive with a third thing.  In other words, 
> opening a hub's usbfs file and probing a hub's children both have to be 
> mutually exclusive with disconnecting the hub.  The three pathways all 
> use the device lock for this purpose, so they are all mutually exclusive 
> with each other.
> 
> > Also managed to get "lsusb -v" to hang in an unkillable way even after
> > I unplugged the device and hub:
> >
> > ) = 1 ([{fd=5, revents=POLLIN}])
> > ioctl(8, USBDEVFS_DISCARDURB
> 
> Making these lock calls interruptible should fix this problem, right?

Here's a patch.  It should fix most of these problems.

Alan Stern



Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -303,13 +303,15 @@ static ssize_t usbdev_read(struct file *
 {
 	struct usb_dev_state *ps = file->private_data;
 	struct usb_device *dev = ps->dev;
-	ssize_t ret = 0;
+	ssize_t ret;
 	unsigned len;
 	loff_t pos;
 	int i;
 
 	pos = *ppos;
-	usb_lock_device(dev);
+	ret = usb_lock_device_interruptible(dev);
+	if (ret < 0)
+		return ret;
 	if (!connected(ps)) {
 		ret = -ENODEV;
 		goto err;
@@ -1039,7 +1041,9 @@ static int usbdev_open(struct inode *ino
 	if (!dev)
 		goto out_free_ps;
 
-	usb_lock_device(dev);
+	ret = usb_lock_device_interruptible(dev);
+	if (ret < 0)
+		goto out_put_device;
 	if (dev->state == USB_STATE_NOTATTACHED)
 		goto out_unlock_device;
 
@@ -1071,6 +1075,7 @@ static int usbdev_open(struct inode *ino
 
  out_unlock_device:
 	usb_unlock_device(dev);
+ out_put_device:
 	usb_put_dev(dev);
  out_free_ps:
 	kfree(ps);
@@ -2591,14 +2596,17 @@ static long usbdev_do_ioctl(struct file
 	struct usb_dev_state *ps = file->private_data;
 	struct inode *inode = file_inode(file);
 	struct usb_device *dev = ps->dev;
-	int ret = -ENOTTY;
+	int ret;
 
 	if (!(file->f_mode & FMODE_WRITE))
 		return -EPERM;
 
-	usb_lock_device(dev);
+	ret = usb_lock_device_interruptible(dev);
+	if (ret < 0)
+		return ret;
 
 	/* Reap operations are allowed even after disconnection */
+	ret = -ENOTTY;
 	switch (cmd) {
 	case USBDEVFS_REAPURB:
 		snoop(&dev->dev, "%s: REAPURB\n", __func__);

