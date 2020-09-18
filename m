Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC3426F744
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 09:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgIRHp3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 03:45:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46521 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgIRHp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 03:45:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so4238857ljp.13
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 00:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pamiUqY8CBTwbC3eJD/iKymS6K6+be8BOK0CqF8kZWI=;
        b=YSlAWoDTcPsovpiQ07AriECQ5n+dQndscTRUICKUrEr7hG7tblKfqoBW2xGuJMXhq0
         zn3bXMfxd57d2bcCRYpr3XiOfJcdBCPptFp14iGUsJ0tFzpaQcR+i+48Ku8RTYw8KeiN
         InbUTPirA8Aiq1piswBbx20MGG6DFd+kMh4b6REKaicwz6c1bbgttW1mNwH4qStbYle1
         xBnGcDuuVfSw6+cruxq95sZ62K+gMHx0BnUn8myJeAEjZg/iQSbn1YBJLnJcxqGvaK5M
         KsSEEksIvh2K8qftxE25lqJy16Ltc9jAJ9rk8t2HhL3316QAfYZx3TeZxhQRYkxwHRD6
         NWSw==
X-Gm-Message-State: AOAM53054pgcyt4ArVvZV6C38tvpHWip8/ENCt9zWaZ041LfcZWd6iV9
        Wxop6v2H7hKMk79tvEShbpyifZ4G7H8=
X-Google-Smtp-Source: ABdhPJwMPe+sAzoT+ICBtim5pLciB65my/3CvEfTWh5LHvbl4a/m+TEn2SsuuHhWPQiLq5ADCCuIYA==
X-Received: by 2002:a2e:9690:: with SMTP id q16mr10486747lji.401.1600415125309;
        Fri, 18 Sep 2020 00:45:25 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g30sm422599lfj.74.2020.09.18.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 00:45:24 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kJB55-00073i-6x; Fri, 18 Sep 2020 09:45:19 +0200
Date:   Fri, 18 Sep 2020 09:45:19 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "<Daniel Caujolle-Bert>" <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie
 support.
Message-ID: <20200918074519.GN24441@localhost>
References: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 31, 2020 at 09:21:27AM +0200, <Daniel Caujolle-Bert> wrote:
> Hi,
> 
>    Whistler TRX serie radio scanners provide 2 USB subclass devices: one
> usb mass storage and one serial device.
> The problem is USB serial is unusable, as the cdc_acm fails with
> error -22.
> Enabling the support in the usb_simple_serial driver make it works.

Thanks for the patch, and sorry about the late reply.

> lsusb -v output:
> Bus 003 Device 003: ID 2a59:0012 Whistler Whistler TRX-1e Scanner
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0 
>   bDeviceSubClass         0 
>   bDeviceProtocol         0 
>   bMaxPacketSize0         8
>   idVendor           0x2a59 
>   idProduct          0x0012 
>   bcdDevice            0.01
>   iManufacturer           1 Whistler
>   iProduct                2 Whistler TRX-1e Scanner
>   iSerial                 0 
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0059
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          2 Whistler TRX-1e Scanner
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     80 Bulk-Only
>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
>         ** UNRECOGNIZED:  08 11 01 02 02 02 01 00
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass         2 Communications
>       bInterfaceSubClass      2 Abstract (modem)
>       bInterfaceProtocol      1 AT-commands (v.25ter)
>       iInterface              0 
>       CDC Header:
>         bcdCDC               1.10
>       CDC ACM:
>         bmCapabilities       0x02
>           line coding and serial state
>       CDC Union:
>         bMasterInterface        0
>         bSlaveInterface         1 

It seems this is the problem right here, that the device designates the
mass-storage interface as master.

I think it would be better if we could teach cdc-acm to handle this
device, for example, by adding a quirk to ignore the union descriptor or
to tell the driver that we're dealing with a combined-interface
directly. In fact, we already have a quirk for the latter, it just needs
to be generalised a bit.

Daniel, could you try the below patch and see if that would work for
you?

Note that adding a IGNORE_UNION quirk allows for a smaller patch, but I
prefer generalising the one we already have instead of adding another. 

Oliver, what do think about this? Do you see any way of autodetecting
broken union descriptors without risking introducing regression? It was
thinking about falling back to combined-interface probing, for example,
if the master interface isn't a Communication or Data Class interface
(as per spec), or perhaps simply if the probed interface has three
endpoints.

>       CDC Call Management:
>         bmCapabilities       0x00
>         bDataInterface          1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval               2
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x03  EP 3 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
> Device Status:     0x0000
>   (Bus Powered)

Johan


From 3a2bf4810ae8bb9266d13359e3cc0ed3425560c4 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Thu, 17 Sep 2020 10:30:20 +0200
Subject: [PATCH] USB: cdc-acm: add Whistler radio scanners TRX series support

Add support for Whistler radio scanners TRX series, which have a union
descriptor that designates a mass-storage interface as master. Handle
that by generalising the NO_DATA_INTERFACE quirk to allow us to fall
back to using the combined-interface detection.

Link: https://lore.kernel.org/r/5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com
Reported-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7f6f3ab5b8a6..dc63a3bcccb2 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1220,27 +1220,26 @@ static int acm_probe(struct usb_interface *intf,
 	if (cmgmd)
 		call_intf_num = cmgmd->bDataInterface;
 
-	if (!union_header) {
-		if (call_intf_num > 0) {
+	combined_interfaces = (quirks & NO_DATA_INTERFACE) != 0;
+
+	if (!union_header || combined_interfaces) {
+		if (call_intf_num > 0 && !combined_interfaces) {
 			dev_dbg(&intf->dev, "No union descriptor, using call management descriptor\n");
-			/* quirks for Droids MuIn LCD */
-			if (quirks & NO_DATA_INTERFACE) {
-				data_interface = usb_ifnum_to_if(usb_dev, 0);
-			} else {
-				data_intf_num = call_intf_num;
-				data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
-			}
+			data_intf_num = call_intf_num;
+			data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
 			control_interface = intf;
 		} else {
 			if (intf->cur_altsetting->desc.bNumEndpoints != 3) {
 				dev_dbg(&intf->dev,"No union descriptor, giving up\n");
 				return -ENODEV;
-			} else {
+			}
+
+			if (!combined_interfaces) {
 				dev_warn(&intf->dev,"No union descriptor, testing for castrated device\n");
 				combined_interfaces = 1;
-				control_interface = data_interface = intf;
-				goto look_for_collapsed_interface;
 			}
+			control_interface = data_interface = intf;
+			goto look_for_collapsed_interface;
 		}
 	} else {
 		data_intf_num = union_header->bSlaveInterface0;
@@ -1807,6 +1806,19 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = CLEAR_HALT_CONDITIONS,
 	},
 
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0010, USB_CDC_SUBCLASS_ACM),
+	.driver_info = NO_DATA_INTERFACE,
+	},
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0011, USB_CDC_SUBCLASS_ACM),
+	.driver_info = NO_DATA_INTERFACE,
+	},
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0012, USB_CDC_SUBCLASS_ACM),
+	.driver_info = NO_DATA_INTERFACE,
+	},
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0013, USB_CDC_SUBCLASS_ACM),
+	.driver_info = NO_DATA_INTERFACE,
+	},
+
 	/* Nokia S60 phones expose two ACM channels. The first is
 	 * a modem and is picked up by the standard AT-command
 	 * information below. The second is 'vendor-specific' but
-- 
2.26.2

