Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7074B26CB37
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 22:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgIPUYT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 16:24:19 -0400
Received: from aibo.runbox.com ([91.220.196.211]:50572 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727084AbgIPR2V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 13:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:Subject:From;
        bh=EF7A2aZIznKvjbmU4/mJNAmp2hc14V7A0aHHQVvh8Ls=; b=Sx+CU2z/PguhjBqvE491Fm5gur
        IhH9H8Qfn4FxWL8SpNQQCWQw7zh7USP5W5ZYAeFTESOaYpECkCJ2/+ElUsIRdmdblVunE2iJeJUFK
        1kSgD0aqHJtCvr61c4wcS2zzYshZRx/LEOjt4z8b9+0f9Vdop9rt58cIfTTj+bUNzs1Q6wN/meUNi
        ENeJ2Yu9DKHn0Hlx3oksi8X8Em2EOauI21ER0BtrA0n4xsBdzxZYBH6uwOmfYqFNL0Y7dyr+nAYxw
        Qzdx+DpdMQEd2VLntKk+jLJDcZdsZc5e06eEB+2aq7omZkLDCSJhG7tDTntecQDzmMtEEvQ7L/spe
        RccmQvXA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kIZpg-0006Bg-M9; Wed, 16 Sep 2020 17:58:56 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kIZpS-0007AR-Jc; Wed, 16 Sep 2020 17:58:42 +0200
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Subject: Re: USB driver ID matching broken
To:     Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzkaller <syzkaller@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
References: <CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com>
 <20200916141513.GA2977321@kroah.com>
 <9d329243e4ed6b09afade2659e09b847e9c780fc.camel@hadess.net>
Message-ID: <359d080c-5cbb-250a-0ebd-aaba5f5c530d@runbox.com>
Date:   Wed, 16 Sep 2020 18:58:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9d329243e4ed6b09afade2659e09b847e9c780fc.camel@hadess.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/09/2020 17.39, Bastien Nocera wrote:
> On Wed, 2020-09-16 at 16:15 +0200, Greg Kroah-Hartman wrote:
>> On Wed, Sep 16, 2020 at 03:33:25PM +0200, Andrey Konovalov wrote:
>>> Hi Bastien, Greg, Alan,
>>>
>>> Looks like commit adb6e6ac20ee ("USB: Also match device drivers
>>> using
>>> the ->match vfunc") broke the USB driver ID matching process. This,
>>> in
>>> turn, led to a complete breakage of the USB fuzzing instance.
>>>
>>> This is how an attempt to connect a USB device looks now:
>>>
>>> [   39.781642][   T12] usb 1-1: new high-speed USB device number 2
>>> using dummy_hcd
>>> [   40.299955][   T12] usb 1-1: New USB device found,
>>> idVendor=0cf3,
>>> idProduct=9271, bcdDevice= 1.08
>>> [   40.303072][   T12] usb 1-1: New USB device strings: Mfr=1,
>>> Product=2, SerialNumber=3
>>> [   40.305678][   T12] usb 1-1: Product: syz
>>> [   40.307041][   T12] usb 1-1: Manufacturer: syz
>>> [   40.308556][   T12] usb 1-1: SerialNumber: syz
>>> [   40.314825][   T12] usbip-host 1-1: 1-1 is not in match_busid
>>> table... skip!
>>> [   42.500114][   T51] usb 1-1: USB disconnect, device number 2
>>>
>>> It seems that when going through the list of registered IDs the
>>> code
>>> tries to match against USB/IP and succeeds as usbip_match() always
>>> returns true.
>>>
>>> I'm not sure what's the best fix for this is.
>>
>> I thought that is what the patch from Bastien was supposed to fix?
>>
>> If it didn't, we can revert it.
> 
> It wasn't. Are you thinking of "usbip: Implement a match function to
> fix usbip" by M. Vefa Bicakci (CC:ed)?
> 
> Seems to me that usbip wants to match *every* device. Wouldn't that be
> a bug in usbip?

Hello all,

I agree with Bastien; it looks like the match function that I had prepared
for the "USB-IP no longer works starting with v5.7.y" bug at [1] is not
appropriate due to the fact that the match function always returns true.

My understanding of how USB-IP works is that the user-space provides the
USB bus identifier of the device to be published via USB-IP to the kernel
via /sys/bus/usb/drivers/usbip-host/match_busid. Given that the bus
identifiers written to match_busid are stored in a table, perhaps this
table can be queried in the usbip_match function to avoid the issue
reported by Andrey while preserving USB-IP's functionality?

If needed, I can prepare a patch implementing this proposal, perhaps after
commit 7a2f2974 ("usbip: Implement a match function to fix usbip") is
reverted. The only catch is that my bandwidth is a bit limited, hence it
may take some time for me to publish a patch.

Sorry for this unexpected bug,

Vefa

[1] https://bugzilla.kernel.org/show_bug.cgi?id=208267
