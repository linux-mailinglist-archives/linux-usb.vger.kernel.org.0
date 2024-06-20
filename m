Return-Path: <linux-usb+bounces-11470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5291003B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 11:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C34BA1C21A0C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2931C1A00CB;
	Thu, 20 Jun 2024 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxLlJl3q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF51A00C2
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875559; cv=none; b=TeR3wOQxsgjhFHM48Z1VG5G1qIdpfMZtexrNCRwBJ9+UrM8tBhSHq6LR9dtWnaTOa35n4HbJgDv0MwxRk2KywM2BriQefTV7ztn9YGHDZn49p1jpWbYWn9Qb0cgrpMlr8Kc7S4k9e6lKHOj2TpoPPu/uVjccSs5Sh1ZkGNeLzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875559; c=relaxed/simple;
	bh=u1zcV0zPUIbE1mmJF3H8fjHdbsntW7sKlIOVxtDxKSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngUlpGZY4dauJIwTYbivbVkHQHAIebcdkavoCBC87FkSdmFIL8gaU9M2wHVNZAV4GtxuN5O6s3tTzxR9/VgFUx8Jiw1VEuCNz/dUTO8XMHYhEdClDHqQXq93JvodxX82acEWSLYVvRrGhjs2Sv7PFiakAkcIJOl837JFZcCsxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxLlJl3q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f177b78dcso65084166b.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718875555; x=1719480355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j32Ba8pyxKwPZQfCHYky4VcmA6qd89daDeN5Cvnb5qs=;
        b=CxLlJl3qZ8VhUUTjXioC+LjdCWC6JvpSDXMs65pxuNrBL4x1wMvmENqOTr+yEFBufU
         SzVP7wcrGN/z5gjKYBquVNetGXwBHoO1QOz14sgfN7f1O6Oifk6GW+WVUSs3mcHJpxcX
         R0MEUKJIg0KrK+qrlsUwa41YOQdpwkdwzI0HAnOjLFWZ8EQVJAmDBAbIwUCH8YhQwNl9
         ZFwavug58yqzPahYsGbziV6xgdmg40D7fupHOCgqNSgUNja/xxQ/OTX7J97N7Y12Yjye
         oAyxqVZ3PU/q7Qs/pBVgKX2cvANnGR1QNCW/HvevOTiU36qh49jzVDL5NxF0rU4rU71Y
         PgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718875555; x=1719480355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j32Ba8pyxKwPZQfCHYky4VcmA6qd89daDeN5Cvnb5qs=;
        b=fXGEI0v5V4OODG0cnPGWxweFhyj2fB0muAoh94VuMfe0U8+YMiFeArWICQFSa1+5gA
         a44BZxAveJQSS1mqkf6/THd1/sEJ9UZeGYo6/mOpMU4G6wa30f6qlzYBxvjTRNMrsU2r
         bEGevJ4LgwTP2gKiNBh6CEZMYPQsIf63YzUK4y+JZtI9gSMSixq2SQgUyoANxKsQ0CJo
         aSEh0zskbGnvkfbGuXqjdLYcx+WgpGYZniAh1+YCIKMMBpDGx512PJoE7JnyJGO5YMHH
         xJyT2q3IHSFtvUkimQkpvp5f2mmrehyCt3q28cDi6Nor03YOCKs0/iSPeXtxK1+2wVKO
         5M/Q==
X-Gm-Message-State: AOJu0YyN19EAu1/lguuKIi+y5uP9GxyBxymQfPoqoWkHj/Z2anmz8nFq
	aj95Ta6xhOhmeS5Wp4SSJNc3aeWCx724D0Xc+5Q9w7QgsVD+zLBb9tpUmysKOE4a+kUNCvOLtRN
	PAXmEhirjssZxebOlmAVU6i67wjf1YDa/
X-Google-Smtp-Source: AGHT+IHxths4O2g3xUhNuS7e1gfnj8MzgY+uUQ69qQ74OSfaSAjfpcAS1j68gkGZsQQBEQdKdxONaAZRR0z3nRdJLSw=
X-Received: by 2002:a17:906:1cd9:b0:a6f:1b3a:8898 with SMTP id
 a640c23a62f3a-a6fab60b9c7mr233102166b.2.1718875555020; Thu, 20 Jun 2024
 02:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
 <2024062016-robust-distance-ea98@gregkh> <CAKSBH7H=TEFtsQLr3=L-Eh9odeEej2j028G2RcbM0H=CTZWrQQ@mail.gmail.com>
 <2024062010-facing-refining-c204@gregkh>
In-Reply-To: <2024062010-facing-refining-c204@gregkh>
From: Giacinto Cifelli <gciofono@gmail.com>
Date: Thu, 20 Jun 2024 11:25:43 +0200
Message-ID: <CAKSBH7HeKuP7gA7hk-RFFdnQpaSAOF46JRnQeqFgcA1deG3D6w@mail.gmail.com>
Subject: Re: usb composition without class
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 8:41=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> > > On Thu, Jun 20, 2024 at 07:58:13AM +0200, Giacinto Cifelli wrote:
> > > > greetings,
> > > >
> > > > question:
> > > >
> > > > on a system (yocto), I have a usb composition that doesn't assign t=
he
> > > > class for the interfaces:
> > > >     |__ Port 3: Dev 3, If 10, Class=3D, Driver=3Dcdc_mbim, 480M
> > > >     |__ Port 3: Dev 3, If 8, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 6, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 4, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 2, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 11, Class=3D, Driver=3Dcdc_mbim, 480M
> > > >     |__ Port 3: Dev 3, If 0, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 9, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 7, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 5, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 3, Class=3D, Driver=3Dcdc_acm, 480M
> > > >     |__ Port 3: Dev 3, If 1, Class=3D, Driver=3Dcdc_acm, 480M
> > > > Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-linux-g=
cc
> > > > (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
> > > > PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023
> > > >
> > > > instead of (arch):
> > > >     |__ Port 004: Dev 004, If 0, Class=3DCommunications, Driver=3Dc=
dc_acm, 5000M
> > > >     |__ Port 004: Dev 004, If 1, Class=3DCDC Data, Driver=3Dcdc_acm=
, 5000M
> > > >     |__ Port 004: Dev 004, If 2, Class=3DCommunications, Driver=3Dc=
dc_acm, 5000M
> > > >     |__ Port 004: Dev 004, If 3, Class=3DCDC Data, Driver=3Dcdc_acm=
, 5000M
> > > >     |__ Port 004: Dev 004, If 4, Class=3DCommunications, Driver=3Dc=
dc_acm, 5000M
> > > >     |__ Port 004: Dev 004, If 5, Class=3DCDC Data, Driver=3Dcdc_acm=
, 5000M
> > > >     |__ Port 004: Dev 004, If 6, Class=3DCommunications, Driver=3Dc=
dc_acm, 5000M
> > > >     |__ Port 004: Dev 004, If 7, Class=3DCDC Data, Driver=3Dcdc_acm=
, 5000M
> > > >     |__ Port 004: Dev 004, If 8, Class=3DCommunications, Driver=3Dc=
dc_acm, 5000M
> > > >     |__ Port 004: Dev 004, If 9, Class=3DCDC Data, Driver=3Dcdc_acm=
, 5000M
> > > >     |__ Port 004: Dev 004, If 10, Class=3DCommunications, Driver=3D=
cdc_mbim, 5000M
> > > >     |__ Port 004: Dev 004, If 11, Class=3DCDC Data, Driver=3Dcdc_mb=
im, 5000M
> > > > Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2024
> > > > 14:45:31 +0000 x86_64 GNU/Linux
> > > >
> > > > This lack of class creates too many /dev/ttyACMx ports, and
> > > > ModemManager tries to access them all, perhaps also blocking the
> > > > device, and the whole system doesn't work.
> > > >
> > > > For completeness, the device is:
> > > >     Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
> > > > which is supported without any customs in the cdc-acm and cdc_mbim =
drivers.
> > > >
> > > > I spotted only two options not compiled-in in the yocto .config
> > > > (compared with the arch one), but I strongly doubt this is related:
> > > >     CONFIG_USB_G_MULTI
> > > >     CONFIG_USB_G_MULTI_CDC
> > > >
> > > > Would you know why the class is not assigned?
> > >
> > > This is just a userspace issue, right?
> >
> > I think the class is assigned by the kernel/driver.
> >
> > > Or are you saying that somehow
> > > the same device plugged into two different systems works differently?
> >
> > correct: the same device works differently in the two systems...  in
> > the sense of the class not assigned.
>
> It's not that it is not assigned, it's that something isn't figuring it
> out properly.
>
> Can you provide the output of 'lsusb -v -d 1e2d:0065' for both systems?

they seem ok with -v, I don't understand it.

yocto:

Bus 001 Device 003: ID 1e2d:0065 Cinterion LTE Modem
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239
  bDeviceSubClass         2
  bDeviceProtocol         1
  bMaxPacketSize0        64
  idVendor           0x1e2d
  idProduct          0x0065
  bcdDevice            3.18
  iManufacturer           1 Cinterion
  iProduct                2 LTE Modem
  iSerial                 3 2de297b0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x01a9
    bNumInterfaces         12
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          2
      bFunctionSubClass       2
      bFunctionProtocol       1
      iFunction               8 CDC Serial
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface              6 CDC Abstract Control Model (ACM)
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
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              7 CDC ACM Data
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          2
      bFunctionSubClass       2
      bFunctionProtocol       1
      iFunction               8 CDC Serial
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface              6 CDC Abstract Control Model (ACM)
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          3
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        2
        bSlaveInterface         3
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              7 CDC ACM Data
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         4
      bInterfaceCount         2
      bFunctionClass          2
      bFunctionSubClass       2
      bFunctionProtocol       1
      iFunction               8 CDC Serial
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface              6 CDC Abstract Control Model (ACM)
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          5
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        4
        bSlaveInterface         5
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              7 CDC ACM Data
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         6
      bInterfaceCount         2
      bFunctionClass          2
      bFunctionSubClass       2
      bFunctionProtocol       1
      iFunction               8 CDC Serial
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface              6 CDC Abstract Control Model (ACM)
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          7
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        6
        bSlaveInterface         7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              7 CDC ACM Data
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         8
      bInterfaceCount         2
      bFunctionClass          2
      bFunctionSubClass       2
      bFunctionProtocol       1
      iFunction              10 CDC Serial (DIAG)
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        8
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface             11 CDC Abstract Control Model (ACM) for DIAG
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          0
      CDC ACM:
        bmCapabilities       0x00
      CDC Union:
        bMasterInterface        8
        bSlaveInterface         9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8a  EP 10 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        9
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface             12 CDC ACM Data for DIAG
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface        10
      bInterfaceCount         2
      bFunctionClass          2
      bFunctionSubClass      14
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       10
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2
      bInterfaceSubClass     14
      bInterfaceProtocol      0
      iInterface             13 MBIM Control
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        10
        bSlaveInterface         11
      CDC MBIM:
        bcdMBIMVersion       1.00
        wMaxControlMessage   4096
        bNumberFilters       32
        bMaxFilterSize       128
        wMaxSegmentSize      2048
        bmNetworkCapabilities 0x20
          8-byte ntb input size
      CDC MBIM Extended:
        bcdMBIMExtendedVersion           1.00
        bMaxOutstandingCommandMessages     64
        wMTU                             1500
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8b  EP 11 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       11
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       11
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10
      bInterfaceSubClass      0
      bInterfaceProtocol      2
      iInterface             14 MBIM Data
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8e  EP 14 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x0f  EP 15 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239
  bDeviceSubClass         2
  bDeviceProtocol         1
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)


arch:

Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x1e2d Gemalto M2M GmbH
  idProduct          0x0065 LTE Modem
  bcdDevice            3.18
  iManufacturer           1 Cinterion
  iProduct                2 LTE Modem
  iSerial                 3 2de297b0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0215
    bNumInterfaces         12
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              896mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              6
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
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
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
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              6
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          3
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        2
        bSlaveInterface         3
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
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
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         4
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              6
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          5
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        4
        bSlaveInterface         5
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              7
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
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         6
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              6
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          7
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        6
        bSlaveInterface         7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
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
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         8
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       2 Abstract (modem)
      bFunctionProtocol       1 AT-commands (v.25ter)
      iFunction              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        8
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface             11
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          0
      CDC ACM:
        bmCapabilities       0x00
      CDC Union:
        bMasterInterface        8
        bSlaveInterface         9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8a  EP 10 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        9
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface             12
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
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x05  EP 5 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface        10
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass      14 [unknown]
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       10
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass     14 [unknown]
      bInterfaceProtocol      0
      iInterface             13
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        10
        bSlaveInterface         11
      CDC MBIM:
        bcdMBIMVersion       1.00
        wMaxControlMessage   4096
        bNumberFilters       32
        bMaxFilterSize       128
        wMaxSegmentSize      2048
        bmNetworkCapabilities 0x20
          8-byte ntb input size
      CDC MBIM Extended:
        bcdMBIMExtendedVersion           1.00
        bMaxOutstandingCommandMessages     64
        wMTU                             1500
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8b  EP 11 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               9
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       11
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber       11
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      2
      iInterface             14
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8e  EP 14 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               2
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x0f  EP 15 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               2


>
> > The device boots in the same way, the difference is not in the device.
>
> True, but this type of device has had a lot of quirks added to it for
> the cdc_ether driver for other ones by this vendor, but not for this
> specific device from what I can tell.  So perhaps we got it right in
> newer kernels, but not older ones?

it was working in the 4.x series, and I never had issues since.  I
think it is some compile option for yocto.


>
> thanks,
>
> greg k-h

