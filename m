Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE623ED3FC
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhHPMc2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 08:32:28 -0400
Received: from pcug.org.au ([203.10.76.4]:50549 "EHLO pasta.tip.net.au"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229600AbhHPMc2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 08:32:28 -0400
X-Greylist: delayed 403 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Aug 2021 08:32:27 EDT
Received: from pasta.tip.net.au (pcug.org.au [203.10.76.4])
        by mailhost.tip.net.au (Postfix) with ESMTP id 4GpCzR0tmxz9Q0Q
        for <linux-usb@vger.kernel.org>; Mon, 16 Aug 2021 22:25:07 +1000 (AEST)
Received: from e4.eyal.emu.id.au (unknown [121.45.32.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4GpCzQ6Ct7z9Pd5
        for <linux-usb@vger.kernel.org>; Mon, 16 Aug 2021 22:25:06 +1000 (AEST)
Subject: Re: USB hub problem
To:     linux-usb@vger.kernel.org
References: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
 <00311c3e-9b32-792d-8320-d6080bc9585c@suse.com>
From:   Eyal Lebedinsky <eyal@eyal.emu.id.au>
Message-ID: <426a1ad4-b0a5-3e26-b871-f5d987401f6f@eyal.emu.id.au>
Date:   Mon, 16 Aug 2021 22:25:01 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <00311c3e-9b32-792d-8320-d6080bc9585c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 16/08/2021 20.30, Oliver Neukum wrote:
> 
> On 15.08.21 01:32, Eyal Lebedinsky wrote:
>> I searched the hub model and IDs but did not find relevant information.
>> Is there an official list of supported hubs (or devices)?
> 
> No, any hub by implementing the hub specification is supported.
> 
>> Attaching the phone does not add a device.
> 
> Just for the sake of completeness, could you post 'lsusb -v'
> for that hub?

Bus 001 Device 095: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0
   bDeviceProtocol         2 TT per port
   bMaxPacketSize0        64
   idVendor           0x0bda Realtek Semiconductor Corp.
   idProduct          0x5411 RTS5411 Hub
   bcdDevice            1.04
   iManufacturer           1 Generic
   iProduct                2 4-Port USB 2.0 Hub
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

>> ## plug phone:
>>          (no new messages)
> That suggests a bug in the hub firmware. specifically that
> under unknown circumstances it fails to generate events
> for connection changes.

I do not know it it is of value, but when the phone is not detected, it also does not
indicate that it is connected using MTP. It thinks it is only being charged only.

>> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: new high-speed USB device
>> number 57 using xhci_hcd
>> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: New USB device found,
>> idVendor=04e8, idProduct=6860, bcdDevice= 4.00
>> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: New USB device strings: Mfr=2,
>> Product=3, SerialNumber=4
>> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: Product: SAMSUNG_Android
> 
> In other respects it does work.
> 
> Based on a hunch, could you test whether the circumstances
> this device fails under is related to runtime PM?
> 
> In order to do so you boot with
> 
> usbcore.autosuspend=-1
 >
> 
> on the kernel command line.

Well I can do better. I use USB TV tuners and in /etc/modprobe.d/dvb.conf I see
	options usbcore autosuspend=-1
It is a leftover from using an old tuner.

>      Regards
>          Oliver

Thanks

-- 
Eyal Lebedinsky (eyal@eyal.emu.id.au)
