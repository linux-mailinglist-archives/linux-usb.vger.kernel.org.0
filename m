Return-Path: <linux-usb+bounces-3121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B8C7F3490
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 18:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D50FB211ED
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4476251C4A;
	Tue, 21 Nov 2023 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsRWEsu3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8FCD1
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:11:32 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so2483316f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700586690; x=1701191490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgFbKfkjpZtFOV10mbTUGv9+qoi/gwRWnXzscISkKgY=;
        b=TsRWEsu3ET6JsXtWYWgk11DFXnUgotdStnas9z74PlP1Oei4nHHWuXhhU4vpSxw6pR
         fh9du5L9Bg+r+pSQrO8MIub5Jo4NY41S5+I5Tjucfmch3O8qK0z1yDrzp74KRLbPcK4d
         CtlRTon093FdUpQ1a8bQdPiZnOa6XOwzf50rejsUtzWEZbabM9xQfGBoRvIO8+dcrOx9
         ev7zqYCL0N18RD1AZXwtHRXNsVt3OPI1SqUhuCgzVdrvK2lREbe/7uInOTlc39rjoYyV
         o0TXB6xVgOMrPstZQWgHQsdN5UjMq0idOKkd8p2Pbk5DBQrccoA0rTg6lXysumXAhSeL
         ZTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586690; x=1701191490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgFbKfkjpZtFOV10mbTUGv9+qoi/gwRWnXzscISkKgY=;
        b=pw69azACSolxOFBqgvARj+2UlbN6XT0PdHkvQ/m7Jr5+tbqDMgcAIddXpkPaNGUYCx
         JE5Ss3aUDwiqWvYBFgxwQmQxqSQvLsWhJoCmnzjqVQJ9SU0DsG7N+jTlZ/2HGABRbWjC
         E9zHE68cbo3x3UwiqEhJlIlPGR9t5zjKDz4gSv0wXytSCcMVL3JYjOMlZL+1zRccM52A
         8LOW+PG7NLjq/Fa9d5Os+REkuUp3jhV2xRGwShaZ7d/eL79QHNvarOmqDiNRreHckJYu
         3F3ZnrDarao7DE2Ha5CMs+eXaqGribhw5HI0EpYS04OOedk2w7Jg72Ca7GxLqHX/GhG7
         iztg==
X-Gm-Message-State: AOJu0Yzrn7RqEnqtJguQS0IRnBBmVOtW+x4dCh8ke1a8n1YAM+oLOtYe
	VlDBjywxlHi8EsYBMoUiicskcQ==
X-Google-Smtp-Source: AGHT+IFEF+2UvblgUygMu/dhxGgzchedTSnMGRy5blKYbvReq+NnknB4FLE+rv18GRO7oNfUYrKrjQ==
X-Received: by 2002:a05:6000:2c5:b0:332:c377:aeb7 with SMTP id o5-20020a05600002c500b00332c377aeb7mr2891487wry.5.1700586690518;
        Tue, 21 Nov 2023 09:11:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d6a8d000000b0032fbe5b1e45sm14719065wru.61.2023.11.21.09.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:11:29 -0800 (PST)
Message-ID: <d0cc33d4-2b1a-43cd-8cd9-6b58d6c71c85@linaro.org>
Date: Tue, 21 Nov 2023 18:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
 <20231120-j7200-usb-suspend-v2-1-038c7e4a3df4@bootlin.com>
 <6f0da181-717c-4b14-ba3f-d287efe4105b@linaro.org>
 <CX4NADEZZEO1.3TXPVNOONKBCF@tleb-bootlin-xps13-01>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CX4NADEZZEO1.3TXPVNOONKBCF@tleb-bootlin-xps13-01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 17:53, Théo Lebrun wrote:
> Hello,
> 
> On Mon Nov 20, 2023 at 6:32 PM CET, Krzysztof Kozlowski wrote:
>> On 20/11/2023 18:06, Théo Lebrun wrote:
>>> On this platform, the controller & its wrapper are reset on resume. This
>>> makes it have a different behavior from other platforms.
>>>
>>> We allow using the new compatible with a fallback onto the original
>>> ti,j721e-usb compatible. We therefore allow using an older kernel with
>>
>> Where is fallback ti,j721e-usb used? Please point me to the code.
> 
> No fallback is implemented in code. Using a kernel that doesn't have
> this patch series but a more recent devicetree: DT has both
> devicetrees & the kernel will know which driver to use.

I meant your bindings. You said - with fallback to ti,j721e-usb. I do
not see it. To me the commit description is not accurate.

> 
> That is opposed to having only compatible = "ti,j7200-usb". If using an
> old kernel, it would not know what driver to match it to.
> 
> [...]
> 
>>> --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
>>> @@ -12,11 +12,15 @@ maintainers:
>>>  properties:
>>>    compatible:
>>>      oneOf:
>>> +      - const: ti,j7200-usb
>>>        - const: ti,j721e-usb
>>>        - const: ti,am64-usb
>>>        - items:
>>>            - const: ti,j721e-usb
>>>            - const: ti,am64-usb
>>> +      - items:
>>> +          - const: ti,j721e-usb
>>
>> This makes little sense. It's already on the list. Twice! Don't add it
>> third time.
>>
>> I am sorry, but this binding makes no sense. I mean, existing binding
>> makes no sense, but your change is not making it anyhow better.
> 
> The goal of the DT schema pre-patch was to allow all three:
> 
>    compatible = "ti,j721e-usb";
>    compatible = "ti,am64-usb";
>    compatible = "ti,j721e-usb", "ti,am64-usb";

Which does not make sense.

How ti,j721e-usb can be and cannot be compatible with am64 in the same time?

> 
> I've followed the same scheme & added both of those:
> 
>    compatible = "ti,j7200-usb";
>    compatible = "ti,j7200-usb", "ti,j721e-usb";
> 
> I messed up the ordering in the added 'items' options, but the logic
> seems right to me. And dtbs_check agrees. Am I missing something?
> 

Logic is wrong. Device either is or is not compatible with something. At
least usually. We have some exceptions like SMMU for Adreno. Is this the
case? Why the device is and is not compatible with some other variant?

Best regards,
Krzysztof


