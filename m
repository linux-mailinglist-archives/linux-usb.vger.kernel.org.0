Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C98336BDE
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 07:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhCKGF1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 01:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhCKGFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 01:05:03 -0500
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7987C061574
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 22:05:03 -0800 (PST)
From:   Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: [usb-storage] Re: Amazon Kindle disconnect after Synchronize
 Cache
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
 <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
Message-ID: <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
Date:   Thu, 11 Mar 2021 07:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310214648.GA236329@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 10.03.21 um 22:46 schrieb Alan Stern:
> On Wed, Mar 10, 2021 at 09:56:04PM +0100, Matthias Schwarzott wrote:
>>> What happens if you set the value to 1000 before running the test?
>>>
>> I tested different values. At 1000 it still disconnects. At lower values it
>> no longer does this.
>> I tested 200 up to 900. Even 900 ms is good enough to keep it connected.
>>
>> Btw. it is not a USB disconnect, but it just seems to plays medium ejected.
>>
>> Out of interest I called "sg_start -v -l /dev/sde" after one of the failing
>> experiments. That made the Kindle go back to connected state.
>>
>> To me the above experiments show that enough TEST UNIT READY commands are
>> needed in the 2 s after a SYNCHRONIZE CACHE.
> 
> So you have found the solution to your problem.  Congratulations!
> 
Thank you for your support.

For longterm I think it should work automatically.
Some options I can think of (ordered by my preference):

1. Kernel sends one or more TEST UNIT READY commands after every 
SYNCHRONIZE CACHE to a Kindle device. Regardless of triggered by kernel 
or by some user code via ioctl.

2. Kernel automatically chooses a low enough value for events_poll_msecs 
if it detects kindle.

3. udev rule is added that matches the Kindle and sets events_poll_msecs.
   3a) SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk", 
ATTRS{product}=="Amazon Kindle", ATTR{events_poll_msecs}="900"

   3b) SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk", 
ATTRS{idVendor}=="1949", ATTRS{idProduct}=="0004", 
ATTR{events_poll_msecs}="900"

4. Kernel sends one or more TEST UNIT READY commands after every 
SYNCHRONIZE CACHE to a device (without matching).


I guess options 1 and 2 require a new entry in unusual_devs together 
with a (new?) quirk.
Option 3 requires to get a new rule into udev.
And option 4 is ugly as it changes behaviour for usb-storage or scsi 
disk device.

I would prefer option 1 or 2.

Do you know how high the overhead of having more TEST UNIT READY 
commands is? (=How much better option 1 is compared to option 2?)

Matthias
