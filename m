Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD81C6F66DD
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 10:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjEDIKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 04:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjEDIJz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 04:09:55 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329EF525D
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 01:08:15 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9619095f479so23308566b.1
        for <linux-usb@vger.kernel.org>; Thu, 04 May 2023 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187691; x=1685779691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byDPUDOt8GYOJTy7S9gC54C3ZXLMwnnDCwgExcgBbwE=;
        b=jUVQge6ZTztk15UsR6kt2KVGMyX190Jy8FmDLHp7XDobF+uXgFac3qVXk8o1y8ZaLi
         YzJSzkHrJvnjjSiDmTOD3Ou8ZcM3yurHQo+9yvUo0A41qMXMyglkj99MAW6lEW8DPruh
         HL2ivjbE9YEYBLRxRPibRaOhC8IgKxwgDxziqfIm4FLPjgqpQ7QrkKEfaa2rpbZYMqkm
         qYx4Oq3+QwK7xBXWFKj4yzSn3d9F8C+s3RxS6Ky9KLvilSL3VdtZMbelOHGFOk0+kPn2
         2cQboQoS3QG49qvvAxxnOc1K26oM2JImD18iesEQAEF3fr1kX8kULe5EDYi7iDKpuwo1
         zacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187691; x=1685779691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byDPUDOt8GYOJTy7S9gC54C3ZXLMwnnDCwgExcgBbwE=;
        b=PyhEGDA0InYHqQ3z5ApwcthHZ0Csn3VxQ6HpKqNhik+WMTt4Xg9t9p9K9yAFXT2HMS
         vBBiJyDZGs7mL56w1Fp75/Q+GT+jw1mMoWzwYgK+JXeCTLcbMbwPawhTsFN9wuE0WGxG
         s/yUiYB3+bouM/JX+JCwUlJQqWKzg6FZ9jY5UtbdPFrAu69MqmnAG9kvwc/nVQj8mtkc
         fiuXpBL/dklOy7XJFklrwaPUvQ3viDtJnfzYjls37q+X2jJ5hSfrVyW4aVNoAIXKbcpu
         oU1hRj/0QXV4a6crl1l4B/+BqrHwqYwblqIh4FkrcAUVxjEPar2OIzYUt6qNlKPQxvYv
         DvJA==
X-Gm-Message-State: AC+VfDwTfQW48p+cHRuziuK9Rw2kWx1QuNoNue/RXheve7cODX424Zcm
        Eqt/6BtWGYYjPI5Q/cn/2SKYrw==
X-Google-Smtp-Source: ACHHUZ7V4VVbuu2QABVgsj2CM8GAltUPKXVXETrFrfDTBh8Bi5Dawj08rUb7EF/Ch99f+XpES0mFPQ==
X-Received: by 2002:a17:907:2681:b0:961:272d:bdb9 with SMTP id bn1-20020a170907268100b00961272dbdb9mr6177923ejc.43.1683187691630;
        Thu, 04 May 2023 01:08:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id my34-20020a1709065a6200b0094f6f45b2c1sm18500238ejc.156.2023.05.04.01.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 01:08:11 -0700 (PDT)
Message-ID: <5564bc98-2de9-d697-23f4-a778dec8088c@linaro.org>
Date:   Thu, 4 May 2023 10:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] dt-bindings: usb: Add binding for Microchip usb5744 hub
 controller
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        ilias.apalodimas@linaro.org, Marek Vasut <marex@denx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Piyush Mehta <piyush.mehta@amd.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <cca068980ae0b902168a9a9b78cab4efb43157a8.1683121150.git.michal.simek@amd.com>
 <4aa7adbf-f89e-6819-64d2-5942a456528a@linaro.org>
 <eb325b2a-d265-d8bb-8e98-9eef8f03355a@amd.com>
 <d5763073-3aaa-8a7f-1336-337c125b1a0e@linaro.org>
 <66c1efb3-32c1-b751-0faf-1fd6814bf05c@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <66c1efb3-32c1-b751-0faf-1fd6814bf05c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 04/05/2023 09:55, Michal Simek wrote:
> 
> 
> On 5/4/23 09:31, Krzysztof Kozlowski wrote:
>> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>>
>>
>> On 04/05/2023 09:25, Michal Simek wrote:
>>>
>>>
>>> On 5/4/23 08:46, Krzysztof Kozlowski wrote:
>>>> On 03/05/2023 15:39, Michal Simek wrote:
>>>>> The Microchip usb5744 is a SS/HS USB 3.0 hub controller with 4 ports.
>>>>> The binding describes USB related aspects of the USB5744 hub, it as
>>>>> well cover the option of connecting the controller as an i2c slave.
>>>>> When i2c interface is connected hub needs to be initialized first.
>>>>> Hub itself has fixed i2c address 0x2D but hardcoding address is not good
>>>>> idea because address can be shifted by i2c address translator in the
>>>>> middle.
>>>>>
>>>>> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
>>>>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>>>>> ---
>>>>>
>>>>> It looks like that usb8041 has also an optional i2c interface which is not
>>>>> covered. But it is mentioned at commit 40e58a8a7ca6 ("dt-bindings: usb:
>>>>> Add binding for TI USB8041 hub controller").
>>>>>
>>>>> i2c-bus name property was suggested by Rob at
>>>>> https://lore.kernel.org/all/CAL_JsqJedhX6typpUKbnzV7CLK6UZVjq3CyG9iY_j5DLPqvVdw@mail.gmail.com/
>>>>> and
>>>>> https://lore.kernel.org/all/CAL_JsqJZBbu+UXqUNdZwg-uv0PAsNg55026PTwhKr5wQtxCjVQ@mail.gmail.com/
>>>>>
>>>>> the question is if adding address like this is acceptable.
>>>>> But it must be specified.
>>>>
>>>> Why? phandle points it explicitly.
>>>
>>> Ok it means just list usb hub on i2c with label and point to it. Works for me.
>>
>> Right. I missed you want the address of the hub but phandle goes to the
>> bus. I think listing it on I2C bus (see
>> arch/arm/boot/dts/vf610-zii-scu4-aib.dts) should work. I think we can
>> have I2C devices without compatibles.
> 
> Device is definitely on i2c bus. But the problem with phande to bus is that 
> there could more the same usb hubs and different i2c addresses of it. That's why 
> I need to have exact match.
> Marek has similar hub where i2c address can be strapped too.
> 
>> The problem is that property should have only one definition/type and
>> i2c-bus is already used in other cases as just "phandle". If we go with
>> your phandle+address approach, then this should be phandle-array with
>> items and then we have two different types.
> 
> What to do with it then?

Your idea. I think you missed part of my comment. Add hub to the I2C bus
and phandle to the hub I2C device node.

Best regards,
Krzysztof

