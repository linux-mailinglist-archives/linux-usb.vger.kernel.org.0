Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB23E143D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 10:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390072AbfJWIbY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 04:31:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44266 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389996AbfJWIbY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 04:31:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E7DC1602E0; Wed, 23 Oct 2019 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571819480;
        bh=CyQc1Z/oCK6qmt0Jkv6RaXFR/Kf8d+oTrEZ5DiKMZNk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Pu6ljqrlFOWRVcK88wT/P9jOb5pVIiG9DDbbgeVu3Wrt/DzUbb93nGwazyI2NUqhv
         DE2qglNFmEq7Q2nT2/MITcWymxnWR4V4nLmKsE6LiIjjPcUF/qmMAfvkt6nSbaqD3+
         DIKCxhrhlcvhUdDxZAWfy/RlBY55DOvsPGk1vRfc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 555F2602E0;
        Wed, 23 Oct 2019 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571819480;
        bh=CyQc1Z/oCK6qmt0Jkv6RaXFR/Kf8d+oTrEZ5DiKMZNk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Pu6ljqrlFOWRVcK88wT/P9jOb5pVIiG9DDbbgeVu3Wrt/DzUbb93nGwazyI2NUqhv
         DE2qglNFmEq7Q2nT2/MITcWymxnWR4V4nLmKsE6LiIjjPcUF/qmMAfvkt6nSbaqD3+
         DIKCxhrhlcvhUdDxZAWfy/RlBY55DOvsPGk1vRfc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Oct 2019 01:31:20 -0700
From:   jackp@codeaurora.org
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: composite: Support more than 500mA
 MaxPower
In-Reply-To: <871rv3kijy.fsf@gmail.com>
References: <20191023065753.32722-1-jackp@codeaurora.org>
 <20191023065753.32722-2-jackp@codeaurora.org> <871rv3kijy.fsf@gmail.com>
Message-ID: <92d4a38890cbac34e6bb52dcf98f394c@codeaurora.org>
X-Sender: jackp@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019-10-23 00:49, Felipe Balbi wrote:
> Hi,
> 
> Jack Pham <jackp@codeaurora.org> writes:
>> USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
>> when in configured state. However, if a configuration wanting to
>> take advantage of this is added with MaxPower greater than 500
>> (currently possible if using a ConfigFS gadget) the composite
>> driver fails to accommodate this for a couple reasons:
>> 
>>  - usb_gadget_vbus_draw() when called from set_config() and
>>    composite_resume() will be passed the MaxPower value without
>>    regard for the current connection speed, resulting in a
>>    violation for USB 2.0 since the max is 500mA.
>> 
>>  - the bMaxPower of the configuration descriptor would be
>>    incorrectly encoded, again if the connection speed is only
>>    at USB 2.0 or below, likely wrapping around UINT8_MAX since
>>    the 2mA multiplier corresponds to a maximum of 610mA.
>> 
>> Fix these by adding checks against the current gadget->speed
>> when the c->MaxPower value is used and appropriately limit
>> based on whether it is currently at a low-/full-/high- or super-
>> speed connection.
>> 
>> Incidentally, 900 is not divisble by 8, so even for super-speed
>> the bMaxPower neds to be capped at 896mA, otherwise due to the
>                 ^^^^
>                 needs
> 
> Why do you need to cap it? DIV_ROUND_UP() should still work.

The round up causes 900 on the input side to be greater than 900 when 
doing the
reverse, i.e. multiplication by 8.

Alternatively we could just do a normal integer division here 
(effectively
round down).

>> round-up division a MaxPower of 900 will result in an encoded
>> value of 904mA and many host stacks (including Linux and Windows)
>> of a root port will reject the configuration.
>> 
>> N.B. USB 3.2 Gen N x 2 allows for up to 1500mA but there doesn't
>> seem to be any any peripheral controller supported by Linux that
>> does two lane operation, so for now keeping the clamp at 900
>> should be fine.
>> 
>> Signed-off-by: Jack Pham <jackp@codeaurora.org>
>> ---
>>  drivers/usb/gadget/composite.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/usb/gadget/composite.c 
>> b/drivers/usb/gadget/composite.c
>> index e1db94d1fe2e..92ce3018f482 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -438,9 +438,10 @@ static u8 encode_bMaxPower(enum usb_device_speed 
>> speed,
>>  	if (!val)
>>  		return 0;
>>  	if (speed < USB_SPEED_SUPER)
>> -		return DIV_ROUND_UP(val, 2);
>> +		return DIV_ROUND_UP(min(val, 500U), 2);
>>  	else
>> -		return DIV_ROUND_UP(val, 8);
>> +		/* USB 3.x supports 900mA, but that isn't divisible by 8... */
>> +		return DIV_ROUND_UP(min(val, 896U), 8);
> 
> DIV_ROUND_UP(896, 8) = 112
> DIV_ROUND_UP(900, 8) = 113
> 
> Why value do you want here?

Right, but now on the host it will do the reverse calculation, i.e. 
113*8 == 904mA.
For a root port this would be greater than it's maximum power budget of 
900mA and
would result in not selecting the config.
