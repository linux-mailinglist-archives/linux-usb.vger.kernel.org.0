Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C6E1634FE
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 22:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgBRVbI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 16:31:08 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:40481 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRVbH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 16:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TPmsarhSMXCj8/dzvasFTlIDQfD072W6X2xvTvgEZbw=; b=a3IZXPKHmQ8XgvNMghLQCjcNMS
        cnBIQFzY9FK45CyIi3otsUEqT99xV+SHEPdt/Qcvi5F77KjXpp1+Hl+MTUV/SNL64diiyGjTOAiGG
        NcY7ddQ4N8XpXyzRc6B7eQgDtHWCekIk6MlTf77I5hYZZ7Ju6+KpnberyslQLk1Ey3FlDJ/3BYfzQ
        9Gf7rC0CmiET2txHVZ2OD+6tSUF3zlvP+K+meGc6imZQnEDOeVMjQiwCNbl4UxemScIUUHjIZzP6q
        jiyUCTB5tj9PLXJGQVq4HkBYEWVVAp+z4lUR/tmXRu/VJyOtWe9hZSK+R3GavH4NXZHFXU86etkw1
        N2N2tZZA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53174 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1j4ASP-0006RE-7F; Tue, 18 Feb 2020 22:31:05 +0100
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        USB <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <CAHp75Vc6=V=cXM0mmh88V6XLmJT6kFnJCS547vgxX0zBG+cTZQ@mail.gmail.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <cda21859-0bd2-2a7f-c74a-360ef7aabadb@tronnes.org>
Date:   Tue, 18 Feb 2020 22:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc6=V=cXM0mmh88V6XLmJT6kFnJCS547vgxX0zBG+cTZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 18.02.2020 21.57, skrev Andy Shevchenko:
> On Sun, Feb 16, 2020 at 7:30 PM Noralf Trønnes <noralf@tronnes.org> wrote:
>>
>> Hi,
>>
>> A while back I had the idea to turn a Raspberry Pi Zero into a $5
>> USB to HDMI/SDTV/DSI/DPI display adapter.
>>
>> Thinking about how to represent the display to the driver I realised
>> that hardware use registers as API. And Linux does have a generic
>> register abstraction: regmap. Furthermore this means that if I can do a
>> regmap over USB implementation, it will be easy to do other functions
>> like gpio, adc and others. After a few iterations trying to understand
>> the USB subsystem and satisfying driver requirements, I now have
>> something that looks promising.
>>
>> I'm sending out an early version hoping to get feedback especially on
>> the core parts that handles regmap and interrupts.
>>
>> Overview:
>>
>>           USB Host          :         USB Device
>>                             :
>>             --------------  :  ------------------
>> ----------  | mfd: mud   |  :  | f_mud          |  ----------
>> | Driver |  --------------  :  |                |  | Driver |
>> ----------  | regmap-usb |  :  | (mud_regmap)   |  ----------
>>             --------------  :  ------------------
>>
>>
>> I've attached 2 drivers:
>> - gpio/pinctrl: is more or less finished
>> - display: needs a lot more work
> 
> Can regmap-usb be used for drivers/mfd/dln2.c for example?
> 

No, apparently dln-2 uses custom protocol structs for each function with
a common header. regmap-usb is a register abstraction with the ability
to bulk read/write multiple registers in one transfer.

I see that dln-2 does a lot of what I'm aiming for except that it
doesn't have the display part.

Noralf.
