Return-Path: <linux-usb+bounces-5604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F5840A93
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 16:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634D72882A0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D114D154BFA;
	Mon, 29 Jan 2024 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVp0sb33"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B001552F5
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706543489; cv=none; b=VRF7so7PtAZAF0kz+LO5FyW7ml7O8DimW792uAVbJYQxNORLD1yKRYot4d9D1rhTfay2tqvj02czWBSWKNltDda5YIZekgURTUJL0UDkTkXjuPuZ4f1ERLRb/X9ZZN3QCLUW9kHrbgO28D2E2LWVpeAoo+4hre/LlD8VxAe0exo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706543489; c=relaxed/simple;
	bh=oOvzNfF73e2joVBo8Ybo3BCKHYDYx6txLFAuIMhEmnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYPsrUqifXfV0nSt4qSjNFTIwcVajYOfzWkrheuWs+hLYb4Ufq3tiFJhIlcIjYHzOJ/ooK/e/EOtT4IJ70OGeS2uJncfj/bijQgTgVdty+1/0MxdxQz20KNAOU+pqrmw0K9aqzF9WB45qFDQ96kiuPLecFn/kT2jih/EB+sjwvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVp0sb33; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-510f37d673aso1819968e87.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706543486; x=1707148286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmwbI0YzgpbbbbOY7anilQpKAyST56aNxm2sGbBhuJs=;
        b=pVp0sb33T75qregCHgFGM5PyfzrVIPeWdt4hzDtVk0CMiObVEgyDbt0s5dK/yfi1eB
         Jf3nby7jJAcXdnRa/L6UDzJeL9CNZf4fiyYu6894vBfu4PCrxL0r/2FnCSkDrIjIx7EW
         BbZu/9rlbAHz8xinu4+ovXCI6o/M6EC89RcqmjvpiEz97fBQHkIbMlxwbIUtp+DtoM7p
         eB7lGGa8EV6dZurriBBQzbfzCWvgkLRSBd784KaE7m7ROnHwqkhdg845o8QnTmRrHQyn
         rtf/Kgyvk0AHepTo1/zVYmTP9Oc5ppagcf3RCYYyUrtB6NmQMya7mZb+MZrh+qrhrF1W
         IGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706543486; x=1707148286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmwbI0YzgpbbbbOY7anilQpKAyST56aNxm2sGbBhuJs=;
        b=iBaI2bY5JKMkou1AiUgUjgNvWupKjZ8Uv3V4E+sjYx8nL5KTvr4D5154NyEQdHZOvQ
         XxZjl25PvIE27tdr/nL+yDpOFSFb0UM9r3xikFbV1H/SzHB850miSvbTsG+PGdyd+QoS
         OpX5+kkxxHKYkx7DZvHebPd0gbT63u/r3oXwYcOvPH9U+IX5cM4IidB28++CuBI9nqDg
         AfiYXPeXEvC3D/II366WNHJhw43d/yy4bRGyo8wrjXfy0VDamj3ahQVPZuR3/yvEwpK1
         WzMGsOtdLs5vx0+ZttRCV4NgcQ2w3WfqOHLh2Bv0JxgBda9hErxaH9WenwnKbpUv3w16
         VW9Q==
X-Gm-Message-State: AOJu0Yxm//1jr6whsjMHQC4YQ6YZlO08fsX2pmHdInB5LNzOmApDqxoJ
	ODhwltU7Z/EOm56eoUYPFnNp9o7BPqVjZ0BZHKk8H6fpXR4A26ml8Cop7K7lNbg=
X-Google-Smtp-Source: AGHT+IH4kgHYi9zXU49lL1gmy8Vw2c/xTSQjTta7ZuyPeWHxYFikwJ4TuFAvLgERkE8NReXeHgL5IA==
X-Received: by 2002:a05:651c:b28:b0:2cf:34ce:67ed with SMTP id b40-20020a05651c0b2800b002cf34ce67edmr5724325ljr.44.1706543485788;
        Mon, 29 Jan 2024 07:51:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id bt8-20020a0564020a4800b0055ec36a811bsm2550221edb.18.2024.01.29.07.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 07:51:25 -0800 (PST)
Message-ID: <a33723fa-6fae-44fc-899f-797d24c7f776@linaro.org>
Date: Mon, 29 Jan 2024 16:51:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: usb: ci-hdrc-usb2: add compatible and
 clock-names restriction for imx93
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-imx@nxp.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jun.li@nxp.com,
 linux-usb@vger.kernel.org
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
 <20240119071936.3481439-5-xu.yang_2@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240119071936.3481439-5-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/01/2024 08:19, Xu Yang wrote:
> The i.MX93 needs a wakup clock to work properly. This will add compatible
> and restriction for i.MX93 platform.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - add clocks restriction
> Changes in v4:
>  - use 'contains' rather 'items'
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 47 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 78e30ca0a8ca..a86cb5de1688 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -57,6 +57,7 @@ properties:
>            - enum:
>                - fsl,imx8mm-usb
>                - fsl,imx8mn-usb
> +              - fsl,imx93-usb
>            - const: fsl,imx7d-usb
>            - const: fsl,imx27-usb
>        - items:
> @@ -455,19 +456,23 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            oneOf:
> -              - const: chipidea,usb2
> -              - const: fsl,imx23-usb
> -              - const: fsl,imx28-usb
> -              - const: fsl,imx7d-usb
> -              - const: fsl,vf610-usb
> -              - const: lsi,zevio-usb
> -              - const: nuvoton,npcm750-udc
> -              - pattern: '^fsl,imx5[0-3]+-usb$'
> -              - pattern: '^fsl,imx6[a-z]+-usb$'
> -              - pattern: '^nvidia,tegra[0-9]+-ehci$'
> -              - pattern: '^nvidia,tegra[0-9]+-udc$'
> +          oneOf:
> +            - contains:
> +                oneOf:

No, this does not make sense.

> +                  - const: chipidea,usb2
> +                  - const: fsl,imx23-usb

Look here is a place for your compatible... unless imx93 is not really
compatible, but then why pretending it is?

> +                  - const: fsl,imx28-usb
> +                  - const: fsl,vf610-usb
> +                  - const: lsi,zevio-usb
> +                  - const: nuvoton,npcm750-udc
> +                  - pattern: '^fsl,imx5[0-3]+-usb$'
> +                  - pattern: '^fsl,imx6[a-z]+-usb$'
> +                  - pattern: '^fsl,imx8[a-z]+-usb$'
> +                  - pattern: '^nvidia,tegra[0-9]+-ehci$'
> +                  - pattern: '^nvidia,tegra[0-9]+-udc$'
> +            - items:
> +                - const: fsl,imx7d-usb
> +                - const: fsl,imx27-usb
>      then:
>        properties:
>          clocks:
> @@ -477,6 +482,22 @@ allOf:
>            minItems: 1
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx93-usb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +          contains:
> +            const: usb_wakeup_clk

Drop "_clk" suffix.

Best regards,
Krzysztof


