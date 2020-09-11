Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7216D26646F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Sep 2020 18:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgIKQiS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Sep 2020 12:38:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42351 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726377AbgIKPMj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Sep 2020 11:12:39 -0400
Received: (qmail 884356 invoked by uid 1000); 11 Sep 2020 11:12:28 -0400
Date:   Fri, 11 Sep 2020 11:12:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     yasushi asano <yazzep@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        "Rosca, Eugeniu \(ADITG/ESM1\)" <erosca@de.adit-jv.com>,
        andrew_gabbasov@mentor.com, Baxter Jim <jim_baxter@mentor.com>,
        "Natsume, Wataru \(ADITJ/SWG\)" <wnatsume@jp.adit-jv.com>,
        "Nishiguchi, Naohiro \(ADITJ/SWG\)" <nnishiguchi@jp.adit-jv.com>,
        =?utf-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>,
        kernel test robot <rong.a.chen@intel.com>
Subject: Re: [PATCH v3] USB: hub.c: decrease the number of attempts of
 enumeration scheme
Message-ID: <20200911151228.GA883311@rowland.harvard.edu>
References: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
 <20200907155052.2450-1-yazzep@gmail.com>
 <20200907155052.2450-2-yazzep@gmail.com>
 <20200908190402.GA797206@rowland.harvard.edu>
 <CAEt1RjquJZzTctN6dNQSDbUZ9YG2FnEtzTZsoA3a9RtXHxwUmA@mail.gmail.com>
 <CAEt1RjpGcZ4T70tr83pmcD--PzAMboBkbv55qFcRfMz11ZUggw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEt1RjpGcZ4T70tr83pmcD--PzAMboBkbv55qFcRfMz11ZUggw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 11, 2020 at 05:33:18PM +0900, yasushi asano wrote:
> Dear Alan,
> I tested the patch you provided.
> Unfortunately, it takes about 40 seconds to reach the detection of
> enumeration failure. so the PET test failed.
> Now I'm checking which procedure took time.

> [  856.409962] usb 1-1.1: new full-speed USB device number 10 using
> ehci-platform
> [  867.281957] usb 1-1.1: device not accepting address 10, error -110
>           [5]....... [5]-[4] = 10.9 second
> [  867.365954] usb 1-1.1: new full-speed USB device number 11 using
> ehci-platform
> [  878.545941] usb 1-1.1: device not accepting address 11, error -110
>           [6]....... [6]-[5] = 11.2 second
> [  878.552808] usb 1-1-port1: unable to enumerate USB device
>           [7]  total [7]-[1] = 39.7 second
> [  899.489808] *** End of Test        ***

The problem is that I forgot to remove the Set-Address loop.  Here's a
revised patch for you to test.

The thing is, I'm afraid that without these retry loops, some devices
will stop working.  If that happens, we will not be able to keep this
patch in place; we will just have to accept that we fail the PET test.

Alan Stern


Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2706,10 +2706,7 @@ static unsigned hub_is_wusb(struct usb_h
 
 
 #define PORT_RESET_TRIES	5
-#define SET_ADDRESS_TRIES	2
-#define GET_DESCRIPTOR_TRIES	2
-#define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
-#define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
+#define PORT_INIT_TRIES		5
 
 #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
 #define HUB_SHORT_RESET_TIME	10
@@ -2717,23 +2714,31 @@ static unsigned hub_is_wusb(struct usb_h
 #define HUB_LONG_RESET_TIME	200
 #define HUB_RESET_TIMEOUT	800
 
-/*
- * "New scheme" enumeration causes an extra state transition to be
- * exposed to an xhci host and causes USB3 devices to receive control
- * commands in the default state.  This has been seen to cause
- * enumeration failures, so disable this enumeration scheme for USB3
- * devices.
- */
 static bool use_new_scheme(struct usb_device *udev, int retry,
 			   struct usb_port *port_dev)
 {
 	int old_scheme_first_port =
-		port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME;
+		(port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME) ||
+		old_scheme_first;
 
+	/*
+	 * "New scheme" enumeration causes an extra state transition to be
+	 * exposed to an xhci host and causes USB3 devices to receive control
+	 * commands in the default state.  This has been seen to cause
+	 * enumeration failures, so disable this enumeration scheme for USB3
+	 * devices.
+	 */
 	if (udev->speed >= USB_SPEED_SUPER)
 		return false;
 
-	return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first);
+	/*
+	 * If use_both_schemes is set, use the first scheme (whichever
+	 * it is) for the larger half of the retries, then use the other
+	 * scheme.  Otherwise, use the first scheme for all the retries.
+	 */
+	if (use_both_schemes && retry >= (PORT_INIT_TRIES + 1) / 2)
+		return old_scheme_first_port;	/* Second half */
+	return !old_scheme_first_port;		/* First half or all */
 }
 
 /* Is a USB 3.0 port in the Inactive or Compliance Mode state?
@@ -4539,12 +4544,13 @@ hub_port_init(struct usb_hub *hub, struc
 	struct usb_device	*hdev = hub->hdev;
 	struct usb_hcd		*hcd = bus_to_hcd(hdev->bus);
 	struct usb_port		*port_dev = hub->ports[port1 - 1];
-	int			retries, operations, retval, i;
+	int			retval, i;
 	unsigned		delay = HUB_SHORT_RESET_TIME;
 	enum usb_device_speed	oldspeed = udev->speed;
 	const char		*speed;
 	int			devnum = udev->devnum;
 	const char		*driver_name;
+	bool			do_new_scheme;
 
 	/* root hub ports have a slightly longer reset period
 	 * (from USB 2.0 spec, section 7.1.7.5)
@@ -4657,130 +4663,101 @@ hub_port_init(struct usb_hub *hub, struc
 	 * first 8 bytes of the device descriptor to get the ep0 maxpacket
 	 * value.
 	 */
-	for (retries = 0; retries < GET_DESCRIPTOR_TRIES; (++retries, msleep(100))) {
-		bool did_new_scheme = false;
-
-		if (use_new_scheme(udev, retry_counter, port_dev)) {
-			struct usb_device_descriptor *buf;
-			int r = 0;
+	do_new_scheme = use_new_scheme(udev, retry_counter, port_dev);
 
-			did_new_scheme = true;
-			retval = hub_enable_device(udev);
-			if (retval < 0) {
-				dev_err(&udev->dev,
-					"hub failed to enable device, error %d\n",
-					retval);
-				goto fail;
-			}
+	if (do_new_scheme) {
+		struct usb_device_descriptor *buf;
+		int r = 0;
+
+		retval = hub_enable_device(udev);
+		if (retval < 0) {
+			dev_err(&udev->dev,
+				"hub failed to enable device, error %d\n",
+				retval);
+			goto fail;
+		}
 
 #define GET_DESCRIPTOR_BUFSIZE	64
-			buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
-			if (!buf) {
-				retval = -ENOMEM;
-				continue;
-			}
+		buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
+		if (!buf) {
+			retval = -ENOMEM;
+			goto fail;
+		}
 
-			/* Retry on all errors; some devices are flakey.
-			 * 255 is for WUSB devices, we actually need to use
-			 * 512 (WUSB1.0[4.8.1]).
-			 */
-			for (operations = 0; operations < 3; ++operations) {
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
+		/*
+		 * 255 is for WUSB devices, we actually need to use
+		 * 512 (WUSB1.0[4.8.1]).
+		 */
+		buf->bMaxPacketSize0 = 0;
+		r = usb_control_msg(udev, usb_rcvaddr0pipe(),
+				USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
+				USB_DT_DEVICE << 8, 0,
+				buf, GET_DESCRIPTOR_BUFSIZE,
+				initial_descriptor_timeout);
+		switch (buf->bMaxPacketSize0) {
+		case 8: case 16: case 32: case 64: case 255:
+			if (buf->bDescriptorType == USB_DT_DEVICE) {
+				r = 0;
+				break;
 			}
-			udev->descriptor.bMaxPacketSize0 =
-					buf->bMaxPacketSize0;
+			fallthrough;
+		default:
+			if (r == 0)
+				r = -EPROTO;
+			if (r != -ENODEV)
+				dev_err(&udev->dev, "device descriptor read/64, error %d\n", r);
+			retval = r;
 			kfree(buf);
+			goto fail;
+		}
+		udev->descriptor.bMaxPacketSize0 = buf->bMaxPacketSize0;
+		kfree(buf);
 
-			retval = hub_port_reset(hub, port1, udev, delay, false);
-			if (retval < 0)		/* error or disconnect */
-				goto fail;
-			if (oldspeed != udev->speed) {
-				dev_dbg(&udev->dev,
-					"device reset changed speed!\n");
-				retval = -ENODEV;
-				goto fail;
-			}
-			if (r) {
-				if (r != -ENODEV)
-					dev_err(&udev->dev, "device descriptor read/64, error %d\n",
-							r);
-				retval = -EMSGSIZE;
-				continue;
-			}
+		retval = hub_port_reset(hub, port1, udev, delay, false);
+		if (retval < 0)		/* error or disconnect */
+			goto fail;
+		if (oldspeed != udev->speed) {
+			dev_dbg(&udev->dev, "device reset changed speed!\n");
+			retval = -ENODEV;
+			goto fail;
+		}
 #undef GET_DESCRIPTOR_BUFSIZE
+	}
+
+	/*
+	 * If device is WUSB, we already assigned an
+	 * unauthorized address in the Connect Ack sequence;
+	 * authorization will assign the final address.
+	 */
+	if (udev->wusb == 0) {
+		retval = hub_set_address(udev, devnum);
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
+						"Plus Gen 2" : " Gen 1",
+				 (udev->rx_lanes == 2 && udev->tx_lanes == 2) ?
+						"x2" : "",
+				 devnum, driver_name);
 		}
 
 		/*
-		 * If device is WUSB, we already assigned an
-		 * unauthorized address in the Connect Ack sequence;
-		 * authorization will assign the final address.
+		 * cope with hardware quirkiness:
+		 *  - let SET_ADDRESS settle, some device hardware wants it
+		 *  - read ep0 maxpacket even for high and low speed,
 		 */
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
-							"Plus Gen 2" : " Gen 1",
-					 (udev->rx_lanes == 2 && udev->tx_lanes == 2) ?
-							"x2" : "",
-					 devnum, driver_name);
-			}
-
-			/* cope with hardware quirkiness:
-			 *  - let SET_ADDRESS settle, some device hardware wants it
-			 *  - read ep0 maxpacket even for high and low speed,
-			 */
-			msleep(10);
-			/* use_new_scheme() checks the speed which may have
-			 * changed since the initial look so we cache the result
-			 * in did_new_scheme
-			 */
-			if (did_new_scheme)
-				break;
-		}
+		msleep(10);
+	}
 
+	if (!do_new_scheme) {
 		retval = usb_get_device_descriptor(udev, 8);
 		if (retval < 8) {
 			if (retval != -ENODEV)
@@ -4804,7 +4781,6 @@ hub_port_init(struct usb_hub *hub, struc
 					retval);
 				retval = 0;
 			}
-			break;
 		}
 	}
 	if (retval)
@@ -5106,7 +5082,7 @@ static void hub_port_connect(struct usb_
 		unit_load = 100;
 
 	status = 0;
-	for (i = 0; i < SET_CONFIG_TRIES; i++) {
+	for (i = 0; i < PORT_INIT_TRIES; i++) {
 
 		/* reallocate for each attempt, since references
 		 * to the previous one can escape in various ways
@@ -5239,7 +5215,7 @@ loop:
 			break;
 
 		/* When halfway through our retry count, power-cycle the port */
-		if (i == (SET_CONFIG_TRIES / 2) - 1) {
+		if (i == (PORT_INIT_TRIES / 2) - 1) {
 			dev_info(&port_dev->dev, "attempt power cycle\n");
 			usb_hub_set_port_power(hdev, hub, port1, false);
 			msleep(2 * hub_power_on_good_delay(hub));
@@ -5770,7 +5746,7 @@ static int usb_reset_and_verify_device(s
 	bos = udev->bos;
 	udev->bos = NULL;
 
-	for (i = 0; i < SET_CONFIG_TRIES; ++i) {
+	for (i = 0; i < PORT_INIT_TRIES; ++i) {
 
 		/* ep0 maxpacket size may change; let the HCD know about it.
 		 * Other endpoints will be handled by re-enumeration. */
