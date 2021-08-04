Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B3C3DFB83
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 08:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhHDGmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 02:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235419AbhHDGmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Aug 2021 02:42:13 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351A9C0613D5
        for <linux-usb@vger.kernel.org>; Tue,  3 Aug 2021 23:42:00 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id h27so771747qtu.9
        for <linux-usb@vger.kernel.org>; Tue, 03 Aug 2021 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3F9vi/Y6cmxaTICfGN4BBiu7ycbuNaSQHzxLxWNMR28=;
        b=DBRCfQODVt7f/vQzz+XIJY7oGZ9J+AH8ZlLh+D4t6b4rGCjxGv5ViCpXlPZX/PtkOR
         TUxCaUb+TYDdbmLlB5s+q2NRkJB9zmEFGixWExuLpuq/DnTG3c3tKIIn6nZF6o8asagc
         Xuee3pmP4ijqKN/Z3qxYRfuvkpjsEU4Se/AG8Arf3LGwiV8sMuXU/Y4Ikn8DJkhh+9/V
         1HCwCH1n6yGoIDTQVKDeg4M12f4hWDd6ny8Fgmf1RyFHxZMPmm20nRkoycaW6u6wFfnV
         7BiXFvofivWOHgyQIXTlrvRgZIu2gn5SwGVlXnMWtvbkKwBTtmjsPABu/ere9HOSqfC6
         aEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3F9vi/Y6cmxaTICfGN4BBiu7ycbuNaSQHzxLxWNMR28=;
        b=JI+iTbtJTC1zdLfu6z/wCNsv5AP9NAfn8VUxvX8XiEfKl7wZgtfZjjIL8UJCEU/onY
         qoECfOS5bX0U3SZ+t1ADyHwEd4u61GlpIybhFihQtXb3mZeNMwFtJcT/5G6L99rcF6IX
         ajLzlDd5iFPLE/p9Bh4f0ysNlv5dwMh8ggKrucScBh2JnwqRlKXsJMY7r+Uc4Ep3Yanm
         23nLD2chy3iY4pAtO+SQI6PeuDvwmfGdxp8Ghp47qT8qDIxZ5H14JO6OQkOczCjaymAe
         AfPIIXoYSp2KUI8I8AIBzJPf3rVrVanB/0okurDTCxB0giRrHDJAaNrHLqK1/zZXzcFf
         ATHw==
X-Gm-Message-State: AOAM533u7624Nu7WHfL5hwy8VnIeIjsiYgza3hjb/A1GP/pHH0GxxnYV
        uap3YropWi14agOonsTFhO4n3NxxxlgH+4YyXzE=
X-Google-Smtp-Source: ABdhPJyqc8EvIbCLj0pkKzkjLe36dFXxa6DiytGleUe8VyaxUBfrifeZWSULgJkikDt989jM9Th/FlSuWu56xBKZVBU=
X-Received: by 2002:a05:622a:188:: with SMTP id s8mr5641301qtw.87.1628059319324;
 Tue, 03 Aug 2021 23:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
 <YQJ8rNbYhSwmZvbb@hovoldconsulting.com> <CA+E=qVdS+7AvRcQAioUu2BshP=ReOcrCLEHE3pmERsXJascbgA@mail.gmail.com>
 <YQPzdwYy8qxY39BW@hovoldconsulting.com>
In-Reply-To: <YQPzdwYy8qxY39BW@hovoldconsulting.com>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Tue, 3 Aug 2021 23:41:33 -0700
Message-ID: <CA+E=qVcLdZ=gdJa-nV42ey751Dd9gFHWya7v=-y3WejoDYkaHA@mail.gmail.com>
Subject: Re: Commit 8a7bf7510d1f ("USB: serial: pl2303: amend and tighten type
 detection") broke pl2303 driver for my adapter
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 30, 2021 at 5:42 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jul 29, 2021 at 10:37:00AM -0700, Vasily Khoruzhick wrote:
> > On Thu, Jul 29, 2021 at 3:02 AM Johan Hovold <johan@kernel.org> wrote:
> > > On Tue, Jul 27, 2021 at 05:00:20PM -0700, Vasily Khoruzhick wrote:
>
> > > > My PL2303 adapter isn't working after I upgraded to 5.13.
>
> > > Thanks for the report. Can you please post the output of lsusb -v for
> > > this device?
> >
> > Here it is:
> >
> > Bus 001 Device 024: ID 067b:23c3 Prolific Technology, Inc. USB-Serial
> > Controller
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass            0
> >   bDeviceSubClass         0
> >   bDeviceProtocol         0
> >   bMaxPacketSize0        64
> >   idVendor           0x067b Prolific Technology, Inc.
> >   idProduct          0x23c3
> >   bcdDevice            3.05
>
> Thanks. Based on the above it looks like either a TA using the default
> GT idProduct and new subminor release number (3.05), or it's a GT with
> an undocumented release number (the datasheet says it should be 1.00).
>
> >   iManufacturer           1 Prolific Technology Inc.
> >   iProduct                2 USB-Serial Controller
> >   iSerial                 3 CMA>b103Y23
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x0027
> >     bNumInterfaces          1
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0xa0
> >       (Bus Powered)
> >       Remote Wakeup
> >     MaxPower              100mA
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       255 Vendor Specific Class
> >       bInterfaceSubClass      0
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x000a  1x 10 bytes
> >         bInterval               1
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x02  EP 2 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0040  1x 64 bytes
> >         bInterval               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x83  EP 3 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0040  1x 64 bytes
> >         bInterval               0
> >
> > > > Any ideas on how to fix it properly? Should I send a patch that
> > > > handles bcdDevice == 0x305 and returns TYPE_HX for it from
> > > > pl2303_detect_type()?
> > >
> > > The device id indicates that this is in fact a PL2303GT so we may need
> > > to amend the HXN type detection.
> >
> > What's the difference between HX and HXN?
>
> The HXN type, or rather G-series, uses a different protocol from the
> older types and would not work at all unless detected correctly.
>
> Could you try applying the patch below and check the log for that
> pl2303_supports_hx_status() printk? If it is indeed a GT then this
> should also make the device work again.

Thanks, with this patch it works:

[793566.912312] usb 1-1: new full-speed USB device number 43 using xhci_hcd
[793567.053688] usb 1-1: New USB device found, idVendor=067b,
idProduct=23c3, bcdDevice= 3.05
[793567.053702] usb 1-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[793567.053708] usb 1-1: Product: USB-Serial Controller
[793567.053712] usb 1-1: Manufacturer: Prolific Technology Inc.
[793567.053716] usb 1-1: SerialNumber: CMA>b103Y23
[793567.056684] pl2303 1-1:1.0: pl2303 converter detected
[793567.056956] pl2303 1-1:1.0: pl2303_supports_hx_status - ret = -32
[793567.057281] usb 1-1: pl2303 converter now attached to ttyUSB0

I tested it with picocom at 115200 baud.

You can have my:

Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

Regards,
Vasily


> Johan
>
>
> From 4e964bc27a02bc37446caf7fcfb796aed6666830 Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Fri, 30 Jul 2021 14:35:24 +0200
> Subject: [PATCH] USB: serial: pl2303: add type instrumentation
>
> ---
>  drivers/usb/serial/pl2303.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 2f2f5047452b..8ef159473504 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -394,6 +394,8 @@ static bool pl2303_supports_hx_status(struct usb_serial *serial)
>                         VENDOR_READ_REQUEST_TYPE, PL2303_READ_TYPE_HX_STATUS,
>                         0, &buf, 1, 100, GFP_KERNEL);
>
> +       dev_info(&serial->interface->dev, "%s - ret = %d\n", __func__, ret);
> +
>         return ret == 0;
>  }
>
> @@ -420,6 +422,7 @@ static int pl2303_detect_type(struct usb_serial *serial)
>
>         switch (bcdDevice) {
>         case 0x100:
> +       case 0x305:
>                 /*
>                  * Assume it's an HXN-type if the device doesn't support the old read
>                  * request value.
> --
> 2.31.1
>
