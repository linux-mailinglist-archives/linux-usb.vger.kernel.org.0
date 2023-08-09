Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7661B774FF4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 02:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjHIAoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 20:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjHIAoW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 20:44:22 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2594519BE
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 17:44:19 -0700 (PDT)
Received: (qmail 178231 invoked by uid 1000); 8 Aug 2023 20:44:18 -0400
Date:   Tue, 8 Aug 2023 20:44:18 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: Remove remnants of Wireless USB and UWB
Message-ID: <b4f2710f-a2de-4fb0-b50f-76776f3a961b@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Wireless USB has long been defunct, and kernel support for it was
removed in 2020 by commit caa6772db4c1 ("Staging: remove wusbcore and
UWB from the kernel tree.").

Nevertheless, some vestiges of the old implementation still clutter up
the USB subsystem and one or two other places.  Let's get rid of them
once and for all.

The only parts still left are the user-facing APIs in
include/uapi/linux/usb/ch9.h.  (There are also a couple of misleading
instances, such as the Sierra Wireless USB modem, which is a USB modem
made by Sierra Wireless.)

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/net/wireless/mediatek/mt76/usb.c |    3 
 drivers/usb/core/config.c                |    3 
 drivers/usb/core/devices.c               |    1 
 drivers/usb/core/hcd.c                   |   40 -------
 drivers/usb/core/hub.c                   |  157 +++++++++----------------------
 drivers/usb/core/sysfs.c                 |    3 
 drivers/usb/core/urb.c                   |   27 +----
 drivers/usb/core/usb.c                   |   11 --
 drivers/usb/host/xhci-mem.c              |    3 
 drivers/usb/host/xhci.c                  |   11 --
 include/linux/usb.h                      |   12 --
 include/linux/usb/ch9.h                  |    5 
 include/linux/usb/composite.h            |   23 ----
 include/linux/usb/hcd.h                  |    2 
 include/uapi/linux/usb/ch11.h            |    6 -
 include/uapi/linux/usb/ch9.h             |    5 
 16 files changed, 63 insertions(+), 249 deletions(-)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -1051,9 +1051,6 @@ int usb_get_bos_descriptor(struct usb_de
 		}
 
 		switch (cap_type) {
-		case USB_CAP_TYPE_WIRELESS_USB:
-			/* Wireless USB cap descriptor is handled by wusb */
-			break;
 		case USB_CAP_TYPE_EXT:
 			dev->bos->ext_cap =
 				(struct usb_ext_cap_descriptor *)buffer;
Index: usb-devel/drivers/usb/core/devices.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devices.c
+++ usb-devel/drivers/usb/core/devices.c
@@ -424,7 +424,6 @@ static ssize_t usb_device_dump(char __us
 	case USB_SPEED_UNKNOWN:		/* usb 1.1 root hub code */
 	case USB_SPEED_FULL:
 		speed = "12"; break;
-	case USB_SPEED_WIRELESS:	/* Wireless has no real fixed speed */
 	case USB_SPEED_HIGH:
 		speed = "480"; break;
 	case USB_SPEED_SUPER:
Index: usb-devel/drivers/usb/core/hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hcd.c
+++ usb-devel/drivers/usb/core/hcd.c
@@ -156,27 +156,6 @@ static const u8 usb3_rh_dev_descriptor[1
 	0x01        /*  __u8  bNumConfigurations; */
 };
 
-/* usb 2.5 (wireless USB 1.0) root hub device descriptor */
-static const u8 usb25_rh_dev_descriptor[18] = {
-	0x12,       /*  __u8  bLength; */
-	USB_DT_DEVICE, /* __u8 bDescriptorType; Device */
-	0x50, 0x02, /*  __le16 bcdUSB; v2.5 */
-
-	0x09,	    /*  __u8  bDeviceClass; HUB_CLASSCODE */
-	0x00,	    /*  __u8  bDeviceSubClass; */
-	0x00,       /*  __u8  bDeviceProtocol; [ usb 2.0 no TT ] */
-	0xFF,       /*  __u8  bMaxPacketSize0; always 0xFF (WUSB Spec 7.4.1). */
-
-	0x6b, 0x1d, /*  __le16 idVendor; Linux Foundation 0x1d6b */
-	0x02, 0x00, /*  __le16 idProduct; device 0x0002 */
-	KERNEL_VER, KERNEL_REL, /*  __le16 bcdDevice */
-
-	0x03,       /*  __u8  iManufacturer; */
-	0x02,       /*  __u8  iProduct; */
-	0x01,       /*  __u8  iSerialNumber; */
-	0x01        /*  __u8  bNumConfigurations; */
-};
-
 /* usb 2.0 root hub device descriptor */
 static const u8 usb2_rh_dev_descriptor[18] = {
 	0x12,       /*  __u8  bLength; */
@@ -368,7 +347,7 @@ static const u8 ss_rh_config_descriptor[
 };
 
 /* authorized_default behaviour:
- * -1 is authorized for all devices except wireless (old behaviour)
+ * -1 is authorized for all devices (leftover from wireless USB)
  * 0 is unauthorized for all devices
  * 1 is authorized for all devices
  * 2 is authorized for internal devices
@@ -383,7 +362,7 @@ module_param(authorized_default, int, S_
 MODULE_PARM_DESC(authorized_default,
 		"Default USB device authorization: 0 is not authorized, 1 is "
 		"authorized, 2 is authorized for internal devices, -1 is "
-		"authorized except for wireless USB (default, old behaviour)");
+		"authorized (default, same as 1)");
 /*-------------------------------------------------------------------------*/
 
 /**
@@ -578,9 +557,6 @@ static int rh_call_control (struct usb_h
 			case HCD_USB3:
 				bufp = usb3_rh_dev_descriptor;
 				break;
-			case HCD_USB25:
-				bufp = usb25_rh_dev_descriptor;
-				break;
 			case HCD_USB2:
 				bufp = usb2_rh_dev_descriptor;
 				break;
@@ -602,7 +578,6 @@ static int rh_call_control (struct usb_h
 				bufp = ss_rh_config_descriptor;
 				len = sizeof ss_rh_config_descriptor;
 				break;
-			case HCD_USB25:
 			case HCD_USB2:
 				bufp = hs_rh_config_descriptor;
 				len = sizeof hs_rh_config_descriptor;
@@ -2860,18 +2835,14 @@ int usb_add_hcd(struct usb_hcd *hcd,
 		hcd->dev_policy = USB_DEVICE_AUTHORIZE_NONE;
 		break;
 
-	case USB_AUTHORIZE_ALL:
-		hcd->dev_policy = USB_DEVICE_AUTHORIZE_ALL;
-		break;
-
 	case USB_AUTHORIZE_INTERNAL:
 		hcd->dev_policy = USB_DEVICE_AUTHORIZE_INTERNAL;
 		break;
 
+	case USB_AUTHORIZE_ALL:
 	case USB_AUTHORIZE_WIRED:
 	default:
-		hcd->dev_policy = hcd->wireless ?
-			USB_DEVICE_AUTHORIZE_NONE : USB_DEVICE_AUTHORIZE_ALL;
+		hcd->dev_policy = USB_DEVICE_AUTHORIZE_ALL;
 		break;
 	}
 
@@ -2915,9 +2886,6 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	case HCD_USB2:
 		rhdev->speed = USB_SPEED_HIGH;
 		break;
-	case HCD_USB25:
-		rhdev->speed = USB_SPEED_WIRELESS;
-		break;
 	case HCD_USB3:
 		rhdev->speed = USB_SPEED_SUPER;
 		break;
Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2117,22 +2117,6 @@ EXPORT_SYMBOL_GPL(usb_set_device_state);
  * USB-3.0 buses the address is assigned by the controller hardware
  * and it usually is not the same as the device number.
  *
- * WUSB devices are simple: they have no hubs behind, so the mapping
- * device <-> virtual port number becomes 1:1. Why? to simplify the
- * life of the device connection logic in
- * drivers/usb/wusbcore/devconnect.c. When we do the initial secret
- * handshake we need to assign a temporary address in the unauthorized
- * space. For simplicity we use the first virtual port number found to
- * be free [drivers/usb/wusbcore/devconnect.c:wusbhc_devconnect_ack()]
- * and that becomes it's address [X < 128] or its unauthorized address
- * [X | 0x80].
- *
- * We add 1 as an offset to the one-based USB-stack port number
- * (zero-based wusb virtual port index) for two reasons: (a) dev addr
- * 0 is reserved by USB for default address; (b) Linux's USB stack
- * uses always #1 for the root hub of the controller. So USB stack's
- * port #1, which is wusb virtual-port #0 has address #2.
- *
  * Devices connected under xHCI are not as simple.  The host controller
  * supports virtualization, so the hardware assigns device addresses and
  * the HCD must setup data structures before issuing a set address
@@ -2145,19 +2129,13 @@ static void choose_devnum(struct usb_dev
 
 	/* be safe when more hub events are proceed in parallel */
 	mutex_lock(&bus->devnum_next_mutex);
-	if (udev->wusb) {
-		devnum = udev->portnum + 1;
-		BUG_ON(test_bit(devnum, bus->devmap.devicemap));
-	} else {
-		/* Try to allocate the next devnum beginning at
-		 * bus->devnum_next. */
-		devnum = find_next_zero_bit(bus->devmap.devicemap, 128,
-					    bus->devnum_next);
-		if (devnum >= 128)
-			devnum = find_next_zero_bit(bus->devmap.devicemap,
-						    128, 1);
-		bus->devnum_next = (devnum >= 127 ? 1 : devnum + 1);
-	}
+
+	/* Try to allocate the next devnum beginning at bus->devnum_next. */
+	devnum = find_next_zero_bit(bus->devmap.devicemap, 128,
+			bus->devnum_next);
+	if (devnum >= 128)
+		devnum = find_next_zero_bit(bus->devmap.devicemap, 128, 1);
+	bus->devnum_next = (devnum >= 127 ? 1 : devnum + 1);
 	if (devnum < 128) {
 		set_bit(devnum, bus->devmap.devicemap);
 		udev->devnum = devnum;
@@ -2175,9 +2153,7 @@ static void release_devnum(struct usb_de
 
 static void update_devnum(struct usb_device *udev, int devnum)
 {
-	/* The address for a WUSB device is managed by wusbcore. */
-	if (!udev->wusb)
-		udev->devnum = devnum;
+	udev->devnum = devnum;
 	if (!udev->devaddr)
 		udev->devaddr = (u8)devnum;
 }
@@ -2670,20 +2646,6 @@ int usb_authorize_device(struct usb_devi
 		goto error_autoresume;
 	}
 
-	if (usb_dev->wusb) {
-		struct usb_device_descriptor *descr;
-
-		descr = usb_get_device_descriptor(usb_dev);
-		if (IS_ERR(descr)) {
-			result = PTR_ERR(descr);
-			dev_err(&usb_dev->dev, "can't re-read device descriptor for "
-				"authorization: %d\n", result);
-			goto error_device_descriptor;
-		}
-		usb_dev->descriptor = *descr;
-		kfree(descr);
-	}
-
 	usb_dev->authorized = 1;
 	/* Choose and set the configuration.  This registers the interfaces
 	 * with the driver core and lets interface drivers bind to them.
@@ -2700,7 +2662,6 @@ int usb_authorize_device(struct usb_devi
 	}
 	dev_info(&usb_dev->dev, "authorized to connect\n");
 
-error_device_descriptor:
 	usb_autosuspend_device(usb_dev);
 error_autoresume:
 out_authorized:
@@ -2783,17 +2744,6 @@ out:
 	return USB_SSP_GEN_UNKNOWN;
 }
 
-/* Returns 1 if @hub is a WUSB root hub, 0 otherwise */
-static unsigned hub_is_wusb(struct usb_hub *hub)
-{
-	struct usb_hcd *hcd;
-	if (hub->hdev->parent != NULL)  /* not a root hub? */
-		return 0;
-	hcd = bus_to_hcd(hub->hdev->bus);
-	return hcd->wireless;
-}
-
-
 #ifdef CONFIG_USB_FEW_INIT_RETRIES
 #define PORT_RESET_TRIES	2
 #define SET_ADDRESS_TRIES	1
@@ -2946,9 +2896,7 @@ static int hub_port_wait_reset(struct us
 		udev->tx_lanes = 1;
 		udev->ssp_rate = USB_SSP_GEN_UNKNOWN;
 	}
-	if (hub_is_wusb(hub))
-		udev->speed = USB_SPEED_WIRELESS;
-	else if (udev->ssp_rate != USB_SSP_GEN_UNKNOWN)
+	if (udev->ssp_rate != USB_SSP_GEN_UNKNOWN)
 		udev->speed = USB_SPEED_SUPER_PLUS;
 	else if (hub_is_superspeed(hub->hdev))
 		udev->speed = USB_SPEED_SUPER;
@@ -4857,13 +4805,10 @@ hub_port_init(struct usb_hub *hub, struc
 	if (initial) {
 		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
 		 * it's fixed size except for full speed devices.
-		 * For Wireless USB devices, ep0 max packet is always 512 (tho
-		 * reported as 0xff in the device descriptor). WUSB1.0[4.8.1].
 		 */
 		switch (udev->speed) {
 		case USB_SPEED_SUPER_PLUS:
 		case USB_SPEED_SUPER:
-		case USB_SPEED_WIRELESS:	/* fixed at 512 */
 			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
 			break;
 		case USB_SPEED_HIGH:		/* fixed at 64 */
@@ -4884,10 +4829,7 @@ hub_port_init(struct usb_hub *hub, struc
 		}
 	}
 
-	if (udev->speed == USB_SPEED_WIRELESS)
-		speed = "variable speed Wireless";
-	else
-		speed = usb_speed_string(udev->speed);
+	speed = usb_speed_string(udev->speed);
 
 	/*
 	 * The controller driver may be NULL if the controller device
@@ -4980,50 +4922,44 @@ hub_port_init(struct usb_hub *hub, struc
 			}
 		}
 
-		/*
-		 * If device is WUSB, we already assigned an
-		 * unauthorized address in the Connect Ack sequence;
-		 * authorization will assign the final address.
-		 */
-		if (udev->wusb == 0) {
-			for (operations = 0; operations < SET_ADDRESS_TRIES; ++operations) {
-				retval = hub_set_address(udev, devnum);
-				if (retval >= 0)
-					break;
-				msleep(200);
-			}
-			if (retval < 0) {
-				if (retval != -ENODEV)
-					dev_err(&udev->dev, "device not accepting address %d, error %d\n",
-							devnum, retval);
-				goto fail;
-			}
-			if (udev->speed >= USB_SPEED_SUPER) {
-				devnum = udev->devnum;
-				dev_info(&udev->dev,
-						"%s SuperSpeed%s%s USB device number %d using %s\n",
-						(udev->config) ? "reset" : "new",
-					 (udev->speed == USB_SPEED_SUPER_PLUS) ?
-							" Plus" : "",
-					 (udev->ssp_rate == USB_SSP_GEN_2x2) ?
-							" Gen 2x2" :
-					 (udev->ssp_rate == USB_SSP_GEN_2x1) ?
-							" Gen 2x1" :
-					 (udev->ssp_rate == USB_SSP_GEN_1x2) ?
-							" Gen 1x2" : "",
-					 devnum, driver_name);
-			}
-
-			/* cope with hardware quirkiness:
-			 *  - let SET_ADDRESS settle, some device hardware wants it
-			 *  - read ep0 maxpacket even for high and low speed,
-			 */
-			msleep(10);
-			if (do_new_scheme)
+		for (operations = 0; operations < SET_ADDRESS_TRIES; ++operations) {
+			retval = hub_set_address(udev, devnum);
+			if (retval >= 0)
 				break;
+			msleep(200);
 		}
+		if (retval < 0) {
+			if (retval != -ENODEV)
+				dev_err(&udev->dev, "device not accepting address %d, error %d\n",
+						devnum, retval);
+			goto fail;
+		}
+		if (udev->speed >= USB_SPEED_SUPER) {
+			devnum = udev->devnum;
+			dev_info(&udev->dev,
+					"%s SuperSpeed%s%s USB device number %d using %s\n",
+					(udev->config) ? "reset" : "new",
+				 (udev->speed == USB_SPEED_SUPER_PLUS) ?
+						" Plus" : "",
+				 (udev->ssp_rate == USB_SSP_GEN_2x2) ?
+						" Gen 2x2" :
+				 (udev->ssp_rate == USB_SSP_GEN_2x1) ?
+						" Gen 2x1" :
+				 (udev->ssp_rate == USB_SSP_GEN_1x2) ?
+						" Gen 1x2" : "",
+				 devnum, driver_name);
+		}
+
+		/*
+		 * cope with hardware quirkiness:
+		 *  - let SET_ADDRESS settle, some device hardware wants it
+		 *  - read ep0 maxpacket even for high and low speed,
+		 */
+		msleep(10);
+
+		if (do_new_scheme)
+			break;
 
-		/* !do_new_scheme || wusb */
 		maxp0 = get_bMaxPacketSize0(udev, buf, 8, retries == 0);
 		if (maxp0 < 0) {
 			retval = maxp0;
@@ -5105,7 +5041,7 @@ hub_port_init(struct usb_hub *hub, struc
 
 	usb_detect_quirks(udev);
 
-	if (udev->wusb == 0 && le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0201) {
+	if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0201) {
 		retval = usb_get_bos_descriptor(udev);
 		if (!retval) {
 			udev->lpm_capable = usb_device_supports_lpm(udev);
@@ -5381,7 +5317,6 @@ static void hub_port_connect(struct usb_
 		usb_set_device_state(udev, USB_STATE_POWERED);
 		udev->bus_mA = hub->mA_per_port;
 		udev->level = hdev->level + 1;
-		udev->wusb = hub_is_wusb(hub);
 
 		/* Devices connected to SuperSpeed hubs are USB 3.0 or later */
 		if (hub_is_superspeed(hub->hdev))
Index: usb-devel/drivers/usb/core/sysfs.c
===================================================================
--- usb-devel.orig/drivers/usb/core/sysfs.c
+++ usb-devel/drivers/usb/core/sysfs.c
@@ -161,9 +161,6 @@ static ssize_t speed_show(struct device
 	case USB_SPEED_HIGH:
 		speed = "480";
 		break;
-	case USB_SPEED_WIRELESS:
-		speed = "480";
-		break;
 	case USB_SPEED_SUPER:
 		speed = "5000";
 		break;
Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -480,8 +480,7 @@ int usb_submit_urb(struct urb *urb, gfp_
 			urb->iso_frame_desc[n].status = -EXDEV;
 			urb->iso_frame_desc[n].actual_length = 0;
 		}
-	} else if (urb->num_sgs && !urb->dev->bus->no_sg_constraint &&
-			dev->speed != USB_SPEED_WIRELESS) {
+	} else if (urb->num_sgs && !urb->dev->bus->no_sg_constraint) {
 		struct scatterlist *sg;
 		int i;
 
@@ -540,17 +539,9 @@ int usb_submit_urb(struct urb *urb, gfp_
 	case USB_ENDPOINT_XFER_ISOC:
 	case USB_ENDPOINT_XFER_INT:
 		/* too small? */
-		switch (dev->speed) {
-		case USB_SPEED_WIRELESS:
-			if ((urb->interval < 6)
-				&& (xfertype == USB_ENDPOINT_XFER_INT))
-				return -EINVAL;
-			fallthrough;
-		default:
-			if (urb->interval <= 0)
-				return -EINVAL;
-			break;
-		}
+		if (urb->interval <= 0)
+			return -EINVAL;
+
 		/* too big? */
 		switch (dev->speed) {
 		case USB_SPEED_SUPER_PLUS:
@@ -560,10 +551,6 @@ int usb_submit_urb(struct urb *urb, gfp_
 				return -EINVAL;
 			max = 1 << 15;
 			break;
-		case USB_SPEED_WIRELESS:
-			if (urb->interval > 16)
-				return -EINVAL;
-			break;
 		case USB_SPEED_HIGH:	/* units are microframes */
 			/* NOTE usb handles 2^15 */
 			if (urb->interval > (1024 * 8))
@@ -587,10 +574,8 @@ int usb_submit_urb(struct urb *urb, gfp_
 		default:
 			return -EINVAL;
 		}
-		if (dev->speed != USB_SPEED_WIRELESS) {
-			/* Round down to a power of 2, no more than max */
-			urb->interval = min(max, 1 << ilog2(urb->interval));
-		}
+		/* Round down to a power of 2, no more than max */
+		urb->interval = min(max, 1 << ilog2(urb->interval));
 	}
 
 	return usb_hcd_submit_urb(urb, mem_flags);
Index: usb-devel/drivers/usb/core/usb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.c
+++ usb-devel/drivers/usb/core/usb.c
@@ -601,14 +601,6 @@ struct device_type usb_device_type = {
 #endif
 };
 
-
-/* Returns 1 if @usb_bus is WUSB, 0 otherwise */
-static unsigned usb_bus_is_wusb(struct usb_bus *bus)
-{
-	struct usb_hcd *hcd = bus_to_hcd(bus);
-	return hcd->wireless;
-}
-
 static bool usb_dev_authorized(struct usb_device *dev, struct usb_hcd *hcd)
 {
 	struct usb_hub *hub;
@@ -748,9 +740,6 @@ struct usb_device *usb_alloc_dev(struct
 #endif
 
 	dev->authorized = usb_dev_authorized(dev, usb_hcd);
-	if (!root_hub)
-		dev->wusb = usb_bus_is_wusb(bus) ? 1 : 0;
-
 	return dev;
 }
 EXPORT_SYMBOL_GPL(usb_alloc_dev);
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -25,7 +25,6 @@
 
 struct usb_device;
 struct usb_driver;
-struct wusb_dev;
 
 /*-------------------------------------------------------------------------*/
 
@@ -425,7 +424,6 @@ struct usb_host_config {
 struct usb_host_bos {
 	struct usb_bos_descriptor	*desc;
 
-	/* wireless cap descriptor is handled by wusb */
 	struct usb_ext_cap_descriptor	*ext_cap;
 	struct usb_ss_cap_descriptor	*ss_cap;
 	struct usb_ssp_cap_descriptor	*ssp_cap;
@@ -612,7 +610,6 @@ struct usb3_lpm_parameters {
  *	WUSB devices are not, until we authorize them from user space.
  *	FIXME -- complete doc
  * @authenticated: Crypto authentication passed
- * @wusb: device is Wireless USB
  * @lpm_capable: device supports LPM
  * @lpm_devinit_allow: Allow USB3 device initiated LPM, exit latency is in range
  * @usb2_hw_lpm_capable: device can perform USB2 hardware LPM
@@ -634,8 +631,6 @@ struct usb3_lpm_parameters {
  * @do_remote_wakeup:  remote wakeup should be enabled
  * @reset_resume: needs reset instead of resume
  * @port_is_suspended: the upstream port is suspended (L2 or U3)
- * @wusb_dev: if this is a Wireless USB device, link to the WUSB
- *	specific data for the device.
  * @slot_id: Slot ID assigned by xHCI
  * @removable: Device can be physically removed from this port
  * @l1_params: best effor service latency for USB2 L1 LPM state, and L1 timeout.
@@ -696,7 +691,6 @@ struct usb_device {
 	unsigned have_langid:1;
 	unsigned authorized:1;
 	unsigned authenticated:1;
-	unsigned wusb:1;
 	unsigned lpm_capable:1;
 	unsigned lpm_devinit_allow:1;
 	unsigned usb2_hw_lpm_capable:1;
@@ -727,7 +721,6 @@ struct usb_device {
 	unsigned reset_resume:1;
 	unsigned port_is_suspended:1;
 
-	struct wusb_dev *wusb_dev;
 	int slot_id;
 	struct usb2_lpm_parameters l1_params;
 	struct usb3_lpm_parameters u1_params;
@@ -1742,11 +1735,6 @@ static inline void usb_fill_bulk_urb(str
  * encoding of the endpoint interval, and express polling intervals in
  * microframes (eight per millisecond) rather than in frames (one per
  * millisecond).
- *
- * Wireless USB also uses the logarithmic encoding, but specifies it in units of
- * 128us instead of 125us.  For Wireless USB devices, the interval is passed
- * through to the host controller, rather than being translated into microframe
- * units.
  */
 static inline void usb_fill_int_urb(struct urb *urb,
 				    struct usb_device *dev,
Index: usb-devel/include/linux/usb/hcd.h
===================================================================
--- usb-devel.orig/include/linux/usb/hcd.h
+++ usb-devel/include/linux/usb/hcd.h
@@ -154,7 +154,6 @@ struct usb_hcd {
 	/* The next flag is a stopgap, to be removed when all the HCDs
 	 * support the new root-hub polling mechanism. */
 	unsigned		uses_new_polling:1;
-	unsigned		wireless:1;	/* Wireless USB HCD */
 	unsigned		has_tt:1;	/* Integrated TT in root hub */
 	unsigned		amd_resume_bug:1; /* AMD remote wakeup quirk */
 	unsigned		can_do_streams:1; /* HC supports streams */
@@ -249,7 +248,6 @@ struct hc_driver {
 #define	HCD_SHARED	0x0004		/* Two (or more) usb_hcds share HW */
 #define	HCD_USB11	0x0010		/* USB 1.1 */
 #define	HCD_USB2	0x0020		/* USB 2.0 */
-#define	HCD_USB25	0x0030		/* Wireless USB 1.0 (USB 2.5)*/
 #define	HCD_USB3	0x0040		/* USB 3.0 */
 #define	HCD_USB31	0x0050		/* USB 3.1 */
 #define	HCD_USB32	0x0060		/* USB 3.2 */
Index: usb-devel/include/linux/usb/ch9.h
===================================================================
--- usb-devel.orig/include/linux/usb/ch9.h
+++ usb-devel/include/linux/usb/ch9.h
@@ -3,7 +3,7 @@
  * This file holds USB constants and structures that are needed for
  * USB device APIs.  These are used by the USB device model, which is
  * defined in chapter 9 of the USB 2.0 specification and in the
- * Wireless USB 1.0 (spread around).  Linux has several APIs in C that
+ * Wireless USB 1.0 spec (now defunct).  Linux has several APIs in C that
  * need these:
  *
  * - the host side Linux-USB kernel driver API;
@@ -14,9 +14,6 @@
  * act either as a USB host or as a USB device.  That means the host and
  * device side APIs benefit from working well together.
  *
- * There's also "Wireless USB", using low power short range radios for
- * peripheral interconnection but otherwise building on the USB framework.
- *
  * Note all descriptors are declared '__attribute__((packed))' so that:
  *
  * [a] they never get padded, either internally (USB spec writers
Index: usb-devel/include/uapi/linux/usb/ch11.h
===================================================================
--- usb-devel.orig/include/uapi/linux/usb/ch11.h
+++ usb-devel/include/uapi/linux/usb/ch11.h
@@ -15,10 +15,8 @@
 /* This is arbitrary.
  * From USB 2.0 spec Table 11-13, offset 7, a hub can
  * have up to 255 ports. The most yet reported is 10.
- *
- * Current Wireless USB host hardware (Intel i1480 for example) allows
- * up to 22 devices to connect. Upcoming hardware might raise that
- * limit. Because the arrays need to add a bit for hub status data, we
+ * Upcoming hardware might raise that limit.
+ * Because the arrays need to add a bit for hub status data, we
  * use 31, so plus one evens out to four bytes.
  */
 #define USB_MAXCHILDREN		31
Index: usb-devel/include/uapi/linux/usb/ch9.h
===================================================================
--- usb-devel.orig/include/uapi/linux/usb/ch9.h
+++ usb-devel/include/uapi/linux/usb/ch9.h
@@ -3,7 +3,7 @@
  * This file holds USB constants and structures that are needed for
  * USB device APIs.  These are used by the USB device model, which is
  * defined in chapter 9 of the USB 2.0 specification and in the
- * Wireless USB 1.0 (spread around).  Linux has several APIs in C that
+ * Wireless USB 1.0 spec (now defunct).  Linux has several APIs in C that
  * need these:
  *
  * - the master/host side Linux-USB kernel driver API;
@@ -14,9 +14,6 @@
  * act either as a USB master/host or as a USB slave/device.  That means
  * the master and slave side APIs benefit from working well together.
  *
- * There's also "Wireless USB", using low power short range radios for
- * peripheral interconnection but otherwise building on the USB framework.
- *
  * Note all descriptors are declared '__attribute__((packed))' so that:
  *
  * [a] they never get padded, either internally (USB spec writers
Index: usb-devel/include/linux/usb/composite.h
===================================================================
--- usb-devel.orig/include/linux/usb/composite.h
+++ usb-devel/include/linux/usb/composite.h
@@ -450,29 +450,6 @@ static inline struct usb_composite_drive
  *
  * One of these devices is allocated and initialized before the
  * associated device driver's bind() is called.
- *
- * OPEN ISSUE:  it appears that some WUSB devices will need to be
- * built by combining a normal (wired) gadget with a wireless one.
- * This revision of the gadget framework should probably try to make
- * sure doing that won't hurt too much.
- *
- * One notion for how to handle Wireless USB devices involves:
- *
- * (a) a second gadget here, discovery mechanism TBD, but likely
- *     needing separate "register/unregister WUSB gadget" calls;
- * (b) updates to usb_gadget to include flags "is it wireless",
- *     "is it wired", plus (presumably in a wrapper structure)
- *     bandgroup and PHY info;
- * (c) presumably a wireless_ep wrapping a usb_ep, and reporting
- *     wireless-specific parameters like maxburst and maxsequence;
- * (d) configurations that are specific to wireless links;
- * (e) function drivers that understand wireless configs and will
- *     support wireless for (additional) function instances;
- * (f) a function to support association setup (like CBAF), not
- *     necessarily requiring a wireless adapter;
- * (g) composite device setup that can create one or more wireless
- *     configs, including appropriate association setup support;
- * (h) more, TBD.
  */
 struct usb_composite_dev {
 	struct usb_gadget		*gadget;
Index: usb-devel/drivers/net/wireless/mediatek/mt76/usb.c
===================================================================
--- usb-devel.orig/drivers/net/wireless/mediatek/mt76/usb.c
+++ usb-devel/drivers/net/wireless/mediatek/mt76/usb.c
@@ -286,8 +286,7 @@ static bool mt76u_check_sg(struct mt76_d
 	struct usb_device *udev = interface_to_usbdev(uintf);
 
 	return (!disable_usb_sg && udev->bus->sg_tablesize > 0 &&
-		(udev->bus->no_sg_constraint ||
-		 udev->speed == USB_SPEED_WIRELESS));
+		udev->bus->no_sg_constraint);
 }
 
 static int
Index: usb-devel/drivers/usb/host/xhci-mem.c
===================================================================
--- usb-devel.orig/drivers/usb/host/xhci-mem.c
+++ usb-devel/drivers/usb/host/xhci-mem.c
@@ -1108,9 +1108,6 @@ int xhci_setup_addressable_virt_dev(stru
 		slot_ctx->dev_info |= cpu_to_le32(SLOT_SPEED_LS);
 		max_packets = MAX_PACKET(8);
 		break;
-	case USB_SPEED_WIRELESS:
-		xhci_dbg(xhci, "FIXME xHCI doesn't support wireless speeds\n");
-		return -EINVAL;
 	default:
 		/* Speed was set earlier, this shouldn't happen. */
 		return -EINVAL;
Index: usb-devel/drivers/usb/host/xhci.c
===================================================================
--- usb-devel.orig/drivers/usb/host/xhci.c
+++ usb-devel/drivers/usb/host/xhci.c
@@ -2194,7 +2194,6 @@ static unsigned int xhci_get_block_size(
 	case USB_SPEED_SUPER_PLUS:
 		return SS_BLOCK;
 	case USB_SPEED_UNKNOWN:
-	case USB_SPEED_WIRELESS:
 	default:
 		/* Should never happen */
 		return 1;
@@ -2555,10 +2554,7 @@ static void xhci_drop_ep_from_interval_t
 	case USB_SPEED_HIGH:
 		interval_bw->overhead[HS_OVERHEAD_TYPE] -= 1;
 		break;
-	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
-	case USB_SPEED_UNKNOWN:
-	case USB_SPEED_WIRELESS:
+	default:
 		/* Should never happen because only LS/FS/HS endpoints will get
 		 * added to the endpoint list.
 		 */
@@ -2615,10 +2611,7 @@ static void xhci_add_ep_to_interval_tabl
 	case USB_SPEED_HIGH:
 		interval_bw->overhead[HS_OVERHEAD_TYPE] += 1;
 		break;
-	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
-	case USB_SPEED_UNKNOWN:
-	case USB_SPEED_WIRELESS:
+	default:
 		/* Should never happen because only LS/FS/HS endpoints will get
 		 * added to the endpoint list.
 		 */
