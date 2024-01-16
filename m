Return-Path: <linux-usb+bounces-5100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192B82EA5A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 08:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 087E02850F3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 07:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AF2111AA;
	Tue, 16 Jan 2024 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGs8OZ96"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1623511188
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so11898240e87.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 23:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705391538; x=1705996338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpktvh0hwhs0L09Ir1G7wwDyRvGIKPXQSYBbSJWusTo=;
        b=oGs8OZ96gbtqJmjKUW6KWwaXCtJoqWmEfkJC32ZA5yg1X6ZrPpgq0jpCiTrsswIXXO
         KOs5OH3nIr70mDuiLFyIIWZ58W412yoHjvgMf5PYAneSiNWAS6EHw7bxJo80GZRymU0U
         2U2SdJo6A+0LpHtwVd0hwU8b19Ppue5w61OFUpiKmcOrEGO88GtrKCRkccFYVeEQUzm0
         mc+ZNFI5nugcgogPR98AA/HCYTvIHl45D04jJMJ5YeK1qB9yN6EbpKDz/jQHYfPtQ/Pt
         /S6N0A+4pwPk3rnC87P4ze+lverhMc8zc/ItphwhuRkhUHlKWnHvezsYCKN6YrUU+TtI
         f4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705391538; x=1705996338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lpktvh0hwhs0L09Ir1G7wwDyRvGIKPXQSYBbSJWusTo=;
        b=K0gpsunXQ5DCSXzv1zHp6ADPhkw5SK4ahyEiKiwiaXENbhgHM/O7duNV1h9ZSUcsRc
         pnwwwfhBns/vSewUIzw80JG2Upr29DAEGSsPctStZk5bTI+oiV26gGMBIRPIBQ+AzVFR
         lYfIxf8tgk+u63DsIZYfExCzR1YteiwMSGAfWL2ngC0vhx9CnXfbt5hmyiQIql9oGAsc
         MBVvIvBLmGQhdRJn4dyHtRA4NcO9VocfqVqw+QT+8sCB2m0VQMqQhXh3s0MHPl91PhZ/
         rVt/v101E86tzt0Rqieb6azQmr0HQHp5IR6wHquK7iyVs0cqlGnBx7bgtuAeub8+18b2
         zgUQ==
X-Gm-Message-State: AOJu0YxACL3IXZbcr0d0JpA3b9Dx9bCEva7Ck3Clocuhuq+IoWJxTNn7
	0l78FE1N8RjZn8An2/rQqDt4CRf2O7n3yw==
X-Google-Smtp-Source: AGHT+IFQv+cfNhIODKrsnM3MWfiNyZtxXoy4PgTf/DKb9j0rxMkwiHC1dfuKZSNyqMl4hDiAviT9tQ==
X-Received: by 2002:a05:6512:6d1:b0:50e:b205:5647 with SMTP id u17-20020a05651206d100b0050eb2055647mr3628357lff.36.1705391538132;
        Mon, 15 Jan 2024 23:52:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id mc12-20020a170906eb4c00b00a2b85ef0ca3sm6114472ejb.202.2024.01.15.23.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 23:52:17 -0800 (PST)
Message-ID: <95e2b70e-c6fb-4c10-b341-efd1f9cbf6e6@linaro.org>
Date: Tue, 16 Jan 2024 08:52:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v3 4/6] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
 <20240112111747.1250915-4-xu.yang_2@nxp.com>
 <3ade5e2c-e3dc-4cf4-9c12-2487e30a2253@linaro.org>
 <DU2PR04MB8822D31A8AD7BEE1F50AC78A8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU2PR04MB8822D31A8AD7BEE1F50AC78A8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2024 08:49, Xu Yang wrote:
> Hi Krzysztof,
> 
>>
>> On 12/01/2024 12:17, Xu Yang wrote:
>>> The i.MX93 needs a wakup clock to work properly. This will add compatible
>>> and restriction for i.MX93 platform.
>>>
>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>
>>> ---
>>> Changes in v2:
>>>  - no changes
>>> Changes in v3:
>>>  - add clocks restriction
>>> ---
>>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-
>> hdrc-usb2.yaml
>>> index b7e664f7395b..6e75099b6394 100644
>>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> @@ -57,6 +57,7 @@ properties:
>>>            - enum:
>>>                - fsl,imx8mm-usb
>>>                - fsl,imx8mn-usb
>>> +              - fsl,imx93-usb
>>>            - const: fsl,imx7d-usb
>>>            - const: fsl,imx27-usb
>>>        - items:
>>> @@ -412,6 +413,21 @@ allOf:
>>>          samsung,picophy-pre-emp-curr-control: false
>>>          samsung,picophy-dc-vol-level-adjust: false
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: fsl,imx93-usb
>>> +    then:
>>> +      properties:
>>> +        clock-names:
>>> +          items:
>>> +            - const: usb_ctrl_root_clk
>>> +            - const: usb_wakeup_clk
>>> +        clocks:
>>> +          minItems: 2
>>> +          maxItems: 2
>>
>> Nothing improved regarding my comments. Why do you allow
>> any/unspecific/unconstrain interrupts and reg?
>>
>> You said:
>> "However, reset, reg and interrupts property is not special for imx93."
>> but what does it even mean? How they can be special or not special?
>>
>> My comments from previous version apply. If you do not want to work on
>> existing technical debt, BTW added by another NXP employee, then I will
>> NAK any new submissions.
> 
> You want me to adjust below properties to be more common properties
> and add device specific limitations, right?

Yes

> 
> ---
>   reg:
>     minItems: 1
>     maxItems: 2
> 
>   interrupts:
>     minItems: 1
>     maxItems: 2
> 
>   clocks:
>     minItems: 1
>     maxItems: 3
> 
>   clock-names:
>     minItems: 1
>     maxItems: 3
> ---
> 
> For most of the devices, property reg, interrupts, clocks and clock-names
> has 1 item. So these properties can set maxItems to 1. For special devices,
> I should list them standalone, is this your expectation?

Just like you constrain clocks for new variant, your variant should have
constrained reg, interrupts and whatever else is there variable. I don't
require fixing all the devices in this binding, but at least your new
one and preferably other NXP as well.


Best regards,
Krzysztof


