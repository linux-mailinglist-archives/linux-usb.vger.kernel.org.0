Return-Path: <linux-usb+bounces-5763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00875846EA8
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 12:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FF851F2951D
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 11:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100B513BEAE;
	Fri,  2 Feb 2024 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpXH16jT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57813D4E4
	for <linux-usb@vger.kernel.org>; Fri,  2 Feb 2024 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706872032; cv=none; b=Iq8ci4jMAoWjGeXduIdUphP0fqWj1nFvPAWu6K9BWol8JPHtbwyUWd20wDpEy2k5E+8w/IZikaJ3rmFkPPadQRJRwuYi2KM/LR7G71u5c1iGqqZrxdDtATsnxq0nV8kcBPnzHFlI5oIYoYbZEHlO25xLqh+b05mbrs5wZjioTtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706872032; c=relaxed/simple;
	bh=LejB3ccJWTExN9bpLvElMGTr7pRQEVT+0jJIcnZKV2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLv9ADqWXtdUiyl/bWEgij/U2hV4HydxpRR1bANSG72VhO/jIpEi9Jcq7MKsfSToN4dGoFslSc74LRHCzEnvbbfzE62xeU9SQhgDnSJBEu0e9Mz8yVXn7iRDNuaPS2kiQc9kUOzFvWuAqLGvfxMo+wckWRkDqUysDRd5hlDgi5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpXH16jT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so2742952a12.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Feb 2024 03:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706872029; x=1707476829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6Kq2nOy4Vcr8k38qRtcVbkqWPpQJBUVq348AmwKe6Q=;
        b=SpXH16jT0P1iDlhTQxUJbbZfifnJQmvAeF+DK8b8OdnVJAA4kSbZY9FIDOOpNO3SSR
         Ev+oWE5Z3EQ0+lqhhSqaVbk2SXyAdm8I0L7oHbX7e04PGcgdK/rAgpIZpmvgbUwSUmEx
         ygB2I8BY0AZOJHAwWB1b0dKMznSU4pXWX8q+HDGFHJOv4UshozdWpl2bvGLjto3ObNfZ
         Z9iRq8CAHwJIXiMB1QICTFXhTFv0q8RTQt6Z5rckSotdujMGs/TGLT5ME6CWj+yUUGCB
         nGFHDN1f9UhB+YkfphPBEspAUfiU4Sq0iBaTqQ/NJN8NQWfTiAnwiV/GAaNpopRDEUfw
         aSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706872029; x=1707476829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6Kq2nOy4Vcr8k38qRtcVbkqWPpQJBUVq348AmwKe6Q=;
        b=tHcz29bN9Brrw8KijsiUmfGWsr4hAE9hKvNp3S0t4o2GHOMOuHtuPYeig6P3fLuN/2
         IhG7s1N7zLIsF0p9chEkekiLkz5LTjCjVTLQ+MYRLP6PPS4+6JArlgYsdD2omgp/hR7o
         hJz388jHls4wLk7D5fYNQi4AhF/568o1o7OMJVJnsZQzrXlFNSu4I9nmjWW/xK8BAegb
         tmWahKHPDXEjkOPU5wfXoB67RCgGz2gSTNvjDw7vWFNCIia30J5aYcHLzBIwHfb5gGq3
         YnDaQsA2JYmdK09T8AqpveGQyLE9EbxKT2pMVqpNrGNUWWfD/dDZynDJml29yw0sGaW2
         TpEg==
X-Gm-Message-State: AOJu0YzJbTymop6VVXOgdZtmUzNMMQw7KGm6H9/hRC93Ut/WgEm2XrL7
	urCfHJXc1DZRAwPWhDECErTTot4CDHcsqLN/gbcuie4cfTjxWyM8t4Qq1yPPK7Y=
X-Google-Smtp-Source: AGHT+IEst/TsjvVAOU/vVVt1OPgkSvqsx9Y8wEYTKYDbYgoqmGZi0fjunuVwsS7Izpu+ufZC6SS5ag==
X-Received: by 2002:a05:6402:3588:b0:55f:11cf:ee53 with SMTP id y8-20020a056402358800b0055f11cfee53mr8070163edc.31.1706872028974;
        Fri, 02 Feb 2024 03:07:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVoyD1ldgjH2feNIenbeNK2twyFwG+4qSx1Fkqu4/h8a0SXLmAzpqSVYsLxN3Vr0Q7NB3T1xrvSRsRys1nc05/AnmSYZWAcx9QR7WgTeIvVR+yBMdWAaAt+9dIe7d3uBL9YB8NYkGjQldWoyCKpAamKa2daAEvEmQl7lq/NdrgwMoCHIfR+79cUUek7ZMUnYqpi8sog9DZH1XNfW5wgOzyHGOhPhSxnCdUqyy4Nd40Qn8t1HaxyIUrFfxoftghTfohWuUahfm8tQLTmBGaMDFdFVxJRoTt09hxGwmcNRvWzohKVMTM3/0BQI4KBfLMmXFsp04iJc6Hbtkt94yThhELnDsDlaQdIg2oD/xLMH0Pms3I94azVtoVtVngUsqmJtFqYcsZOBpQynWri1pNGbqKNxYvpENCwq+RTvNy0tWrOS6E3soMS56fcngjoG9hGoc/g4G9kQxJKxyQfg9MXc8+TM8CTzz32urxaFUMi3LMjuDrF
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id fe9-20020a056402390900b0055d312732dbsm706500edb.5.2024.02.02.03.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 03:07:08 -0800 (PST)
Message-ID: <bcd733ab-ea9e-4ef0-a521-8e6c2023479f@linaro.org>
Date: Fri, 2 Feb 2024 12:07:06 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v5 4/8] dt-bindings: usb: ci-hdrc-usb2: add
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
 "festevam@gmail.com" <festevam@gmail.com>,
 "peter.chen@kernel.org" <peter.chen@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-4-xu.yang_2@nxp.com>
 <a0134089-a283-488b-8d7f-3f59dd938b60@linaro.org>
 <DU2PR04MB88221602EB986D2C2A5BBF8D8C422@DU2PR04MB8822.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU2PR04MB88221602EB986D2C2A5BBF8D8C422@DU2PR04MB8822.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2024 10:10, Xu Yang wrote:
> Hi Krzysztof,
> 
>>
>> On 31/01/2024 12:43, Xu Yang wrote:
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
>>> Changes in v5:
>>>  - keep common property unchanged
>>>  - make if-then more readable
>>>  - remove non imx part
>>> ---
>>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 118 ++++++++++++++++++
>>>  1 file changed, 118 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-
>> hdrc-usb2.yaml
>>> index 3b56e0edb1c6..6ad3582051b8 100644
>>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>>> @@ -412,6 +412,124 @@ allOf:
>>>          samsung,picophy-pre-emp-curr-control: false
>>>          samsung,picophy-dc-vol-level-adjust: false
>>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          const: fsl,imx27-usb
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +        clock-names:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +          items:
>>> +            anyOf:
>>> +              - const: ipg
>>> +              - const: ahb
>>> +              - const: per
>>
>> This would be just: enum: [ipg, ahb, per], but in both cases I question
>> why the order should be flexible? Nothing in commit msg explains it.
> 
> The driver will get the clock by clock-name, then the order should not
> matter. However, these three clock-names should be present at the same
> time. I should use enum then.

Forgot to answer to this.

Which driver? U-boot? OpenBSD? The one in my custom Linux kernel fork
(open-source and published on github)? Did you check all of them?

The order should be strict (or "fixed" as in non-flexible), unless there
is some reason against. If one driver does not care about order, is not
the reason.

This comment applies to all bindings so to all your future
contributions. I really keep repeating it...


Best regards,
Krzysztof


