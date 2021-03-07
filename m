Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7299B32FF36
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 07:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhCGF6k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 00:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhCGF6T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 00:58:19 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64542C06174A
        for <linux-usb@vger.kernel.org>; Sat,  6 Mar 2021 21:58:19 -0800 (PST)
From:   Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: Amazon Kindle disconnect after Synchronize Cache
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
Message-ID: <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
Date:   Sun, 7 Mar 2021 06:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305191437.GC48113@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 05.03.21 um 20:14 schrieb Alan Stern:
> On Fri, Mar 05, 2021 at 05:54:43PM +0100, Matthias Schwarzott wrote:
>> One major difference I noticed looking at service answer time statistics:
>> Windows sends a lot more requests of type "Test Unit Ready".
>> * Windows: 6385 calls
>> * linux: 71 calls
> 
> It's generally well known that Windows issues lots and lots of redundant
> commands to USB storage drives.
> 
> 
> Unless the Kindle advertises removable media, there doesn't seem to be
> any real point to all those TEST UNIT READY commands.  Unless they are
> what prevents the disconnections...
> 
This is kernel log from connecting:
[41709.248006] usb 3-4: new high-speed USB device number 6 using xhci_hcd
[41709.380015] usb 3-4: New USB device found, idVendor=1949, 
idProduct=0004, bcdDevice= 1.00
[41709.380019] usb 3-4: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[41709.380021] usb 3-4: Product: Amazon Kindle
[41709.380022] usb 3-4: Manufacturer: Amazon
[41709.380023] usb 3-4: SerialNumber: REMOVED
[41709.493988] usb-storage 3-4:1.0: USB Mass Storage device detected
[41709.494080] scsi host6: usb-storage 3-4:1.0
[41710.510122] scsi 6:0:0:0: Direct-Access     Kindle   Internal Storage 
0100 PQ: 0 ANSI: 2
[41710.510245] sd 6:0:0:0: Attached scsi generic sg3 type 0
[41710.513059] sd 6:0:0:0: Power-on or device reset occurred
[41710.526331] sd 6:0:0:0: [sdc] Attached SCSI removable disk
[41712.629152] sd 6:0:0:0: [sdc] 6688768 512-byte logical blocks: (3.42 
GB/3.19 GiB)
[41712.846353] sd 6:0:0:0: [sdc] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[41712.846357] sdc: detected capacity change from 0 to 6688768
[41712.849499]  sdc: sdc1

As it prints "Attached SCSI removable disk" the device advertises 
removable media.

>> How can I get further on this topic?
> 
> Is runtime power management enabled?  Maybe the Kindle disconnects
> whenever the computer tries to suspend it.  This typically happens 2
> seconds after the last command was issued, which matches your
> observations.  If runtime PM is enabled, you can try disabling it.
> 
I assume this means autosuspend is not used:

# cat /sys/block/sde/device/power/control
on

# lsusb:
[...]
Bus 003 Device 017: ID 1949:0004 Lab126, Inc. Amazon Kindle 3/4/Paperwhite
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x1949 Lab126, Inc.
   idProduct          0x0004 Amazon Kindle 3/4/Paperwhite
   bcdDevice            1.00
   iManufacturer           1 Amazon
   iProduct                2 Amazon Kindle
   iSerial                 3 REMOVED....
   bNumConfigurations      1
OTG Descriptor:
   bLength                 3
   bDescriptorType         9
   bmAttributes         0x03
     SRP (Session Request Protocol)
     HNP (Host Negotiation Protocol)
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0023
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          4 Self-powered
     bmAttributes         0xc0
       Self Powered
     MaxPower                2mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     80 Bulk-Only
       iInterface              5 Mass Storage
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
         bInterval               1
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0001
   Self Powered

Regards
Matthias
