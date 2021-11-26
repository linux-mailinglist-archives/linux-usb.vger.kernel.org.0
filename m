Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B503445EE56
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 13:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbhKZM6w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 07:58:52 -0500
Received: from fieber.vanmierlo.com ([84.243.197.177]:37946 "EHLO
        kerio9.vanmierlo.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1377527AbhKZM4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 07:56:52 -0500
X-Footer: dmFubWllcmxvLmNvbQ==
Received: from roundcube.vanmierlo.com ([192.168.37.37])
        (authenticated user m.brock@vanmierlo.com)
        by kerio9.vanmierlo.com (Kerio Connect 9.3.1 patch 1) with ESMTPA;
        Fri, 26 Nov 2021 13:53:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Nov 2021 13:53:19 +0100
From:   Maarten Brock <m.brock@vanmierlo.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CP2105 gives kernel error -22 when in modem mode
In-Reply-To: <YaCtPXkQXQIzsuq2@hovoldconsulting.com>
References: <5eb560c81d2ea1a2b4602a92d9f48a89@vanmierlo.com>
 <YaCtPXkQXQIzsuq2@hovoldconsulting.com>
Message-ID: <fb6416cc7e07d40b8eb3956ed4fb0a62@vanmierlo.com>
X-Sender: m.brock@vanmierlo.com
User-Agent: Roundcube Webmail/1.3.3
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-11-26 10:47, Johan Hovold wrote:
> On Thu, Nov 25, 2021 at 04:42:27PM +0100, Maarten Brock wrote:
>> Hello all,
>> 
>> When a uart of the CP2105 USB-serial chip is programmed to be in modem
>> mode, all its gpio pins are in alternate use and none are available 
>> for
>> gpio. Still the cp210x driver tries to add a gpiochip unconditionally,
>> which results in an error.
>> 
>> > cp210x 1-1.4.4:1.0: cp210x converter detected
>> > usb 1-1.4.4: cp210x converter now attached to ttyUSB0
>> > cp210x 1-1.4.4:1.1: cp210x converter detected
>> > gpio gpiochip2: (cp210x): tried to insert a GPIO chip with zero lines
>> > gpiochip_add_data_with_key: GPIOs 0..-1 (cp210x) failed to register,
>> > -22
>> > cp210x 1-1.4.4:1.1: GPIO initialisation failed: -22
>> > usb 1-1.4.4: cp210x converter now attached to ttyUSB1
> 
> Thanks for reporting this.
> 
>> I propose to add something like the following to cp210x_gpio_init
>> 
>> +	unsigned long valid_mask, altfunc_mask;
>> ...
>> +	altfunc_mask = priv->gpio_altfunc;
>> +	bitmap_complement(&valid_mask, &altfunc_mask, priv->gc.ngpio);
>> +	if (bitmap_empty(&valid_mask, priv->gc.ngpio))
>> +		return 0;
>> +
>>   	priv->gc.label = "cp210x";
>>   	priv->gc.request = cp210x_gpio_request;
>>   	priv->gc.get_direction = cp210x_gpio_direction_get;
>> 
>> I can write a proper patch, but am unsure if and what the Fixes tag
>> should be.
> 
> This was introduced by commit c8acfe0aadbe ("USB: serial: cp210x:
> implement GPIO support for CP2102N") when generalising GPIO support and
> adding support for CP2102N. Before that commit, the GPIO chip would
> indeed never have been registered in this case.
> 
> The right fix however is to continue to always register the gpiochip 
> but
> to make sure that the number of lines is initialised before doing so.
> This is how we deal with with the other device types and is also how
> CP2105 is handled when both pins of the CP2105 ECI port are muxed for
> LED function.
> 
> I've just posted a fix here:
> 
> 	https://lore.kernel.org/r/20211126094348.31698-1-johan@kernel.org
> 
> Johan

Thanks for the quick solution. That patch seems to be a better fix for 
this bug and I have acknowledged it with a Tested-by.

I do however wonder if it is desirable to register a GPIO controller 
that has no lines. It's not like those lines can become available at any 
later time. The CP2105 is OTP, but also the other CP210x devices need to 
be reprogrammed and reenumerated for those lines to become available 
again. So I would still vote to apply my proposal though not as a bug 
fix.

Thanks again,
Maarten

