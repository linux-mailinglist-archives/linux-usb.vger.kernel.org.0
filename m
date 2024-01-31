Return-Path: <linux-usb+bounces-5688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558578439CC
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 09:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A521C27B2C
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA7561671;
	Wed, 31 Jan 2024 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUNDalGE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7B069953
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690753; cv=none; b=Mf7mjuu2Q47b43t2IE4jNxcVhDYfXV6r/F7XlQf9T9hP7S9IpXJFrjAl01w/M2nHfSg+1w6fI3GGhqcJA7KRreFNMaYWRb4jfFeuvPZAdQDBWBZFQKK/ScfidfYviZ+hPJNVUCSRJw4Twos/E8ETMsblNL5cP2Dl+Y27EIEJXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690753; c=relaxed/simple;
	bh=BBxbmFtw7Hy50ln2W3ImwluHV7LvUrJIWwKQYWHBY+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=murqycQEO0oPrd13yWSwLBQjKdCsN1Ib9yNuGqfY2FnM2yKuMhHp4LVW/eE88DzIQuvS4EubUTjT84LjC07283KeMyP0iZu5cH2Xhu7a9HL99mYgeUVtYN2paPIYxsyRHBkgfEvVix1J0WMSk2ZXjfaWCZJW2LPJXHAsTxh3+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vUNDalGE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51032058f17so4251913e87.3
        for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 00:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706690749; x=1707295549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1a7IohwBv4bLWBxOuEuvNh315WhvEEkKbOY8VCFdC3Y=;
        b=vUNDalGEGK/40daAfVsPNAayBO66Ex0L/qbLk2k8awwusPW7INZZVuWjpdNg94qDMi
         6cpKrwZdIOBKkdKwh2VlIlya377EqJvM9BQRNYfCjmDo66zVevUAGXev0d48uyZOU6bD
         6ssq6KLn41DD4yWUkfpVTjgrfyq5UGLcdkcffOYe+62YRL1gQlyZN+Js99JbB1xzVc54
         ODNkO/m+yc2K/uzKR7JjbgIY/B1RpO1j4VlG3ZJiJdVsVwBuzLHqPotl+HNnoUMPHRNR
         a0M2d/3hPWs5Co/dCgmvXkMlTGR0bETLzOG2Twh4wgI1mwAChH+UpTej7v97VFFU1VYm
         Szzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690749; x=1707295549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1a7IohwBv4bLWBxOuEuvNh315WhvEEkKbOY8VCFdC3Y=;
        b=LCqlPYZI2C229cC/ban1XG1CXbyErVDDSQodJfRwFz7UcBp4HJsy47JLlrT3l2Da1m
         kTZ3vBAqInO/leUA7XD+QRtRQmw3TMCBphD/vq8pFibOJ09kYUyWeEwnYe1YrZ7MaH3K
         XTPoxWdoAh8WQTkwv0SQWonUzqnNzqLwOImDYOjisBSwDw8xMe1lJGl5D+p4cF6vlEWe
         kqN3rt7NYztQqZ1+SyHkUeFibINjwTFMTL1Ewj3rAsn+LB69qhJMNfjAS/LDc6UQFpwI
         xWLjMrTKJlMZEmqpEIO1LfNw13/63li/Dy87KCQYymAd9og1db3PR/aoN0cQT9+3Tlj2
         hj4Q==
X-Gm-Message-State: AOJu0YxSho7yWCHeQQCRVSfvsKxcYZPdktk1ZgcfP+ei8cAoFwocQaK2
	ebaP2fSynUNNzrxON7TQXx5+VIYRknlbYJO3PDbD8DvGa1ZOwvnzKLTLvLPPGQE=
X-Google-Smtp-Source: AGHT+IF0jVpuHA7o7NdVaAqNa/eHbH0RfPt3ULHcRYD9Vmc1N9DFhm3vBmS21dOoMAsbGZcRm1rqzg==
X-Received: by 2002:ac2:4887:0:b0:50e:6b69:6ab9 with SMTP id x7-20020ac24887000000b0050e6b696ab9mr691429lfc.21.1706690749558;
        Wed, 31 Jan 2024 00:45:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWupUNKMFdMHChCP6bXpQiwsmda3HP9My6ag+QzfKlzmdgBw+qqlwZBmH5dJsf3h6CaKdlge+E3Mk26GT4fdFF+in5yPPU0aPtl7EqxUy+QnBo/k2AsZJEd+QJtIrioJUZP3zzUVFaUay+Kj2wv13oiry+poma+cUNcrdmF+vJ04LJzD1/RsS41jGCjAhnzK4dQe1huezGymjwpAM97hrjM/pQvfBZIIEoYUvM+Ns9A0yd3+npmcgVUl++izjJ4CGz4x4Vo4eYoKZtCNhQAgDm8j1feXcDyXMwiyXpe4yeNFf3jfugrw6QrcANKtBr6ExqP4lUjtLXN4uBB92AolmzbjOtiBvr8sFLb884j7CWuPHAIUP0mMS5f7hwe3OQM2R9IMG4dfQprgt1NMgKl2xacOp1FsJ+lBO9c/BjCYGz1RXVM/dNlWYrzbu6OBRstFTFDhP+Ip2Ym3LAw0A==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id f19-20020a17090624d300b00a2f15b8cb76sm5915608ejb.184.2024.01.31.00.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:45:49 -0800 (PST)
Message-ID: <ff948836-8b8a-474b-820d-06a9c71ea8ad@linaro.org>
Date: Wed, 31 Jan 2024 09:45:47 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 5/7] dt-bindings: usb: ci-hdrc-usb2: add
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
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
 <20240119071936.3481439-5-xu.yang_2@nxp.com>
 <a33723fa-6fae-44fc-899f-797d24c7f776@linaro.org>
 <DU2PR04MB88227179C7D48F17CDEC4C0D8C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU2PR04MB88227179C7D48F17CDEC4C0D8C7C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 09:36, Xu Yang wrote:
> Hi Krzysztof,
> 
>>
>> On 19/01/2024 08:19, Xu Yang wrote:
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
>>> Changes in v4:
>>>  - use 'contains' rather 'items'
>>> ---
>>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 47 ++++++++++++++-----
>>>  1 file changed, 34 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-
>> hdrc-usb2.yaml
>>> index 78e30ca0a8ca..a86cb5de1688 100644
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
>>> @@ -455,19 +456,23 @@ allOf:
>>>    - if:
>>>        properties:
>>>          compatible:
>>> -          contains:
>>> -            oneOf:
>>> -              - const: chipidea,usb2
>>> -              - const: fsl,imx23-usb
>>> -              - const: fsl,imx28-usb
>>> -              - const: fsl,imx7d-usb
>>> -              - const: fsl,vf610-usb
>>> -              - const: lsi,zevio-usb
>>> -              - const: nuvoton,npcm750-udc
>>> -              - pattern: '^fsl,imx5[0-3]+-usb$'
>>> -              - pattern: '^fsl,imx6[a-z]+-usb$'
>>> -              - pattern: '^nvidia,tegra[0-9]+-ehci$'
>>> -              - pattern: '^nvidia,tegra[0-9]+-udc$'
>>> +          oneOf:
>>> +            - contains:
>>> +                oneOf:
>>
>> No, this does not make sense.
>>
>>> +                  - const: chipidea,usb2
>>> +                  - const: fsl,imx23-usb
>>
>> Look here is a place for your compatible... unless imx93 is not really
>> compatible, but then why pretending it is?
> 
> I can't put fsl,imx93-usb here since imx93 needs 2 clocks. So I add another
> if-then limitation for imx93 below this part.

Hm, ok, but anyway I don't want to go deeper in this indentation. It
does not make things easier to read.

> 
>>
>>> +                  - const: fsl,imx28-usb
>>> +                  - const: fsl,vf610-usb
>>> +                  - const: lsi,zevio-usb
>>> +                  - const: nuvoton,npcm750-udc
>>> +                  - pattern: '^fsl,imx5[0-3]+-usb$'
>>> +                  - pattern: '^fsl,imx6[a-z]+-usb$'
>>> +                  - pattern: '^fsl,imx8[a-z]+-usb$'
>>> +                  - pattern: '^nvidia,tegra[0-9]+-ehci$'
>>> +                  - pattern: '^nvidia,tegra[0-9]+-udc$'
>>> +            - items:
>>> +                - const: fsl,imx7d-usb
>>> +                - const: fsl,imx27-usb
>>>      then:
>>>        properties:
>>>          clocks:
>>> @@ -477,6 +482,22 @@ allOf:
>>>            minItems: 1
>>>            maxItems: 1
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: fsl,imx93-usb
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +          maxItems: 2
>>> +        clock-names:
>>> +          minItems: 2
>>> +          maxItems: 2
>>> +          contains:
>>> +            const: usb_wakeup_clk
>>
>> Drop "_clk" suffix.
> 

Anyway neither this nor previous patch has the entries constrained. They
must be specific, so constrained.

Best regards,
Krzysztof


