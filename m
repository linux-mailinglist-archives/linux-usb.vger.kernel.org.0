Return-Path: <linux-usb+bounces-5687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7D843941
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 09:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975D1289D6F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A0D5DF23;
	Wed, 31 Jan 2024 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0LLgJcF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF15DF35
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690501; cv=none; b=hlifYaCy4jHm8Xm2WW1r7b+fsfk3e5wI/FuZM7oMfBelepmI3YNP5cj2e4mN9E/fbv1T/9EUiLolQ1UVeND+LNMVdaeqO4cDkj1Nae4u50WCTpldPel+jZ6TxFf+jfjQNpcvnkoB1hlhZu26RFD5hy2f4Ijv5NYTsZwDRZl7bMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690501; c=relaxed/simple;
	bh=V2EKFzQiAfs8whAc4xoHHTAX6ChTZkUNVfGwRtEfLZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuS+zi+9OpycSpA+qVN6l3DPQUqLM2iZw9YALVvUpxGXEoCP+R8WgRK+UqONPafiy+wSF/jistkjYjY0bBl0yvq0duqyaB+pEtCiSFF8oTY6vjGURTb7tPjfSQTaKr0NkSx37p8TyZR9YpoEhsxjWLH0K0X2pFkos9R7OoIoNTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0LLgJcF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a90a0a1a1so5062765a12.0
        for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706690497; x=1707295297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLBUVNJs0HRqem5dcUo/8u0QXcbDxZkT7mxPwMcTYv8=;
        b=k0LLgJcFXv1kXr1Ab1HhOGo6V3nccOvUUjN8Ihu0Ylggf9DEZjWV2nePLD2yPDb8qZ
         bBzHnPNkL8BFqP/coGWBcUZuvP6dACW/jYIUHdtgraYrY+GjBuP9hd+15AEpGyO0V/7L
         bKnDuSJytiQdr2wC08SQ134UquZtVdzuYz1jASQkd+ESSOR/ajxSDuzBf00n2oikKluL
         OHgKyjsRtkXCWS587wI6s5BkFoc4hF03sQCYYq2QU7hiMMZNuKIcpYvNBzNE4fRtXxV+
         h5oTE2HxTfRlkESjaMkvrLaLO5GzmRNp8sDANdNRuLmOuu6LPaf3WR0ISRMfU/1cf11S
         sksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690497; x=1707295297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLBUVNJs0HRqem5dcUo/8u0QXcbDxZkT7mxPwMcTYv8=;
        b=bxIMRZnhXN+5kDQ0P08K/ZpCvuV5qPZhgo4Ix4nhx+JqbYAG6ergs/gkUSqMR7HY1t
         TFTe7S7BlDVmBWgnkAe9PVEipnv7WyYf0TohAQ6IRy01nHWr7YvLoIhBYdQNCKzPke9T
         TlNDtJpqMBZa8TgI5WAG4P7zibjleg+EzLDv087CZDK1rktsZuOQC/zxs2AHFGEOsB/C
         8MPIEl8EF0msMzU6GTGjJtCOc+BI9a77BAtXkmLqElteYwtOCXLNNSbYPQk5/eI5zsQs
         2E60RpmFNyQKkFp556Ug5mUOj1c9FSFb/bFuWtQOdgiOQFNPf1F3E5HFBdtg1qg/pulF
         vK2A==
X-Gm-Message-State: AOJu0YwRFrqNupLXfHxI1okpo5GXIrkUnOVAbb7L4pCWf/+kspPvMnJt
	2yzjn8JbkyYt1rhgQA9hUw99XcapPsd5aTj2c6SG2lU22n+EssZe2402MlK+EY0=
X-Google-Smtp-Source: AGHT+IETShaftO5rMt3EuoGo5LEer32B5EgnwUIKUU4r4fu7xR2tSHESsNv4tlq7iScvKmAozPdyUg==
X-Received: by 2002:a50:d4dd:0:b0:55f:41ba:9a72 with SMTP id e29-20020a50d4dd000000b0055f41ba9a72mr659734edj.35.1706690497048;
        Wed, 31 Jan 2024 00:41:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNuD+ctA8GU6S3Lp/2/ipnLgxPUVfiMLm6X+yMX3LsRGnOLRk2UMqDD2ual1UCkaxvcIQ3B2ADoU3j4iaha0A7qlTPPmvSMpJ8AX/RiBXj49P/YYwqsl1ZCMte5bYfIiDBWFNaoZHf83Z7MqOSpR/CWigAFN+LtjOHJumBXJMouhAJgEsrkNRhC48fj5c3tYBNB+5jaC3GuORK+XZB9g+W5li7UsAxkR2IPBrnf39XY2IPsv0RPYcKYV+NGvKNb2n/CWsGEvMfXeFhKpgIat+8CdXwlS0QY3eShPTs3OnPQgIgU+qIKrvrrsHtWiRxnJNbk90hmjcNQvRrRF/7GWiGX6AJLLLXAdiI6rcnwiI3zdXmJGL85WyHhW3gw/k7U0VSlfMVfTdzvwmAD8bk/o9XCArlaY4hcnTSKdEGOtzDzCrgLZQNHi1bpm6OIvL8JXyG0fRJkK+kMp0qTQ==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id k17-20020a056402049100b0055c63205052sm5761479edv.37.2024.01.31.00.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:41:36 -0800 (PST)
Message-ID: <d9c2bd53-40cb-43b3-b051-616f27b8f49e@linaro.org>
Date: Wed, 31 Jan 2024 09:41:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 4/7] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
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
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
 <20240119071936.3481439-4-xu.yang_2@nxp.com>
 <0a3f5446-7179-4855-b627-72acedebd883@linaro.org>
 <DU2PR04MB88228BAE9D747424B065E5B98C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU2PR04MB88228BAE9D747424B065E5B98C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 09:24, Xu Yang wrote:
> Hi Krzysztof,
> 
>>
>> On 19/01/2024 08:19, Xu Yang wrote:
>>> Change reg, interrupts, clock and clock-names as common properties and add
>>> restrictions on them for different compatibles.
>>>
>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>
>>> ---
>>> Changes in v4:
>>>  - new patch since v3's discussion
>>>  - split the reg, interrupts, clock and clock-names properties into
>>>    common part and device-specific
>>> ---
>>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 118 +++++++++++++++---
>>>  1 file changed, 102 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-
>> hdrc-usb2.yaml
>>> index b7e664f7395b..78e30ca0a8ca 100644
>>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> @@ -73,22 +73,10 @@ properties:
>>>                - nuvoton,npcm845-udc
>>>            - const: nuvoton,npcm750-udc
>>>
>>> -  reg:
>>> -    minItems: 1
>>> -    maxItems: 2
>>> -
>>> -  interrupts:
>>> -    minItems: 1
>>> -    maxItems: 2
>>> -
>>> -  clocks:
>>> -    minItems: 1
>>> -    maxItems: 3
>>> -
>>> -  clock-names:
>>> -    minItems: 1
>>> -    maxItems: 3
>>
>> Why all these are gone? They are supposed to be here. Your if:then: only
>> customizes them.
> 
> I have also concerns of whether to make this part common.
> I will revert this later.

Revert? No. This patch must be correct.
> 
>>
>>> -
>>> +  reg: true
>>> +  interrupts: true
>>> +  clocks: true
>>> +  clock-names: true
>>
>> No. These are not booleans on other variants.
> 
> Okay.
> 
>>
>>>    dr_mode: true
>>>
>>>    power-domains:
>>> @@ -412,6 +400,104 @@ allOf:
>>>          samsung,picophy-pre-emp-curr-control: false
>>>          samsung,picophy-dc-vol-level-adjust: false
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          oneOf:
>>> +            - items:
>>> +                - const: fsl,imx27-usb
>>
>> No, the syntax you need is contains:.
>>
>> Look at existing code - there is no single binding with oneOf: in if: block.
> 
> I wonder why 'make dt_binding_check' does not report this issue if the syntax
> is not correct?

I did not say syntax is incorrect.


> 
> So I need to add contains as below, right?
> 
>   - if:
>       properties:
>         compatible:
>           contains:
>             oneOf:
>               - items:
>                   - const: fsl,imx27-usb
>               - items:
>                   - enum:
>                       - fsl,imx25-usb
>                       - fsl,imx35-usb
>                   - const: fsl,imx27-usb
> 
> The purpose of this code is to match:
> 
>   - compatible = "fsl,imx27-usb";
>   - compatible = "fsl,imx25-usb", "fsl,imx27-usb";
>   - compatible = "fsl,imx35-usb", "fsl,imx27-usb";
> 
> but should not match:
> 
>   - compatible = "fsl,imx7d-usb", "fsl,imx27-usb";
> 
> Is this feasible?

So maybe they are not compatible? Your patch creates some unusual
constraints for all the variants, which is probably result of huge one
binding for all implementations of re-used IP block. I don't think that
this huge if: you add here and further in the patch helps. Just like for
other re-used IP blocks, this should have common part and
per-device/per-family/per-implementation binding.

Best regards,
Krzysztof


