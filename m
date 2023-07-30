Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3E9768478
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jul 2023 10:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjG3I3m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jul 2023 04:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjG3I3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jul 2023 04:29:41 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6EF134
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 01:29:40 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c0290f0a8so116549866b.1
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690705779; x=1691310579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZT5FR2WHFsC8qN7AFeuHchBvtaiMEqOyeSAp+D0JUY=;
        b=u4eiVJaOBDVlu0T/dpvwmJ86X3MdU1JS4kkk9vWiHdT6VyJcTgd7ieVRE9SVwvvFdT
         DJW7GpJkQb0CNziEsQzXqc5/jx2NY18eNM4kB+CVXwdPu5n/fCbR3StWbFbCmqVZoC2I
         5H53uHhhu+by2G7U+ZLTzhBt4ZRmLJSF2xdbm9tfi1wL3ipRGAVjJvg9bc9t5WvkMYiF
         M8LbAxPv2dJfXx19IyruYS7B2+8fULHJuRVXW/Xs6VEoZFR2rcqOrStH/l9pnQAOBPj0
         gGibhM5DHzFCJvHLmOc4Y/0UOssI+ELxzPTdZpGALOxKq8GfVd53Y0A6O77i5V1TeFzq
         Gp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705779; x=1691310579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZT5FR2WHFsC8qN7AFeuHchBvtaiMEqOyeSAp+D0JUY=;
        b=W5KGEBGpVjP4CpN9UJwVMs5his3h0+qw+PwVjhtpQm19QOISQJFkXPcdkit0QhwLov
         W4mM5CPGpnfWljypYuAZYCKVtUvYxdxziGyriiiS4TwBy6rcHoIjLAxe8ELvvFuPcSpm
         1jixDmsm7sGtUyk8j7cLGF4zC/eN68Ev6J7yUycV99avG3JZhPIc4EakrgX3Mkp+JOWY
         XetrHo6bcCj2Dt+uI2ffMwFR8w+vRx52F+JP3g3licQq3amA5OZKbVdEAQ0Kp5tuL3Bk
         zsBZzR0/Om/GI7zDwOaVW8xWzJbHpFb0qrlmBwzgpvwoo+h26UshQRAGeN2tQYsYFPpV
         VKJQ==
X-Gm-Message-State: ABy/qLaHa3dpXtBKw9eSgOXDYm9NY+k1YONqiVPalydsRhjpXa5DudMA
        FCejdbjPyA+3beN1jv+MKHAhNg==
X-Google-Smtp-Source: APBJJlEByirSEkyXQuQYnVYHqc0mvB5lM+7xmc5u4j5BAWwViqqECsFBGPPO5eTIxclKORUGxaQvqA==
X-Received: by 2002:a17:907:270d:b0:98e:26ae:9b07 with SMTP id w13-20020a170907270d00b0098e26ae9b07mr3750083ejk.35.1690705778649;
        Sun, 30 Jul 2023 01:29:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id s13-20020a1709060c0d00b009928b4e3b9fsm4348634ejf.114.2023.07.30.01.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 01:29:38 -0700 (PDT)
Message-ID: <08388eec-bfe8-c4c4-06b7-8450bc34182e@linaro.org>
Date:   Sun, 30 Jul 2023 10:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 2/2] doc: dt: bindings: usb: realtek,dwc3: Add Realtek
 DHC RTD SoC DWC3 USB
Content-Language: en-US
To:     =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230728035318.18741-1-stanley_chang@realtek.com>
 <20230728035318.18741-2-stanley_chang@realtek.com>
 <4bbdd646-ad16-1a7d-a727-878c6cf92410@linaro.org>
 <740d0d33a9064c2bb2696ef762294b0c@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <740d0d33a9064c2bb2696ef762294b0c@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/07/2023 19:37, Stanley Chang[昌育德] wrote:
>>> +
>>> +  realtek,disable-usb3-phy:
>>> +    description: Close USB 3.0 PHY if the board design not support USB 3.0.
>>> +    type: boolean
>>> +
>>> +  realtek,enable-l4icg:
>>> +    description: Enable the power saving feature l4icg by hardware clock.
>>> +      gating.
>>
>> You described the desired Linux feature or behavior, not the actual hardware.
>> The bindings are about the latter, so instead you need to rephrase the property
>> and its description to match actual hardware
>> capabilities/features/configuration etc.
> 
> The l4icg entry is a hardware feature for power saving. 
> The term may not clearly convey the function.
> So instead of the term "l4icg" I use "hw clock gating".
> 
>   realtek,enable-hw-clock-gating:
>     description: Enable the clock gated function which will gating sram
>       clock when dbus idle.

And why this should be configurable per board? It looks you like to put
OS policy into DT, so no.


Best regards,
Krzysztof

