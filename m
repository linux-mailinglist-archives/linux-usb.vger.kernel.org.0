Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F85652A561
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 16:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349431AbiEQOx4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 10:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349304AbiEQOxr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 10:53:47 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD4F2C673
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 07:53:38 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id m23so22094872ljc.0
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=98lrMyDx9nA58tX+jL8WsvjaXFJ5bPfTC4nB38BPHxA=;
        b=x9dx0SlO4F+EkMbBg+vshW88M1gEMckHm0L13WDfzZo5c4+BVCTmrbAdnJ98gufYJe
         Qmf4hd07LDsg6x1ZYTY8fQRD+qwnKQqEaqSHOxwf8CwwGwozgEkqQ5wn3k297ne+94Lu
         10/RKKdcjfqL7DzHy/z/Kh5cWmJ1mh2DFzqTnLTS5JSAlOcy6yTHk745eI1I16HuRLPi
         +BPF/07xb2jWxwr35+dsqwKrBN7oLLmgdIR1oo1SaIAIZDK5CTJXESaVi55t+rvO8Woh
         Cyh4OYqy/lTKbOr0y3+SFEmVPs6wxSz+h7W+MS30+uUq3kWSwySQimWQ04pqLHNAe3ij
         HKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=98lrMyDx9nA58tX+jL8WsvjaXFJ5bPfTC4nB38BPHxA=;
        b=PDa9LbEEIAw1FMopZqonhB3ZKDgMEKLQCjln51EXPiFuaC1JPaXCa/rYtJa0+eYfZY
         w+CltklXEYG9qtt7JgSa+p3fIfj/BlDKNGfFB/CVqGYwrOKIHM7zHQiCHcKTco4KZL/N
         msm0vDulbGaMty8gvPHAlhwQimtCMzKm6/ShjyKC0Tt+66K3auVav7fZx6O0ZRyWAVkP
         yIVBARu7SKIBy2JCBOLq1drTm6G89ber0kCHZ5z5jeTYLASbmQoxVV7yd8U1vtk/e9bt
         dt/LAUm2In4IftE8dj80j89+brHZ9aGHejAi4U1hWojtzW45Y/r6275QbvrK9VFfGgUj
         BxZQ==
X-Gm-Message-State: AOAM532nNvjl3JIDOvjeC1Xf6Nr3pF2oBcRckDmiNsnI/aJ9r7VU8K8O
        PBK5CKV4twE6XxaoZfp1G4TQuA==
X-Google-Smtp-Source: ABdhPJyWvHzwFXV4y4dwE1Mg+4vxEcyCuwAK4eajYXdjTegf080biutfjdxui5eX5IbFoPm6jzW9uQ==
X-Received: by 2002:a2e:9d08:0:b0:250:d483:d734 with SMTP id t8-20020a2e9d08000000b00250d483d734mr14679734lji.406.1652799215969;
        Tue, 17 May 2022 07:53:35 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w17-20020ac254b1000000b0047255d210f8sm1611527lfk.39.2022.05.17.07.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 07:53:35 -0700 (PDT)
Message-ID: <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
Date:   Tue, 17 May 2022 16:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
 node
Content-Language: en-US
To:     Neal Liu <neal_liu@aspeedtech.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Felipe Balbi <balbi@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Li Yang <leoyang.li@nxp.com>
Cc:     "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
 <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/05/2022 16:50, Neal Liu wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Tuesday, May 17, 2022 8:00 PM
>> To: Neal Liu <neal_liu@aspeedtech.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>;
>> Andrew Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit
>> Semwal <sumit.semwal@linaro.org>; Christian König
>> <christian.koenig@amd.com>; Geert Uytterhoeven <geert@linux-m68k.org>;
>> Li Yang <leoyang.li@nxp.com>
>> Cc: linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
>> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org
>> Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
>> node
>>
>> On 17/05/2022 10:25, Neal Liu wrote:
>>> Add USB2.0 device controller(udc) node to device tree for AST2600.
>>>
>>> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
>>> ---
>>>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi
>>> b/arch/arm/boot/dts/aspeed-g6.dtsi
>>> index 3d5ce9da42c3..5517313eb2b5 100644
>>> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
>>> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
>>> @@ -298,6 +298,16 @@ vhub: usb-vhub@1e6a0000 {
>>>  			status = "disabled";
>>>  		};
>>>
>>> +		udc: udc@1e6a2000 {
>>
>> The same as DTS in bindings - generic node name, please.
>>
> 
> Is it possible to use "udc: usb-udc@1e6a2000" to distinguish it between "vhub: usb-vhub@1e6a0000"?

Possible yes :), but not recommended and not wanted. Nodes should be
generic and prefixes are added only if there is no unit address. You can
though use some more descriptive label.


Best regards,
Krzysztof
