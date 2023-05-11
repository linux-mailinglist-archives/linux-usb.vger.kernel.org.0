Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50A76FF4F4
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 16:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbjEKOuV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 May 2023 10:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238760AbjEKOt6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 May 2023 10:49:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB46106E2
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 07:49:04 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-956ff2399b1so1646852466b.3
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683816543; x=1686408543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfmScQuHDtUIzeUlR/F8RZSBPxoOFtpMv619WIBm4+4=;
        b=IU/f7ixl4zdQ8gsbp48DMo1UmGVuGpNZ5gaqKJjMdSLL310e9oSEwrSrf1IJSel89i
         RjJiE8dLS5FK/iGLtLEuc1KerE/Vhyj9vN85P5QnUJZMRwME2z74verzU9vi4X8WVEni
         oGAI6sw76v3WXcYss1Ydt/FmzjDfoYJ4eC4IpwBXnKz+CzOmxGTNqeYw0bMaBuwOOYlv
         xVPFnJ8XnKGTCHClOu+c0zKcTGw9bxj3CuZ/foq4YK6Ioen3ScrHZAdJwLhyVzgD13id
         ePWIF9xgxz1dWKu/QM6n1035+xbe7LxK78DSPzgtMMDYToTzjy0nNEOat2whYE5ONXid
         UHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683816543; x=1686408543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfmScQuHDtUIzeUlR/F8RZSBPxoOFtpMv619WIBm4+4=;
        b=SP8+mIdQxzsrrD9ZvD6ErRKxCKcdJmWpSGBM5sHzxVFRNjUFhbR2FnST/vMSeSWQvc
         xbBtUhKXIIrvPfOXOVxvhzCnbx4Hg28dsYAJ/NxTyXruVsZsHaM7LSoXpwIk5MLU1AUE
         GWP5X4wCYJBghigRskxvdk5heCFQyQzdc5zw699DRNU1kfObxImvuP2jI6J5dcweQBaA
         fXXIod0TrlmHfjnyY8TiUFErBIwR5FFobv9fkeE509YoW06sC+NQb3wqQpOvmU0HOogl
         zGF05QbBMD9SqP13cRXJ86hCO6d1ykM1HYPEyUGTY9TjO6DIlFbZGVnQsvmtu3m+Avk7
         7lUg==
X-Gm-Message-State: AC+VfDzEmWyRN8Q8dIIgaTlLfGWFECzejwVrUokjVdGPTqswnygIVnfc
        X7raAyxU58zWYg+z+eXrJ67Lrw==
X-Google-Smtp-Source: ACHHUZ7r3REokTqrU9qR/UYBky+WbyZ6zPRRmQvruQaNLoxgGEpLy1LeSp4bpsryPfyslW+zo8qhrA==
X-Received: by 2002:a17:907:2687:b0:961:a67:29c with SMTP id bn7-20020a170907268700b009610a67029cmr18117774ejc.70.1683816543309;
        Thu, 11 May 2023 07:49:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7cd:1be6:f89d:7218? ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id bz1-20020a1709070aa100b00969e316d8dbsm3810210ejc.225.2023.05.11.07.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 07:49:02 -0700 (PDT)
Message-ID: <028fb8ac-d6cc-6fee-f50b-b965e69e7d0c@linaro.org>
Date:   Thu, 11 May 2023 16:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: cdns,usb3: Add clock and reset
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>,
        Minda Chen <minda.chen@starfivetech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230510132816.108820-1-minda.chen@starfivetech.com>
 <20230510132816.108820-2-minda.chen@starfivetech.com>
 <9cf5965a-8290-dfff-9f92-07ed2df66650@linaro.org>
 <05057f6d-cb38-8e4a-5d30-82863e0cda44@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <05057f6d-cb38-8e4a-5d30-82863e0cda44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/05/2023 14:16, Roger Quadros wrote:
> 
> 
> On 11/05/2023 12:26, Krzysztof Kozlowski wrote:
>> On 10/05/2023 15:28, Minda Chen wrote:
>>> To support generic clock and reset init in Cadence USBSS
>>> controller, add clock and reset dts configuration.
>>>
>>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>>> ---
>>>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>>> index cae46c4982ad..623c6b34dee3 100644
>>> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>>> @@ -42,6 +42,18 @@ properties:
>>>        - const: otg
>>>        - const: wakeup
>>>  
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 8
>>> +    description:
>>> +      USB controller clocks.
>>
>> You need to list the items. And why is it variable? Your clock choice in
>> the example is poor, I doubt it is real.
>>
>>> +
>>> +  resets:
>>> +    minItems: 1
>>> +    maxItems: 8
>>> +    description:
>>> +      USB controller generic resets.
>>
>> Here as well.
>>
>> You had one clock last time, thus the review was - drop the names. Now
>> you changed it to 8 clocks... I don't understand.
>>
> 
> Different platforms may have different number of clocks/resets or none.
> So I don't think minItems/maxItems should be specified.

Yeah, but we want the clocks to be specific per platform. Not anything
anywhere.

Best regards,
Krzysztof

