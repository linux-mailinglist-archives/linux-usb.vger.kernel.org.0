Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30753DB8CA
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 14:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238808AbhG3MmJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 08:42:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238723AbhG3MmI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Jul 2021 08:42:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC91760E97;
        Fri, 30 Jul 2021 12:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627648924;
        bh=JMI/Ue6RAsVh19eMB/EUqMUex6fpmAUMHTb0GH1UFX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6lc5TP3uWTOVb5psdgow//r+w1pPzKB3a/msvySI7tHjev6MbcMEYU/24gWWSpBt
         3oemH2878bn1+XKPh/JeXsr4iJHFCCV3LGgfC7EZByqvwdix+JHkhCRRNjgiyVKTzY
         unCZZQZiiJ8AwpbYRa99x210pbl1beCwQ9YHMv/CpgGd/YVFpfNnNFMU42CamKGGog
         4UqkEb73ZMG67Mo2L8jwvuVwJJNO+oDrX3Da2EDzdDW2R0ZyOls1l5MWeJdxBBJOYI
         q6kCpFiUCOvpLnGi5qJf6CukV8boeGxUp1TMcXyA6ppPrXMEhGw2ISMsqIAne+V0yN
         5lPbuWPqepqQg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m9RpP-0002Nu-1e; Fri, 30 Jul 2021 14:41:27 +0200
Date:   Fri, 30 Jul 2021 14:41:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Commit 8a7bf7510d1f ("USB: serial: pl2303: amend and tighten
 type detection") broke pl2303 driver for my adapter
Message-ID: <YQPzdwYy8qxY39BW@hovoldconsulting.com>
References: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
 <YQJ8rNbYhSwmZvbb@hovoldconsulting.com>
 <CA+E=qVdS+7AvRcQAioUu2BshP=ReOcrCLEHE3pmERsXJascbgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+E=qVdS+7AvRcQAioUu2BshP=ReOcrCLEHE3pmERsXJascbgA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 29, 2021 at 10:37:00AM -0700, Vasily Khoruzhick wrote:
> On Thu, Jul 29, 2021 at 3:02 AM Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Jul 27, 2021 at 05:00:20PM -0700, Vasily Khoruzhick wrote:

> > > My PL2303 adapter isn't working after I upgraded to 5.13.

> > Thanks for the report. Can you please post the output of lsusb -v for
> > this device?
> 
> Here it is:
> 
> Bus 001 Device 024: ID 067b:23c3 Prolific Technology, Inc. USB-Serial
> Controller
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x067b Prolific Technology, Inc.
>   idProduct          0x23c3
>   bcdDevice            3.05

Thanks. Based on the above it looks like either a TA using the default
GT idProduct and new subminor release number (3.05), or it's a GT with
an undocumented release number (the datasheet says it should be 1.00).

>   iManufacturer           1 Prolific Technology Inc.
>   iProduct                2 USB-Serial Controller
>   iSerial                 3 CMA>b103Y23
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0027
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xa0
>       (Bus Powered)
>       Remote Wakeup
>     MaxPower              100mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x000a  1x 10 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
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
> 
> > > Any ideas on how to fix it properly? Should I send a patch that
> > > handles bcdDevice == 0x305 and returns TYPE_HX for it from
> > > pl2303_detect_type()?
> >
> > The device id indicates that this is in fact a PL2303GT so we may need
> > to amend the HXN type detection.
> 
> What's the difference between HX and HXN?

The HXN type, or rather G-series, uses a different protocol from the
older types and would not work at all unless detected correctly.

Could you try applying the patch below and check the log for that
pl2303_supports_hx_status() printk? If it is indeed a GT then this
should also make the device work again.

Johan


From 4e964bc27a02bc37446caf7fcfb796aed6666830 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 30 Jul 2021 14:35:24 +0200
Subject: [PATCH] USB: serial: pl2303: add type instrumentation

---
 drivers/usb/serial/pl2303.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 2f2f5047452b..8ef159473504 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -394,6 +394,8 @@ static bool pl2303_supports_hx_status(struct usb_serial *serial)
 			VENDOR_READ_REQUEST_TYPE, PL2303_READ_TYPE_HX_STATUS,
 			0, &buf, 1, 100, GFP_KERNEL);
 
+	dev_info(&serial->interface->dev, "%s - ret = %d\n", __func__, ret);
+
 	return ret == 0;
 }
 
@@ -420,6 +422,7 @@ static int pl2303_detect_type(struct usb_serial *serial)
 
 	switch (bcdDevice) {
 	case 0x100:
+	case 0x305:
 		/*
 		 * Assume it's an HXN-type if the device doesn't support the old read
 		 * request value.
-- 
2.31.1

