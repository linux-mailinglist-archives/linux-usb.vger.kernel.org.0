Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0720F46E488
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 09:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhLIIuH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 03:50:07 -0500
Received: from cable.insite.cz ([84.242.75.189]:55292 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhLIIuH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Dec 2021 03:50:07 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C6379A1A3D402;
        Thu,  9 Dec 2021 09:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639039592; bh=M3qwLUTcZQOvSfUmdbdrCnwU4AY9IxGtraIgvNzSiB8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OBAXk8ALzH9apkp89TxvQgIxqKlLd/bVL2y3sLM2VIZpUw5jEGhLxlVu1ynfbZ2nH
         3stEmfr711CUCbVK92JfCNGua+UPfBqMJwhSrbDMBmqouydbzrlPxGBdFZzJdXvRyZ
         BUUjdbX8oop6QBTlefoMDQo/tP5RKIxlxiqZYrK8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AsokzKEiwVno; Thu,  9 Dec 2021 09:46:27 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id E42BEA1A3D400;
        Thu,  9 Dec 2021 09:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639039587; bh=M3qwLUTcZQOvSfUmdbdrCnwU4AY9IxGtraIgvNzSiB8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JOPu6rz7O3Gq3+Sn2p+ib6Eb1CwCA1OJrKvY6uqX6TFhvZrWKvjDUJ3oBOOpGCW52
         VjikV9N+mMczvIhN9Yk+OIRWpZF9vWP1J68d3PJPtLXwdkJHyyXg0WTI90/4Y61xdD
         kiM9nSHfAVlNMI7wpWBK+kPNPgcF83IESU3heeqc=
Subject: Re: usb:core: possible bug in wMaxPacketSize validation in config.c?
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <ce5ed936-4325-95a1-cd1c-eece35c4b613@ivitera.com>
 <YbG4CvLEdf5CmYbc@kroah.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <65f8eaa8-5606-73da-acfb-4b7322b5b96a@ivitera.com>
Date:   Thu, 9 Dec 2021 09:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbG4CvLEdf5CmYbc@kroah.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Dne 09. 12. 21 v 9:02 Greg KH napsal(a):
> On Thu, Dec 09, 2021 at 08:53:37AM +0100, Pavel Hofman wrote:
>> Hi,
>>
>> in
>> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L409
>> the initial value of maxp is obtained using function usb_endpoint_maxp.
>>
>> maxp = usb_endpoint_maxp(&endpoint->desc);
>>
>> This function https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/usb/ch9.h#L647
>> returns only the bits 0 - 10 of the wMaxPacketSize field, i.e. dropping the
>> high-bandwidth bits 11 and 12. Yet the subsequent code extracts these bits
>> from maxp into variable i
>> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L427
>> , clears them in maxp, and re-sets back in one of the further checks
>> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L445
>>
>> IMO that means the code requires that initial value of maxp contains the
>> additional-transactions bits. IMO the code should be fixed with this trivial
>> patch (tested on my build):
>>
>>
>> ===================================================================
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> --- a/drivers/usb/core/config.c	(revision
>> 018dd9dd80ab5f3bd988911b1f10255029ffa52d)
>> +++ b/drivers/usb/core/config.c	(date 1638972286064)
>> @@ -406,7 +406,7 @@
>>   	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
>>   	 * (see the end of section 5.6.3), so don't warn about them.
>>   	 */
>> -	maxp = usb_endpoint_maxp(&endpoint->desc);
>> +	maxp = endpoint->desc.wMaxPacketSize;
>>   	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
>>   		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has
>> invalid wMaxPacketSize 0\n",
>>   		    cfgno, inum, asnum, d->bEndpointAddress);
>>
>>
>> =========================
>>
>> I can send a proper patch should the change be approved.
> 
> Please always just send a real patch, that makes it easier to discuss.

> 
> Anyway, what problem is this solving?  

The config.c contains several verifications which modify wMaxPacketSize 
values reported by a device to conform to USB specs. IMO there is a bug 
in the validation code.

> Do you have a device where the > data is calculated incorrectly?

No I don't, I noticed the issue while testing something which involved 
that part of code.

>  What value in a device is being
> declared incorrect because of the existing code?
Please look at the existing code with my comments starting ///////:


====================

	/*
	 * Validate the wMaxPacketSize field.
	 * Some devices have isochronous endpoints in altsetting 0;
	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
	 * (see the end of section 5.6.3), so don't warn about them.
	 */

////// Here only bits 0 - 10 from endpoint->desc.wMaxPacketSize
////// are copied to maxp
	maxp = usb_endpoint_maxp(&endpoint->desc);
	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has 
invalid wMaxPacketSize 0\n",
		    cfgno, inum, asnum, d->bEndpointAddress);
	}

	/* Find the highest legal maxpacket size for this endpoint */
	i = 0;		/* additional transactions per microframe */
	switch (udev->speed) {
	case USB_SPEED_LOW:
		maxpacket_maxes = low_speed_maxpacket_maxes;
		break;
	case USB_SPEED_FULL:
		maxpacket_maxes = full_speed_maxpacket_maxes;
		break;
	case USB_SPEED_HIGH:
		/* Bits 12..11 are allowed only for HS periodic endpoints */
		if (usb_endpoint_xfer_int(d) || usb_endpoint_xfer_isoc(d)) {

///////// Here bits 11 and 12 are extracted from maxp,
///////// removed from maxp and stored in i.
///////// They are always 0 due to the usb_endpoint_maxp call.
			i = maxp & (BIT(12) | BIT(11));
			maxp &= ~i;
		}
		fallthrough;
	default:
		maxpacket_maxes = high_speed_maxpacket_maxes;
		break;
	case USB_SPEED_SUPER:
	case USB_SPEED_SUPER_PLUS:
		maxpacket_maxes = super_speed_maxpacket_maxes;
		break;
	}
	j = maxpacket_maxes[usb_endpoint_type(&endpoint->desc)];

	if (maxp > j) {
		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has 
invalid maxpacket %d, setting to %d\n",
		    cfgno, inum, asnum, d->bEndpointAddress, maxp, j);

//////// If maxp > max allowed packet size (the device reports incorrect 
//////// values in bits 0-10, wMaxPacketSize will use the max allowed 
//////// packet size for bits 0-10, and the additional-transaction 
//////// (high-bandwidth) bits stored in i will be set, to allow more 
//////// packets per frame. But currently i is always = 0 due to the 
//////// usb_endpoint_maxp call.
		maxp = j;
		endpoint->desc.wMaxPacketSize = cpu_to_le16(i | maxp);
	}



====================

Thanks a lot for the review.

Pavel.
