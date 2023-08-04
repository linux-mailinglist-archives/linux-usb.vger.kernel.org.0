Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D327708AC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 21:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjHDTLD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 15:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjHDTLC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 15:11:02 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id BBFE4E7
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 12:11:00 -0700 (PDT)
Received: (qmail 43313 invoked by uid 1000); 4 Aug 2023 15:10:59 -0400
Date:   Fri, 4 Aug 2023 15:10:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 1/3] USB: core: Unite old scheme and new scheme descriptor
 reads
Message-ID: <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for reworking the usb_get_device_descriptor() routine,
it is desirable to unite the two different code paths responsible for
initially determining endpoint 0's maximum packet size in a newly
discovered USB device.  Making this determination presents a
chicken-and-egg sort of problem, in that the only way to learn the
maxpacket value is to get it from the device descriptor retrieved from
the device, but communicating with the device to retrieve a descriptor
requires us to know beforehand the ep0 maxpacket size.

In practice this problem is solved in two different ways, referred to
in hub.c as the "old scheme" and the "new scheme".  The old scheme
(which is the approach recommended by the USB-2 spec) involves asking
the device to send just the first eight bytes of its device
descriptor.  Such a transfer uses packets containing no more than
eight bytes each, and every USB device must have an ep0 maxpacket size
>= 8, so this should succeed.  Since the bMaxPacketSize0 field of the
device descriptor lies within the first eight bytes, this is all we
need.

The new scheme is an imitation of the technique used in an early
Windows USB implementation, giving it the happy advantage of working
with a wide variety of devices (some of them at the time would not
work with the old scheme, although that's probably less true now).  It
involves making an initial guess of the ep0 maxpacket size, asking the
device to send up to 64 bytes worth of its device descriptor (which is
only 18 bytes long), and then resetting the device to clear any error
condition that might have resulted from the guess being wrong.  The
initial guess is determined by the connection speed; it should be
correct in all cases other than full speed, for which the allowed
values are 8, 16, 32, and 64 (in this case the initial guess is 64).

The reason for this patch is that the old- and new-scheme parts of
hub_port_init() use different code paths, one involving
usb_get_device_descriptor() and one not, for their initial reads of
the device descriptor.  Since these reads have essentially the same
purpose and are made under essentially the same circumstances, this is
illogical.  It makes more sense to have both of them use a common
subroutine.

This subroutine does basically what the new scheme's code did, because
that approach is more general than the one used by the old scheme.  It
only needs to know how many bytes to transfer and whether or not it is
being called for the first iteration of a retry loop (in case of
certain time-out errors).  There are two main differences from the
former code:

	We initialize the bDescriptorType field of the transfer buffer
	to 0 before performing the transfer, to avoid possibly
	accessing an uninitialized value afterward.

	We read the device descriptor into a temporary buffer rather
	than storing it directly into udev->descriptor, which the old
	scheme implementation used to do.

Since the whole point of this first read of the device descriptor is
to determine the bMaxPacketSize0 value, that is what the new routine
returns (or an error code).  The value is stored in a local variable
rather than in udev->descriptor.  As a side effect, this necessitates
moving a section of code that checks the bcdUSB field for SuperSpeed
devices until after the full device descriptor has been retrieved.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>

---

 drivers/usb/core/hub.c |  173 ++++++++++++++++++++++++++-----------------------
 1 file changed, 94 insertions(+), 79 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -4718,6 +4718,67 @@ static int hub_enable_device(struct usb_
 	return hcd->driver->enable_device(hcd, udev);
 }
 
+/*
+ * Get the bMaxPacketSize0 value during initialization by reading the
+ * device's device descriptor.  Since we don't already know this value,
+ * the transfer is unsafe and it ignores I/O errors, only testing for
+ * reasonable received values.
+ *
+ * For "old scheme" initialization, size will be 8 so we read just the
+ * start of the device descriptor, which should work okay regardless of
+ * the actual bMaxPacketSize0 value.  For "new scheme" initialization,
+ * size will be 64 (and buf will point to a sufficiently large buffer),
+ * which might not be kosher according to the USB spec but it's what
+ * Windows does and what many devices expect.
+ *
+ * Returns: bMaxPacketSize0 or a negative error code.
+ */
+static int get_bMaxPacketSize0(struct usb_device *udev,
+		struct usb_device_descriptor *buf, int size, bool first_time)
+{
+	int i, rc;
+
+	/*
+	 * Retry on all errors; some devices are flakey.
+	 * 255 is for WUSB devices, we actually need to use
+	 * 512 (WUSB1.0[4.8.1]).
+	 */
+	for (i = 0; i < GET_MAXPACKET0_TRIES; ++i) {
+		/* Start with invalid values in case the transfer fails */
+		buf->bDescriptorType = buf->bMaxPacketSize0 = 0;
+		rc = usb_control_msg(udev, usb_rcvaddr0pipe(),
+				USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
+				USB_DT_DEVICE << 8, 0,
+				buf, size,
+				initial_descriptor_timeout);
+		switch (buf->bMaxPacketSize0) {
+		case 8: case 16: case 32: case 64: case 255:
+			if (buf->bDescriptorType == USB_DT_DEVICE) {
+				rc = buf->bMaxPacketSize0;
+				break;
+			}
+			fallthrough;
+		default:
+			if (rc >= 0)
+				rc = -EPROTO;
+			break;
+		}
+
+		/*
+		 * Some devices time out if they are powered on
+		 * when already connected. They need a second
+		 * reset, so return early. But only on the first
+		 * attempt, lest we get into a time-out/reset loop.
+		 */
+		if (rc > 0 || (rc == -ETIMEDOUT && first_time &&
+				udev->speed > USB_SPEED_FULL))
+			break;
+	}
+	return rc;
+}
+
+#define GET_DESCRIPTOR_BUFSIZE	64
+
 /* Reset device, (re)assign address, get device descriptor.
  * Device connection must be stable, no more debouncing needed.
  * Returns device in USB_STATE_ADDRESS, except on error.
@@ -4742,6 +4803,12 @@ hub_port_init(struct usb_hub *hub, struc
 	int			devnum = udev->devnum;
 	const char		*driver_name;
 	bool			do_new_scheme;
+	int			maxp0;
+	struct usb_device_descriptor	*buf;
+
+	buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
+	if (!buf)
+		return -ENOMEM;
 
 	/* root hub ports have a slightly longer reset period
 	 * (from USB 2.0 spec, section 7.1.7.5)
@@ -4861,9 +4928,6 @@ hub_port_init(struct usb_hub *hub, struc
 		}
 
 		if (do_new_scheme) {
-			struct usb_device_descriptor *buf;
-			int r = 0;
-
 			retval = hub_enable_device(udev);
 			if (retval < 0) {
 				dev_err(&udev->dev,
@@ -4872,52 +4936,8 @@ hub_port_init(struct usb_hub *hub, struc
 				goto fail;
 			}
 
-#define GET_DESCRIPTOR_BUFSIZE	64
-			buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
-			if (!buf) {
-				retval = -ENOMEM;
-				continue;
-			}
-
-			/* Retry on all errors; some devices are flakey.
-			 * 255 is for WUSB devices, we actually need to use
-			 * 512 (WUSB1.0[4.8.1]).
-			 */
-			for (operations = 0; operations < GET_MAXPACKET0_TRIES;
-					++operations) {
-				buf->bMaxPacketSize0 = 0;
-				r = usb_control_msg(udev, usb_rcvaddr0pipe(),
-					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
-					USB_DT_DEVICE << 8, 0,
-					buf, GET_DESCRIPTOR_BUFSIZE,
-					initial_descriptor_timeout);
-				switch (buf->bMaxPacketSize0) {
-				case 8: case 16: case 32: case 64: case 255:
-					if (buf->bDescriptorType ==
-							USB_DT_DEVICE) {
-						r = 0;
-						break;
-					}
-					fallthrough;
-				default:
-					if (r == 0)
-						r = -EPROTO;
-					break;
-				}
-				/*
-				 * Some devices time out if they are powered on
-				 * when already connected. They need a second
-				 * reset. But only on the first attempt,
-				 * lest we get into a time out/reset loop
-				 */
-				if (r == 0 || (r == -ETIMEDOUT &&
-						retries == 0 &&
-						udev->speed > USB_SPEED_FULL))
-					break;
-			}
-			udev->descriptor.bMaxPacketSize0 =
-					buf->bMaxPacketSize0;
-			kfree(buf);
+			maxp0 = get_bMaxPacketSize0(udev, buf,
+					GET_DESCRIPTOR_BUFSIZE, retries == 0);
 
 			retval = hub_port_reset(hub, port1, udev, delay, false);
 			if (retval < 0)		/* error or disconnect */
@@ -4928,14 +4948,13 @@ hub_port_init(struct usb_hub *hub, struc
 				retval = -ENODEV;
 				goto fail;
 			}
-			if (r) {
-				if (r != -ENODEV)
+			if (maxp0 < 0) {
+				if (maxp0 != -ENODEV)
 					dev_err(&udev->dev, "device descriptor read/64, error %d\n",
-							r);
-				retval = -EMSGSIZE;
+							maxp0);
+				retval = maxp0;
 				continue;
 			}
-#undef GET_DESCRIPTOR_BUFSIZE
 		}
 
 		/*
@@ -4981,19 +5000,17 @@ hub_port_init(struct usb_hub *hub, struc
 				break;
 		}
 
-		retval = usb_get_device_descriptor(udev, 8);
-		if (retval < 8) {
+		/* !do_new_scheme || wusb */
+		maxp0 = get_bMaxPacketSize0(udev, buf, 8, retries == 0);
+		if (maxp0 < 0) {
+			retval = maxp0;
 			if (retval != -ENODEV)
 				dev_err(&udev->dev,
 					"device descriptor read/8, error %d\n",
 					retval);
-			if (retval >= 0)
-				retval = -EMSGSIZE;
 		} else {
 			u32 delay;
 
-			retval = 0;
-
 			delay = udev->parent->hub_delay;
 			udev->hub_delay = min_t(u32, delay,
 						USB_TP_TRANSMISSION_DELAY_MAX);
@@ -5010,27 +5027,10 @@ hub_port_init(struct usb_hub *hub, struc
 	if (retval)
 		goto fail;
 
-	/*
-	 * Some superspeed devices have finished the link training process
-	 * and attached to a superspeed hub port, but the device descriptor
-	 * got from those devices show they aren't superspeed devices. Warm
-	 * reset the port attached by the devices can fix them.
-	 */
-	if ((udev->speed >= USB_SPEED_SUPER) &&
-			(le16_to_cpu(udev->descriptor.bcdUSB) < 0x0300)) {
-		dev_err(&udev->dev, "got a wrong device descriptor, "
-				"warm reset device\n");
-		hub_port_reset(hub, port1, udev,
-				HUB_BH_RESET_TIME, true);
-		retval = -EINVAL;
-		goto fail;
-	}
-
-	if (udev->descriptor.bMaxPacketSize0 == 0xff ||
-			udev->speed >= USB_SPEED_SUPER)
+	if (maxp0 == 0xff || udev->speed >= USB_SPEED_SUPER)
 		i = 512;
 	else
-		i = udev->descriptor.bMaxPacketSize0;
+		i = maxp0;
 	if (usb_endpoint_maxp(&udev->ep0.desc) != i) {
 		if (udev->speed == USB_SPEED_LOW ||
 				!(i == 8 || i == 16 || i == 32 || i == 64)) {
@@ -5056,6 +5056,20 @@ hub_port_init(struct usb_hub *hub, struc
 		goto fail;
 	}
 
+	/*
+	 * Some superspeed devices have finished the link training process
+	 * and attached to a superspeed hub port, but the device descriptor
+	 * got from those devices show they aren't superspeed devices. Warm
+	 * reset the port attached by the devices can fix them.
+	 */
+	if ((udev->speed >= USB_SPEED_SUPER) &&
+			(le16_to_cpu(udev->descriptor.bcdUSB) < 0x0300)) {
+		dev_err(&udev->dev, "got a wrong device descriptor, warm reset device\n");
+		hub_port_reset(hub, port1, udev, HUB_BH_RESET_TIME, true);
+		retval = -EINVAL;
+		goto fail;
+	}
+
 	usb_detect_quirks(udev);
 
 	if (udev->wusb == 0 && le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0201) {
@@ -5078,6 +5092,7 @@ fail:
 		hub_port_disable(hub, port1, 0);
 		update_devnum(udev, devnum);	/* for disconnect processing */
 	}
+	kfree(buf);
 	return retval;
 }
 
