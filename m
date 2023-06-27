Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67ACA73F471
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 08:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjF0GXx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 02:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjF0GXv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 02:23:51 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E41E5A
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 23:23:50 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fa99b57a38so16160265e9.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687847029; x=1690439029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqR2Bde7fgFZFfqx9wKscXdAyIjVnqS4blsqmK6ypzU=;
        b=AcmzkJ/g1c26P23mJhuAkBl86X58muZGFK71lAR26FHzUzu+VkpBqKZwJhlpzUlDH9
         D0HdUXIyyfcfsQE7k4VMFz3inbbi8dXU0JSFSAU9n1q98JqM+mh5Q9Ib/aWJqGXYfcDL
         x7a3rL26rkxUJfLx0dpU17Tusgsh1r8RQ/NB2/G850vxVOw7z+s7aj74tQpgQWbsHQGu
         ikM6qeQ5rk8gS8XzQ6XjKJvHqcbr6b3J7bmUwYIYFjfF87Bq0kqpu6wnx3ZHzXgdxZ5L
         lGJo2oLZqpAYSBRg8T+tB5UsJz10arEX2G+NYZVnBAW+kZZveqLjB6PUkDHTbbU7+jBi
         IxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687847029; x=1690439029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqR2Bde7fgFZFfqx9wKscXdAyIjVnqS4blsqmK6ypzU=;
        b=cx0Pq/unHE/RZJwJIiR3q7RSrAOxSpGmsTUaDieH6LcFkNpc8uve9R5qg2vn/nSRMN
         fpjmWOGWdDowzC5ZSyg1hHusS+Jh766dCdJTHUtMwCy7ET+eSt8GkaEO2EsbeLhgyAHe
         OB88xugqezqhtaSrDFXfJP/vc93Gc4LgrVFaCM3Z/BaXinkOjLkvO8ZGsrbpuixGNCHN
         yt6TTdsh4b/Mvw0KpxCoOkL6z8zPAg7w4+/J8+G8LpxHN9LlaBouZcHKdlsJYI3XrBzr
         oGUWP+SXRLO2oXMLLUhib2G5ESINrKoRfkIvlAwDW6SZLAjghY00uzIdkL53RAWC9elI
         zf2g==
X-Gm-Message-State: AC+VfDz9eKchKEdNFZAD+y63rPIExIfjCsX1nYSW9T7Fp5NmEaFB/5OG
        7nDIEUQUW/LihDqIA8Lc+OyLGw==
X-Google-Smtp-Source: ACHHUZ6yzCvgzdX2Y/g3bD2+TrI4wajnQCV07TKGG2zgI7H/hQkuiyoX9o7t7FH4X5RDQ6Ulefrdvg==
X-Received: by 2002:a05:6000:1cb:b0:313:efd5:f294 with SMTP id t11-20020a05600001cb00b00313efd5f294mr3766666wrx.10.1687847028573;
        Mon, 26 Jun 2023 23:23:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm8429048wrs.55.2023.06.26.23.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 23:23:48 -0700 (PDT)
Message-ID: <10e356c6-81fa-f127-8263-0fdf8a512aa6@linaro.org>
Date:   Tue, 27 Jun 2023 08:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXT] Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add
 samsung,picophy-rise-fall-time-adjust property
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
References: <20230626092952.1115834-1-xu.yang_2@nxp.com>
 <20230626092952.1115834-2-xu.yang_2@nxp.com>
 <f7bca54b-9de1-be9a-ad46-3502df58289f@linaro.org>
 <DB7PR04MB4505F485E48DE667D62602748C27A@DB7PR04MB4505.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB7PR04MB4505F485E48DE667D62602748C27A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/06/2023 05:10, Xu Yang wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Monday, June 26, 2023 11:45 PM
>> To: Xu Yang <xu.yang_2@nxp.com>; peter.chen@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> gregkh@linuxfoundation.org
>> Cc: conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>; Peng Fan
>> <peng.fan@nxp.com>; linux-usb@vger.kernel.org; devicetree@vger.kernel.org; Jun Li <jun.li@nxp.com>
>> Subject: [EXT] Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add samsung,picophy-rise-fall-time-adjust property
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the
>> message using the 'Report this email' button
>>
>>
>> On 26/06/2023 11:29, Xu Yang wrote:
>>> The samsung,picophy-rise-fall-time-adjust property can help to adjust the
>>> rise/fall times of the high-speed transmitter waveform. The value can be
>>> 0~3.
>>>
>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>> ---
>>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml          | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-
>> hdrc-usb2.yaml
>>> index 782402800d4a..d84c66c342ac 100644
>>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> @@ -292,6 +292,16 @@ properties:
>>>      minimum: 0x0
>>>      maximum: 0xf
>>>
>>> +  samsung,picophy-rise-fall-time-adjust:
>>> +    description:
>>> +      HS Transmitter Rise/Fall Time Adjustment. Adjust the rise/fall times
>>
>> Adjust with/by what? What are the units?
> 
> This property is used to adjust the rise/fall time of the high-speed
> transmitter waveform. It has no unit. According to the description of
> USBNC_n_PHY_CFG1 register, the rise/fall time will be increased or
> decreased by a certain percentage relative to design default time if
> a value is given to this property.
> 
> The actions as below:
>   - 0: -10%
>   - 1: design default 
>   - 2: +15%
>   - 3: +20%

Include it then in the description or even make the property -percent:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml


Best regards,
Krzysztof

