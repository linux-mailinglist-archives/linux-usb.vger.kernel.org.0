Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E929683A6C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 00:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjAaXYU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 18:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjAaXXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 18:23:54 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D3235BF
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 15:23:29 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 7so11228129pga.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 15:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cu8tklsyAymcSrqGUlRmNmim7c7BEdwoohSZMNePtI8=;
        b=pJ5oHxky75g0Zv+8JSBUfhiQQhtAlzpZpeEwb7GrJcwAZNKp9UkaqiGQ4SNH+1fz/S
         /5Myl51sNJn5x9YOt2DwbKib3cnxcpt0CD3+q8TttSLsdChRUdWrAvSofrtu37rK8HIU
         USI4LUMzzQtzz70qUnUHQ6PbHhawo7teSdf/U42++Ao3zW9fmg6BpMoa8U3aYYStnrj7
         o0pBTm8tIIUWkpUzjXUUU0/5qT4Bwj5Lttwk4UNpQ2LvWEe/VIWaTac3H5moJiYpbvuW
         JNOlTgqERJgap8hK6EAmsEbqlWUC1x5EBwDqrYTx8MIHGgL8GZL6ZLwkF31azOyF8p3m
         1yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu8tklsyAymcSrqGUlRmNmim7c7BEdwoohSZMNePtI8=;
        b=HdBWVOgV8pqhVN/y7mAKY/301dgMRkFzODduJdkr/mo3G2AHhBv1MANklZBe9SFsYq
         UD4KDU96izuBBHknIA43/Zwk9Bi/quyqquwVoKxyp8R4QqRZyVtLxUMXLBnEKsDTRKrg
         ZqBZVsbRtgkD44lJtrcQhaETGSxp84P5ScTLodeLooM21B4a6g1nj77zISBaVQsNgp7K
         STeYdDGXGe/tGygLSkqWTBmNk9a2CCz2ZDCSn9GlNXPxzn0wdMoLWoSzcamPd88xQese
         QKjfsG47lV1QM5F0bCz2uznfLxMTqzWSN0iIEnRez7eC3cqh8RCP3/B7YRvxzOtAeNus
         4Log==
X-Gm-Message-State: AO0yUKXBWFQgHBSHomjqcpyV4yYeyrRTfOpAtU62qP46yGFQD/fryAS5
        7OGTGDQkvZx27gWuv5a5+aiQ2D5mwz+CuSTXkTx1tqnzmnE=
X-Google-Smtp-Source: AK7set9iUxsK7RZgabmB1upiou+Nbp66tPRbYNUNGWDFOagsyumPshKbnCnUf9YyGK15LuAbglZxkp8YUIwwmvtSyTQ=
X-Received: by 2002:a62:e819:0:b0:593:11c7:e0f9 with SMTP id
 c25-20020a62e819000000b0059311c7e0f9mr53753pfi.40.1675207388826; Tue, 31 Jan
 2023 15:23:08 -0800 (PST)
MIME-Version: 1.0
References: <CABdb6gwzmiE6jH9jSCMucASNKrK-hkaQgxG7K04vjgdxE-L4-w@mail.gmail.com>
In-Reply-To: <CABdb6gwzmiE6jH9jSCMucASNKrK-hkaQgxG7K04vjgdxE-L4-w@mail.gmail.com>
From:   Fehmi Demiralp <f.demiralp@gmail.com>
Date:   Wed, 1 Feb 2023 00:22:56 +0100
Message-ID: <CABdb6gxuzWhk05Q4Q+eVDP+-vwD0=Ggusn-b4ciKuQ6+qrfwTw@mail.gmail.com>
Subject: Re: Prolific Technology, Inc. USB-To-USB Cable Bridge
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

Hello There,

Regarding the recommendation on the dmesg of my Fedora 36,  the
information about the USB 3.0 Data Transfer Cable by lsusb is inlined
below.
(Please find more information unde the link
https://www.cablematters.com/pc-1177-135-usb-30-data-transfer-cable.aspx#Support)

Best Regards,

Fehmi Demiralp

# lsusb
Bus 002 Device 021: ID 067b:27a1 Prolific Technology, Inc. USB-To-USB
Cable Bridge
Bus 002 Device 020: ID 067b:27a1 Prolific Technology, Inc. USB-To-USB
Cable Bridge

# lsusb -v -d 067b:27a1

Bus 002 Device 021: ID 067b:27a1 Prolific Technology, Inc. USB-To-USB
Cable Bridge
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x27a1
  bcdDevice            1.00
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-To-USB Cable Bridge
  iSerial                 3 PROLIFICMP000000020
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x004f
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower               96mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x08  EP 8 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      HIRD Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
Device Status:     0x000c
  (Bus Powered)
  U1 Enabled
  U2 Enabled

Bus 002 Device 020: ID 067b:27a1 Prolific Technology, Inc. USB-To-USB
Cable Bridge
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x27a1
  bcdDevice            1.00
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-To-USB Cable Bridge
  iSerial                 3 PROLIFICMP000000020
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x004f
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower               96mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x08  EP 8 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      HIRD Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
Device Status:     0x000c
  (Bus Powered)
  U1 Enabled
  U2 Enabled

________________________________
