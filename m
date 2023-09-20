Return-Path: <linux-usb+bounces-428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4137A8C24
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 20:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E492818F9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 18:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D199418639;
	Wed, 20 Sep 2023 18:58:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA61857
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 18:58:16 +0000 (UTC)
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960B4C2;
	Wed, 20 Sep 2023 11:58:13 -0700 (PDT)
Received: from [192.168.10.7] (unknown [10.0.12.132])
	by kozue.soulik.info (Postfix) with ESMTPSA id E446E300241;
	Thu, 21 Sep 2023 03:57:53 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info E446E300241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
	t=1695236276; bh=pKKVPDoXC+0yTrAxNgoKkk4gXJa1/08RQ47iSUXgp4g=;
	h=Date:To:Cc:From:Subject:From;
	b=V1V2wMM5cCNLrlXvn0BgTZEdGbulrR9HFNmpSxEKOSPqjmO4vYVtoZawgwladjzHG
	 JvdlVyH0eatpktZrCbrwlzGkwc1Wwh7Dj+acG6TR9z2T7a+bG9ABGTWps/1XwR8+mF
	 RU3oERuuh5hbySPI3WdnixlCvq9mmSJCl7yc0jQQ=
Message-ID: <2cee5cdc-e3bc-3702-9e06-0b425c2a69eb@soulik.info>
Date: Thu, 21 Sep 2023 02:58:07 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: linux-usb@vger.kernel.org
Cc: lee@kernel.org, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
 ira.weiny@intel.com, broonie@kernel.org, linux-spi@vger.kernel.org
From: Randy Li <ayaka@soulik.info>
Subject: Any framework for a USB exclusive function MFD, wch347
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello

I am trying to implement the USB to SPI master driver of a WCH CH347, it 
is a upgrade for the ch341 which destroyed many 25 flash by 5V.

The problem is although it support different functions, they can't used 
at the same time, all the operation are applied to the last USB 
interface with vendor class. MFD could be the parent class, but it 
didn't offer any mechanism that only a type of device is open.

Auxiliary bus could be, while it didn't offer a interface that let me 
remove an subdev.

Any helper framework that I could use to implement such a exclusive 
usage of multiple functions device? I think such a device is not orphan 
case, in linux media, we have had hantro D1 and H1, which could be 
configuration to share part of circles, making the encoder and decoder 
can't work at the same time.


P.S. There are two hardware modes that I am interesting at, mode 1 and 
mode 3. The mode 1 would offer a converter to SPI  and I2C, while mode 3 
is for JTAG and bitbang. Its protocol is not very complex, I have 
finished its SPI part.


Mode 1

Bus 001 Device 017: ID 1a86:55db QinHeng Electronics USB To UART+SPI+I2C
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x1a86 QinHeng Electronics
   idProduct          0x55db
   bcdDevice            2.41
   iManufacturer           1 wch.cn
   iProduct                2 USB To UART+SPI+I2C
   iSerial                 3 0123456789
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0062
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              200mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass          2 Communications
       bFunctionSubClass       2 Abstract (modem)
       bFunctionProtocol       1 AT-commands (v.25ter)
       iFunction               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      1 AT-commands (v.25ter)
       iInterface              0
       CDC Header:
         bcdCDC               1.10
       CDC Call Management:
         bmCapabilities       0x00
         bDataInterface          1
       CDC ACM:
         bmCapabilities       0x02
           line coding and serial state
       CDC Union:
         bMasterInterface        0
         bSlaveInterface         1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x04  EP 4 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
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
         bEndpointAddress     0x86  EP 6 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0


Mode 3

Bus 001 Device 021: ID 1a86:55dd QinHeng Electronics USB To UART+JTAG
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x1a86 QinHeng Electronics
   idProduct          0x55dd
   bcdDevice            2.41
   iManufacturer           1 wch.cn
   iProduct                2 USB To UART+JTAG
   iSerial                 3 0123456789
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0062
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              200mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass          2 Communications
       bFunctionSubClass       2 Abstract (modem)
       bFunctionProtocol       1 AT-commands (v.25ter)
       iFunction               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      1 AT-commands (v.25ter)
       iInterface              0
       CDC Header:
         bcdCDC               1.10
       CDC Call Management:
         bmCapabilities       0x00
         bDataInterface          1
       CDC ACM:
         bmCapabilities       0x02
           line coding and serial state
       CDC Union:
         bMasterInterface        0
         bSlaveInterface         1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x04  EP 4 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
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
         bEndpointAddress     0x86  EP 6 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0


