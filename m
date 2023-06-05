Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6A972231A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 12:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbjFEKNv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 06:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjFEKNu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 06:13:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A10EC
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 03:13:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so3857307e87.2
        for <linux-usb@vger.kernel.org>; Mon, 05 Jun 2023 03:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685960028; x=1688552028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJ7krLeka9/tcUoAhRSnlfOcLA+KOziuahGCOZe17b8=;
        b=zopAbIr6JOrr16OqxPw8RykyZ7f/l6cnq+lVwMF5cEKiKtMRLlBWnFKPrKfRuKQDz3
         XvO1JdYBnwAWxJ9NAd94lA9eKM/3v0zxMXCnnc+i2Sr5n5xc4JzdN3hEbDRLWpfMJw97
         CROoXMipwf4fBFRPwBgsbT0mqsNSmzQjWh5c0eHVgI5Glx/UJbas/F/58wyLra3hcKFm
         1/8UZjZ/63+dgWLJQ2UD07WXY64+LwzVvrBmY6/KJRy5z82anu9zO7R3dxjTwbJ9gS3N
         FiMYeXdLX1Q17jX1nqe+G9eXRHotvoBbzlaeTQtDwE+5/ZP62dFirbMCzfXvEvbtsHiv
         63Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685960028; x=1688552028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ7krLeka9/tcUoAhRSnlfOcLA+KOziuahGCOZe17b8=;
        b=j568FXOKkar2d86UdxL+eHxCsYHeO9ofm0LfJTigD9HwBRrGAIVz5Hqae8dZKdAXi2
         dxdAYh3Uwin4TRLwhzkxrUJg2LhUmoDjDR8eltZHRT/285XrNjZiV6hybrnabaGq4+OY
         7X/oaWxzsGfJkgR0Kn8gmB8RjBL40GNtjkBwfBBYz6AEg90HwS3I65hPy7xW32XCF3pR
         EXhATJ/X5oLpMjrPdFjDtkW8IzSh00HubM/GVzTQrB07GXdlZNPPS3zs8MJIBSXNQU08
         1G1eKvFnjr20RLJq8djbDNF1a9XQtgF3tSBQ4ntPLfkpm368Wx934Qhl4AR1TAeJk7c9
         OM/Q==
X-Gm-Message-State: AC+VfDzJzw4uN1VTBH5ZXoO0K3UWQcIffXhtPPiH4qR+Otrx+Yn8g8Ac
        wvsvl0t19FIJXqgi/QO/S4XL4Q==
X-Google-Smtp-Source: ACHHUZ5L+i8nFNC0cXmACRX6qjRsloQt84Jkk5TEZKQfctk3syBNbEQZYk5VfjVhuwFu96i+rW+nNQ==
X-Received: by 2002:ac2:41d4:0:b0:4ef:ec6a:198c with SMTP id d20-20020ac241d4000000b004efec6a198cmr4054425lfi.26.1685960027611;
        Mon, 05 Jun 2023 03:13:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q26-20020ac24a7a000000b004ec83bc3e2dsm1085686lfp.42.2023.06.05.03.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 03:13:47 -0700 (PDT)
Message-ID: <733ccf5e-99cc-67e7-1c2b-be318daebc58@linaro.org>
Date:   Mon, 5 Jun 2023 13:13:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 1/7] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-GB
To:     neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v1-0-d4d97b4d8bab@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v1-1-d4d97b4d8bab@linaro.org>
 <0fbf55e7-2140-751d-5347-f907a46ef78c@linaro.org>
 <d7da64a8-8d49-595f-f519-9cdc2092d9e7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d7da64a8-8d49-595f-f519-9cdc2092d9e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/06/2023 10:30, Neil Armstrong wrote:
> On 03/06/2023 22:22, Dmitry Baryshkov wrote:
>> On 01/06/2023 17:07, Neil Armstrong wrote:
>>> On some platforms, the Type-C plug orientation is given on a GPIO line.
>>>
>>> Document this optional Type-C connector property, and take the
>>> assumption an active level represents an inverted/flipped orientation.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/connector/usb-connector.yaml | 5 
>>> +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/connector/usb-connector.yaml 
>>> b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>> index ae515651fc6b..c3884eed6ba4 100644
>>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>>> @@ -114,6 +114,11 @@ properties:
>>>       description: Set this property if the Type-C connector has no 
>>> power delivery support.
>>>       type: boolean
>>> +  orientation-gpios:
>>> +    description: An input gpio for Type-C connector orientation, 
>>> used to detect orientation
>>> +      of the Type-C connector. GPIO active level means "CC2" or 
>>> Reversed/Flipped orientation.
>>> +    maxItems: 1
>>
>> Should this be a property of the connector or of the parent device 
>> node? I mean, unlike usb-b-connector (where ID and Vbus can be simple 
>> GPIOs nearly directly connected to the pins of the connector) for the 
>> USB-C the orientation is not a connector's GPIO, but rather some 
>> additional not elementary logic.
> 
> I don't see the issue, orientation is a property of the connector itself,
> even if it's provided by another ic.

I'd argue that the _gpio_ is not a property of the connector itself. 
Generic USB-C connector will not have such orientation GPIO. But 
probably it is a minor issue.

>>
>>> +
>>>     # The following are optional properties for "usb-c-connector" 
>>> with power
>>>     # delivery support.
>>>     source-pdos:
>>>
>>
> 

-- 
With best wishes
Dmitry

