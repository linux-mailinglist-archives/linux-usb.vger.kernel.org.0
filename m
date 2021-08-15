Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3E53EC80D
	for <lists+linux-usb@lfdr.de>; Sun, 15 Aug 2021 09:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbhHOH5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Aug 2021 03:57:24 -0400
Received: from pcug.org.au ([203.10.76.4]:57739 "EHLO pasta.tip.net.au"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235569AbhHOH5Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Aug 2021 03:57:24 -0400
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Aug 2021 03:57:23 EDT
Received: from pasta.tip.net.au (pcug.org.au [203.10.76.4])
        by mailhost.tip.net.au (Postfix) with ESMTP id 4GnTsM2n2yz9Q1w
        for <linux-usb@vger.kernel.org>; Sun, 15 Aug 2021 17:47:19 +1000 (AEST)
Received: from e4.eyal.emu.id.au (unknown [121.45.32.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4GnTsM2Bbtz9PyS
        for <linux-usb@vger.kernel.org>; Sun, 15 Aug 2021 17:47:19 +1000 (AEST)
Subject: Re: USB hub problem
To:     linux-usb@vger.kernel.org
References: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
 <YRi0ICEZM+1eAyNu@kroah.com>
From:   Eyal Lebedinsky <eyal@eyal.emu.id.au>
Message-ID: <588377e9-9775-e885-7f37-26eff44f7299@eyal.emu.id.au>
Date:   Sun, 15 Aug 2021 17:47:14 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRi0ICEZM+1eAyNu@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 15/08/2021 16.28, Greg KH wrote:
> On Sun, Aug 15, 2021 at 09:32:06AM +1000, Eyal Lebedinsky wrote:
>> I have an external 4-way USB3.0 hub (I actually have two of them) That do not behave as expected.
>> It is an XCD XCDESSUSBH4BK. It is unpowered. I am on fedora 34, kernel 5.13.8-200.fc34.x86_64
>>
>> For starters, I found that attaching a USB SSD does not allow booting from it.
> 
> That is up to your BIOS, not Linux.

Attaching the USB SSD directly to the PC does boot from it though.

>> I then found that when attaching my phone it is not recognized.
> 
> In what way?
> 
>> I searched the hub model and IDs but did not find relevant information.
>> Is there an official list of supported hubs (or devices)?
> 
> No, as any list would instantly be out of date.
> 
>> Here is what it looks like.
>>
>> When the hub is attached (no phone) I see
>>          Bus 001 Device 048: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
>> and
>>          /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>              |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>>                  |__ Port 2: Dev 48, If 0, Class=Hub, Driver=hub/4p, 480M
>> Attaching the phone does not add a device.
>>
>> Detaching/attaching the hub (with the phone already plugged in) I get
>>          Bus 001 Device 052: ID 04e8:6860 Samsung Electronics Co., Ltd Galaxy A5 (MTP)
>>          Bus 001 Device 051: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
>> and
>>          /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>              |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>>                  |__ Port 2: Dev 51, If 0, Class=Hub, Driver=hub/4p, 480M
>>                      |__ Port 1: Dev 52, If 1, Class=Communications, Driver=cdc_acm, 480M
>>                      |__ Port 1: Dev 52, If 2, Class=CDC Data, Driver=cdc_acm, 480M
>>                      |__ Port 1: Dev 52, If 0, Class=Imaging, Driver=, 480M
>>                      |__ Port 1: Dev 52, If 3, Class=Vendor Specific Class, Driver=, 480M
>> and the phone is recognized and accessible as MTP device.
> 
> Great, so when does this not work?  This shows a successful device
> found.

Yes, this does show success, but earlier there is this failure shown:
	## plug phone:
         	(no new messages)
In other words, the system did not notice the phone when it was plugged into that hub.

I then attached the hub to the machine with the phone already plugged into it and it was
noticed.

My suspicion is that the hub is at fault and it fails to report the (phone plugged in) event
so linux probably has no knowledge of this.

What I failed to mention is that plugging a USB disk into this hub IS recognized as expected.
Something is not happy between the phone and this hub.

Plugging the phone to other USB 3.0 ports on this machine is recognized properly.

Thanks,
	Eyal

> thanks,
> 
> greg k-h
> 

-- 
Eyal Lebedinsky (eyal@eyal.emu.id.au)
