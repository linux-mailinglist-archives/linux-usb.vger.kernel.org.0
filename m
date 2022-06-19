Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A9B550983
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jun 2022 11:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiFSJmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 05:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiFSJmA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 05:42:00 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4995FF598
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 02:41:58 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kq6so15940208ejb.11
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=albMXVUJN1PyGD+EU711OCycIp/tK1F14rNQyz6apOY=;
        b=mJDGGgN2uhtyqgP3fR9DzByErx7HfhoZnqyKaMxWzVtxqMw+FkKIhoWliPkAWfOyMz
         OWkoQ7IDBrR0v0wb4UoELcwfWxHTcjBGTH1xr95qAND9pMiyITjsB72dMC5Mg5RKh/ko
         PJ1tYp3jZoOcFM/f56GgfgvrAjJulS8WWsdBk56uUavE3R5QPBbRq94a8oHQ+sPgUfpu
         UeK9CGcOAxMQoyGTT/J3Zu439aVXEKf9JZrmxstTLePaVY3Ce67EvVTNRHN9UNWbZM1C
         Hn/YpDBxob3wRWqkgc+aszMX0CRp7lv9MXY1iZ4m4lHDxnBIOLYbypaKeEMSreFlHeR+
         sdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=albMXVUJN1PyGD+EU711OCycIp/tK1F14rNQyz6apOY=;
        b=bs96UP30Qj+8OysIW5zjQZ+8CrCE9K4SMKHSGg5N9N5SqOocZcdh/OBH0pK1mC/kC0
         TF++V+2WZ4cqExeUUJ/G+j9sIEsl4vEZA4SW+xH5Ir4+fiHzR0W7ShWHTPxmJch2c/6l
         2t14sJm+gL39sbfA0M47Bb1zIE/KK5KLAU16xC59rA7L6XL2ynXc07x1pJP1lx7KjR61
         Lx8VD5zAIlwaL1JBSOCMuiRu6V7R634k4lyko2vapjBFpC3+NvPRiVr1Ilx/P4ALH4B7
         n7Vhf+/XgLlHkDuO9T+lbONdFMKKlw59Vd4vRMQzxoN4quFlWl1xopUFP52KA7vWj5bf
         T4Mw==
X-Gm-Message-State: AJIora+IMj81ofDn2gtsoRM07Ft/GsgEp3ddB1gIhYN5qio4PCIzK0F6
        c3PZwuPdcMpQOwkbFtBNj/1HNJxOBavQeTZJKJoRDu8=
X-Google-Smtp-Source: AGRyM1szUMbY1e15sHIDH9fEKKoGSjCNiKNHC3L77JPTAz+U9hSHoTkGmpLg13h+FXt9PV+/sRRegbZyKN4XK4ag8ik=
X-Received: by 2002:a17:906:51c5:b0:711:f4ee:6574 with SMTP id
 v5-20020a17090651c500b00711f4ee6574mr15912635ejk.509.1655631716370; Sun, 19
 Jun 2022 02:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAA0uCUZV0Jdc5HJnPg=Rqv06+UVYAudbx5qUNOatE9ZZsP6vsA@mail.gmail.com>
 <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com>
In-Reply-To: <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com>
From:   Giles Roadnight <giles.roadnight@gmail.com>
Date:   Sun, 19 Jun 2022 10:41:47 +0100
Message-ID: <CAA0uCUZ=wNKoWi7H0Y8AMepxZoasJQ9mmBm8HpcA1e=NSFOOfw@mail.gmail.com>
Subject: Re: Prolific Technology pl2303: unknown device type
To:     linux-usb@vger.kernel.org
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

I have managed to get this working on an older version of the kernel.
I have tried raspberry pi os buster (debian version 10) and the serial
port was correctly created.
It was Raspberry pi os bullseye (debian 11) that this did not work for.

Giles Roadnight
http://giles.roadnight.name


Giles Roadnight
http://giles.roadnight.name


On Sat, 18 Jun 2022 at 07:42, Giles Roadnight <giles.roadnight@gmail.com> wrote:
>
> Hi
>
> I am trying to connect a Prolific pl2303 to my raspberry pi 4 running
> raspberry pi os 64 bit. When I look at dmesg I get the following
> output:
>
> [ 31.714397] cam-dummy-reg: disabling
> [ 44.046197] usb 1-1.1: USB disconnect, device number 3
> [ 47.254348] usb 1-1.1: new full-speed USB device number 4 using xhci_hcd
> [ 47.361386] usb 1-1.1: New USB device found, idVendor=067b,
> idProduct=23a3, bcdDevice= 6.05
> [ 47.361402] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [ 47.361407] usb 1-1.1: Product: USB-Serial Controller
> [ 47.361412] usb 1-1.1: Manufacturer: Prolific Technology Inc.
> [ 47.361417] usb 1-1.1: SerialNumber: ALBAb115819
> [ 47.364081] pl2303 1-1.1:1.0: pl2303 converter detected
> [ 47.364106] pl2303 1-1.1:1.0: unknown device type, please report to
> linux-usb@vger.kernel.org
>
> so I followed the example and emailed this address!
>
> and with lsusb:
>
> lsusb -v
> Bus 001 Device 004: ID 067b:23a3 Prolific Technology, Inc. USB-Serial Controller
> Couldn't open device, some information will be missing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x067b Prolific Technology, Inc.
>   idProduct          0x23a3
>   bcdDevice            6.05
>   iManufacturer           1 Prolific Technology Inc.
>   iProduct                2 USB-Serial Controller
>   iSerial                 3 ALBAb115819
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
> Any help much appreciated. Thanks
>
> Giles Roadnight
> http://giles.roadnight.name
