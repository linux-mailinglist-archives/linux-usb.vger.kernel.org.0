Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C716015A5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 19:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiJQRrp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 13:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiJQRro (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 13:47:44 -0400
Received: from titan5.planetwebservers.net (titan5.planetwebservers.net [51.222.33.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AFF62934
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mrgiflU4myV4vq0PKMHVPRA9K4IPGIRxr7EmBZo9n0A=; b=s/okrabHjMVfxdYiw9lNArTDnh
        nxQFy1iaybnGfwKgqGa3ZXAWBY1eOzWDt5/4IiYMnjenPVYxnNOovaLNljSzSJikIqh87TT5TTDVY
        83qHx4+ApUsCqmLw+OQzfCBZO/EMiz73Qv4GmTlZRjj8FJXLnMN1JtfY8XZaFhELTfECbHj9mfMTb
        LEyO0KGo18elZ3SH+qooKwwb5qtPQkkYUdeYTI7kP6zTVniYGd8i4mV+ptuSbTsYdIkaK/sCbglk6
        etJ1885v3FzFrWvimO5DCd6eBdornyl/5xhZPWEidw8CPmbPH07MxoEzy6vfa1mS4moc8Wnu7iU7x
        Oi5hAzWg==;
Received: from [66.79.242.44] (port=35132 helo=[192.168.68.80])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <bjlockie@lockie.ca>)
        id 1okUD7-0000UH-Sr;
        Tue, 18 Oct 2022 04:47:41 +1100
Message-ID: <2c81fb1b-8ec3-d652-4ee8-9354998a0c10@lockie.ca>
Date:   Mon, 17 Oct 2022 13:47:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: is usb.ids used anymore?
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <8526b38d-64b2-05b0-48e5-a54936f6332f@lockie.ca>
 <Y0zheI+RSeLNulpx@kroah.com> <7cb0f51d-6ad1-488d-a989-08eb6727e9b7@lockie.ca>
 <Y01uSKYMXBkZVgOJ@kroah.com>
Content-Language: en-US
From:   James <bjlockie@lockie.ca>
In-Reply-To: <Y01uSKYMXBkZVgOJ@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>> I tried to add:
>> 7961 MT7921AU 802.11a/b/g/n/ac/ax Wireless Adapter
>>
>> 7961 shows up but the description/name is blank on:
>> https://usb-ids.gowdy.us/read/UD/0e8d

0e8d:7961 MediaTek Inc. Wireless_Device
>>
>> I also tried to add 0608  the 7921k USB Bluetooth portion of a pci card.
> I don't understand, how is a USB device part of a PCI device?
The PCI device is a wireless card that has a chipset that also supports 
Bluetooth and the PCI device has a USB cable that connects to the 
motherboard to support the Bluetooth part.
The wireless radio is connected via PCI and the Bluetooth radio is 
connected via USB.
>
> What does 'lsusb' show for these devices?
0e8d:0608 MediaTek Inc. Wireless_Device
>
>> Someone else added 2870 but it doesn't show a name either.
> Is there a name in the device itself?  That's the best place for this
> information, and is why USB added strings to the configuration
> descriptors, so that no external tool should ever really be needed.
Is the name in the device put there by the manufacturer of the device 
(eg. Comfast/Netgear) or is the name stored in the chipset used (eg. 
MediaTek)?

I have an Alfa Networks AWUS036ACM that shows in lsusb as:
0e8d:7612 MediaTek Inc. MT7612U 802.11a/b/g/n/ac Wireless Adapter
I was suspicious they (MediaTek) don't embed a detailed name in the 
device (just "Wireless_Device") so
I removed:
usb:v0E8Dp7612*
  ID_MODEL_FROM_DATABASE=MT7612U 802.11a/b/g/n/ac Wireless Adapter
from:
/lib/udev/hwdb.d/20-usb-vendor-model.hwdb
and I also tried to override the name in /etc/udev/hwdb.d/
Neither worked.

I copied that directive to make one for 0E8D:7961 but that didn't work 
either. :-(
usb:v0E8Dp7961*
  ID_MODEL_FROM_DATABASE=MT7612U 802.11a/b/g/n/ac/ax Wireless Adapter

>>>> The link to the maintainer is no longer valid. :-(
>>> What link?
>> It says "This site maintained by Stephen J. Gowdy." and has a link to http://cern.ch/gowdy which is 404 not found.
> There might be an email address on the file itself if you really want to
> contact them.

Can you please just let him know about the broken link?
