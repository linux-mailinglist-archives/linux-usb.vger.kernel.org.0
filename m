Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFEBDEBC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 11:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfD2JKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 05:10:18 -0400
Received: from rila.superhosting.bg ([91.196.125.212]:54319 "EHLO
        rila.superhosting.bg" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbfD2JKR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 05:10:17 -0400
X-Greylist: delayed 3418 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Apr 2019 05:10:15 EDT
Received: from [78.128.48.21] (port=60190 helo=[192.168.0.10])
        by rila.superhosting.bg with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.91)
        (envelope-from <help@roumenpetrov.info>)
        id 1hL1PT-000CGG-Mb
        for linux-usb@vger.kernel.org; Mon, 29 Apr 2019 11:13:14 +0300
From:   =?UTF-8?B?0KDRg9C80LXQvSDQn9C10YLRgNC+0LI=?= 
        <help@roumenpetrov.info>
Subject: flash fail with mediatek device
To:     linux-usb@vger.kernel.org
Message-ID: <fa172514-38ed-71af-bc25-e035b8840807@roumenpetrov.info>
Date:   Mon, 29 Apr 2019 11:13:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - rila.superhosting.bg
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roumenpetrov.info
X-Get-Message-Sender-Via: rila.superhosting.bg: authenticated_id: master78@roumenpetrov.info
X-Authenticated-Sender: rila.superhosting.bg: master78@roumenpetrov.info
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I would like to use  "SP Flash Tool"  to flash Android MediaTek. Process 
ends with error S_FT_DA_NO_RESPONSE and I have no more ideas how to proceed.
Internet has many clips on non-linux system that shows working "SP Flash 
Tool" with specific CDC driver.
Unfortunately is not clear configuration for working Linux version of 
program.

Question is how to get it working.


kernel:  4.4.176.  Remark: does not work with previous 4.4.* kernels.
modules: cdc_acm loaded in advance.
program: SP_Flash_Tool v5.1824 (Linux) . Remark: fail with previous as well.
udev rule that stops ModemManaget exist (system) - ID_MM_DEVICE_IGNORE 
is set
udev rule that stops MTP probe added (host) -  MTP_NO_PROBE is set

Device:
lsusb
...
Bus 002 Device 004: ID 0e8d:2000 MediaTek Inc. MT65xx Preloader
...

When the program "SP Flash Tool" is in "download" mode, i.e. it has to 
and device is plugged following is visible:

On terminal:
======================================================================
Connecting to BROM...
Scanning USB port...
Search usb, timeout set as 3600000 ms
add@/devices/pci0000:00/0000:00:13.2/usb4/4-3

add@/devices/pci0000:00/0000:00:13.2/usb4/4-3/4-3:1.0

add@/devices/pci0000:00/0000:00:13.2/usb4/4-3/4-3:1.1

add@/devices/pci0000:00/0000:00:13.2/usb4/4-3/4-3:1.1/tty/ttyACM0

vid is 0e8d

device vid = 0e8d

pid is 2000

device pid = 2000

com portName is: /dev/ttyACM0

Total wait time = -1556345943.000000
USB port is obtained. path name(/dev/ttyACM0), port name(/dev/ttyACM0)
USB port detected: /dev/ttyACM0
BROM connected
Downloading & Connecting to DA...
connect DA end stage: 2, enable DRAM in 1st DA: 0
COM port is open. Trying to sync with the target...
Failed to Connect DA: S_FT_DA_NO_RESPONSE
Disconnect!
BROM Exception! ( ERROR : S_FT_DA_NO_RESPONSE (4001)

DA didn't send response data to FlashTool!

======================================================================

System log
======================================================================
...
.. kernel: [...] usb 4-3: new high-speed USB device number 3 using ehci-pci
.. kernel: [...] usb 4-3: New USB device found, idVendor=0e8d, 
idProduct=2000
.. kernel: [...] usb 4-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
.. kernel: [...] usb 4-3: Product: MT65xx Preloader
.. kernel: [...] usb 4-3: Manufacturer: MediaTek
.. kernel: [...] cdc_acm 4-3:1.1: ttyACM0: USB ACM device
...
======================================================================

Remark: if "SP Flash Tool" is not in "download" mode device disconnects 
immediately.

Regards,
Roumen Petrov

P.S. verbose data for USB device.
a) lsusb -v -s 002:004 (stderr):
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
cannot read device status, Resource temporarily unavailable (11)

b) lsusb -v -s 002:004 (stdout):
Bus 002 Device 004: ID 0e8d:2000 MediaTek Inc. MT65xx Preloader
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            2 Communications
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0e8d MediaTek Inc.
   idProduct          0x2000 MT65xx Preloader
   bcdDevice            1.00
   iManufacturer           1 (error)
   iProduct                2 (error)
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength           70
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          3 (error)
     bmAttributes         0xc0
       Self Powered
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              4 (error)
       Endpoint Descriptor:
         bLength                 8
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 8
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      1 AT-commands (v.25ter)
       iInterface              5 (error)
       CDC Header:
         bcdCDC               1.10
       CDC ACM:
         bmCapabilities       0x0f
           connection notifications
           sends break
           line coding and serial state
           get/set/clear comm features
       CDC Union:
         bMasterInterface        1
         bSlaveInterface         0
       CDC Call Management:
         bmCapabilities       0x03
           call management
           use DataInterface
         bDataInterface          0
       Endpoint Descriptor:
         bLength                 8
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval              16

