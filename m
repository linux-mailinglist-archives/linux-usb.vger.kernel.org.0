Return-Path: <linux-usb+bounces-3323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BB37F91A9
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 07:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F521C20AFF
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 06:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DA03C2F;
	Sun, 26 Nov 2023 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeqc1aJ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A5A110
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 22:38:38 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso3006854276.3
        for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 22:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700980717; x=1701585517; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vISbD30EvP+9aupIShYJZV4weiqPCww0YgFpdMlRk4A=;
        b=aeqc1aJ9WNlugomv5Ths7jHFePX1o7YFIiJXOQdOGI4Iwsn2bdKaFghxxTZG0i7FAk
         8M7cj4xKt5hNW1jCtSqd3yPqc1L7DFSvwGsBSRy458Xl/7gv9RpelnhHJplSLBywtOUM
         Le2+LaL3+zUKqPUPtNGBOK9cEry6hUxut+K4AYreTX58Tgpmik5awDglN0lojRkWwtiv
         K1VjmS12P4KlFfLzHOQIHuj5cev9rIHJIOLsmXo15pSIqiBmfm6zXvB/QiXuV9KhwCg9
         L3eCSb8HaQkZtv463oy+XazLL++0J+eV5M1z8vfW3wahObQK57MN+VQX6x6/7QdhlgDK
         I5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700980717; x=1701585517;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vISbD30EvP+9aupIShYJZV4weiqPCww0YgFpdMlRk4A=;
        b=Qs90EKBI78vCC74nzupyFPLDC51WWh4KEmeoFE524y0fspYFmrZab4neSEfYTDqtXt
         uYCfnz7RMYD8pVTd08RS84hvYjWB3FwZ4ue1dcitHkuvzXHbqQLClCrj2fId32INRgop
         VXf5hfgzJSEsbWgowEjUxyYcsidqDxYTcID15o4rS+Hy49XhY4znetLlSQwBVSKTmBuT
         gwiwscBL8xClr0dj22raN9jaG/9McGbMafcQ6cYIt687BW90ETMgw1vRtB65dz7UcI8+
         9lQB6TJanJ2ibh0r5p44bAyVpxDo9uH2DV8AuH7rvVngThfumUxihsfBxzoNC3YBwS2U
         /N3Q==
X-Gm-Message-State: AOJu0Yw4e2Jzz8UROvsEsqn3iWHAj99JRXueHz070YC5T4fGKyo35E5B
	57LuDWk8M+Ykt2nqS+ciLa7LTq/FBU1e31n4CXzL8mRmWlA=
X-Google-Smtp-Source: AGHT+IHCQuLu8zvgU9zslSNumZ8wGMkT/VWIrEfz9Wo5udJlyWp2fRtT6vpc2m3ibVmD0mLpqwCoxw5HWbt9B/fYkaA=
X-Received: by 2002:a5b:f83:0:b0:da0:c80f:5775 with SMTP id
 q3-20020a5b0f83000000b00da0c80f5775mr6117233ybh.61.1700980717095; Sat, 25 Nov
 2023 22:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ian Zurutuza <ian.zurutuza@gmail.com>
Date: Sun, 26 Nov 2023 00:38:26 -0600
Message-ID: <CAJrDFhpoOLNx-RX_raU4v++ZPYVShg_pmaxv0V2WfkfgcFdUGg@mail.gmail.com>
Subject: device driver association
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I need help associating this device with the proper driver for serial
communication. If I am barking up the wrong tree, please let me know.

I am able to open a serial port to send commands to the Epson BT-40
moverio AR glasses after running this command `sudo modprobe -r
cdc_acm && sudo modprobe usbserial vendor=0x04b8 product=0x0d12`.
After I saw in the system log a message that asked me to reach out to
this mailing list to get this device added to a proper driver.

Please let me know if you need more information regarding this device.

lsusb -v
```
Bus 007 Device 006: ID 04b8:0d12 Seiko Epson Corp. EPSON HMD Com&Sens
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04b8 Seiko Epson Corp.
  idProduct          0x0d12
  bcdDevice            2.00
  iManufacturer           1 Seiko Epson Corporation
  iProduct                2 EPSON HMD Com&Sens
  iSerial                 3 NPH269690577
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x007d
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength    2408
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         1
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              16
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength    2204
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1

Bus 007 Device 007: ID 04b8:0335 Seiko Epson Corp. EPSON HMD Audio
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x04b8 Seiko Epson Corp.
  idProduct          0x0335
  bcdDevice            0.03
  iManufacturer           1 EPSON
  iProduct                2 EPSON HMD Audio
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0022
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      42
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
```

Many thanks,
Ian

