Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066BA59E843
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 19:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343787AbiHWREe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 13:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343879AbiHWRDk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 13:03:40 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9919B4B5
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 07:07:57 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6EDD183010;
        Tue, 23 Aug 2022 16:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1661263674;
        bh=83qdoxjskF6G6BfAM0qAcnGp3aH0Uow3QytggceuTbM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=F1HyMgEBc5UxOMBrLFoXafjXf1/O8IFDoMlqp7rlGBwU3RtgAUgrQr4dEksNCMJBK
         vG6jCfJj+4+y2Ry/xizUDzDHnYwWbYJi2wVg8qQ1W41ggJvVFlkSmauEbceD0rhFV3
         MEwPn5t2tdd0CN8WaGAAe0KGZDkMNxVe/13wjx2fcYuS0QFxhBFACp6m2v/kBWNPXJ
         0KAOLNDDT/22uZGiTzVQItX5rvJCYsixmY01rgDQXltzf5IjhnmuxVKx0ooQEwGxMR
         zkNHB3sX+ELMwmi5CHN/rIW0u1NgP6ydNk1m4e1CgKclxKhPihz1PCp0z19CIw3BqK
         uW90oINhckOvg==
Message-ID: <4e64477f-8479-d67d-522e-285a829323a1@denx.de>
Date:   Tue, 23 Aug 2022 16:07:53 +0200
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
 <d1df55df-3baf-4200-cee5-7dbc3311a4de@denx.de>
 <20220823125719.bafu6k72jf5u7z7z@bang-olufsen.dk>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220823125719.bafu6k72jf5u7z7z@bang-olufsen.dk>
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

On 8/23/22 14:57, Alvin Šipraga wrote:
> On Tue, Aug 23, 2022 at 12:39:28PM +0200, Marek Vasut wrote:
>> On 8/23/22 11:49, Alvin Šipraga wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>>>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>>>> which can expose details collected by the TUSB320 in a far more
>>>> precise way than extcon. Since there are existing users in the
>>>> kernel and in DT which depend on the extcon interface, keep it
>>>> for now.
>>>>
>>>> Add TYPE-C interface and expose the supported supply current,
>>>> direction and connector polarity via the TYPE-C interface.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Chanwoo Choi <cw00.choi@samsung.com>
>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>> Cc: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> To: linux-usb@vger.kernel.org
>>>> ---
>>>>    drivers/extcon/Kconfig               |   2 +-
>>>>    drivers/extcon/extcon-usbc-tusb320.c | 159 +++++++++++++++++++++++++++
>>>>    2 files changed, 160 insertions(+), 1 deletion(-)
>>>
>>> Happy to see I'm not the only one that observed this. I wonder if you
>>> saw also my previous stab at this:
>>>
>>> https://lore.kernel.org/linux-usb/20220301132010.115258-1-alvin@pqrs.dk/
>>
>> I have not.
>>
>>> I had some issues with the dt-bindings which I could not reconcile, but
>>> the basic problem was how to describe a typec accessory mode mux
>>> connected to the TUSB320. Perhaps you have a better intuition for how
>>> this should look?
>>>
>>> One thing that is missing from your implementation that we are using on
>>> our end is the USB role switch. I set this from the typec driver via
>>> usb_role_switch_set_role().
>>
>> I only use this chip to detect charger type (and cable polarity), the device
>> where this is integrated is always peripheral and cannot charge other
>> devices or become host.
>>
>> But I think those aforementioned requirements could be extended on top of
>> this patch, can they not ? I recall I looked at least at the direction
>> detection and that could be added easily. I have no way of testing any of
>> that functionality, so I didn't add them as part of the patch.
> 
> Sure - if your patch gets merged then I'll just extend it. Fair enough
> that you cannot test on your board.
> 
> To that end, you can add:
> 
> Reviewed-by: Alvin Šipraga <alsi@bang-olufsen.dk>

Thanks.

If you plan to submit anything on top, I might be able to test at least 
the charger detect and plug orientation still works ... but that's 
probably something you can also test on your own, that's the easy part 
of the USB-C.
