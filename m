Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59AC6317DF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 01:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiKUAqy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 19:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiKUAqu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 19:46:50 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86971115B
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 16:46:48 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 89F8485268;
        Mon, 21 Nov 2022 01:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668991606;
        bh=0AHRRsaeoRVjrnLJswts459qEHgfQ4hkv5xGqAqhEig=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ruXRvErMyMgaoX5ONqYYJJV8+3BAhv5vqpQRmIcJKMf9M9OLv1vkSp6sTl79Memus
         LUuOYnHbwzdwlxyKZJgI/m+4zPZT1E1ydc2DoS3kUp1DdLQLluYyPwZfibRjl6WIeB
         pEQb8ZwdDx7el/mOMYWur7IXZ6fz3/Z5msCTTArx3f6g7bvQfzRsOxU3pEPdAluTeh
         c6eQfHvTXWlcC3SS8QNejXDvWCli0o40qQLe+b7QcRuypBWRYib2i7oN/xn4Fd8zay
         y7SSd5/lYRueTZJDvMKSVKoK3/j3gJbUSa3onceHUq8FAabOtTHmVDzdyANY81PHBY
         HzM2OfAGTfbxg==
Message-ID: <f00d162e-f64a-194c-6098-bc3faef6d002@denx.de>
Date:   Mon, 21 Nov 2022 01:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] extcon: usbc-tusb320: Update state on probe even if no
 IRQ pending
To:     =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20221120141509.81012-1-marex@denx.de>
 <20221120235218.zrpbdxldzexzudks@bang-olufsen.dk>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221120235218.zrpbdxldzexzudks@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/21/22 00:52, Alvin Šipraga wrote:
> Hi Marek,

Hi,

> On Sun, Nov 20, 2022 at 03:15:09PM +0100, Marek Vasut wrote:
>> Currently this driver triggers extcon and typec state update in its
>> probe function, to read out current state reported by the chip and
>> report the correct state to upper layers. This synchronization is
>> performed correctly, but only in case the chip indicates a pending
>> interrupt in reg09 register.
>>
>> This fails to cover the situation where all interrupts reported by
>> the chip were already handled by Linux before reboot, then the system
>> rebooted, and then Linux starts again. In this case, the TUSB320 no
>> longer reports any interrupts in reg09, and the state update does not
>> perform any update as it depends on that interrupt indication.
>>
>> Fix this by turning tusb320_irq_handler() into a thin wrapper around
>> tusb320_state_update_handler(), where the later now contains the bulk
>> of the code of tusb320_irq_handler(), but adds new function parameter
>> "force_update". The "force_update" parameter can be used by the probe
>> function to assure that the state synchronization is always performed,
>> independent of the interrupt indicated in reg09. The interrupt handler
>> tusb320_irq_handler() callback uses force_update=false to avoid state
>> updates on potential spurious interrupts and retain current behavior.
>>
>> Fixes: 06bc4ca115cdd ("extcon: Add driver for TI TUSB320")
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Alvin Šipraga <alsi@bang-olufsen.dk>
> 
> snip
> 
>> @@ -466,7 +473,7 @@ static int tusb320_probe(struct i2c_client *client,
>>   		return ret;
>>   
>>   	/* update initial state */
>> -	tusb320_irq_handler(client->irq, priv);
>> +	tusb320_state_update_handler(priv, true);
> 
> I wonder, is this function call even necessary?

Yes, it is, even though this is not immediately obvious why.

The tusb320_reset() rcalled right after the aforementioned call triggers 
priv->ops->set_mode(), which is implemented e.g. by tusb320_set_mode(), 
which contains this conditional:
if (priv->state != TUSB320_ATTACHED_STATE_NONE)
and the priv->state is assigned in tusb320_state_update_handler(), or 
rather in function it calls, the tusb320_extcon_irq_handler().
