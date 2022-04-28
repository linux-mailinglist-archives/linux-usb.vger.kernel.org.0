Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F86512CEF
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 09:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245387AbiD1Hgi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Apr 2022 03:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245375AbiD1Hgh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Apr 2022 03:36:37 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70169BAD0
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 00:33:21 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so4488379ede.8
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 00:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6RK5ggN9NLoYI2/Ikeo1LCTW9c8MuLSBt5JODTGgLtM=;
        b=MLI4eHa46946Z+UMP59E0/y1Wp9KUFuuNkamqzkL1+GqAcKN/QDOF/7DkO1z7hWWv+
         lchOvWLdU5Y4tdD/wKTrrAyLTAITwTnzUzrP1BH9f1mQdHrf0Nc9hvkdEhcnfIWZkHUO
         G1b3IMjUj5dqGajYNjuxKY7DRi8K/j2/VzhwyO7N1MSzJ5tfyJb4q4nVhlBBMRYIIEnb
         19C6FJ8OrvbomikttW78+ID6ABexHCFZxBOeFr+ZBpJ8qDevJtAj5QkDMtdlmSx3N7O9
         f5yZNQJ6og+MdDGtY3AM+YC+wqre432y3BabuArejcsNA0YjnivuSRRFGKdvqsFs5Ddi
         vshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6RK5ggN9NLoYI2/Ikeo1LCTW9c8MuLSBt5JODTGgLtM=;
        b=ONoZv3dxDbdho5D5Nnq7AITERq5HdmHhF1cjH5lP+v1WNNrnmhsvSXoLdKIvmIz+3n
         ppKGoYZPQF2UMY44fmIgYzfg1KAQoph7HLx7SlVzwYKZ1dLpu2ErCttRTMmHKPvBDN+1
         IGUK0KZvmlXIDXNal8BR2FICySaIzOnoYXQrvV3WzgICpBnkNUJ/GFtKhITpoEM3kU1z
         R2LQbrksGKLkoJQX5TvDousk5pMn7E5h+ir7Yp1idRT8G2G8RRyt1me4XGunWFi5dOds
         xnE5a4/Z+md7NmSICB+rBpNYhXkNKZr92fw+Llg/aRxAWsKE5Jre8i4DA8RgPJr3w+hw
         2oLw==
X-Gm-Message-State: AOAM531KqvUs+JE46EjRySomEBt+Ue5X0vMMtu32vBV6+H7K++Pcytqk
        Ew62dfX18zdYrT+Lw34zax/NFQ==
X-Google-Smtp-Source: ABdhPJzVAsgSEpouVt0LEy5BF654Lc3QgAnqUd+Fg1b4wSHNldvD57kdc4CqfPEyNbHkN6xxwptdHA==
X-Received: by 2002:a05:6402:424b:b0:426:1fdc:851c with SMTP id g11-20020a056402424b00b004261fdc851cmr3971433edb.374.1651131200481;
        Thu, 28 Apr 2022 00:33:20 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709066d8700b006d4b4d137fbsm7961004ejt.50.2022.04.28.00.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 00:33:19 -0700 (PDT)
Message-ID: <8a4dfbe6-e1d6-edc3-fe08-f99b76020b4c@linaro.org>
Date:   Thu, 28 Apr 2022 09:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/6] ARM: dts: am33xx: use new 'dma-channels/requests'
 properties
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org
References: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
 <20220427161126.647073-5-krzysztof.kozlowski@linaro.org>
 <YmmJfInA0hNQOhDN@robh.at.kernel.org>
 <CAGE=qrp1GAVxDF4b1iBigdvbONwsF0jhfcLG-Xt3pjm8VAEdiQ@mail.gmail.com>
 <YmpCn+g7oN+1HWSY@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmpCn+g7oN+1HWSY@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/04/2022 09:30, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220427 19:23]:
>> On Wed, 27 Apr 2022 at 20:20, Rob Herring <robh@kernel.org> wrote:
>>>> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
>>>> index f6ec85d58dd1..55ffb0813ded 100644
>>>> --- a/arch/arm/boot/dts/am33xx.dtsi
>>>> +++ b/arch/arm/boot/dts/am33xx.dtsi
>>>> @@ -461,8 +461,8 @@ cppi41dma: dma-controller@2000 {
>>>>                               interrupts = <17>;
>>>>                               interrupt-names = "glue";
>>>>                               #dma-cells = <2>;
>>>> -                             #dma-channels = <30>;
>>>> -                             #dma-requests = <256>;
>>>> +                             dma-channels = <30>;
>>>> +                             dma-requests = <256>;
>>>
>>> You could keep the old properties for compatibility and to apply
>>> immediately.
>>
>> Indeed, that's a nice solution. Any preference from TI SoC maintainers?
> 
> Makes sense to me to avoid dependencies.

Thanks. I will send a v3 today with such change.


Best regards,
Krzysztof
