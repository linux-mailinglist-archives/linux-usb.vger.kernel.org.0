Return-Path: <linux-usb+bounces-5762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922F846E9A
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 12:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7B71C263B0
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 11:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2A613541C;
	Fri,  2 Feb 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3of72C0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD5679DB2
	for <linux-usb@vger.kernel.org>; Fri,  2 Feb 2024 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706871897; cv=none; b=dKeKegGWgMEYgXEPKYPDiDjBDI/yO4J9O4Qm1yLtGY5gYvyGqG46s4tzCdd4ftH7zxp2mD5ePMoxseyqoHgMPwpbNmkeyjaVO9UVCCRCayk7p+GrPjx2w+eCIsJ2hBX0uin6bKJUN6OrCh8C0Tq4iuRhWQ5PCi8Pnm9hqD7F2lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706871897; c=relaxed/simple;
	bh=mLRRrP4/SaUv4Kk76CLKURcna0dez3SVClEe1tEfQ/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRSqxbwk5gh1F+OpMW7UeC7IhxAn0MLplsh2R51O9em4wqNzH/d3R9ORAQ+r4XMaspyLW3o6udKWofTfkSruwZ+u7rliobgy1qlxN1wisQfbZM3W7FVKTY3Botje5saR2k0cTwRNqvebTCyVavcz4aw52Wzaz2UAP6d8CWdc5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3of72C0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40ef6da20feso3653925e9.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Feb 2024 03:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706871893; x=1707476693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5rgiwB/8HBdonmwtrNMsNg5DVvgM9WZyl9v3OJ7a2qg=;
        b=a3of72C0MUx93qxu+/E7euYj/UWgved/7Ejwsb5Lf+R3k0T5i462oaOQnaAVYc6OSq
         l+ZCTBWtOL9rXoM9A70B8TRJB7V9+jRAOaCG0FDxcyX3TLHd74LOaMTCwOE0sjDBIw/n
         6iEtM7Iyj1wlXNoQ/f8kCUjRYrkK8KLyaamWkZpjUUPrb/q4rXFbDtzNSe9MLQgJX4QJ
         Bln1Uu9S7t+x8EUlTIwidE28rQY+prLRJeYP0xXf3b7EQdNGZ5GUEz18oFK7QEXX+l8L
         WDY94bQfj7AWAwYZUNlZlqtVbede/Hg2LE+6oXnxKq9JNh/buRzaB12TmOf0Fcz6IUSk
         klbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706871893; x=1707476693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rgiwB/8HBdonmwtrNMsNg5DVvgM9WZyl9v3OJ7a2qg=;
        b=NPsivijEZMAhmnwlzFK6u9K1N+VMg0HIMy9p+puxGAHBL+ymeQUKaTPX2bo61kN5pt
         5m02jw8SRRAo1YB5bw6HFFXcwHwNZ2XtPolbjyj8IHLjQykEJo3GeayeNCTtxKJql7DQ
         bfM/AQcEpVojWbDt6ShqCasdzjOkPlju1gIXlbWExUCVWszUkVumxLykYlPaBT+bq5uI
         cclkunGvvPSh0QuiK/oS6GLgvcCwKUheuZ+a8xWdzb5Asj93251BtUcVCIvFc/qGPjcR
         FDiBvlKrE1L9597UWFzhiBZYbnqHJO2jKCNuWhPNMdZbjnjH1iEe6LpHQr8Lo+xJyT/n
         jXXg==
X-Gm-Message-State: AOJu0YzP6cJ57qJUWZNeYmPT7cD9PGwcMLmekK706PmJ6rr78Il7uWXM
	4t48VshH7Ieo0FriimnQMxf9PpPg02hXLxiYM1uWSJ721JPQb1htMfWl5mgdJIs=
X-Google-Smtp-Source: AGHT+IEnSUCsn/X74Nuno4eB4In308s0CVHDcBAgmZYx9IXDdA/JpzOX+wtxpeBH0aOgDRIuzbkrEQ==
X-Received: by 2002:a05:600c:190a:b0:40e:70f5:a9a3 with SMTP id j10-20020a05600c190a00b0040e70f5a9a3mr1465686wmq.5.1706871893377;
        Fri, 02 Feb 2024 03:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWYGVQH8IDJO01MhA5n4f7ydfKEHIAT2URqX9ZButGbmjnElgUscBOwaj3eilfV+0guStL23IgJdpkk5M4zjr0geQ39KeE9cN3CfqypjaBtUIgBzR+QDp6mkW+fWBlwTtDaEbIrmO/LIS/sk4Foy9wPZFAE+m8S+ra+qqtOSf38nunrxiWee5oETbW2F4gf167YSMzNqltOE4nv1bl/ugMqDK2Mm69mKzureU/M2Io7lcWYTmuAhKr30V5snUu8PFSRX5sbdqLwZ3a3aNxKHhfXHYOOHoHgJ2f1OKm6vESPzfRGHTNnZWe5L67+mCLUOY3R0z0NZ+846PzHAiP2OUioU9qXKbrofcgW1oFre7PMhoZxGU93z9M4zUOk/OeEWpB/iAqBBb2SwRcoLOde8nDOXhcUiMQN6J2YcD7itnmr0U71yJ9whaI8Ymn3vz3K87xLtS/vOxnXuccE5T4oi5o1Np6POcQqvZlXSEdWcH+Fywk1
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05600c82c900b0040e5945307esm2261978wmb.40.2024.02.02.03.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 03:04:52 -0800 (PST)
Message-ID: <f62289f2-0f37-4e27-bc27-ab6d70dcc898@linaro.org>
Date: Fri, 2 Feb 2024 12:04:51 +0100
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
> 
>>
>> Plus I will repeat myself from your v4. I don't think this is helping,
>> because the file will soon grow to umnanageable chunk. I prefer to fix
>> it at beginning, before we reach snps-schema level of complexities.
>>
>> Please define common schema, reference in this file and move IMX to own
>> file.
> 
> I'm not that familiar with dt-bindings architecture. If I define a common
> schema, then should I create imx, qcom, nvidia and other dt-binding files
> too? 

No, the rest you can leave here. Someone, maybe me, will move them some
time. The point is to move at least IMX to its own file.

Best regards,
Krzysztof


