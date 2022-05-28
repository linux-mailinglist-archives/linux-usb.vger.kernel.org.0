Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F7F536EB1
	for <lists+linux-usb@lfdr.de>; Sun, 29 May 2022 00:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiE1V4r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 May 2022 17:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiE1V4q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 May 2022 17:56:46 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AC765BC
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 14:56:45 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id jx22so14488296ejb.12
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 14:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zk0xQE5PRMOr7nr72k5i+07rYXMkONWXxhGxrl6OBpA=;
        b=NaK7HMSPWpJPZkJu7MiD40ovJsE9xXyKBI+PAm3bjxfT/+5FXFY+6fRQ6vDAfhxAFS
         gi5LOxn0mscbRTu0Gh7d3fgPVTfceiN5Z6WFeAITlDbTiwy3MGqnJ/HsunhJz9pUebWV
         oIByIOIc6ugxcKLVy9VU1gojhvfr8scMaLkRorccEs6dMqIi51T9Zgm2oSvRBWdTNhm3
         4hBcTeXBB+ixgKsm827frM0I7+NAOyVVhOt4rZqPgVv68i5xrBUMB2MdS/ZD0mt/2Kuv
         +O90uZwbBxXEaRyh26ygMBJli9RwNTLCC9/B8XPwLJOc5f2DPCMFlYXtzAkBtaPjR2x2
         fbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zk0xQE5PRMOr7nr72k5i+07rYXMkONWXxhGxrl6OBpA=;
        b=esmj6FodNZpoMfYAMF1qG99rFuczYrK8tbc8a8oK50jyNMhOnAgMVL5wAIcuLofGTz
         nKg1/oW4k3CmQXk0+hUdavuxOManSxsBy1sKaxrYCMF8Myw2BKGuP10Vg93NvsY+Vo3v
         vu5H69eGHF3Gs/aAG8fHW7lL2scTFCWdGiz2yRBDljjLIV9b1iPfGynoz53eIw4ENGi5
         dxFiSfWlBp0tV4VnmFgrR4js9oZP68/IyW1Hd3s3awPPj0QPU2cHD1rOvbYAOybK9o7C
         lND4l3RkxmBix1vfeOk0ja0oDO5TaT0cJeUnTPp4d2Uw148uzTFUi8/SrTubzdV50CHv
         4tRQ==
X-Gm-Message-State: AOAM5323519dAtsvhYoSPDJM2RbPa1W8fuSmPE3lfc0Yj9vl/3n0eKB0
        4hcidQAF2Qppwy3qatIHRhaFiQdn+JAqPBsVzcg=
X-Google-Smtp-Source: ABdhPJyz/wzLsKjCav1vOrLaRSlgz3z07Vt+/Cu44jYmZNWplugbIHNkinlBLapuc+oW4B1YeoEYP7nIxjjg5BE5qXo=
X-Received: by 2002:a17:907:3f90:b0:6fe:cd08:dc21 with SMTP id
 hr16-20020a1709073f9000b006fecd08dc21mr30777555ejc.136.1653775003905; Sat, 28
 May 2022 14:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220528073445.50066-1-c.lobrano@gmail.com>
In-Reply-To: <20220528073445.50066-1-c.lobrano@gmail.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Sat, 28 May 2022 23:56:32 +0200
Message-ID: <CAGRyCJG93qP=Baui6DfizrV6SjHoRNNbLnPjeWBy-mUVS=Yexw@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: option Add Telit LN910Cx 0x1250 composition
To:     Carlo Lobrano <c.lobrano@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Carlo,

Il giorno sab 28 mag 2022 alle ore 22:24 Carlo Lobrano
<c.lobrano@gmail.com> ha scritto:
>
> Add support for Telit LN910Cx 0x1250 composition
>
> 0x1250: rmnet, tty, tty, tty, tty
>
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> ---
>
> Hello,
>
> here is the lsusb output, thanks.
>
> Bus 001 Device 002: ID 1bc7:1250 Telit Wireless Solutions LE910C1-EU
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x1bc7 Telit Wireless Solutions
>   idProduct          0x1250
>   bcdDevice            3.18
>   iManufacturer           1 Android
>   iProduct                2 LE910C1-EU
>   iSerial                 3 0123456789ABCDEF
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x00eb
>     bNumInterfaces          5
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass    255 Vendor Specific Subclass
>       bInterfaceProtocol    255 Vendor Specific Protocol
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval               9
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       ** UNRECOGNIZED:  05 24 00 10 01
>       ** UNRECOGNIZED:  05 24 01 00 00
>       ** UNRECOGNIZED:  04 24 02 02
>       ** UNRECOGNIZED:  05 24 06 00 00
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x000a  1x 10 bytes
>         bInterval               9
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       ** UNRECOGNIZED:  05 24 00 10 01
>       ** UNRECOGNIZED:  05 24 01 00 00
>       ** UNRECOGNIZED:  04 24 02 02
>       ** UNRECOGNIZED:  05 24 06 00 00
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x86  EP 6 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x000a  1x 10 bytes
>         bInterval               9
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x03  EP 3 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       ** UNRECOGNIZED:  05 24 00 10 01
>       ** UNRECOGNIZED:  05 24 01 00 00
>       ** UNRECOGNIZED:  04 24 02 02
>       ** UNRECOGNIZED:  05 24 06 00 00
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x88  EP 8 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x000a  1x 10 bytes
>         bInterval               9
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x87  EP 7 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x04  EP 4 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        4
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       ** UNRECOGNIZED:  05 24 00 10 01
>       ** UNRECOGNIZED:  05 24 01 00 00
>       ** UNRECOGNIZED:  04 24 02 02
>       ** UNRECOGNIZED:  05 24 06 00 00
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x8a  EP 10 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x000a  1x 10 bytes
>         bInterval               9
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x89  EP 9 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x05  EP 5 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0000
>   (Bus Powered)
>
> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 152ad882657d..a0bfc9a187d8 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1255,6 +1255,8 @@ static const struct usb_device_id option_ids[] = {
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1203, 0xff),    /* Telit LE910Cx (RNDIS) */
>           .driver_info = NCTRL(2) | RSVD(3) },
> +       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),    /* Telit LE910Cx (rmnet) */
> +         .driver_info = NCTRL(0) },

Thanks for adding support for Telit composition 0x1250!

Note, though, that interface 0 is rmnet that does not need NCTRL, but RSVD.

Regards,
Daniele

>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1204, 0xff),    /* Telit LE910Cx (MBIM) */
>           .driver_info = NCTRL(0) | RSVD(1) },
>         { USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG4),
> --
> 2.32.0
>
