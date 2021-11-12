Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E456A44EB53
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 17:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbhKLQ3L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 11:29:11 -0500
Received: from dynamic-077-001-167-197.77.1.pool.telefonica.de ([77.1.167.197]:53540
        "EHLO vacharakis.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234342AbhKLQ3K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 11:29:10 -0500
Received: from [192.168.1.209] (router.lan [192.168.1.1])
        by vacharakis.de (Postfix) with ESMTP id E07D53C3BF1;
        Fri, 12 Nov 2021 17:26:17 +0100 (CET)
Message-ID: <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
Date:   Fri, 12 Nov 2021 17:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Content-Language: de-DE
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
From:   DocMAX <mail@vacharakis.de>
In-Reply-To: <20211112162316.GC32928@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sure:

Bus 006 Device 006: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x0715 VL817 SATA Adaptor
   bcdDevice            6.14
   iManufacturer           1 VIA Labs,Inc.
   iProduct                2 USB3.1 SATA Bridge
   iSerial                 3 0000000000000004
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0079
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower                8mA
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           4
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     98
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
         Command pipe (0x01)
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
         bMaxBurst              15
         MaxStreams              8
         Data-in pipe (0x03)
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0400  1x 1024 bytes
         bInterval               0
         bMaxBurst              15
         MaxStreams              8
         Data-out pipe (0x04)
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
         MaxStreams              8
         Status pipe (0x02)
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0046
   bNumDeviceCaps          4
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
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {510191c2-9ce8-c54e-bdcb-471b97c61daa}
   SuperSpeedPlus USB Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000023
       Sublink Speed Attribute count 3
       Sublink Speed ID count 1
     wFunctionalitySupport   0x1100
     bmSublinkSpeedAttr[0]   0x00050030
       Speed Attribute ID: 0 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b0
       Speed Attribute ID: 0 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4031
       Speed Attribute ID: 1 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b1
       Speed Attribute ID: 1 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
   Self Powered

Bus 006 Device 005: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x0715 VL817 SATA Adaptor
   bcdDevice            6.14
   iManufacturer           1 VIA Labs,Inc.
   iProduct                2 USB3.1 SATA Bridge
   iSerial                 3 0000000000000003
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0079
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower                8mA
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           4
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     98
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
         Command pipe (0x01)
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
         bMaxBurst              15
         MaxStreams              8
         Data-in pipe (0x03)
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0400  1x 1024 bytes
         bInterval               0
         bMaxBurst              15
         MaxStreams              8
         Data-out pipe (0x04)
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
         MaxStreams              8
         Status pipe (0x02)
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0046
   bNumDeviceCaps          4
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
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {bd40ee7c-d192-4a43-bf24-7cbf9090b1d5}
   SuperSpeedPlus USB Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000023
       Sublink Speed Attribute count 3
       Sublink Speed ID count 1
     wFunctionalitySupport   0x1100
     bmSublinkSpeedAttr[0]   0x00050030
       Speed Attribute ID: 0 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b0
       Speed Attribute ID: 0 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4031
       Speed Attribute ID: 1 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b1
       Speed Attribute ID: 1 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
   Self Powered

Bus 006 Device 004: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x0715 VL817 SATA Adaptor
   bcdDevice            6.14
   iManufacturer           1 VIA Labs,Inc.
   iProduct                2 USB3.1 SATA Bridge
   iSerial                 3 0000000000000002
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0079
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower                8mA
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           4
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     98
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
         Command pipe (0x01)
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
         bMaxBurst              15
         MaxStreams              8
         Data-in pipe (0x03)
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0400  1x 1024 bytes
         bInterval               0
         bMaxBurst              15
         MaxStreams              8
         Data-out pipe (0x04)
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
         MaxStreams              8
         Status pipe (0x02)
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0046
   bNumDeviceCaps          4
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
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {774a3fc1-ad31-a145-bdac-2fb12d791bd9}
   SuperSpeedPlus USB Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000023
       Sublink Speed Attribute count 3
       Sublink Speed ID count 1
     wFunctionalitySupport   0x1100
     bmSublinkSpeedAttr[0]   0x00050030
       Speed Attribute ID: 0 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b0
       Speed Attribute ID: 0 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4031
       Speed Attribute ID: 1 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b1
       Speed Attribute ID: 1 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
   Self Powered

Bus 006 Device 003: ID 2109:0715 VIA Labs, Inc. VL817 SATA Adaptor
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x0715 VL817 SATA Adaptor
   bcdDevice            6.14
   iManufacturer           1 VIA Labs,Inc.
   iProduct                2 USB3.1 SATA Bridge
   iSerial                 3 0000000000000001
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0079
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower                8mA
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
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           4
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     98
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
         Command pipe (0x01)
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
         bMaxBurst              15
         MaxStreams              8
         Data-in pipe (0x03)
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0400  1x 1024 bytes
         bInterval               0
         bMaxBurst              15
         MaxStreams              8
         Data-out pipe (0x04)
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
         MaxStreams              8
         Status pipe (0x02)
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0046
   bNumDeviceCaps          4
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
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {cad2ca93-36b2-504d-8043-8e827bbe1b9b}
   SuperSpeedPlus USB Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000023
       Sublink Speed Attribute count 3
       Sublink Speed ID count 1
     wFunctionalitySupport   0x1100
     bmSublinkSpeedAttr[0]   0x00050030
       Speed Attribute ID: 0 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b0
       Speed Attribute ID: 0 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4031
       Speed Attribute ID: 1 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b1
       Speed Attribute ID: 1 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
   Self Powered

Bus 006 Device 002: ID 2109:8822 VIA Labs, Inc. USB3.1 Hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.20
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x8822
   bcdDevice            5.a3
   iManufacturer           1 VIA Labs, Inc.
   iProduct                2 USB3.1 Hub
   iSerial                 3 000000001
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
       bInterfaceSubClass      0
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes           19
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0002  1x 2 bytes
         bInterval               8
         bMaxBurst               0
Hub Descriptor:
   bLength              12
   bDescriptorType      42
   nNbrPorts             4
   wHubCharacteristic 0x0009
     Per-port power switching
     Per-port overcurrent protection
   bPwrOn2PwrGood      175 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   bHubDecLat          0.4 micro seconds
   wHubDelay          2292 nano seconds
   DeviceRemovable    0x00
  Hub Port Status:
    Port 1: 0000.0203 lowspeed enable connect
    Port 2: 0000.0203 lowspeed enable connect
    Port 3: 0000.0203 lowspeed enable connect
    Port 4: 0000.0203 lowspeed enable connect
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0049
   bNumDeviceCaps          5
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000006
       BESL Link Power Management (LPM) Supported
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
     bU1DevExitLat           4 micro seconds
     bU2DevExitLat         231 micro seconds
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {30eef35c-07d5-2549-b001-802d79434c30}
   SuperSpeedPlus USB Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000023
       Sublink Speed Attribute count 3
       Sublink Speed ID count 1
     wFunctionalitySupport   0x1100
     bmSublinkSpeedAttr[0]   0x00050030
       Speed Attribute ID: 0 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b0
       Speed Attribute ID: 0 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4031
       Speed Attribute ID: 1 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b1
       Speed Attribute ID: 1 10Gb/s Symmetric TX SuperSpeedPlus
   ** UNRECOGNIZED:  03 10 0b
Device Status:     0x0001
   Self Powered

Bus 005 Device 003: ID 2109:8818 VIA Labs, Inc. USB Billboard Device
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.01
   bDeviceClass           17
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x8818
   bcdDevice            0.01
   iManufacturer           1 VIA Labs, Inc.
   iProduct                2 USB Billboard Device
   iSerial                 3 0000000000000001
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0012
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          3 0000000000000001
     bmAttributes         0xc0
       Self Powered
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        17
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              3 0000000000000001
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0051
   bNumDeviceCaps          3
   Billboard Capability:
     bLength                    48
     bDescriptorType            16
     bDevCapabilityType         13
     iAdditionalInfoURL          3 0000000000000001
     bNumberOfAlternateModes     1
     bPreferredAlternateMode     0
     VCONN Power                 0 1W
     bmConfigured                03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     bcdVersion               1.21
     bAdditionalFailureInfo      0
     bReserved                   0
     Alternate Modes supported by Device Container:
     Alternate Mode 0 : Alternate Mode configuration successful
       wSVID[0]                    0xFF01
       bAlternateMode[0]           0
       iAlternateModeString[0]     3 0000000000000001
   Billboard Alternate Mode Capability:
     bLength                     8
     bDescriptorType            16
     bDevCapabilityType         15
     bIndex                      0
     dwAlternateModeVdo          0x05000000
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {30eef35c-07d5-2549-b001-802d79434c30}
Device Status:     0x0001
   Self Powered

Bus 005 Device 002: ID 2109:2822 VIA Labs, Inc. USB2.0 Hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         2 TT per port
   bMaxPacketSize0        64
   idVendor           0x2109 VIA Labs, Inc.
   idProduct          0x2822
   bcdDevice            5.a3
   iManufacturer           1 VIA Labs, Inc.
   iProduct                2 USB2.0 Hub
   iSerial                 3 000000001
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
       bInterfaceSubClass      0
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
       bInterfaceSubClass      0
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
Hub Descriptor:
   bLength               9
   bDescriptorType      41
   nNbrPorts             5
   wHubCharacteristic 0x00e9
     Per-port power switching
     Per-port overcurrent protection
     TT think time 32 FS bits
     Port indicators
   bPwrOn2PwrGood      175 * 2 milli seconds
   bHubContrCurrent    100 milli Ampere
   DeviceRemovable    0x00
   PortPwrCtrlMask    0xff
  Hub Port Status:
    Port 1: 0000.0100 power
    Port 2: 0000.0100 power
    Port 3: 0000.0100 power
    Port 4: 0000.0100 power
    Port 5: 0000.0507 highspeed power suspend enable connect
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0049
   bNumDeviceCaps          5
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000006
       BESL Link Power Management (LPM) Supported
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
     bU1DevExitLat           4 micro seconds
     bU2DevExitLat         231 micro seconds
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {30eef35c-07d5-2549-b001-802d79434c30}
   SuperSpeedPlus USB Device Capability:
     bLength                28
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000023
       Sublink Speed Attribute count 3
       Sublink Speed ID count 1
     wFunctionalitySupport   0x1100
     bmSublinkSpeedAttr[0]   0x00050030
       Speed Attribute ID: 0 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b0
       Speed Attribute ID: 0 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4031
       Speed Attribute ID: 1 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b1
       Speed Attribute ID: 1 10Gb/s Symmetric TX SuperSpeedPlus
   ** UNRECOGNIZED:  03 10 0b
Device Status:     0x0001
   Self Powered



Am 12.11.21 um 17:23 schrieb Alan Stern:
> Can you please provide the output from "lsusb -v" for this device?

