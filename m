Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706F1586F71
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 19:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbiHARTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 13:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiHARTP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 13:19:15 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98611D51
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 10:19:14 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id w129so5886182vkg.10
        for <linux-usb@vger.kernel.org>; Mon, 01 Aug 2022 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=gpzqa5OMVXfNjZUV5orlHGJKmuaftnx7tvm4Eh1NXpQ=;
        b=Qr/XClYeudNFRzR+TwOrqATKwRr7WajjNXtME843z7qn1Mf7n37kSoSGfl3mZU3spy
         wJ5D/70qNAakGTKSQv5xkj2W+busBRqiDAYuUXXP5WZCJ8F0xrizUI2Vn1gIfOjwzqFZ
         Tc7Ib+jaHf4L24OnQ0HVk/CKxY281k3OnH86hVbETRw/jE7JM6S77Jk0X/e3A2HMODuP
         LIp4nijNwc7EKI5QAle7bRi4k0HhYGSZZHYLlY6bowVcXB63tqOSfEXccCgx6W6MaCLc
         NmWhlMhnkJYycaEpTro3vZ1alg9DrIEy6O93Kd7HisMqbMY9EcHZzckIPzYQF33Rd0J4
         +x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=gpzqa5OMVXfNjZUV5orlHGJKmuaftnx7tvm4Eh1NXpQ=;
        b=6eoxYCuYy9Q61CV0wE2hvSU2KAzaqk9/B7MtgJi5d+CDF3XYjqEzluf5myIEflNaxp
         yI2SU5WSDMUEx5ClLG2pGJ1u+5A8xj21kanqoNnk9d9lPtadRZR3En67DGOj/H3uwHoR
         ADZvow/sy2UVP4hQ9hW60TlRmSPo48fx4B5nBw5i9TvAFwYX0/qj2E+AC4j//JZdWEUm
         ffscsfvyqQgDp0xi5wnXFiO7ZQjx8HLvvsECKCyOrGQ+glFLXH+nrjRTYzdjJXX5+02O
         Jz7mtZLDrMT5SJHXryN41kbOTL9I0SR9AN3REfBh0tYIwgZGC02cN8d/w+o24mTufWen
         QqcQ==
X-Gm-Message-State: ACgBeo0k7i3GLGW6r5pawTiSGvb/XS8g4vJDhD6n4hx/nFzM4FIBlsUw
        2/LG3QVp871FNknZi0Smm09LXL/v2OEFk2E2FEPAU9KN
X-Google-Smtp-Source: AA6agR6Nf7vt52TM25EMYoXY1rL5xC+0+eKCSVq1h0fkOmBan51ihZBTWK9wqmEEk6rV2bMM7H0XNO+8oTR0sWQbxcs=
X-Received: by 2002:a1f:1bd1:0:b0:377:b693:bb39 with SMTP id
 b200-20020a1f1bd1000000b00377b693bb39mr215439vkb.22.1659374353353; Mon, 01
 Aug 2022 10:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANyrUpxawx0iba88N6g=w_sOwF9Nepe4UgQbWTpVsWjN7oiKrw@mail.gmail.com>
In-Reply-To: <CANyrUpxawx0iba88N6g=w_sOwF9Nepe4UgQbWTpVsWjN7oiKrw@mail.gmail.com>
From:   Pere Blay <pereblay@gmail.com>
Date:   Mon, 1 Aug 2022 19:19:01 +0200
Message-ID: <CANyrUpwZCHQTgoo-8vQxqcnnmETVchiZjfKXOnbTYHKWBra0nw@mail.gmail.com>
Subject: Fwd: PL2303 unknown device type in kernel
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi and thanks,

I get this message when plugin a usb device wich uses a usb-serial converter:

[ 5097.161310] usb 1-3.4.1: New USB device found, idVendor=067b,
idProduct=23d3, bcdDevice= 4.00
[ 5097.161326] usb 1-3.4.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[ 5097.161332] usb 1-3.4.1: Product: USB-Serial Controller
[ 5097.161336] usb 1-3.4.1: Manufacturer: Prolific Technology Inc.
[ 5097.161340] usb 1-3.4.1: SerialNumber: DGARb193428
[ 5097.170447] pl2303 1-3.4.1:1.0: pl2303 converter detected
[ 5097.170470] pl2303 1-3.4.1:1.0: unknown device type, please report
to linux-usb@vger.kerne.org

Then, I'm reporting.

My system:

$ uname -r
5.17.5-051705-generic

Output of lsusb:
$lsusb -d 067b:23d3 -v

Bus 001 Device 017: ID 067b:23d3 Prolific Technology, Inc. USB-Serial Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x23d3
  bcdDevice            4.00
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 3 DGARb193428
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
Device Status:     0x0000
  (Bus Powered)

Anything to make it work? thanks a lot.
Pere Blay
