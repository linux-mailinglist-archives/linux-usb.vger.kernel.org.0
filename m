Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F80B56175C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 12:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiF3KLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 06:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbiF3KLu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 06:11:50 -0400
X-Greylist: delayed 357 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Jun 2022 03:11:48 PDT
Received: from pasta.tip.net.au (pasta.tip.net.au [IPv6:2401:fc00:0:129::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875D44477F
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 03:11:48 -0700 (PDT)
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
        by mailhost.tip.net.au (Postfix) with ESMTP id 4LYYqQ09pRz9Qjf
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 20:05:22 +1000 (AEST)
Received: from [192.168.122.14] (unknown [121.45.58.108])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4LYYqP6P8kz9Qjc
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 20:05:21 +1000 (AEST)
Message-ID: <fcb5ad8f-1a62-566b-0c3e-9f79066ec7af@eyal.emu.id.au>
Date:   Thu, 30 Jun 2022 20:05:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: SATA/USB caddy - wrong device size reported
Content-Language: en-US
To:     list linux-usb <linux-usb@vger.kernel.org>
References: <a1ac4690-4d46-4461-a90f-dfa4777dbf54@eyal.emu.id.au>
 <YrxiF/uE0/0Kw7rJ@rowland.harvard.edu>
 <ae3ccebe-79ef-5dda-ae35-b753869a8822@suse.com>
From:   Eyal Lebedinsky <eyal@eyal.emu.id.au>
In-Reply-To: <ae3ccebe-79ef-5dda-ae35-b753869a8822@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 30/06/2022 18.55, Oliver Neukum wrote:
> 
> 
> On 29.06.22 16:30, Alan Stern wrote:
> 
>> Historically the problem goes the other way: Lots of devices used to
>> report a total size that was one logical block _larger_ than their
>> actual capacity.  This was caused by the firmware authors
>> misunderstanding the READ CAPACITY command, which is supposed to return
>> the block number of the last logical block -- but instead they would
>> return the total number of logical blocks, which is one higher (since
>> the first block is number 0).
>>
>> Nowadays most devices seem to sorted this out.  It looks like you found
>> one that makes the opposite mistake: The value it reports is one less
>> than the last block number.
>>
>> It is definitely a bug in the caddy.  On the other hand, this bug
>> probably doesn't affect the rest of the caddy's operations.
> 
> Or alternatively, the caddy is marked as quirky by mistake.
> In that case we need the descriptors of your device to compare it
> to the list of quirky devices. Could you provide "lsusb -v"?

Bus 002 Device 030: ID 0bc2:3330 Seagate RSS LLC Raptor 3.5" USB 3.0
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x0bc2 Seagate RSS LLC
   idProduct          0x3330
   bcdDevice            0.16
   iManufacturer           1 Seagate
   iProduct                2 Raptor 3.5" USB 3.0
   iSerial                 3 2HC015KJ
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
     MaxPower               96mA
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

> 	Regards
> 		Oliver

-- 
Eyal Lebedinsky (eyal@eyal.emu.id.au)
