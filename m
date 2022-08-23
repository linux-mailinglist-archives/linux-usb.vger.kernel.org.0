Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D149559E5DC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 17:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242933AbiHWPSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 11:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242926AbiHWPRy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 11:17:54 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B74DF4F
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 03:41:09 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 982E08406A;
        Tue, 23 Aug 2022 12:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1661251172;
        bh=T3Cr3PETfOqn12KLgi3sTOWLBpqG0hJx0Ol74RdsoVo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=S1wtlzPkmVbAkvUGXPB+pG/2ickNsy3DDEdxHASEjW9P5xn5YGne76veZdp+SApMH
         Oi5bb9mdET8RPOrrthPRIyE9K6hrjBiqIvNdEZIcuqoKuUXCfAzb4C+81b0h3xJqhK
         wZmKajlXrb8bhkr1ryTHBwnNJj/UduklFp9X7dOA2MhmOGyhaU57mpOeciTyLb2wpC
         Qj4+/pACGrR7pEuNZfnnwl3Qu5YH+XSqXM1A/PuZoMtjK3X9T/Wdhbuxt1qszuf6hh
         6KDV9hFbmGXUaX5jA3To2RItE2ho2tUUWexk8RtvTQSAWLAGO7CVTBCOgaGh3GI1PW
         xgWwcsbg0FNcg==
Message-ID: <d1df55df-3baf-4200-cee5-7dbc3311a4de@denx.de>
Date:   Tue, 23 Aug 2022 12:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Content-Language: en-US
To:     =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220730180500.152004-1-marex@denx.de>
 <20220730180500.152004-2-marex@denx.de>
 <20220823094934.so377vfpe4vipxuw@bang-olufsen.dk>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220823094934.so377vfpe4vipxuw@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/23/22 11:49, Alvin Šipraga wrote:
> Hi Marek,

Hi,

> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>> which can expose details collected by the TUSB320 in a far more
>> precise way than extcon. Since there are existing users in the
>> kernel and in DT which depend on the extcon interface, keep it
>> for now.
>>
>> Add TYPE-C interface and expose the supported supply current,
>> direction and connector polarity via the TYPE-C interface.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Chanwoo Choi <cw00.choi@samsung.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Yassine Oudjana <y.oudjana@protonmail.com>
>> To: linux-usb@vger.kernel.org
>> ---
>>   drivers/extcon/Kconfig               |   2 +-
>>   drivers/extcon/extcon-usbc-tusb320.c | 159 +++++++++++++++++++++++++++
>>   2 files changed, 160 insertions(+), 1 deletion(-)
> 
> Happy to see I'm not the only one that observed this. I wonder if you
> saw also my previous stab at this:
> 
> https://lore.kernel.org/linux-usb/20220301132010.115258-1-alvin@pqrs.dk/

I have not.

> I had some issues with the dt-bindings which I could not reconcile, but
> the basic problem was how to describe a typec accessory mode mux
> connected to the TUSB320. Perhaps you have a better intuition for how
> this should look?
> 
> One thing that is missing from your implementation that we are using on
> our end is the USB role switch. I set this from the typec driver via
> usb_role_switch_set_role().

I only use this chip to detect charger type (and cable polarity), the 
device where this is integrated is always peripheral and cannot charge 
other devices or become host.

But I think those aforementioned requirements could be extended on top 
of this patch, can they not ? I recall I looked at least at the 
direction detection and that could be added easily. I have no way of 
testing any of that functionality, so I didn't add them as part of the 
patch.
