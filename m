Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E4B647EEC
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 09:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiLIIHC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Dec 2022 03:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiLIIHA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Dec 2022 03:07:00 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F6A5B87C
        for <linux-usb@vger.kernel.org>; Fri,  9 Dec 2022 00:06:59 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id cf42so5874270lfb.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Dec 2022 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Vs+1WI1y3virfX5xKwzsGtAygi7nWt3LxEdPgxueY=;
        b=DM5mZnd9ChTGZazpZvbX3e2l/bSIy8PL3KnAU66pl2Mfhb5SEXRPyiA10Yy551uzlb
         EOeuefI7JelhJ8rQiCN7k4Tfit64IT+e0l4Ogz/6o7AAabwZYURpj47g+c9gnYl9I0Oe
         vCN3ibG7BdaKeZjiaKw+H84K2YdS89F7JvDj8G0VUJCVusbvlGQ2lMYtOPjvoZIRlHcd
         ZJc7GUf76vBS+oqzcwb9tLbcQvI+Y8b+5blVdAmO9hx1Hls4iAebc6zDqlKPIAf66rIT
         afLcrMgZ9/SYJYQJmOV18QjU7k700yKlWfMuK9TPM/ZmtJWyoY9TbOUb+/LEVRpPifyS
         8v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Vs+1WI1y3virfX5xKwzsGtAygi7nWt3LxEdPgxueY=;
        b=aubRMiTiaRHXLbQP2xNn/FeyrirQZAp0pNrvXtHeQOJcznMzJE3GeVzPbxzO8MS5/h
         m1nap5V3WiiHv0CaboAUKrYr7XlCvdu+8fSkK3k2lOfJpmR3Mnq5NEB0FOkzEBYRd/cu
         KVHiKZPOOprpBjcg8KSTQheMSebdPsxmrNEIwoDUNKSEH7wS1gvZqw6lKb13DG6Abka+
         TiSAKi7KZz+M+obTp9OZpC/g4c6sxTSBCPdmm2QDpWNOvQvKlC0fL2uJ10eOvlMyjkXL
         YX2VoVHVZKHYCcKANjSxBGf1pzGl2Y1teXZCB+v30EZ2UAcYFIz2XQJuAcrFpfTrz3Yn
         tAhQ==
X-Gm-Message-State: ANoB5pn/9vu9LyHEjoPUwAlg9np25J1zcRK2gn829seEpDh2HpZ5ozi5
        4yw0BEuV2z5c7aCbuzcl1/720A==
X-Google-Smtp-Source: AA0mqf6UBTJgYTJ9mm2nM5Oa6/8gKG5B2r0fumHwhHHSaESXxoQhfvm9fGBSLzqAfFkdEtVurXaPzA==
X-Received: by 2002:a05:6512:1508:b0:4a4:68b9:6094 with SMTP id bq8-20020a056512150800b004a468b96094mr1979487lfb.31.1670573217565;
        Fri, 09 Dec 2022 00:06:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q25-20020ac25a19000000b00494978b0caesm152032lfn.276.2022.12.09.00.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:06:57 -0800 (PST)
Message-ID: <15cb7a77-4308-15f0-4669-7a2673b4abcb@linaro.org>
Date:   Fri, 9 Dec 2022 09:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/9] dt-bindings: PCI: renesas,pci-rcar-gen2:
 'depends-on' is no more optional
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
 <20221207162435.1001782-4-herve.codina@bootlin.com>
 <36895e49-aea5-3676-e7df-78b30277e6a0@linaro.org>
 <20221208100530.137fa8b7@bootlin.com>
 <8dfb5b8a-766a-14ec-16d4-74fdd9f7d622@linaro.org>
 <20221208165101.584e4b92@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208165101.584e4b92@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/12/2022 16:51, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Thu, 8 Dec 2022 10:46:32 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 08/12/2022 10:05, Herve Codina wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, 8 Dec 2022 09:26:41 +0100
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>   
>>>> On 07/12/2022 17:24, Herve Codina wrote:  
>>>>> The 'depends-on' property is set in involved DTS.
>>>>>
>>>>> Move it to a required property.
>>>>>
>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml | 1 +    
>>>>
>>>> This should be squashed with previous patch. There is no point to add
>>>> property and immediately in the next patch make it required. Remember
>>>> that bindings are separate from DTS.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>  
>>>
>>> I though about make dtbs_check in case of git bisect.  
>>
>> And what would this commit change? In Git you will have
>> 1. dt-bindings: PCI: renesas,pci-rcar-gen2: Add depends-on for RZ/N1 SoC
>> family
>> 2. dt-bindings: PCI: renesas,pci-rcar-gen2: 'depends-on' is no more optional
>>
>> so what is the difference for git bisect?
> 
> Well, today, I have:
> 1. dt-bindings: Add depends-on
> 2. dts: Add depends-on
> 3. dt-bindings: Move depends-on to mandatory

What does it mean "I have"? Patches on mailing list? But we talk about
Git and I wrote you bindings are DTS are not going the same tree.

> 
> If I squash dt-bindings commits, I am going to have:
>   1. dt-bindings: Add mandatory depends-on
>   2. dts: Add depends-on
> or
>   1. dts: Add depends-on
>   2. dt-bindings: Add mandatory depends-on

And how does it matter? Anyway it goes separate trees.

> 
> I have not tested but if I used only the first commit in each
> case (git bisect):

It's not bisectable anyway, you cannot make it bisectable within one
release.

> In the first case, dtbs_check is probably going to signal the
> missing 'depends-on' property on dts.
> In the second case, dtbs_check is probably going to signal the
> not described 'depends-on' property present in dts.

And why is that even a problem?

Best regards,
Krzysztof

