Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D833449513C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 16:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376549AbiATPRQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 10:17:16 -0500
Received: from mpx2.rcs-rds.ro ([212.54.125.6]:39361 "EHLO mpx2.rcs-rds.ro"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346406AbiATPRO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jan 2022 10:17:14 -0500
X-Greylist: delayed 535 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Jan 2022 10:17:13 EST
Received: from [10.252.93.157] (unknown [10.252.93.157])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mpx2.rcs-rds.ro (Postfix) with ESMTPSA id 08BD91C02D2
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 17:08:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rcs-rds.ro;
        s=MailProxy; t=1642691296;
        bh=CK87CjM2xBXzojOeP34LgSYFnd1pY6PbUggQqeSZ3Ms=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=ZIO5Xr3Y5FyAYecAMZ2VfBUKdy2OKCi1FW73ZE4+5gM2cWi1roaC3aJnbQUSkktae
         ufqbZJrk0Z92UnGrJXrI0j7XLrQCoCRGEoEMfDdi3VNMpDHdxxNLRnGSLSwT9Um/BQ
         c9V87yQBZJvpXuSX8PkXgpdcIXmaMiHaHI2I5yto=
Subject: Bug report for pl2303 converter (ATEN USB to serial Bridge,
 idVendor=067b, idProduct=23a3, bcdDevice= 1.05)
To:     linux-usb@vger.kernel.org
References: <10d4dbe9-4b17-aeb5-0abe-bf0829173c1d@rcs-rds.ro>
From:   Eduard-Bogdan Budai <eduard.budai@rcs-rds.ro>
Organization: IT Hardware RCS&RDS Cluj
Message-ID: <e85bac58-6d40-b61a-b217-8c4ee3c5853e@rcs-rds.ro>
Date:   Thu, 20 Jan 2022 17:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <10d4dbe9-4b17-aeb5-0abe-bf0829173c1d@rcs-rds.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Sirs,

Today, when a USB-RJ45 adapter was conected to a cumputer running Ubuntu 
20.04.3 in its dmesg appeared:

[Thu Jan 20 15:24:17 2022] usb 1-3.1: new full-speed USB device number 7 
using xhci_hcd
[Thu Jan 20 15:24:17 2022] usb 1-3.1: New USB device found, 
idVendor=067b, idProduct=23a3, bcdDevice= 1.05
[Thu Jan 20 15:24:17 2022] usb 1-3.1: New USB device strings: Mfr=1, 
Product=2, SerialNumber=0
[Thu Jan 20 15:24:17 2022] usb 1-3.1: Product: ATEN USB to Serial Bridge
[Thu Jan 20 15:24:17 2022] usb 1-3.1: Manufacturer: Prolific Technology Inc.
[Thu Jan 20 15:24:17 2022] pl2303 1-3.1:1.0: pl2303 converter detected
[Thu Jan 20 15:24:17 2022] pl2303 1-3.1:1.0: unknown device type, please 
report to linux-usb@vger.kernel.org

The kernel version is 5.13.0-27-generic #29~20.04.1-Ubuntu.

The output of lsusb -v for this adapter is:

Bus 001 Device 007: ID 067b:23a3 Prolific Technology, Inc. Lenovo USB 
Optical Mouse
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
   bcdDevice            1.05
   iManufacturer           1 Prolific Technology Inc.
   iProduct                2 ATEN USB to Serial Bridge
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0027
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xbf
       (Bus Powered)
       Remote Wakeup
       Battery Powered
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

Thank you in advance for any help and/or answer. :)

-- 
Eduard-Bogdan Budai
.............................................................................
mobile: 0770/064481
office: 0364/400427
e-mail:eduard.budai@rcs-rds.ro
.............................................................................
Privileged/Confidential Information may be contained in this message. If you are not in the addresses indicated in this message (or responsible for delivery of the message to such person), you may not copy or deliver this message to anyone. In such a case, you should destroy this message and kindly notify the sender by reply e-mail.
.............................................................................

