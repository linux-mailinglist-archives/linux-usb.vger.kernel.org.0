Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A574C550EA2
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 04:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbiFTCoO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 22:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiFTCoN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 22:44:13 -0400
Received: from mail.gtsys.com.hk (tunnel316222-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7DC2AF8
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 19:44:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id D562D22A0306;
        Mon, 20 Jun 2022 10:44:08 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fuPoJPiqNGKA; Mon, 20 Jun 2022 10:44:08 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id BA75F229C1B1;
        Mon, 20 Jun 2022 10:44:08 +0800 (HKT)
Received: from [10.128.1.32] (unknown [182.239.87.123])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id 292DDC0139D;
        Mon, 20 Jun 2022 10:44:08 +0800 (HKT)
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
To:     USB list <linux-usb@vger.kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
Message-ID: <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
Date:   Mon, 20 Jun 2022 10:44:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/6/2022 12:11 pm, Chris Ruehl wrote:
> Hi there,
>
> yet an other cdc-acm which not probed and no /dev/ttyACM0 comes up.
>
> [  539.655588] usb 2-1.4.3: USB disconnect, device number 9
> [  568.792182] usb 2-1.4.3: new high-speed USB device number 10 using ehci-pci
> [  568.890554] usb 2-1.4.3: New USB device found, idVendor=0590, 
> idProduct=00ca, bcdDevice= 2.00
> [  568.890562] usb 2-1.4.3: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=3
> [  568.890566] usb 2-1.4.3: Product: OMRON B5L-001011
> [  568.890568] usb 2-1.4.3: Manufacturer: OMRON Corporation
> [  568.890571] usb 2-1.4.3: SerialNumber: 010000366A1
> [  568.945679] cdc_acm 2-1.4.3:1.0: Zero length descriptor references
> [  568.945690] cdc_acm: probe of 2-1.4.3:1.0 failed with error -22
> [  568.946477] usbcore: registered new interface driver cdc_acm
> [  568.946480] cdc_acm: USB Abstract Control Model driver for USB modems and 
> ISDN adapters
>
> so I set the quirk in the cdc-acm.c
>
>  { USB_DEVICE(0x0590, 0x00ca), /* Omron b5l */
>      .driver_info = NO_UNION_NORMAL, /* reports zero length descriptor */
>  },
>
> and solved the error.
>
> [  724.148131] usbcore: deregistering interface driver cdc_acm
> [  725.766219] usb 2-1.4.3: USB disconnect, device number 10
> [  757.467770] usb 2-1.4.3: new high-speed USB device number 11 using ehci-pci
> [  757.566100] usb 2-1.4.3: New USB device found, idVendor=0590, 
> idProduct=00ca, bcdDevice= 2.00
> [  757.566109] usb 2-1.4.3: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=3
> [  757.566113] usb 2-1.4.3: Product: OMRON B5L-001011
> [  757.566115] usb 2-1.4.3: Manufacturer: OMRON Corporation
> [  757.566117] usb 2-1.4.3: SerialNumber: 010000366A1
> [  757.622501] usbcore: registered new interface driver cdc_acm
> [  757.622506] cdc_acm: USB Abstract Control Model driver for USB modems and 
> ISDN adapters
>
>
> But the kernel does not create the /dev/ttyACM0.
>
> Kernel is vanilla 5.15.47
>
> lsusb -v get me this.
>
> Bus 002 Device 014: ID 0590:00ca Omron Corp. OMRON B5L-001011
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            2 Communications
>   bDeviceSubClass         2 Abstract (modem)
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x0590 Omron Corp.
>   idProduct          0x00ca
>   bcdDevice            2.00
>   iManufacturer           1 OMRON Corporation
>   iProduct                2 OMRON B5L-001011
>   iSerial                 3 010000366A1
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x002e
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower                4mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           4
>       bInterfaceClass         2 Communications
>       bInterfaceSubClass      2 Abstract (modem)
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x03  EP 3 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval              16
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval              16
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass            2 Communications
>   bDeviceSubClass         2 Abstract (modem)
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> can't get debug descriptor: Resource temporarily unavailable
> Device Status:     0x0001
>   Self Powered
>
>
> Anything you have in mind?
>
> Thanks
> Chris
>
>

Enabled the debugfs and checked /sys/kernel/debug/usb/devices for the B5L

T:  Bus=02 Lev=03 Prnt=04 Port=01 Cnt=01 Dev#= 17 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=02(comm.) Sub=02 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=0590 ProdID=00ca Rev= 2.00
S:  Manufacturer=OMRON Corporation
S:  Product=OMRON B5L-001011
S:  SerialNumber=010000319A1
C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=  4mA
I:* If#= 0 Alt= 0 #EPs= 4 Cls=02(comm.) Sub=02 Prot=00 Driver=(none)
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms

Driver is not assigned.

-Chris
