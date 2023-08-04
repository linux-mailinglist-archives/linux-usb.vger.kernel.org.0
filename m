Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566947708BB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 21:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjHDTOR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 15:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjHDTOQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 15:14:16 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0F8A818B
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 12:14:14 -0700 (PDT)
Received: (qmail 43456 invoked by uid 1000); 4 Aug 2023 15:14:14 -0400
Date:   Fri, 4 Aug 2023 15:14:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 3/3] USB: core: Fix race by not overwriting udev->descriptor
 in hub_port_init()
Message-ID: <b958b47a-9a46-4c22-a9f9-e42e42c31251@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu>
 <d0111bb6-56c1-4f90-adf2-6cfe152f6561@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0111bb6-56c1-4f90-adf2-6cfe152f6561@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Syzbot reported an out-of-bounds read in sysfs.c:read_descriptors():


BUG: KASAN: slab-out-of-bounds in read_descriptors+0x263/0x280 drivers/usb/core/sysfs.c:883
Read of size 8 at addr ffff88801e78b8c8 by task udevd/5011

CPU: 0 PID: 5011 Comm: udevd Not tainted 6.4.0-rc6-syzkaller-00195-g40f71e7cd3c6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 print_address_description.constprop.0+0x2c/0x3c0 mm/kasan/report.c:351
 print_report mm/kasan/report.c:462 [inline]
 kasan_report+0x11c/0x130 mm/kasan/report.c:572
 read_descriptors+0x263/0x280 drivers/usb/core/sysfs.c:883
...
Allocated by task 758:
...
 __do_kmalloc_node mm/slab_common.c:966 [inline]
 __kmalloc+0x5e/0x190 mm/slab_common.c:979
 kmalloc include/linux/slab.h:563 [inline]
 kzalloc include/linux/slab.h:680 [inline]
 usb_get_configuration+0x1f7/0x5170 drivers/usb/core/config.c:887
 usb_enumerate_device drivers/usb/core/hub.c:2407 [inline]
 usb_new_device+0x12b0/0x19d0 drivers/usb/core/hub.c:2545


As analyzed by Khazhy Kumykov, the cause of this bug is a race between
read_descriptors() and hub_port_init(): The first routine uses a field
in udev->descriptor, not expecting it to change, while the second
overwrites it.

Prior to commit 45bf39f8df7f ("USB: core: Don't hold device lock while
reading the "descriptors" sysfs file") this race couldn't occur,
because the routines were mutually exclusive thanks to the device
locking.  Removing that locking from read_descriptors() exposed it to
the race.

The best way to fix the bug is to keep hub_port_init() from changing
udev->descriptor once udev has been initialized and registered.
Drivers expect the descriptors stored in the kernel to be immutable;
we should not undermine this expectation.  In fact, this change should
have been made long ago.

So now hub_port_init() will take an additional argument, specifying a
buffer in which to store the device descriptor it reads.  (If udev has
not yet been initialized, the buffer pointer will be NULL and then
hub_port_init() will store the device descriptor in udev as before.)
This eliminates the data race responsible for the out-of-bounds read.

The changes to hub_port_init() appear more extensive than they really
are, because of indentation changes resulting from an attempt to avoid
writing to other parts of the usb_device structure after it has been
initialized.  Similar changes should be made to the code that reads
the BOS descriptor, but that can be handled in a separate patch later
on.  This patch is sufficient to fix the bug found by syzbot.

Reported-and-tested-by: syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/000000000000c0ffe505fe86c9ca@google.com/#r
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: Khazhy Kumykov <khazhy@google.com>
Fixes: 45bf39f8df7f ("USB: core: Don't hold device lock while reading the "descriptors" sysfs file")
Cc: <stable@vger.kernel.org>

---

 drivers/usb/core/hub.c |  114 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 70 insertions(+), 44 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -4793,10 +4793,17 @@ static int get_bMaxPacketSize0(struct us
  * the port lock.  For a newly detected device that is not accessible
  * through any global pointers, it's not necessary to lock the device,
  * but it is still necessary to lock the port.
+ *
+ * For a newly detected device, @dev_descr must be NULL.  The device
+ * descriptor retrieved from the device will then be stored in
+ * @udev->descriptor.  For an already existing device, @dev_descr
+ * must be non-NULL.  The device descriptor will be stored there,
+ * not in @udev->descriptor, because descriptors for registered
+ * devices are meant to be immutable.
  */
 static int
 hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
-		int retry_counter)
+		int retry_counter, struct usb_device_descriptor *dev_descr)
 {
 	struct usb_device	*hdev = hub->hdev;
 	struct usb_hcd		*hcd = bus_to_hcd(hdev->bus);
@@ -4808,6 +4815,7 @@ hub_port_init(struct usb_hub *hub, struc
 	int			devnum = udev->devnum;
 	const char		*driver_name;
 	bool			do_new_scheme;
+	const bool		initial = !dev_descr;
 	int			maxp0;
 	struct usb_device_descriptor	*buf, *descr;
 
@@ -4846,32 +4854,34 @@ hub_port_init(struct usb_hub *hub, struc
 	}
 	oldspeed = udev->speed;
 
-	/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
-	 * it's fixed size except for full speed devices.
-	 * For Wireless USB devices, ep0 max packet is always 512 (tho
-	 * reported as 0xff in the device descriptor). WUSB1.0[4.8.1].
-	 */
-	switch (udev->speed) {
-	case USB_SPEED_SUPER_PLUS:
-	case USB_SPEED_SUPER:
-	case USB_SPEED_WIRELESS:	/* fixed at 512 */
-		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
-		break;
-	case USB_SPEED_HIGH:		/* fixed at 64 */
-		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
-		break;
-	case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
-		/* to determine the ep0 maxpacket size, try to read
-		 * the device descriptor to get bMaxPacketSize0 and
-		 * then correct our initial guess.
+	if (initial) {
+		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
+		 * it's fixed size except for full speed devices.
+		 * For Wireless USB devices, ep0 max packet is always 512 (tho
+		 * reported as 0xff in the device descriptor). WUSB1.0[4.8.1].
 		 */
-		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
-		break;
-	case USB_SPEED_LOW:		/* fixed at 8 */
-		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
-		break;
-	default:
-		goto fail;
+		switch (udev->speed) {
+		case USB_SPEED_SUPER_PLUS:
+		case USB_SPEED_SUPER:
+		case USB_SPEED_WIRELESS:	/* fixed at 512 */
+			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
+			break;
+		case USB_SPEED_HIGH:		/* fixed at 64 */
+			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
+			break;
+		case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
+			/* to determine the ep0 maxpacket size, try to read
+			 * the device descriptor to get bMaxPacketSize0 and
+			 * then correct our initial guess.
+			 */
+			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
+			break;
+		case USB_SPEED_LOW:		/* fixed at 8 */
+			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
+			break;
+		default:
+			goto fail;
+		}
 	}
 
 	if (udev->speed == USB_SPEED_WIRELESS)
@@ -4894,22 +4904,24 @@ hub_port_init(struct usb_hub *hub, struc
 	if (udev->speed < USB_SPEED_SUPER)
 		dev_info(&udev->dev,
 				"%s %s USB device number %d using %s\n",
-				(udev->config) ? "reset" : "new", speed,
+				(initial ? "new" : "reset"), speed,
 				devnum, driver_name);
 
-	/* Set up TT records, if needed  */
-	if (hdev->tt) {
-		udev->tt = hdev->tt;
-		udev->ttport = hdev->ttport;
-	} else if (udev->speed != USB_SPEED_HIGH
-			&& hdev->speed == USB_SPEED_HIGH) {
-		if (!hub->tt.hub) {
-			dev_err(&udev->dev, "parent hub has no TT\n");
-			retval = -EINVAL;
-			goto fail;
+	if (initial) {
+		/* Set up TT records, if needed  */
+		if (hdev->tt) {
+			udev->tt = hdev->tt;
+			udev->ttport = hdev->ttport;
+		} else if (udev->speed != USB_SPEED_HIGH
+				&& hdev->speed == USB_SPEED_HIGH) {
+			if (!hub->tt.hub) {
+				dev_err(&udev->dev, "parent hub has no TT\n");
+				retval = -EINVAL;
+				goto fail;
+			}
+			udev->tt = &hub->tt;
+			udev->ttport = port1;
 		}
-		udev->tt = &hub->tt;
-		udev->ttport = port1;
 	}
 
 	/* Why interleave GET_DESCRIPTOR and SET_ADDRESS this way?
@@ -4943,6 +4955,12 @@ hub_port_init(struct usb_hub *hub, struc
 
 			maxp0 = get_bMaxPacketSize0(udev, buf,
 					GET_DESCRIPTOR_BUFSIZE, retries == 0);
+			if (maxp0 > 0 && !initial &&
+					maxp0 != udev->descriptor.bMaxPacketSize0) {
+				dev_err(&udev->dev, "device reset changed ep0 maxpacket size!\n");
+				retval = -ENODEV;
+				goto fail;
+			}
 
 			retval = hub_port_reset(hub, port1, udev, delay, false);
 			if (retval < 0)		/* error or disconnect */
@@ -5016,6 +5034,12 @@ hub_port_init(struct usb_hub *hub, struc
 		} else {
 			u32 delay;
 
+			if (!initial && maxp0 != udev->descriptor.bMaxPacketSize0) {
+				dev_err(&udev->dev, "device reset changed ep0 maxpacket size!\n");
+				retval = -ENODEV;
+				goto fail;
+			}
+
 			delay = udev->parent->hub_delay;
 			udev->hub_delay = min_t(u32, delay,
 						USB_TP_TRANSMISSION_DELAY_MAX);
@@ -5059,7 +5083,10 @@ hub_port_init(struct usb_hub *hub, struc
 					retval);
 		goto fail;
 	}
-	udev->descriptor = *descr;
+	if (initial)
+		udev->descriptor = *descr;
+	else
+		*dev_descr = *descr;
 	kfree(descr);
 
 	/*
@@ -5369,7 +5396,7 @@ static void hub_port_connect(struct usb_
 		}
 
 		/* reset (non-USB 3.0 devices) and get descriptor */
-		status = hub_port_init(hub, udev, port1, i);
+		status = hub_port_init(hub, udev, port1, i, NULL);
 		if (status < 0)
 			goto loop;
 
@@ -5999,7 +6026,7 @@ static int usb_reset_and_verify_device(s
 	struct usb_device		*parent_hdev = udev->parent;
 	struct usb_hub			*parent_hub;
 	struct usb_hcd			*hcd = bus_to_hcd(udev->bus);
-	struct usb_device_descriptor	descriptor = udev->descriptor;
+	struct usb_device_descriptor	descriptor;
 	struct usb_host_bos		*bos;
 	int				i, j, ret = 0;
 	int				port1 = udev->portnum;
@@ -6035,7 +6062,7 @@ static int usb_reset_and_verify_device(s
 		/* ep0 maxpacket size may change; let the HCD know about it.
 		 * Other endpoints will be handled by re-enumeration. */
 		usb_ep0_reinit(udev);
-		ret = hub_port_init(parent_hub, udev, port1, i);
+		ret = hub_port_init(parent_hub, udev, port1, i, &descriptor);
 		if (ret >= 0 || ret == -ENOTCONN || ret == -ENODEV)
 			break;
 	}
@@ -6047,7 +6074,6 @@ static int usb_reset_and_verify_device(s
 	/* Device might have changed firmware (DFU or similar) */
 	if (descriptors_changed(udev, &descriptor, bos)) {
 		dev_info(&udev->dev, "device firmware changed\n");
-		udev->descriptor = descriptor;	/* for disconnect() calls */
 		goto re_enumerate;
 	}
 
