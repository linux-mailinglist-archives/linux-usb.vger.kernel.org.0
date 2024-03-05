Return-Path: <linux-usb+bounces-7549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7CD8720CC
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 14:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5CD5282C96
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504ED85C7D;
	Tue,  5 Mar 2024 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUlOj3WO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B348593E
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709646619; cv=none; b=XVQk96huAZ0rzPBVyxeO4VivqGzs1+dXLcQ/e89i7FZ6djU9gz4Q7yReI0vcgydvzqKAxmT2mt2t9MSyezmTz1hZM5rjKVKZi7WbXV8lqXaVi/P+pFBprApAobAAP8gXGgsDFpHvZo0MgsFEPQi8XWFLVwryDlUnMfN7QWzYSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709646619; c=relaxed/simple;
	bh=w9gNXh54Qso/2C+WmivN8zm571IfgMtep8cXbylA0vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iC1yrRVoX9pZGaFEooclGuPSQS5mFD8cr8iCYvlkZrmq6ZmWNSn8TeKLFOPaMYpN/YCpVRQ/ZNQ06W3TSJGbWkP78SSDNPdqZvmNSleID2e1QP9dDt9AlrwnNoQ5ZvjT8CCpEvJ4do51X6lIIS7RHOuFIAt9EPGgIdIaKmiw/S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUlOj3WO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso30077635ad.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Mar 2024 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709646617; x=1710251417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p32Ewo2w4OLXjRI6Z8s0YxTTmLnfS7gszq0iPxYq1m0=;
        b=gUlOj3WOHbcn9MZhaCIgBOWuJ/mVrSu84tiBp5QX80Bifg4lPwVpmnGoIhwtfmwTEW
         6Wszw3riiGkByU/VVXYA2pBpnVaKzqnokxfyi6fa6D20guyVGNsTHUysnSq0wGqS16Wx
         11sKZF//Z3EkwHISY7a3ITQD5nx442BacCOeyFUQz0NqVQkThuIL/x2yoqYnD7dE+IRF
         SF+jEWjp6mPzX87OxCoPYWfZmhO2IoA8mBTRWbOBIC3GFZUHLWGpDlUXOKQ+nKqasxXk
         GoLagZXlmrZqK5VhLF8N2r6W6SJG/cNlFjGkmRYu6N0BK/p0VYqW0VRpp75epI45EcWt
         VE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709646617; x=1710251417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p32Ewo2w4OLXjRI6Z8s0YxTTmLnfS7gszq0iPxYq1m0=;
        b=nD4GSOLJHzvtuvEE1XIbz/RUdqkRuDRKpEZBGJUhgUsoKPdXqpu6YfJEKhzvnt+Axt
         32O8ccJrfl3guVF8mOes0/sof+whoWAHJB5uZrbWFQ/DEuoexf/+1wVywc4vYdlNZHK3
         lrQvFj86Ea83wWUyGa+yDbH49J66Y/UVcPnx2KHx+dr3in4eTT5tTNCnDoP41lattoBZ
         ZGI2CpOQYYxdC3JO9ScSPaXORJiB+6M4gHoGeW2kT2xIqrXGW6jkKsPauPevZUidqB0n
         ukTnhj2E8YvjZt+FBvujU2dWhSWJuOCaB9M8cO+5c8jXo7T96oaJE+8VSC+07YxWKcNc
         oFTQ==
X-Gm-Message-State: AOJu0YyaDi/ne5fnudIxaExk2TQk2aifl7EoKmolSnA1zug0iRylxhkM
	tEmxF6Vuj5VXA+sqhTj0e7VHdlns3niLMUsxIrPglW7zi0agEjra9nmk7HhM
X-Google-Smtp-Source: AGHT+IGQs7r8iRCLi4OycV9S2pEwdA15+iCO0CRhy4eh6xcDoH7+SPGLPQksw78JBoCaF5i37UYguw==
X-Received: by 2002:a17:902:a584:b0:1d9:b751:4752 with SMTP id az4-20020a170902a58400b001d9b7514752mr1641569plb.62.1709646616489;
        Tue, 05 Mar 2024 05:50:16 -0800 (PST)
Received: from [192.168.1.120] ([58.7.175.19])
        by smtp.gmail.com with ESMTPSA id l1-20020a170903244100b001dc10796951sm10579989pls.19.2024.03.05.05.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 05:50:16 -0800 (PST)
Message-ID: <d7e18ecb-a239-4dfd-8df2-c0df89997b98@gmail.com>
Date: Tue, 5 Mar 2024 21:50:09 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Tell linux-usb@vger.kernel.org to add your device to a proper
 driver
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
References: <b133097f-0793-47bb-953f-4c31a721a5c6@gmail.com>
 <ZeWgs0ZClpCwE5lT@hovoldconsulting.com>
Content-Language: en-US
From: Mike Miller <u492758@gmail.com>
In-Reply-To: <ZeWgs0ZClpCwE5lT@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Johan,

Thank you for getting back, it is appreciated and unexpected.

Since sending you the email, a couple of things I have also noticed.

1. If I run the Audrino IDE (on windows), I have to plug in the device 
after I initiate the upload of the script (it actally tells me to do it).

2. I have to use a specific cable (1 of 3 I have tried).

3. It doesnt create the ACM0 device I was expecting and ttyS0 doesnt 
work (not ttys4, which are the only 2 options).

Anyway, to your particular request, with the "right" cable, the lsusb -v 
output is

mike@MyLinux:~$ lsusb -v

Bus 001 Device 022: ID 16d0:0753 MCS Digistump DigiSpark
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x16d0 MCS
   idProduct          0x0753 Digistump DigiSpark
   bcdDevice            2.02
   iManufacturer           0
   iProduct                0
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0012
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         0
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
Device Status:     0x0067
   Self Powered
   Remote Wakeup Enabled
   Test Mode
   Debug Mode

Bus 001 Device 003: ID 0bda:0181 Realtek Semiconductor Corp. USB2.0-CRW
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0bda Realtek Semiconductor Corp.
   idProduct          0x0181
   bcdDevice           81.97
   iManufacturer           1 Generic
   iProduct                2 USB2.0-CRW
   iSerial                 3 20060413092100000
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0020
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          4
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     80 Bulk-Only
       iInterface              5
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0

Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x8087 Intel Corp.
   idProduct          0x0024 Integrated Rate Matching Hub
   bcdDevice            0.00
   iManufacturer           0
   iProduct                0
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0002  1x 2 bytes
         bInterval              12

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         0 Full speed (or root) hub
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.05
   iManufacturer           3 Linux 6.5.0-21-generic ehci_hcd
   iProduct                2 EHCI Host Controller
   iSerial                 1 0000:00:1d.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.05
   iManufacturer           3 Linux 6.5.0-21-generic xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:02:00.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12
         bMaxBurst               0

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.05
   iManufacturer           3 Linux 6.5.0-21-generic xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:02:00.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Bus 002 Device 006: ID 2357:0108 TP-Link TL-WN822N Version 4 RTL8192EU
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x2357 TP-Link
   idProduct          0x0108 TL-WN822N Version 4 RTL8192EU
   bcdDevice            2.00
   iManufacturer           1 Realtek
   iProduct                2 802.11n NIC
   iSerial                 3 00e04c000001
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0035
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           5
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol    255 Vendor Specific Protocol
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x05  EP 5 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               3
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x08  EP 8 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0

Bus 002 Device 005: ID 0409:0238 NEC Corp.
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         2 TT per port
   bMaxPacketSize0        64
   idVendor           0x0409 NEC Corp.
   idProduct          0x0238
   bcdDevice            1.00
   iManufacturer           0
   iProduct                0
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0029
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                2mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      1 Single TT
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      2 TT per port
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12

Bus 002 Device 004: ID 046d:c05b Logitech, Inc. M-U0004 810-001317 [B110 
Optical USB Mouse]
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x046d Logitech, Inc.
   idProduct          0xc05b M-U0004 810-001317 [B110 Optical USB Mouse]
   bcdDevice           54.00
   iManufacturer           1 Logitech
   iProduct                2 USB Optical Mouse
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0022
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower               98mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      1 Boot Interface Subclass
       bInterfaceProtocol      2 Mouse
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.11
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      67
          Report Descriptors:
            ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0006  1x 6 bytes
         bInterval              10

Bus 002 Device 003: ID 413c:2107 Dell Computer Corp. KB212-B Quiet Key 
Keyboard
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x413c Dell Computer Corp.
   idProduct          0x2107 KB212-B Quiet Key Keyboard
   bcdDevice            1.78
   iManufacturer           1 DELL
   iProduct                2 Dell USB Entry Keyboard
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0022
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      1 Boot Interface Subclass
       bInterfaceProtocol      1 Keyboard
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.10
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      65
          Report Descriptors:
            ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval              10

Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x8087 Intel Corp.
   idProduct          0x0024 Integrated Rate Matching Hub
   bcdDevice            0.00
   iManufacturer           0
   iProduct                0
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12

Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         0 Full speed (or root) hub
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.05
   iManufacturer           3 Linux 6.5.0-21-generic ehci_hcd
   iProduct                2 EHCI Host Controller
   iSerial                 1 0000:00:1a.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Cheers

Mike



On 4/3/24 18:21, Johan Hovold wrote:
> On Wed, Feb 07, 2024 at 08:48:12PM +0800, Mike Miller wrote:
>> I am only doing this because dmesg has told me to :).
> Thanks for the report.
>   
>> I am struggling to get a cheap arse Chinese knock-off Arduino Nano
>> working on my
>>
>> Linux MyLinux 6.5.0-15-generic #15~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC
>> Fri Jan 12 18:54:30 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
>>
>> and I get the message
>>
>> [ 2840.099780] usb 2-1.2: new low-speed USB device number 8 using ehci-pci
>> [ 2840.210523] usb 2-1.2: New USB device found, idVendor=16d0,
>> idProduct=0753, bcdDevice= 2.02
>> [ 2840.210537] usb 2-1.2: New USB device strings: Mfr=0, Product=0,
>> SerialNumber=0
>> [ 2840.211335] usbserial_generic 2-1.2:1.0: The "generic" usb-serial
>> driver is only for testing and one-off prototypes.
>> [ 2840.211338] usbserial_generic 2-1.2:1.0: Tell
>> linux-usb@vger.kernel.org to add your device to a proper driver.
>> [ 2840.211340] usbserial_generic 2-1.2:1.0: device has no bulk endpoints
> Hmm. Without bulk endpoints you shouldn't be able to actually use the
> device with the generic driver.
>
>> This something you really can address?
> Can you please post the output of lsusb -v for this device?
>
> Johan

