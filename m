Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4626E537062
	for <lists+linux-usb@lfdr.de>; Sun, 29 May 2022 10:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiE2Iwh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 May 2022 04:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiE2Iwf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 May 2022 04:52:35 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7144147AF1
        for <linux-usb@vger.kernel.org>; Sun, 29 May 2022 01:52:34 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-f2cd424b9cso10829737fac.7
        for <linux-usb@vger.kernel.org>; Sun, 29 May 2022 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yu0vVEQ1Jx4TmcDnPCAdLl01ekF+KaqqFzND4WPD6q4=;
        b=pLSfGkFRKOdoHqp3Q7Fd7SACSF/9gpqs4CQqG/EA3/8MAwDKpE6qzD8Mi9n//pzbpE
         4MN0IRtiHVIk0rpeNkuvzNqEITTbMLls2oc9zvTTsAMnSFYWsDyMTqHhGhcMCsNB7bT9
         UNtLd8JgwHe+LdHTdAQ+Prfhc+ktuI0+9QAVTNDe1a0pFAv8vj9zOrDhQqMkgWAHXP6X
         k+R9O7akw7nlZDtYtukUgkqAYGDWdSaY2Vwz3LJMNRbEyFzk6vaomsmOWrwr1aI/Y24H
         kFF6/oXgvDChje+6tQ7+bEE+peXZ6AUASs/ZT/MvIBWmZDpeYWKri9EPLSlCKkV4bPDt
         GY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yu0vVEQ1Jx4TmcDnPCAdLl01ekF+KaqqFzND4WPD6q4=;
        b=NvJYEPrwaAc+l3vA7Ua49Queq7mMZe3+gCD+JYYsN0z/PbYm0sVtpHjxL1r+9SGC+/
         acyfxM9WorxoC0sflei1qlOLM0pW6Ww9XyJnA0Ub6vQeDnR6FGIVFU4jR4+o/rSDgjZn
         GsiJLLmZ3AhnVkiLrDdxUN1jVT55QATMiypRoutjxuFMEAGjg+PJ+PDTHiPs+k31dFqO
         ndHHiecTQjywVs9+paTthSwpncAtGVVMS2aCYd/vhA6JsATQsFpRHKyE0RciWHa+oRhP
         BcMQDATeWO+Z7y+v9rY26W9FTl9xO6XZaff94eNaG7GMFv14MGEgIOgnV6d9smES3dQp
         YEIg==
X-Gm-Message-State: AOAM5325cAhyb5tsE7QtRUjIQn2/2rim4pPXiX+QSrvqGVXWxS4w9h7n
        3N1Q63ySIKqXr/bKNegLROLeKkmWaHwVJ2zj1jI=
X-Google-Smtp-Source: ABdhPJzlcGp+g2JguAslbNNetfOmTDpUChH371lj/70OEzVbirOOzMASu+MS44IzUxJNLSehlo2iqfcbD+TgIVvXxBI=
X-Received: by 2002:a05:6870:4250:b0:f2:be0e:96fb with SMTP id
 v16-20020a056870425000b000f2be0e96fbmr7621035oac.216.1653814353683; Sun, 29
 May 2022 01:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220528073445.50066-1-c.lobrano@gmail.com> <CAGRyCJG93qP=Baui6DfizrV6SjHoRNNbLnPjeWBy-mUVS=Yexw@mail.gmail.com>
In-Reply-To: <CAGRyCJG93qP=Baui6DfizrV6SjHoRNNbLnPjeWBy-mUVS=Yexw@mail.gmail.com>
From:   Carlo Lobrano <c.lobrano@gmail.com>
Date:   Sun, 29 May 2022 10:50:45 +0200
Message-ID: <CA+KuA8cHDMHA4xJt-CWnmmB4LnPBa+y7gN6az06c6DUs0aVa4g@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: option Add Telit LN910Cx 0x1250 composition
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Daniele


On Sat, 28 May 2022 at 23:56, Daniele Palmas <dnlplm@gmail.com> wrote:
>
> Hi Carlo,
>
> Il giorno sab 28 mag 2022 alle ore 22:24 Carlo Lobrano
> <c.lobrano@gmail.com> ha scritto:
> >
> > Add support for Telit LN910Cx 0x1250 composition
> >
> > 0x1250: rmnet, tty, tty, tty, tty
> >
> > Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> > ---
> >
> > Hello,
> >
> > here is the lsusb output, thanks.
> >
> > Bus 001 Device 002: ID 1bc7:1250 Telit Wireless Solutions LE910C1-EU
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass            0
> >   bDeviceSubClass         0
> >   bDeviceProtocol         0
> >   bMaxPacketSize0        64
> >   idVendor           0x1bc7 Telit Wireless Solutions
> >   idProduct          0x1250
> >   bcdDevice            3.18
> >   iManufacturer           1 Android
> >   iProduct                2 LE910C1-EU
> >   iSerial                 3 0123456789ABCDEF
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x00eb
> >     bNumInterfaces          5
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0x80
> >       (Bus Powered)
> >     MaxPower              500mA
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       255 Vendor Specific Class
> >       bInterfaceSubClass    255 Vendor Specific Subclass
> >       bInterfaceProtocol    255 Vendor Specific Protocol
> >       iInterface              0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0008  1x 8 bytes
> >         bInterval               9
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x01  EP 1 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       255 Vendor Specific Class
> >       bInterfaceSubClass      0
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       ** UNRECOGNIZED:  05 24 00 10 01
> >       ** UNRECOGNIZED:  05 24 01 00 00
> >       ** UNRECOGNIZED:  04 24 02 02
> >       ** UNRECOGNIZED:  05 24 06 00 00
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x84  EP 4 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x000a  1x 10 bytes
> >         bInterval               9
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x83  EP 3 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x02  EP 2 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        2
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       255 Vendor Specific Class
> >       bInterfaceSubClass      0
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       ** UNRECOGNIZED:  05 24 00 10 01
> >       ** UNRECOGNIZED:  05 24 01 00 00
> >       ** UNRECOGNIZED:  04 24 02 02
> >       ** UNRECOGNIZED:  05 24 06 00 00
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x86  EP 6 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x000a  1x 10 bytes
> >         bInterval               9
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x85  EP 5 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x03  EP 3 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        3
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       255 Vendor Specific Class
> >       bInterfaceSubClass      0
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       ** UNRECOGNIZED:  05 24 00 10 01
> >       ** UNRECOGNIZED:  05 24 01 00 00
> >       ** UNRECOGNIZED:  04 24 02 02
> >       ** UNRECOGNIZED:  05 24 06 00 00
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x88  EP 8 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x000a  1x 10 bytes
> >         bInterval               9
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x87  EP 7 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x04  EP 4 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        4
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       255 Vendor Specific Class
> >       bInterfaceSubClass      0
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       ** UNRECOGNIZED:  05 24 00 10 01
> >       ** UNRECOGNIZED:  05 24 01 00 00
> >       ** UNRECOGNIZED:  04 24 02 02
> >       ** UNRECOGNIZED:  05 24 06 00 00
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x8a  EP 10 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x000a  1x 10 bytes
> >         bInterval               9
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x89  EP 9 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x05  EP 5 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> > Device Qualifier (for other device speed):
> >   bLength                10
> >   bDescriptorType         6
> >   bcdUSB               2.00
> >   bDeviceClass            0
> >   bDeviceSubClass         0
> >   bDeviceProtocol         0
> >   bMaxPacketSize0        64
> >   bNumConfigurations      1
> > Device Status:     0x0000
> >   (Bus Powered)
> >
> > ---
> >  drivers/usb/serial/option.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 152ad882657d..a0bfc9a187d8 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -1255,6 +1255,8 @@ static const struct usb_device_id option_ids[] = {
> >           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
> >         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1203, 0xff),    /* Telit LE910Cx (RNDIS) */
> >           .driver_info = NCTRL(2) | RSVD(3) },
> > +       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),    /* Telit LE910Cx (rmnet) */
> > +         .driver_info = NCTRL(0) },
>
> Thanks for adding support for Telit composition 0x1250!
>
> Note, though, that interface 0 is rmnet that does not need NCTRL, but RSVD.
>
> Regards,
> Daniele
>
> >         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1204, 0xff),    /* Telit LE910Cx (MBIM) */
> >           .driver_info = NCTRL(0) | RSVD(1) },
> >         { USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG4),
> > --
> > 2.32.0
> >

you are right, thanks for notice it. I will send the v2 asap

Carlo
