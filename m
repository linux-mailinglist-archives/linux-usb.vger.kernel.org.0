Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886FD55033D
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 08:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbiFRGnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jun 2022 02:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiFRGm7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jun 2022 02:42:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1777911151
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 23:42:57 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n20so5496665ejz.10
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=XMcMUGxWymuYEPef2BLDRpHbLeH9y/O8bz7IVsvh5Pw=;
        b=nacu6P6THsy22KTvIIcreSmpKzz1EF3zbVo1wRGy9zIX2hntHn5nwi+gj369uAm70H
         3IlHzX7psVJHIAr5G5jX2sZtABUrXwf31aWIL4bToCy7CVMr3gQFODnP9ynD54bAJzW8
         xfbm4JPZbK2GbXo1v1/7fvQKDy6BlZwaHSazIOvLltys/PeSbMg1WZffCUfJr7ogrbtq
         zc3HEqJexPQxyiF5QUkmKypngjfwmrnhEYPhKOJeQWdiHK4ht8+Kt8MzQHrJJDxNfWTS
         /kKZXnevNQU5/yRaoQaEkcBOPN5kZCDUkswD0DvKM9XxGKdvLG2bsKwRSRyHPGTpDgAM
         VcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=XMcMUGxWymuYEPef2BLDRpHbLeH9y/O8bz7IVsvh5Pw=;
        b=bsLV9Z03p8AYi5nv6Wg73sYcOaK/UA45oro5M98i7JmzzQ7xu3n1QfhRiTAp0NCzbV
         SXMVC+HIbE6dXDG115CW0I1Kh4UohU7YaiplGE7sKe8+XaCyCJfbptlJ1tDiVdKnRM8n
         DKXmHt1dIf077e5JoNunh9wAeVTSw6rgfeK5kTQP7fWJF1bqiZUotj8jsnszsUznNtcf
         XkxXm4iOv1mkjID4tcYT9EUc2lH9q1SjV1MrG+zSAkPVdQ6E81iS3QlvlgFukfCXiBYa
         Ct+3AhLDxDA/PmCz0xFiErp8Xze1kgoz3rMUo7B1nBMZ+g8fd4rNEKfhvvxpwdsTmhey
         ZxOw==
X-Gm-Message-State: AJIora/7PDUZFqvco52z+UUcnLTOJ34/bMAAl5XvASRnlbInX5O8vB3F
        ml9UrkZA1XKar9PZsatBL2bLHDjBbRvlv3q9aulK7wQ=
X-Google-Smtp-Source: AGRyM1t8WVbPbbnVXnKJeMZREdeXPMdckjmfaAYPDkCqHS2XhxU4Ew6D8E/f9JLk3R4w4r9WwPoTCQ8jXRO0HsUP3R8=
X-Received: by 2002:a17:906:51c5:b0:711:f4ee:6574 with SMTP id
 v5-20020a17090651c500b00711f4ee6574mr11956710ejk.509.1655534575261; Fri, 17
 Jun 2022 23:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAA0uCUZV0Jdc5HJnPg=Rqv06+UVYAudbx5qUNOatE9ZZsP6vsA@mail.gmail.com>
In-Reply-To: <CAA0uCUZV0Jdc5HJnPg=Rqv06+UVYAudbx5qUNOatE9ZZsP6vsA@mail.gmail.com>
From:   Giles Roadnight <giles.roadnight@gmail.com>
Date:   Sat, 18 Jun 2022 07:42:43 +0100
Message-ID: <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com>
Subject: Prolific Technology pl2303: unknown device type
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

Hi

I am trying to connect a Prolific pl2303 to my raspberry pi 4 running
raspberry pi os 64 bit. When I look at dmesg I get the following
output:

[ 31.714397] cam-dummy-reg: disabling
[ 44.046197] usb 1-1.1: USB disconnect, device number 3
[ 47.254348] usb 1-1.1: new full-speed USB device number 4 using xhci_hcd
[ 47.361386] usb 1-1.1: New USB device found, idVendor=067b,
idProduct=23a3, bcdDevice= 6.05
[ 47.361402] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 47.361407] usb 1-1.1: Product: USB-Serial Controller
[ 47.361412] usb 1-1.1: Manufacturer: Prolific Technology Inc.
[ 47.361417] usb 1-1.1: SerialNumber: ALBAb115819
[ 47.364081] pl2303 1-1.1:1.0: pl2303 converter detected
[ 47.364106] pl2303 1-1.1:1.0: unknown device type, please report to
linux-usb@vger.kernel.org

so I followed the example and emailed this address!

and with lsusb:

lsusb -v
Bus 001 Device 004: ID 067b:23a3 Prolific Technology, Inc. USB-Serial Controller
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x23a3
  bcdDevice            6.05
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 3 ALBAb115819
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0

Any help much appreciated. Thanks

Giles Roadnight
http://giles.roadnight.name
