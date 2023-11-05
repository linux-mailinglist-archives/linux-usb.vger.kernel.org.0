Return-Path: <linux-usb+bounces-2545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65427E1340
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 13:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2377D2813BD
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 12:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B2ABA2B;
	Sun,  5 Nov 2023 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXA6OrMD"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F941B66D
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 12:02:21 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C07FB
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 04:02:19 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so5985186a12.3
        for <linux-usb@vger.kernel.org>; Sun, 05 Nov 2023 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699185737; x=1699790537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ULRZxqpz6jrWkTei6MQpuWNUK4OPDyJfETbLXRnqMDg=;
        b=fXA6OrMDuTC/Fy1zI3A52+kvxEUa7LyNJmwOp7P21nI4L2hhegQUK7ea3DxTdUywjT
         rq39iiajmsTQmKCebGcM8hNk+9hUd84kJCbe930t7Y0TB42PGO+STv8f6QspD1uon5JF
         9ggHorO/MmSCtX1IpXFoXqpWgSUyX8RIctuHjsyoS3d+X3qbgZnw7kH5DruYjx6KNQRF
         t8r4K9pGGjWQ0NwR6fCZuPbTOCR+zoVmVfjHGjo1s+GALc9K7bY507Eqfv8nK80MsZ8X
         wB9L5xKEbokqmJdgigRyX2SdqJr0Dd4XtxcER6+cc6vzM2FzX60nn6nEQC9q4IVd3Fz+
         fYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699185737; x=1699790537;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULRZxqpz6jrWkTei6MQpuWNUK4OPDyJfETbLXRnqMDg=;
        b=Vo4FdLpUwL5aJwDwF8+2SNMpSropt6jUmZo7TCOadetRP9KbTrx/gBckojh6OF4pDu
         dFzatFfRP75/cNHdiZWgUyr9+HdgvtlkJMVbPfoEGMwQ2wo1v2FkLq6QoIfMOi9kd7/M
         NIL+fU1wGWDOFjzWWgzqigvnK+wiRJVAxwLf2Pxk9WQYGEBktTfcA2Jcb7fIPEBUwcwc
         q5uWIf2kxdFhXu0IsxFYY9PV8aEKby3rWItlXsiFzyIH4lGBk6fMFcJtwN34fHTCYpSb
         J2sr9qaTZa9n2m+nTPeNMZ21TgXiiMp8+caVSVqquozlwfvMX/94f8I7deCAYokKX8sS
         /Ayw==
X-Gm-Message-State: AOJu0YwkZfQmV4KA9nAcIpVKglbGCilp6kK26n2JaAuE42s5ZYHWpNUX
	U8wC/mTS2WjvpT1gUqaNUDyXnUVoodk=
X-Google-Smtp-Source: AGHT+IF3HKNkrY7+zuRNNeQ5Jta07WettzD8IaSM8IEskHSaWLA1QWRmYwVOi68NIAaXu6dR8L2miw==
X-Received: by 2002:a17:907:3f02:b0:9bf:f20:876d with SMTP id hq2-20020a1709073f0200b009bf0f20876dmr13194423ejc.75.1699185737421;
        Sun, 05 Nov 2023 04:02:17 -0800 (PST)
Received: from ping (dynamic-2a01-0c23-614a-dd00-56d7-c8e7-9783-ba85.c23.pool.telefonica.de. [2a01:c23:614a:dd00:56d7:c8e7:9783:ba85])
        by smtp.gmail.com with ESMTPSA id jp6-20020a170906f74600b009ad89697c86sm2976970ejb.144.2023.11.05.04.02.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 04:02:17 -0800 (PST)
Date: Sun, 5 Nov 2023 13:02:15 +0100
From: Fabian Melzow <fabian.melzow@gmail.com>
To: linux-usb@vger.kernel.org
Subject: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480 Mbps
Message-ID: <20231105130215.2b669c8b@ping>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I have three USB "3.0" WLAN sticks (https://i.imgur.com/zSg5s0d.jpg)
which are all based on the Realtek RTW8822BU (<=780 Mbps with IEEE
802.11ac) and use the same vendor and product ID 0bda:b812 and have the
exact same output of "lsusb -vd 0bda:b812".

These devices should report 5 Gbps for USB 3.0 in the Binary Object
Store Descriptor, but don't do so.

Maybe it is possible to add a software fix for this hardware
problem, so I report it here.

Output of lsusb from usbutils 017 on x86_64 with kernel 6.6.0:

Bus 001 Device 003: ID 0bda:b812 Realtek Semiconductor Corp. RTL88x2bu [AC1200 Techkey]
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.10
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0xb812 RTL88x2bu [AC1200 Techkey]
  bcdDevice            2.10
  iManufacturer           1 Realtek
  iProduct                2 USB3.0 802.11ac 1200M Adapter
  iSerial                 3 123456
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0035
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           5
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              2 USB3.0 802.11ac 1200M Adapter
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x05  EP 5 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x06  EP 6 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               3
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x08  EP 8 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
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
    wSpeedsSupported   0x0006
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        1023 micro seconds
Device Status:     0x0000
  (Bus Powered)

