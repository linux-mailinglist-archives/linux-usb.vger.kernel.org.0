Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B654760CB6B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 14:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJYMAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 08:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiJYMAF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 08:00:05 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2561F37192
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 05:00:04 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id cr19so7339734qtb.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JwEc4h/bCs2CEYw2C6MQJBjMDKFiMJzjPC/Rh3ZHAdE=;
        b=Sj9up0siyu8z1FRhi4Z+IA+snnh9oUW5vXIzE50MdKF8oIKjI+NJtU6cY4o9YD/jlg
         cI/tfUdFXtAnbI5VMitYSpI3aXa0GisbtAsDSDLiJNUd6U8QYxQx8upH7LqbD4RWyfLe
         TX9KA1g5mg2LM5gYV89834qAx1cqcqxzADqRgzohNzD5bjhV4EThcpxkVvy5HP83aRfi
         LtHHalMqmh+b0PR9cAPE/UDppEgL4r2biv7QZTG6vlhP4swxMIJswnj34buW3eXITYf7
         /2U8zi20QXudbxTs2bfB2rB9ltt2mUlDg+Q9eP04ErWlscsHo9azWFPWMZq6Zi5n221l
         v6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwEc4h/bCs2CEYw2C6MQJBjMDKFiMJzjPC/Rh3ZHAdE=;
        b=VxYllhJApw8qG5Pi9K4FIcrllf3tEgd4HwEJuxyufIuOHmyA0P5HDKm0wdrBuMf3eH
         iUOLXVV/7QZGCy78TJjWIoiAXxSkajMPpHfoV6CMpmw/S5LA7D/3Q8M5ff/8Z3w43BjT
         ulLTdRi2/8AdElPWZFPCV2NHBqPqZuDqtNlfmrmEKnKkfepX+Z+RjwZ0LFLGu4+NwRy4
         fW1e1FnieIExSbhN/sTKi0aDoYR1PlwkuBJB/yBlndU9Mr03ks8kvgiMouL/zWCVeNhv
         oV6KOLfNuIHT4Si+hxv/mG0am6S2yulYkMPiMU39p9GdKOC+/PWiGkp/BaIkaebDkz6J
         Ch9w==
X-Gm-Message-State: ACrzQf3Yk1Aj3ZKwPs2DCLHJopSL46YV6HCkm6GjPRhEWYfgGB8YYfR3
        dFcvMqNwhoNCjaJO6Ifb2Bra2i5Djs/hGA==
X-Google-Smtp-Source: AMsMyM42+bKoDXAM8cX2MRCXDU/JxPVuBjeeRuU9NPVKhHTKaeowMoViaT290esxBoC+19wKg6faSQ==
X-Received: by 2002:a05:622a:146:b0:39d:784:387f with SMTP id v6-20020a05622a014600b0039d0784387fmr24788872qtw.137.1666699202990;
        Tue, 25 Oct 2022 05:00:02 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bq44-20020a05620a46ac00b006ee77f1ecc3sm1941077qkb.31.2022.10.25.05.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:00:02 -0700 (PDT)
Message-ID: <dda052c0-7ef1-1ab1-45cc-d5796f388af8@linaro.org>
Date:   Tue, 25 Oct 2022 08:00:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source
 property
To:     Jun Li <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>
References: <1666588648-1047-1-git-send-email-jun.li@nxp.com>
 <1995a21d-1458-8c80-4a24-641f4b5dcf81@linaro.org>
 <PA4PR04MB96406F52F9DE40F363B9E39B89319@PA4PR04MB9640.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PA4PR04MB96406F52F9DE40F363B9E39B89319@PA4PR04MB9640.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/10/2022 06:43, Jun Li wrote:
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Tuesday, October 25, 2022 8:23 AM
>> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org
>> Cc: balbi@kernel.org; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; Xu Yang <xu.yang_2@nxp.com>
>> Subject: Re: [PATCH 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source
>> property
>>
>> On 24/10/2022 01:17, Li Jun wrote:
>>> usb phy may be part of wakeup source, so add wakeup source property
>>
>> s/usb/USB/
>>
>> "part of wakeup source" is actually not descriptive. What do you want to
>> say here?
> 
> Will change to be "USB phy may be a system wakeup source".
> 
>>
>>> to keep its resource(e.g power domain) active to make usb remote
>>
>> space before (
>> s/e.g/e.g./
>> s/usb/USB/
> 
> Okay.
> 
>>
>>> wakeup work.
>>>
>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>> ---
>>>  Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
>>> b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
>>> index 2824c17285ee..7b71e32d1df0 100644
>>> --- a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
>>> @@ -39,6 +39,11 @@ properties:
>>>        the VBus line.
>>>      $ref: /schemas/types.yaml#/definitions/phandle
>>>
>>> +  wakeup-source:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>
>> This shouldn't be needed, as it is a standard property.
> 
> Will remove.
> 
>>
>>> +    description:
>>> +      Specify if it's USB remote wakeup capable.
>>
>> Now you have to explain in the bindings what is "USB remote wakeup".
> 
> "USB remote wakeup" is a standard concept in USB world/spec, change
> the description like "if the USB phy can detect the remote wakeup
> signal while the system sleep" make sense to you?

If it is a standard concept, keep it.

Best regards,
Krzysztof

