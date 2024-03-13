Return-Path: <linux-usb+bounces-7913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB487A36E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 08:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690D51C21730
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 07:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D73717541;
	Wed, 13 Mar 2024 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgtJAG9r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277B1642C
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314754; cv=none; b=kAA48tYCqtnS2vfpJE9ooiZVBYJsX5/KYVo0QdJAPz08o4ey2S6/y7dB6/EXq3blRButEhUOqDIvAosouGLLHfZ4b8nrbjNdIccqgcHJACv8xJie1BUldMBr36eKBZ8YC881FPc3F8s8lL7p1hRGLukXoknNawctFUDEN/4s+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314754; c=relaxed/simple;
	bh=VEqmL5Ne9KOn5rq07Wpa8GpmnPzEbf1JTqgmJDSO/ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKZSmTJM0zGamNFDL3AkwP2SwmBVl14JjD7HLRDhHjuJGx25kl0iu2EI2bFAcYeB2PhCW2PB4vgJ6qbDUBBUt34EUfcf6TAqspGT/QNHLL4uzDidAvlQi3FVwgnnbBYVw5MkWWtZogNe2Bz5EKqsLfEWZH0eKOFzYk/sP1OuUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgtJAG9r; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33e162b1b71so6008805f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710314751; x=1710919551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4f/Wzyuh+kfmQLlcLwZAIA3JEBqEBBGm25AKo4O3s/Q=;
        b=GgtJAG9rtd8jRZghsUtOqIJnu47+NDOUObpBUTGT2EBRCYJmrrNOshDw5LKV17NgBG
         PgABSQvkNN7Kc6OjTn4Gd/lh/9N26XyNyvVwZmjs1416N5mxbxVWrxKS0terORDf41tr
         HBHla9FjhL2oRkhKUlAvBPbHI95FqalMufXq2nPzQFVMqPZ0J/Jb+3vpauQnNJZuCnUE
         PIeyyZkeCr5V0gqeuvJoSN6Nfqf5qgGeag7My4IMhQJLIRx+v3r70qSs9T5ti2hFhvih
         /L0GkEzpvkYX1J1rc7KZsZWK9Wc5nIpGkHu0FAJ2oea8+r0PnUTmBvOtJdswGqumKk+S
         vVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710314751; x=1710919551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4f/Wzyuh+kfmQLlcLwZAIA3JEBqEBBGm25AKo4O3s/Q=;
        b=ga98M5u3Vr1pMGuW+vB1B1V9l1TRaA7C2IA332Gazad96j9SnW8AEH/OAnEwgSWzC9
         gRURUzW67XKU6WHpeurXtUcwaJmmphpt6IVezNFNRAYqNIv4Eo2hCJV1miSQpFopgjIT
         D+gT21aT6S6ggM2+t0HMpexv5OW4quVQ3VZEp2tKdQ/TJJ2qD0nIEtNiaEnmSybX06Oe
         U2KyVlFSv5ovYLjcbmtXpxsDUj/UrIubHIzoD7WmZNSojlurjRqv0C1fdRj2gVV1LVTy
         f4hmUqr9LwzmI9rEt5WSZy0EyYsSv2EQGJt2bozDq93YnKgfZ4uIyw2VYdut7as79kRS
         8j5g==
X-Forwarded-Encrypted: i=1; AJvYcCXY6Bundi35x2R1jLkrwG0dn5cNd0aH/G/Vqy0aEALi+S6Zc2Eh0AILPHPRQZmFRqUoELelot6n9ANN5dwJ2Uak4ZgRmE2lTqgu
X-Gm-Message-State: AOJu0Yy2FgxxHo6/D2196I8e9jIcvVXl2+x1pnrPblBUMdVSK/uqv8Jl
	a3cieN2UIb850U9+7OKhov70A76+C65DBAPEcBpRtTIxurPl6GHaHpO0gwkFNnI=
X-Google-Smtp-Source: AGHT+IF7IhzIp3utzAj870J4x+R9RBNUhiPa7qzNaxtXS1ubCoEScQXADnEXq6xpvfP+yDe/EsIoTg==
X-Received: by 2002:a5d:6da3:0:b0:33d:87e9:5900 with SMTP id u3-20020a5d6da3000000b0033d87e95900mr1142638wrs.62.1710314750828;
        Wed, 13 Mar 2024 00:25:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id r10-20020adff70a000000b0033dec836ea6sm10902481wrp.99.2024.03.13.00.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 00:25:50 -0700 (PDT)
Message-ID: <fa0ae368-7383-4d50-b924-67f10af75ffd@linaro.org>
Date: Wed, 13 Mar 2024 08:25:47 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v8 05/10] dt-bindings: usb: ci-hdrc-usb2-imx:
 add restrictions for reg, interrupts, clock and clock-names properties
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "peter.chen@kernel.org" <peter.chen@kernel.org>, Jun Li <jun.li@nxp.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240312091703.1220649-1-xu.yang_2@nxp.com>
 <20240312091703.1220649-5-xu.yang_2@nxp.com>
 <20240312145035.GA2204647-robh@kernel.org>
 <DU2PR04MB8822976F9F052E18D7951FA48C2A2@DU2PR04MB8822.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU2PR04MB8822976F9F052E18D7951FA48C2A2@DU2PR04MB8822.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2024 03:48, Xu Yang wrote:
>>> +
>>> +  # imx7d Soc need one clock
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          items:
>>> +            - const: fsl,imx7d-usb
>>> +            - const: fsl,imx27-usb
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          maxItems: 1
>>> +        clock-names:
>>> +          maxItems: 1
>>
>> What's the name?
> 
> Can I not specify the name since the macro definition for USB

But you must specify name or disallow names (: false).

> controller clock in clock.h is recognizable and the driver doesn't

header has nothing to do with it

> get this clock by name rather index?

Driver does not have to take clocks by names, it does not really matter
to such discussion. If you provide clock-names, then the name should be
defined/fixed.


Best regards,
Krzysztof


