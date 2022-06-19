Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145FF550A81
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jun 2022 14:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236878AbiFSMFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 08:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237038AbiFSMFg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 08:05:36 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC5D12610
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 05:05:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e2so655221edv.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jakXNefXr+d4XHXk3yMQZ4OQ2nmGeDzmNhlPkvj1/X4=;
        b=D58WLVKUXyi+dx4Z2fQfDcotvsZXCiAWSQWbsXluKMHKlXC6jSVQM+0nw+Sdn9K6XF
         rTjtQGmVXuQyIQHrFGrwUojJHyTCDl5nxMHbA8cGs2aZVFWVFeJnwJXC5Ffr8pbiH+Jr
         JResf2C3FcIn/SNNowXrLlVKeprt7jHqsyiJsOIbawrR7MzGbgFqkCbfrFvdAR57vC6R
         R9rotoR4f0NPXh5/1HZoWVgPYWqB+lin1Nv+sHnQWY6Ex5AibOj2dpTzaepVk2XXAjeX
         R+AAhW+DbWMclZiMvAsPoUNTLW+MFB78voLjhmewSuXZpfdxoiMuMfOhCKmptP35fzqR
         740Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jakXNefXr+d4XHXk3yMQZ4OQ2nmGeDzmNhlPkvj1/X4=;
        b=RRUoWQVJTcPr2U8Yih7lcmcjNabMEasAwyTmO+7A5wHm84ROV5AyPWlhmkvQHGBxlr
         cwb5pW1ta2PT0+7XMMw9vtDFtA/HjHLs+fDjdE+U0ei05kYGZtQ8dwtRYT0mOM8CyDGc
         fYgqnVkmyKRpxITJQPRK964Vkihw5wejC0Qsr7bXKrSVHQpR8wrh7oZ3EOrnD1YQgjZN
         HHFBWmq8cvESA1l8fQ6rBTVaBHGDeb0XgqtPkPnWYVPyuXTQ2TWIpiJykqf+PhaxsxUP
         Zaoh/1ec1urBUubKGRrFEbmhfrQhmqgyxIP/6wO/CZuWi+dTGluxGQSN8BKtPmkr94wM
         709Q==
X-Gm-Message-State: AJIora/tNevl21uo8SF2SYcRF/8QSgy1uNDOPMcCrGqeDuzoRO6vnJoT
        5pjLh4wtqaIRST29vNBt4GdNxw==
X-Google-Smtp-Source: AGRyM1ubMh4MAcbm8HuB4hANaOoImVAB4pUW4EYnaEi/EHV0T9LSSNyaYUlQlOGQLgoD6UW/FDUnnw==
X-Received: by 2002:a05:6402:350e:b0:42f:b2c1:9393 with SMTP id b14-20020a056402350e00b0042fb2c19393mr23592753edd.11.1655640332791;
        Sun, 19 Jun 2022 05:05:32 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o16-20020a50fd90000000b0042617ba63basm7708329edt.68.2022.06.19.05.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 05:05:32 -0700 (PDT)
Message-ID: <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
Date:   Sun, 19 Jun 2022 14:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/06/2022 09:46, Chunfeng Yun wrote:
> On Fri, 2022-06-17 at 18:25 -0700, Krzysztof Kozlowski wrote:
>> On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
>>> The current clock list in the binding doesn't allow for one of the
>>> optional clocks to be missing and a subsequent clock to be present.
>>> An
>>> example where this is an issue is in mt8192.dtsi, which has
>>> "sys_ck",
>>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
>>>
>>> Change the clock list in a way that allows the middle optional
>>> clocks to
>>> be missing, while still guaranteeing a fixed order. The "ref_ck" is
>>> kept
>>> as a const even though it is optional for simplicity, since it is
>>> present in all current dts files.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>
>>>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9
>>> +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
>>> xhci.yaml
>>> index 63cbc2b62d18..99a1b233ec90 100644
>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> @@ -80,8 +80,13 @@ properties:
>>>      items:
>>>        - const: sys_ck  # required, the following ones are optional
>>>        - const: ref_ck
>>> -      - const: mcu_ck
>>> -      - const: dma_ck
>>> +      - enum:
>>> +          - mcu_ck
>>> +          - dma_ck
>>> +          - xhci_ck
>>> +      - enum:
>>> +          - dma_ck
>>> +          - xhci_ck
>>>        - const: xhci_ck
>>
>> You allow now almost any order here, including incorrect like
>> sys,ref,xhci,xhci,xhci.
>>
>> The order of clocks has to be fixed and we cannot allow flexibility.
>> Are
>> you sure that these clocks are actually optional (not wired to the
>> device)?
> In fact, these optional clocks are fixed, due to no gates are provided,
> SW can't control them by CCF;
> In this case, I usually use a fixed clock, or ignore it.

But in some versions these clocks are controllable or not?

Best regards,
Krzysztof
