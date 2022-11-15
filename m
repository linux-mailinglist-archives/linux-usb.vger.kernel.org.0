Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C7E629F0D
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 17:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238665AbiKOQ3R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 11:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbiKOQ3O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 11:29:14 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F2AFC3
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:29:13 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b9so18235326ljr.5
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSUOaIRRIaxCLKOVLUG5d+WOgQHkBDA9Bz3omdshBMY=;
        b=dTUbslcQxIsZytfrJ6/WgQJkXDPlTWI1saLhS8IYtQYvVFNXLXSgiX5+p6JL4NO2lC
         mtoZSjHkBoIcTc5YskvjicGU1Ms8VUfBv6wcmDDOM4XCz7Of0VbHvAA/lOPHDQbY+OJF
         NPpm4p6oR1VEvuEpbgcjnqI83AuDNxLyKcY1KY8TmiDv+rbbQY89eMFUrAxpTqWd8Qi/
         PfRllCRd+nAgmuxQ8WipXpHb/G89hE5+YgFMrGNM+KyV1/CoAk4YO/xQFDl1av4V20Ik
         Bpb7P8cR1o7oba4nk4DpAl8Z9ZsTibMb6sjQLMPykA2xSq4g3ASV/6VXWqnHUtA12X4V
         8pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSUOaIRRIaxCLKOVLUG5d+WOgQHkBDA9Bz3omdshBMY=;
        b=P6GcgEbsNsfYP1xfW8qvGi5142bUnoW6YXDVSGOlQFGv5BiYSrgOMZpcws3LoA5wnn
         bJahVK3hJDHsFYjVPU2EBELLFR8kHpJ/EDR2CkzI6eSyrueO33kpOseVRwJ6lP0LeOJ8
         IHxlQAjFg9HC6TW8rzIx9jlOlp1tOj0Hk0n8CpRxQJn9WFAtjHlJNyRGpZLbKQb8NI9z
         ufzzGipyLPV91ecDhi0S70VEYsU94UqezhdV2TJeHgxef4BGBAznAvplf4YrZ0L3n7dY
         FzO3eNrAz1P1/w6EpSz0auc93pqFAWYFjeUxTOD6mkNS6US5KsRVxLLkaupU4u1axq5n
         sSZQ==
X-Gm-Message-State: ANoB5pkX6dCc7FlstQUuYJ8iDvnhnVT9mWF1Eoglw1WGhrtS5huPWhdW
        TR3EUfSF2ZZl4iYsM+bLogGLpg==
X-Google-Smtp-Source: AA0mqf6D8YP9WiiKhNlDLQWxOuvAdoFVC4qTb68DacS4/NhKXtdcQN2FDpXCsDm2xYVspqHfO13eSw==
X-Received: by 2002:a2e:b0ca:0:b0:277:7793:fcd2 with SMTP id g10-20020a2eb0ca000000b002777793fcd2mr6697368ljl.364.1668529751652;
        Tue, 15 Nov 2022 08:29:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e21-20020a196915000000b004b3db0a3d9csm2263721lfc.117.2022.11.15.08.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 08:29:11 -0800 (PST)
Message-ID: <e861e62f-4148-b867-0155-e71b1cee0b81@linaro.org>
Date:   Tue, 15 Nov 2022 17:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-4-andre.przywara@arm.com> <Y2ypy0CM8rJGu2g4@matsya>
 <4438485.LvFx2qVVIh@jernej-laptop>
 <52920a00-8e29-f7f4-0cbd-ceb638ded970@linaro.org>
 <20221115104426.20728ba5@donnerap.cambridge.arm.com>
 <4516dcfb-b928-d454-18a6-bd725f39cc24@linaro.org>
 <20221115161917.328ec91a@donnerap.cambridge.arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115161917.328ec91a@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/11/2022 17:19, Andre Przywara wrote:
> On Tue, 15 Nov 2022 16:00:54 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi,
> 
>> On 15/11/2022 11:44, Andre Przywara wrote:
>>> On Tue, 15 Nov 2022 11:03:24 +0100
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> Hi,
>>>   
>>>> On 15/11/2022 07:01, Jernej Škrabec wrote:  
>>>>> Dne četrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul napisal(a):    
>>>>>> On 06-11-22, 15:48, Andre Przywara wrote:    
>>>>>>> From: Icenowy Zheng <uwu@icenowy.me>
>>>>>>>
>>>>>>> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
>>>>>>>
>>>>>>> Add support for its USB PHY.    
>>>>>>
>>>>>> This does not apply for me, please rebase and resend
>>>>>>
>>>>>> Also, consider splitting phy patches from this. I dont think there is
>>>>>> any dependency    
>>>>>
>>>>> DT patches in this series depend on functionality added here.
>>>>>     
>>>>
>>>> DTS always goes separately from driver changes because it is a hardware
>>>> description. Depending on driver means you have potential ABI break, so
>>>> it is already a warning sign.  
>>>
>>> We understand that ;-)
>>> What Jernej meant was that the DTS patches at the end depend on patch
>>> 01/10, which adds to the PHY binding doc. I am not sure if Vinod's
>>> suggestion was about splitting off 01/10, 03/10, and 10/10, or just the
>>> two latter which touch the driver.
>>>
>>> I can split off 03/10 and 10/10, rebased on top of linux-phy.git/next, and
>>> send that to Vinod.
>>> Then I would keep 01/10 in a respin of this series here, to satisfy the
>>> dependency of the later DTS patches, and Vinod can pick that one patch from
>>> there?  
>>
>> There is no hard dependency of DTS on bindings. You can split these (and
>> some maintainers prefer that way) and in DTS patches just provide the
>> link to the bindings, saying it is in progress.
> 
> But that breaks "make dtbs_check", doesn't it?

The check will be broken anyway because binding goes via driver
subsystem and DTS goes via arm-soc.

If both make to the linux-next and next release, then it's not a problem.

> 
> I would think that the DT bits - bindings first, then DTS files using it -
> should be bundled. This is how I imagine the future(TM), where DTs and
> bindings live outside the kernel repo.

Yes, that's preferred. Therefore in DTS patch you say the binding is not
merged and it is here - lore link.

> 
>> The bindings should be however kept with driver changes as it goes the
>> same way.
> 
> I understand that the bindings describe the contract the driver acts on,
> but going forward I think driver changes would need to come later, then
> (since they will live in a separate repo at some day)?
> Maybe pointing to the binding changes in progress?

Later as one commit later - yes. Later as other option - not really, why?

> So with a separate repo we would actually need to upstream just the
> bindings first, then could push driver changes and .dts files
> independently?

There is no separate repo, so we talk about Linux case now.

> And for now it looks like we are stuck with putting everything in one
> series, to make both checkpatch and dtbs_check happy.

You should rather make maintainers happy :) and here one asked to split.

Best regards,
Krzysztof

