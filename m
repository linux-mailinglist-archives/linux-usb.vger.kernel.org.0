Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657D1B7F34
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 18:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403904AbfISQcz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 12:32:55 -0400
Received: from smtpout-fallback.aon.at ([195.3.96.120]:35484 "EHLO
        smtpout-fallback.aon.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388812AbfISQcz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 12:32:55 -0400
Received: (qmail 5107 invoked from network); 19 Sep 2019 16:32:50 -0000
Received: from unknown (HELO smtpout.aon.at) ([172.18.1.200])
          (envelope-sender <nospamforba@aon.at>)
          by fallback44.highway.telekom.at (qmail-ldap-1.03) with SMTP
          for <linux-usb@vger.kernel.org>; 19 Sep 2019 16:32:50 -0000
X-A1Mail-Track-Id: 1568910770:5106:fallback44:172.18.1.200:1
Received: (qmail 22857 invoked from network); 19 Sep 2019 16:32:47 -0000
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        WARSBL506.highway.telekom.at
X-Spam-Level: 
Received: from 100-64-46-110.rfc6598.a1.net (HELO [192.168.2.14]) ([100.64.46.110])
          (envelope-sender <nospamforba@aon.at>)
          by smarthub80.res.a1.net (qmail-ldap-1.03) with AES256-SHA encrypted SMTP; 19 Sep 2019 16:32:47 -0000
X-A1Mail-Track-Id: 1568910767:22838:smarthub80:100.64.46.110:1
Subject: Fwd: ASMEDIA ASM1351 Bridge - ATAPI support
To:     linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org
From:   Bernhard <nospamforba@aon.at>
X-Forwarded-Message-Id: 
Message-ID: <58cd1fe4-5a88-2a83-8ac3-496d7898449f@aon.at>
Date:   Thu, 19 Sep 2019 18:32:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


https://bugzilla.kernel.org/show_bug.cgi?id=204905
kernel 5.2.14 , 4.19.73

ASMEDIA Bridge - ATAPI support

Dear kernel developers,

I have bought a SATA to USB3 Adapter by Delock, which supports optical drives (ATAPI support) , ASMEDIA Bridge.
Chipset: Asmedia ASM1351

But it is not working with optical drives (hdd and ssd work) , see kernel messages. I also disabled uas for testing, but no success.

Is it possible to add ATAPI support for this device?

Thanks, Bernhard

https://www.delock.de/produkte/G_62715/merkmale.html?setLanguage=en

https://www.delock.de/produkte/G_62715/technische_details.html

ASMT     2135
idVendor=174c, idProduct=55aa

[27003.336349] usb 4-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[27003.383774] usb 4-1: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
[27003.383776] usb 4-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
[27003.383778] usb 4-1: Product: ASM105x
[27003.383779] usb 4-1: Manufacturer: ASMT
[27003.383780] usb 4-1: SerialNumber: 123546400035
[27003.447065] usb-storage 4-1:1.0: USB Mass Storage device detected
[27003.447176] usb-storage 4-1:1.0: Quirks match for vid 174c pid 55aa: c00000
[27003.447207] scsi host0: usb-storage 4-1:1.0
[27003.447353] usbcore: registered new interface driver usb-storage
[27003.451028] usbcore: registered new interface driver uas
[27004.464296] scsi 0:0:0:0: Direct-Access     ASMT     2135             0    PQ: 0 ANSI: 6
[27004.464554] scsi 0:0:0:0: Attached scsi generic sg0 type 0
[27004.478120] sd 0:0:0:0: [sda] Attached SCSI removable disk
[27137.900469] usb 4-1: USB disconnect, device number 2
[27138.593741] usb 4-1: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
[27138.631353] usb 4-1: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
[27138.631355] usb 4-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
[27138.631356] usb 4-1: Product: ASM105x
[27138.631357] usb 4-1: Manufacturer: ASMT
[27138.631358] usb 4-1: SerialNumber: 123546400035
[27138.638885] usb 4-1: UAS is blacklisted for this device, using usb-storage instead
[27138.638886] usb-storage 4-1:1.0: USB Mass Storage device detected
[27138.639048] usb-storage 4-1:1.0: Quirks match for vid 174c pid 55aa: c00000
[27138.639093] scsi host0: usb-storage 4-1:1.0
[27139.654238] scsi host0: scsi scan: INQUIRY result too short (5), using 36
[27139.654242] scsi 0:0:0:0: Direct-Access                                    PQ: 0 ANSI: 0
[27139.654505] sd 0:0:0:0: Attached scsi generic sg0 type 0
[27173.844235] usb 4-1: Device not responding to setup address.
[27178.013590] usb 4-1: Device not responding to setup address.
[27178.229705] usb 4-1: device not accepting address 3, error -71
[27182.503739] usb 4-1: Device not responding to setup address.
[27186.673101] usb 4-1: Device not responding to setup address.
[27186.899538] usb 4-1: device not accepting address 3, error -71
     

sudo lsusb -v -d 174c:55aa

Bus 004 Device 002: ID 174c:55aa ASMedia Technology Inc. Name: ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
Device Descriptor:
     bLength                18
     bDescriptorType         1
     bcdUSB               3.10
     bDeviceClass            0
     bDeviceSubClass         0
     bDeviceProtocol         0
     bMaxPacketSize0         9
     idVendor           0x174c ASMedia Technology Inc.
     idProduct          0x55aa Name: ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge
     bcdDevice            1.00
     iManufacturer           2 ASMT
     iProduct                3 ASM105x
     iSerial                 1 123546400035
     bNumConfigurations      1
     Configuration Descriptor:
       bLength                 9
       bDescriptorType         2
       wTotalLength       0x002c
       bNumInterfaces          1
       bConfigurationValue     1
       iConfiguration          0
       bmAttributes         0xc0
         Self Powered
       MaxPower                0mA
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        0
         bAlternateSetting       0
         bNumEndpoints           2
         bInterfaceClass         8 Mass Storage
         bInterfaceSubClass      6 SCSI
         bInterfaceProtocol     80 Bulk-Only
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
           bMaxBurst              15
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
           bMaxBurst              15
Binary Object Store Descriptor:
     bLength                 5
     bDescriptorType        15
     wTotalLength       0x002a
     bNumDeviceCaps          3
     USB 2.0 Extension Device Capability:
       bLength                 7
       bDescriptorType        16
       bDevCapabilityType      2
       bmAttributes   0x0000f41e
         BESL Link Power Management (LPM) Supported
       BESL value     1024 us
       Deep BESL value    61440 us
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
     SuperSpeedPlus USB Device Capability:
       bLength                20
       bDescriptorType        16
       bDevCapabilityType     10
       bmAttributes         0x00000001
         Sublink Speed Attribute count 1
         Sublink Speed ID count 0
       wFunctionalitySupport   0x0000
       bmSublinkSpeedAttr[0]   0x000a4030
         Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
       bmSublinkSpeedAttr[1]   0x000a40b0
         Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
     Self Powered


