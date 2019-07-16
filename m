Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 157D36A6D4
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 12:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbfGPKzb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 06:55:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43498 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733067AbfGPKzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 06:55:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id c19so13361015lfm.10
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 03:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4o/reC9E+HzZo0wjSLhcoIugJjWHJknIHua2XgAZ0s=;
        b=ExJCl8uKixdauKF5SDOT39r1ij7vRpfprwtb8jfNvd4gq21WTDeRaHcXFx8IrejAm/
         TlwoQrZ4O7cZxGjgj+x/r8jKs1uKGcBbDVoIHQqEchnsjnl5HJQsphdfUgDSIY/TlZFn
         JUlboqxutiJJ8QEeYbufYfAv6tezAfV0nb/3W17taMAyTnn8upzP3nYv3SIzh3EqpCPz
         LJDlF5mC+Zx6VP9QAJxf07/04sbnz6uTYdesQDuB8gFa1mSJlmu0LAc77TZ1RWWUGGuX
         ajR2FD/3jIpmPufixpa/7OkYwuRMQIORegEKTrU6t9y3TlHt3gFtNUigbbwpmUQAO81z
         FZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4o/reC9E+HzZo0wjSLhcoIugJjWHJknIHua2XgAZ0s=;
        b=BVbMpoXGlzw4A6TQCsmL7rwVb3OVUEUMXSQwHPJFBDm6gTLaNHLlUAGVHXn6wQJ91C
         BzyHVoShMiXfr8lrpZ7FYxdObYv7J9a9cV3C4mBUnGI3MU0SKQ/R6lqe4/E/5Ul/dRAS
         wwYw3MW6IzkosEfDGZU+52aQrbEVh7WZf68NLdBariZnlfH0spdkcfdeU7LgyNhrwbRC
         C4M6j5nc2zKtckf7je+F7YHDK3xTEjhCa36WKfeOXwHLHDkaNfljiMxBtxI0fuMQBilH
         rJlf25ML7df494KiJqXFEqDHttqmG0qo92eSbjAyWcJX3aPi9RUkxF312unIK/ngaVWI
         AOJg==
X-Gm-Message-State: APjAAAUB6Qg4HIpHLLkQOLxERMori1eaObtlfVLbHMsr4NjHWLeRxbRr
        mTiqyoZ9kqxi9q6tQEOqXCguQTys1VuYtOxF9my6xqi8qNI=
X-Google-Smtp-Source: APXvYqxVHsvtCsFo0KIP+nx/ixJFPEF9YYUobHkCHM+BMxrZ2LMNZ2KP6VTtHBrS5zVTq+dDMyFCIk69L2MLXRM1lhI=
X-Received: by 2002:ac2:5636:: with SMTP id b22mr14022465lff.2.1563274528203;
 Tue, 16 Jul 2019 03:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190711094012.GA16316@lisa.dawes.za.net> <20190711103457.GA17414@lisa.dawes.za.net>
 <20190716091122.GB3522@localhost>
In-Reply-To: <20190716091122.GB3522@localhost>
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Tue, 16 Jul 2019 12:55:17 +0200
Message-ID: <CAOYdKdiEUsk9O=ytis=u2yD-69LoKNSE8=ivwer8K3sMNCd8Dw@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
 [version 2]
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have a gist with all of the relevant information here:

https://gist.github.com/RoganDawes/afcc0aa1d12b53b540afc94ffc8e4494

lsusb -v is at:

https://gist.githubusercontent.com/RoganDawes/afcc0aa1d12b53b540afc94ffc8e4494/raw/de31775e4a8048a0f06362fe59bb4f98a54b3c16/lsusb%2520-v%2520-d%25202001:7e3d%2520after

Or:

After binding the Option driver, lsusb -v -d 2001:7e3d

Bus 001 Device 062: ID 2001:7e3d D-Link Corp. Mobile Connect
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x2001 D-Link Corp.
  idProduct          0x7e3d
  bcdDevice            2.28
  iManufacturer           1 Mobile Connect
  iProduct                2 Mobile Connect
  iSerial                 3 0123456789ABCDEF
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00e8
    bNumInterfaces          6
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
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
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
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
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
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              4 Mass Storage
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8a  EP 10 IN
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
        bInterval               1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x000c
  bNumDeviceCaps          1
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      HIRD Link Power Management (LPM) Supported
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
  (Bus Powered)


On Tue, Jul 16, 2019 at 11:11 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jul 11, 2019 at 12:34:57PM +0200, Rogan Dawes wrote:
> > Add device id for D-Link DWM-222.
> >
> > Cc: stable@vger.kernel.org
> > Signed-Off-By: Rogan Dawes <rogan@dawes.za.net>
> > ---
> > Apologies, a typo crept in when submitting this previously.
>
> Thanks for the patch, all looks good, but next time add the version
> information inside the "[PATCH v2]" prefix so that it doesn't end up the
> commit logs.
>
> Would you mind posting also the output of usb-devices (or lsusb -v) for
> this device for completeness? The former is compact enough to be
> included in the commit message.
>
> No need to resend unless you prefer to. I'll apply this one after the
> merge window closes.
>
> Thanks,
> Johan
