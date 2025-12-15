Return-Path: <linux-usb+bounces-31448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD2CBEE1C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 17:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1675D306EDB6
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CE4342529;
	Mon, 15 Dec 2025 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=natalieee.net header.i=@natalieee.net header.b="OGc/OslJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.sakamoto.pl (mail.sakamoto.pl [185.236.240.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE44342502
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.236.240.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808302; cv=none; b=SyuhKZ54/N7ewWiXbIP+7j6IVZxT13lmJmUvTM20IkY7SkjvnKAad6CT0MN7vclQ2xWaiyUBDRJYX+uznvcuKRp0D2VjCJoF1bxh8aHGtbHxdwiADgggdWXoH0OYJswvmlKR7b7OW6Gr0jWOUCO07Zv2cECLrA1fOyCHirRO578=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808302; c=relaxed/simple;
	bh=eFdnqfJOjgLhucyLiU1/biXovu3KYrpDrZ0CNJDBtfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZA5SSVLlfqvfzZsnknWrtvPKQh8df5+2E5bGCxZ6vXjay4UJ5dSyckcHySRcUXDxilQGwAQ4bzpyGLVJZ/KMncEs5ewadUcWkIkNhl+2I2bCrdOHm9ZVysxP/pOcEFA4VfHdXicrPXQ+AY1zRA2Nh4gHiXzfmcJDylDhIQQlcVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=natalieee.net; spf=pass smtp.mailfrom=natalieee.net; dkim=pass (2048-bit key) header.d=natalieee.net header.i=@natalieee.net header.b=OGc/OslJ; arc=none smtp.client-ip=185.236.240.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=natalieee.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalieee.net
Authentication-Results: mail.sakamoto.pl;
	auth=pass (plain)
Message-ID: <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>
Date: Mon, 15 Dec 2025 06:17:34 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
 <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
Content-Language: en-US
From: natalie roentgen connolly <natalie@natalieee.net>
Autocrypt: addr=natalie@natalieee.net; keydata=
 xjMEZyF+dhYJKwYBBAHaRw8BAQdAuh3EVhqODqs4DQasm/jUILG+4cNj0Q3Gb8SITEhqNNvN
 PW5hdGFsaWUgcm9lbnRnZW4gY29ubm9sbHkgKGJlZXAgYm9vcCkgPG5hdGFsaWVAbmF0YWxp
 ZWVlLm5ldD7CmQQTFgoAQRYhBJo0/NsX3ToM9ZBiC6HD1we8+QjlBQJnIX52AhsDBQkDwmcA
 BQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEKHD1we8+Qjl0VYBAKrJtKM2bJj6hsU+
 kTt8HXxDNdCY37eSL6GxzQ4fGBqJAP9NuysVDyyFVL7HOkUa3XbNFkxgSNNfDSXnyXG1/JnZ
 Ds44BGchfnYSCisGAQQBl1UBBQEBB0CebBBPcowxbCbOIAM9aJAe2kHbNZ4bIxZT7klRjf0+
 WgMBCAfCfgQYFgoAJhYhBJo0/NsX3ToM9ZBiC6HD1we8+QjlBQJnIX52AhsMBQkDwmcAAAoJ
 EKHD1we8+QjldDoBAIj3f2uA6AWu08lWSBkEDKrzKMduShD/Pv8jvDyznHvHAP0VskOMQSFg
 9MBrwZ+7azZzgnCs2FSiZvHJW7HTo4v9Bw==
In-Reply-To: <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Haraka-GeoIP: US
X-Haraka-GeoIP-Received: 2601:1c2:880:14b0::6234:US
Received: from localhost (Unknown [127.0.0.1])
	by mail.sakamoto.pl (Haraka/3.0.3) with ESMTPSA id 7146DD20-37C3-46D1-9F9A-B02988C60A72.1
	envelope-from <natalie@natalieee.net>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Mon, 15 Dec 2025 15:17:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalieee.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 To: Subject: MIME-Version: Date: Message-ID; q=dns/txt; s=s20250406155;
 t=1765808279; bh=U3mbTM76q/8ZuQ8YFIMZcbLMShKPgE8ExbBApwB7yms=;
 b=OGc/OslJr3fi8uC1oOnV39MSPwDIgH30t1XoKhJ2D7AsaP6rE817qrMmRy82zb8TF+k/7NCCc
 YRlCxZXx1lvg7wvqQVjBewMOxEKU0q1TCWT3FYxUjOfM7ucwFBHfBKwBCW4zunKwOG/Dyz8Mdm2
 sEi6g8CDEFG6BB9km0PyJw4yRO6DtHQcWOK+XZTxxbvAZ4azWa2BR4IzZ2DBtjgtZMQPcY7q2fD
 qh7vE5eHbW0tZ6/2E78+uFa76qTXjTFitis9xfNOsplvYUFHfYepiO8N+a/pFUwJz5bguFVJETr
 10Po1cx0zJBMcSemPC9+fuuYVz1f97TVTdpx6Zrx8lvg==

Hello,

Without adding {USB_DEVICE(0x04b8, 0x0d12)} to acm_ids, the stock driver
emits no logs:
[  102.197116] [  T233] usb 7-1: new high-speed USB device number 6 
using xhci_hcd
[  102.329927] [  T233] usb 7-1: New USB device found, idVendor=0424, 
idProduct=2744, bcdDevice= 1.21
[  102.329935] [  T233] usb 7-1: New USB device strings: Mfr=1, 
Product=2, SerialNumber=0
[  102.329939] [  T233] usb 7-1: Product: USB2734
[  102.329941] [  T233] usb 7-1: Manufacturer: Microchip Tech
[  102.337694] [ T2537] ucsi_acpi USBC000:00: unknown error 256
[  102.337702] [ T2537] ucsi_acpi USBC000:00: GET_CABLE_PROPERTY failed (-5)
[  102.394421] [  T233] hub 7-1:1.0: USB hub found
[  102.394714] [  T233] hub 7-1:1.0: 3 ports detected
[  102.743783] [  T208] usb 7-1.1: new high-speed USB device number 7 
using xhci_hcd
[  102.849736] [  T208] usb 7-1.1: New USB device found, idVendor=04b8, 
idProduct=0335, bcdDevice= 0.03
[  102.849748] [  T208] usb 7-1.1: New USB device strings: Mfr=1, 
Product=2, SerialNumber=0
[  102.849752] [  T208] usb 7-1.1: Product: EPSON HMD Audio
[  102.849756] [  T208] usb 7-1.1: Manufacturer: EPSON
[  102.911231] [  T208] hid-generic 0003:04B8:0335.0007: 
hiddev96,hidraw3: USB HID v1.11 Device [EPSON EPSON HMD Audio] on 
usb-0000:c3:00.4-1.1/input0
[  102.993830] [  T208] usb 7-1.2: new full-speed USB device number 8 
using xhci_hcd
[  103.129473] [  T208] usb 7-1.2: New USB device found, idVendor=04b8, 
idProduct=0d12, bcdDevice= 2.00
[  103.129483] [  T208] usb 7-1.2: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
[  103.129486] [  T208] usb 7-1.2: Product: EPSON HMD Com&Sens
[  103.129489] [  T208] usb 7-1.2: Manufacturer: Seiko Epson Corporation
[  103.129491] [  T208] usb 7-1.2: SerialNumber: NPH269690136
[  103.274105] [  T208] hid-sensor-hub 0003:04B8:0D12.0008: hidraw4: USB 
HID v1.11 Device [Seiko Epson Corporation EPSON HMD Com&Sens] on 
usb-0000:c3:00.4-1.2/input0
[  103.290886] [  T208] hid-sensor-hub 0003:04B8:0D12.0009: hidraw5: USB 
HID v1.11 Device [Seiko Epson Corporation EPSON HMD Com&Sens] on 
usb-0000:c3:00.4-1.2/input3
[  103.497274] [  T208] usb 7-1.3: new full-speed USB device number 9 
using xhci_hcd
[  103.624459] [  T208] usb 7-1.3: New USB device found, idVendor=04b4, 
idProduct=3126, bcdDevice= 0.00
[  103.624465] [  T208] usb 7-1.3: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
[  103.624466] [  T208] usb 7-1.3: Product: Type-C DP Dongle
[  103.624468] [  T208] usb 7-1.3: Manufacturer: Cypress Semiconductor
[  103.624469] [  T208] usb 7-1.3: SerialNumber: 11AD1D07B9612F012F2D0B00

With the device declared in acm_ids, the logs are the same except for
the following two lines being present:
[ 1775.057872] [T12799] cdc_acm 7-1.2:1.2: Zero length descriptor references
[ 1775.057888] [T12799] cdc_acm 7-1.2:1.2: probe with driver cdc_acm 
failed with error -22

Here is the output of lsusb -v:
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c1:00.3
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Bus 001 Device 006: ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd. 
Goodix USB2.0 MISC
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x27c6 Shenzhen Goodix Technology Co.,Ltd.
   idProduct          0x609c Goodix USB2.0 MISC
   bcdDevice            1.00
   iManufacturer           1 Goodix Technology Co., Ltd.
   iProduct                2 Goodix USB2.0 MISC
   iSerial                 3 UID2A744E00_XXXX_MOC_B0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0020
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          3
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              4
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

Bus 001 Device 007: ID 0e8d:e616 MediaTek Inc. Wireless_Device
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x0e8d MediaTek Inc.
   idProduct          0xe616 Wireless_Device
   bcdDevice            1.00
   iManufacturer           5 MediaTek Inc.
   iProduct                6 Wireless_Device
   iSerial                 7 000000000
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x00fe
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          8
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower              100mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         3
       bFunctionClass        224 Wireless
       bFunctionSubClass       1 Radio Frequency
       bFunctionProtocol       1 Bluetooth
       iFunction               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval               1
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
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0000  1x 0 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0000  1x 0 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0009  1x 9 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0009  1x 9 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0011  1x 17 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0011  1x 17 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       3
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0019  1x 25 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0019  1x 25 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       4
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0021  1x 33 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0021  1x 33 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       5
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0031  1x 49 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0031  1x 49 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       6
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x003f  1x 63 bytes
         bInterval               4
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x003f  1x 63 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              3
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x8a  EP 10 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x0a  EP 10 OUT
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass       224 Wireless
       bInterfaceSubClass      1 Radio Frequency
       bInterfaceProtocol      1 Bluetooth
       iInterface              3
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x8a  EP 10 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x0a  EP 10 OUT
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               1

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Negotiated speed: SuperSpeed+ (10Gbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c1:00.3
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12
         bMaxBurst               0
         wBytesPerInterval       2

Bus 002 Device 002: ID 0bda:8156 Realtek Semiconductor Corp. USB 
10/100/1G/2.5G LAN
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.20
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x0bda Realtek Semiconductor Corp.
   idProduct          0x8156 USB 10/100/1G/2.5G LAN
   bcdDevice           31.04
   iManufacturer           1 Realtek
   iProduct                2 USB 10/100/1G/2.5G LAN
   iSerial                 6 4013000001
   bNumConfigurations      3
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0039
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              256mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol      0
       iInterface              0
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
         bMaxBurst               3
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
         bMaxBurst               3
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0002  1x 2 bytes
         bInterval              11
         bMaxBurst               0
         wBytesPerInterval       2
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0068
     bNumInterfaces          2
     bConfigurationValue     2
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              256mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass     13 [unknown]
       bInterfaceProtocol      0
       iInterface              5
       CDC Header:
         bcdCDC               1.10
       CDC Union:
         bMasterInterface        0
         bSlaveInterface         1
       CDC Ethernet:
         iMacAddress                      3 (??)
         bmEthernetStatistics    0x0031501f
         wMaxSegmentSize               1518
         wNumberMCFilters            0x8000
         bNumberPowerFilters              0
       CDC NCM:
         bcdNcmVersion        1.00
         bmNetworkCapabilities 0x2b
           8-byte ntb input size
           max datagram size
           net address
           packet filter
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval              11
         bMaxBurst               0
         wBytesPerInterval       8
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      1
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      1
       iInterface              4
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
         bMaxBurst               3
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
         bMaxBurst               3
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0062
     bNumInterfaces          2
     bConfigurationValue     3
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              256mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      6 Ethernet Networking
       bInterfaceProtocol      0
       iInterface              5
       CDC Header:
         bcdCDC               1.10
       CDC Union:
         bMasterInterface        0
         bSlaveInterface         1
       CDC Ethernet:
         iMacAddress                      3 (??)
         bmEthernetStatistics    0x0031501f
         wMaxSegmentSize               1518
         wNumberMCFilters            0x8000
         bNumberPowerFilters              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval              11
         bMaxBurst               0
         wBytesPerInterval       8
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              4
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
         bMaxBurst               3
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
         bMaxBurst               3

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c1:00.4
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Negotiated speed: SuperSpeed+ (10Gbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c1:00.4
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12
         bMaxBurst               0
         wBytesPerInterval       2

Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c3:00.3
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Negotiated speed: SuperSpeed+ (10Gbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c3:00.3
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12
         bMaxBurst               0
         wBytesPerInterval       2

Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c3:00.4
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0019
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12

Bus 007 Device 061: ID 0424:2744 Microchip Technology, Inc. (formerly 
SMSC) Hub
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         2 TT per port
   bMaxPacketSize0        64
   idVendor           0x0424 Microchip Technology, Inc. (formerly SMSC)
   idProduct          0x2744 Hub
   bcdDevice            1.21
   iManufacturer           1 Microchip Tech
   iProduct                2 USB2734
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0029
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      1 Single TT
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      2 TT per port
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12

Bus 007 Device 062: ID 04b8:0335 Seiko Epson Corp. EPSON HMD Audio
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.01
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x04b8 Seiko Epson Corp.
   idProduct          0x0335 EPSON HMD Audio
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
       bInterfaceSubClass      0 [unknown]
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

Bus 007 Device 063: ID 04b8:0d12 Seiko Epson Corp. EPSON HMD Com&Sens
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x04b8 Seiko Epson Corp.
   idProduct          0x0d12 EPSON HMD Com&Sens
   bcdDevice            2.00
   iManufacturer           1 Seiko Epson Corporation
   iProduct                2 EPSON HMD Com&Sens
   iSerial                 3 NPH269690136
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
       bInterfaceSubClass      0 [unknown]
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
       bInterfaceSubClass      0 [unknown]
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
       bInterfaceSubClass      0 [unknown]
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

Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Negotiated speed: SuperSpeed+ (10Gbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.18
   iManufacturer           3 Linux 6.18.0 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:c3:00.4
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12
         bMaxBurst               0
         wBytesPerInterval       2

Thanks,
Natalie

