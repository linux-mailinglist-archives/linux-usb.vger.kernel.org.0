Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD873C1AFC
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 07:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfI3F0i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 01:26:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40116 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfI3F0i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 01:26:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so11145577wmj.5
        for <linux-usb@vger.kernel.org>; Sun, 29 Sep 2019 22:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pqe6XGV9iFsybS699I+3e/hU7YTC1RERKfS+mumwIAg=;
        b=PgvxDJAzr8DwZbrXDS/4A1ZyhBycwROEeBHd93ZDTY+hXKZTdGQaHBd0I0qPS+oDLC
         RfG94GELYnFIcP/EtU5aWQ4w+6rHZwtXA5DZ//gmLtMJIKjqoAiWUkAILh7y7pnNdjwg
         BfvFpfeCJmEEm/WX80I65a8ER+x7PlMNxrxBSfni/O9eoaMsDmxoYOG7gyxL/59vIFVe
         O3Nc4joLYDqn804ekm5volXlOr/H/rt7/QJRFhbLIDvEJRhUtJlDlpM9wWEL6rdPVjk7
         8UzPYC6tCLnvHCbJQLk3lO9gHsDuDnbMQVneeivV5/pRRmSeJFjExs24spY0QPmxWVSk
         PbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pqe6XGV9iFsybS699I+3e/hU7YTC1RERKfS+mumwIAg=;
        b=BDacoxBtmrhzESaFnDEeFnoRQa2CpWYdbf5IVEdMjEk3E1AjjK31hW850HDOr71OSg
         nSLeVYMJGDEPJbuWpdUAOzj4qThv9X+OFoUpJNYkcKfQp8xTI8bVGaHC+GMJ1yyOLGVx
         y7cnb553nFjrq9bFl0gW4m5u0edW0H7JikV6HtX3hz0leimHysvHTXlkTjL3o0SvddIc
         qNQ29XHjLMbsYcSkMSqREYGmLEXBODP5mUKZoTG5xiOOdQxJXiLzDvj8nCKsUiDGKjiX
         0Mx62f/euJOYD/tDHiUbdOwk2UgrRsufQgrHANwDmzOAr7r7cEfHU+bq0+ry26Vav0FC
         8Rmg==
X-Gm-Message-State: APjAAAXze7uC++40xe8ku3rq/auevUlMZJQYYDBAJCXQDQ58lwGvEdVi
        cxGTZiMOAeN4C1jHDBV6XYBfwpDgKEBFQg==
X-Google-Smtp-Source: APXvYqwSZE8Vo96IRBbobiC2T92dOaymPBCvr1qZSY0/S/MV2rlqrdpbVg6nmplpLoqOVTYG0O3rvA==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr16469271wmi.142.1569821193027;
        Sun, 29 Sep 2019 22:26:33 -0700 (PDT)
Received: from dhe-pc (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.gmail.com with ESMTPSA id a71sm15473741wme.11.2019.09.29.22.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2019 22:26:31 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
X-Google-Original-From: David Heinzelmann <dhe@dhe-pc>
Date:   Mon, 30 Sep 2019 09:26:24 +0200
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     David Heinzelmann <heinzelmann.david@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20190930072624.GA24182@dhe-pc>
References: <20190924100119.GA7353@dhe-pc>
 <Pine.LNX.4.44L0.1909251010290.14432-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1909251010290.14432-100000@netrider.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 25, 2019 at 10:20:00AM -0400, Alan Stern wrote:
> On Tue, 24 Sep 2019, David Heinzelmann wrote:
> 
> > > I really don't understand this.
> > > 
> > > Your patch involves the case where there was a connect-change event but 
> > > the port is still enabled.  Now maybe I've forgotten about one of the 
> > > pathways, but it seems like that combination should never occur.
> > > 
> > > Certainly it shouldn't occur in your case.  The device disconnects and 
> > > then reconnects with a new set of descriptors.  The disconnect should 
> > > cause the port to be disabled, and the port should remain disabled 
> > > after the reconnect occurs.  So how can your new code run in the first 
> > > place?
> > > 
> > > Alan Stern
> > > 
> > 
> > Hi,
> > 
> > I have a log with two devices which are connected to a hub and the hub is plugged in. 
> > 
> > The device which is not working in this log:
> > 
> > Sep 24 08:32:21 kernel: usb 2-6-port1: status 0203 change 0011
> > Sep 24 08:32:21 kernel: usb 2-6.1: new SuperSpeed Gen 1 USB device number 65 using xhci_hcd
> 
> Ah, SuperSpeed.  You're using a USB-3 device.  That does make a
> difference.
> 
> > Sep 24 08:32:21 kernel: usb 2-6.1: udev 65, busnum 2, minor = 192
> > Sep 24 08:32:21 kernel: usb 2-6.1: New USB device found, idVendor=1409, idProduct=3240, bcdDevice= 0.00
> > Sep 24 08:32:21 kernel: usb 2-6.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > Sep 24 08:32:21 kernel: usb 2-6.1: Product: USB 3.0 Camera
> > Sep 24 08:32:21 kernel: usb 2-6.1: Manufacturer: Camera Manufacturer
> > 
> > Now the firmware download happens and the device is re-enumerating and a disconnect/connect should occur.
> > But the only change which is seen is the following output:
> > 
> > Sep 24 08:32:23 kernel: usb 2-6-port1: link state change
> > Sep 24 08:32:23 kernel: usb 2-6-port1: status 0203, change 0041, 5.0 Gb/s
> > 
> > Now the resuscitation is happening but from my understanding this is not correct as in the reality there was a
> > reconnect from the device. So I tried to initiate a device reconnect if the device descriptor changed.
> > 
> > It also seems to me that the enumeration from the second device (usb 2-6-port1) is blocking 
> > the port change event and so the actual disconnect is missed.
> 
> Now it all makes sense.  Yes, I agree that your patch is the
> appropriate thing to do -- except that it contains at least one logic
> error: It doesn't handle the return code from
> usb_get_device_descriptor() properly.
> 
> Also, I think you should expand the immediately preceding comment.  
> Explain that it is indeed possible for the port to be enabled at this
> point, because USB-3 connections are initialized automatically by the
> host controller hardware when the connection is detected.
> 
> Alan Stern
> 

Hi,

I adjusted the patch. Any comments? If it's okay, I will re-sent the patch 
to the mailing list.

Here is the second version:


From dc78b8add72168215b8295e01ce3e2599b4998f7 Mon Sep 17 00:00:00 2001
From: David Heinzelmann <heinzelmann.david@gmail.com>
Date: Mon, 30 Sep 2019 07:11:31 +0200
Subject: [PATCH v2] Check for changed device descriptors when a connection-change
 occurs before validating the connection.

When a port connection-change occurs the hub driver tries to resuscitate an existing
device. Activated from a firmware download a usb device can re-enumerate with new or
changed device descriptors. Therefore it will be checked for changed device descriptors
before the connection is resuscitated and the connection-change event is ignored.

Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>
---
 drivers/usb/core/hub.c | 196 +++++++++++++++++++++++------------------
 1 file changed, 111 insertions(+), 85 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 236313f41f4a..45d8bdc9eaae 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4930,6 +4930,91 @@ hub_power_remaining(struct usb_hub *hub)
 	return remaining;
 }
 
+
+static int descriptors_changed(struct usb_device *udev,
+		struct usb_device_descriptor *old_device_descriptor,
+		struct usb_host_bos *old_bos)
+{
+	int		changed = 0;
+	unsigned	index;
+	unsigned	serial_len = 0;
+	unsigned	len;
+	unsigned	old_length;
+	int		length;
+	char		*buf;
+
+	if (memcmp(&udev->descriptor, old_device_descriptor,
+			sizeof(*old_device_descriptor)) != 0)
+		return 1;
+
+	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
+		return 1;
+	if (udev->bos) {
+		len = le16_to_cpu(udev->bos->desc->wTotalLength);
+		if (len != le16_to_cpu(old_bos->desc->wTotalLength))
+			return 1;
+		if (memcmp(udev->bos->desc, old_bos->desc, len))
+			return 1;
+	}
+
+	/* Since the idVendor, idProduct, and bcdDevice values in the
+	 * device descriptor haven't changed, we will assume the
+	 * Manufacturer and Product strings haven't changed either.
+	 * But the SerialNumber string could be different (e.g., a
+	 * different flash card of the same brand).
+	 */
+	if (udev->serial)
+		serial_len = strlen(udev->serial) + 1;
+
+	len = serial_len;
+	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
+		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
+		len = max(len, old_length);
+	}
+
+	buf = kmalloc(len, GFP_NOIO);
+	if (!buf)
+		/* assume the worst */
+		return 1;
+
+	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
+		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
+		length = usb_get_descriptor(udev, USB_DT_CONFIG, index, buf,
+				old_length);
+		if (length != old_length) {
+			dev_dbg(&udev->dev, "config index %d, error %d\n",
+					index, length);
+			changed = 1;
+			break;
+		}
+		if (memcmp(buf, udev->rawdescriptors[index], old_length)
+				!= 0) {
+			dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
+				index,
+				((struct usb_config_descriptor *) buf)->
+					bConfigurationValue);
+			changed = 1;
+			break;
+		}
+	}
+
+	if (!changed && serial_len) {
+		length = usb_string(udev, udev->descriptor.iSerialNumber,
+				buf, serial_len);
+		if (length + 1 != serial_len) {
+			dev_dbg(&udev->dev, "serial string error %d\n",
+					length);
+			changed = 1;
+		} else if (memcmp(buf, udev->serial, length) != 0) {
+			dev_dbg(&udev->dev, "serial string changed\n");
+			changed = 1;
+		}
+	}
+
+	kfree(buf);
+	return changed;
+}
+
 static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		u16 portchange)
 {
@@ -5167,7 +5252,9 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 {
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_device *udev = port_dev->child;
+	struct usb_device_descriptor descriptor;
 	int status = -ENODEV;
+	int retval;
 
 	dev_dbg(&port_dev->dev, "status %04x, change %04x, %s\n", portstatus,
 			portchange, portspeed(hub, portstatus));
@@ -5188,7 +5275,30 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 	if ((portstatus & USB_PORT_STAT_CONNECTION) && udev &&
 			udev->state != USB_STATE_NOTATTACHED) {
 		if (portstatus & USB_PORT_STAT_ENABLE) {
-			status = 0;		/* Nothing to do */
+			/* USB-3 connections are initialized
+			 * automatically by the host controller
+			 * hardware. Therefore check for changed
+			 * device descriptors before resuscitating
+			 * the device.
+			 */
+			descriptor = udev->descriptor;
+			retval = usb_get_device_descriptor(udev,
+				sizeof(udev->descriptor));
+			if (retval < 0) {
+				dev_dbg (&udev->dev, "can't read device "
+					"descriptor %d\n", retval);
+			} else {
+				if (descriptors_changed(udev, &descriptor,
+					udev->bos)) {
+						dev_dbg(&udev->dev, "device descriptor "
+							"has changed\n");
+
+						/* for disconnect() calls */
+						udev->descriptor = descriptor;
+					} else {
+						status = 0; /* Nothing to do */
+			}
+		}
 #ifdef CONFIG_PM
 		} else if (udev->state == USB_STATE_SUSPENDED &&
 				udev->persist_enabled) {
@@ -5550,90 +5660,6 @@ void usb_hub_cleanup(void)
 	usb_deregister(&hub_driver);
 } /* usb_hub_cleanup() */
 
-static int descriptors_changed(struct usb_device *udev,
-		struct usb_device_descriptor *old_device_descriptor,
-		struct usb_host_bos *old_bos)
-{
-	int		changed = 0;
-	unsigned	index;
-	unsigned	serial_len = 0;
-	unsigned	len;
-	unsigned	old_length;
-	int		length;
-	char		*buf;
-
-	if (memcmp(&udev->descriptor, old_device_descriptor,
-			sizeof(*old_device_descriptor)) != 0)
-		return 1;
-
-	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
-		return 1;
-	if (udev->bos) {
-		len = le16_to_cpu(udev->bos->desc->wTotalLength);
-		if (len != le16_to_cpu(old_bos->desc->wTotalLength))
-			return 1;
-		if (memcmp(udev->bos->desc, old_bos->desc, len))
-			return 1;
-	}
-
-	/* Since the idVendor, idProduct, and bcdDevice values in the
-	 * device descriptor haven't changed, we will assume the
-	 * Manufacturer and Product strings haven't changed either.
-	 * But the SerialNumber string could be different (e.g., a
-	 * different flash card of the same brand).
-	 */
-	if (udev->serial)
-		serial_len = strlen(udev->serial) + 1;
-
-	len = serial_len;
-	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
-		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
-		len = max(len, old_length);
-	}
-
-	buf = kmalloc(len, GFP_NOIO);
-	if (!buf)
-		/* assume the worst */
-		return 1;
-
-	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
-		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
-		length = usb_get_descriptor(udev, USB_DT_CONFIG, index, buf,
-				old_length);
-		if (length != old_length) {
-			dev_dbg(&udev->dev, "config index %d, error %d\n",
-					index, length);
-			changed = 1;
-			break;
-		}
-		if (memcmp(buf, udev->rawdescriptors[index], old_length)
-				!= 0) {
-			dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
-				index,
-				((struct usb_config_descriptor *) buf)->
-					bConfigurationValue);
-			changed = 1;
-			break;
-		}
-	}
-
-	if (!changed && serial_len) {
-		length = usb_string(udev, udev->descriptor.iSerialNumber,
-				buf, serial_len);
-		if (length + 1 != serial_len) {
-			dev_dbg(&udev->dev, "serial string error %d\n",
-					length);
-			changed = 1;
-		} else if (memcmp(buf, udev->serial, length) != 0) {
-			dev_dbg(&udev->dev, "serial string changed\n");
-			changed = 1;
-		}
-	}
-
-	kfree(buf);
-	return changed;
-}
-
 /**
  * usb_reset_and_verify_device - perform a USB port reset to reinitialize a device
  * @udev: device to reset (not in SUSPENDED or NOTATTACHED state)
-- 
2.20.1
