Return-Path: <linux-usb+bounces-5757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0A8469E1
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 08:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 650801C2529D
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 07:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CFF17C67;
	Fri,  2 Feb 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2B172tE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024D17BBE
	for <linux-usb@vger.kernel.org>; Fri,  2 Feb 2024 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860599; cv=none; b=TCeGXsTbotzcsAokvAeG9Hnu40XrOBLAm/6vdlQZktudxHOyyq+bl5rqch/N89EGtoxfjNqzbfDalVJKsDXjaUJ9tiwiQxihbpuwK1zFCpknQM9OJuv9LICHTVgXHx7+owfm2wYF6mJEI/cki6IxmtMw8FHdLi5lyk5T5vRmn5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860599; c=relaxed/simple;
	bh=Q2FR1EDi3AVmfHPQqnIWVurAiEaqZPF0rseioLM1zEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMokHAuOUK5+4CyVbDA4gxhJ9uH7ipf1MCvkXD/NcPCBCAtA6DHqX9ylg9uIM6ZxBCvgYpsv864GIhZuc5wFnlzaQx1yWn74akzmjPeDVHW0llZ+T4ZiHEH2NeH3Q2o3FKOr3TAjsO1xQqq37t6SOQT3DCl9/DaAJvaS9mFlVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2B172tE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55fd5f67f03so1456391a12.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 23:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706860595; x=1707465395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUdqA1v/MN2ky8gHE4yini02xkS4ocndoCeKQSzWx7E=;
        b=K2B172tEL605reIGco00i1NRhaQ+sfCGYaxKSH0hKQiY2EgSx9xA1l1pQMNdcJ9QpC
         KmvxjbgkfLpr1P54oeablaQf2T3+P8pXmDVtPtQbxz8hGTJclanFXrUHcZKkYrY1TcY/
         ZvmRCaz+xaPJZpNaQINCcrmkey6thPHv7c4wqG9q2FK3T/od8NT0JB/yXVRozOZGNr6W
         0p9ecx8iNKZ4dXF7WcpRPLm9xAJJykDhmGBzj/Zq8fR3ZICrNhWIWD4vjNoNdPtO4csZ
         MVhBTEy3ZbnCzv534aBzlLjaegmPg/1eGmXFAcypZoD+ePy3OQiXol/2zna22LK8hI8M
         KmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860595; x=1707465395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUdqA1v/MN2ky8gHE4yini02xkS4ocndoCeKQSzWx7E=;
        b=Dl1tHUnUcXrLgVMeGyaoAxMm5cQIiOnp3K5Rm/aF/AXLWgJZD96lpD5lqhy88hxdWj
         JXk7us3QQmmV/Uo1umvFZS504uQIX9FXNFEc7SElhDIW7Rxdqzec9ydq7mv9dhcVMOru
         fWqhuMF/0jUQAXgEyI2NjvdJ/5w8+bQdwgME9mop9rYukwGyoWd4aY4jqTKsX7pGPI8K
         SwA+ENMIIdi61nBuk1QUmETYa8m+PtEE0rHwYx8ontqTXtuHbl7ewg4iFfoQwS9d14qi
         DQ/Fplgfs7mMvDJtMltMnMJUSi0YSbteFkB24GuteU02pYCwQjoHpHgTBRHbiGf/rzJR
         Hh1Q==
X-Gm-Message-State: AOJu0YwlLYAq/5pvvuRKc3XeS2Tx4QMBAIWo/lcjpo9uupnFmYtt//9P
	gQEXluooKN6QIEpsV58UMrlMCLa3b6JHN/3ST4AECnZMGQgayQEK+RBf39IRMOA=
X-Google-Smtp-Source: AGHT+IEDpBvriMsFK86Wxk4meaHT86ksoEIxjFMCxEalpexKjYvCHmRj5fFFH8aCnBp8b7DoBIkXFA==
X-Received: by 2002:a17:906:408b:b0:a36:3edb:aeac with SMTP id u11-20020a170906408b00b00a363edbaeacmr3552339ejj.17.1706860595674;
        Thu, 01 Feb 2024 23:56:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXU8eexJvlDhHluT6wdqTH46Ac5XJ0ibqvnNESpgE9fabtBGjeh8k3/hUdGA5CVyPpXBbD7+qxILcKbigMoDp8ukWDTI0vaF+X3AdGeCP7H2PUhDMR2ozH5iSiWJl2WCy1KnmHeEsnkX5XB6kIj14yk87kBJgo9Ex0gsy8BKawjbTpsbyxWDF1RkpA0leN85y61gJe5m/Ml9QC+2f+eZH4+cVkSs+H2wTAnRNQG5V1+KDrZ5LsHhdVSuMnPGTPbZcyviEDBwiamV3FVeZvau/POKiUb0QCwmy/FewF25ARTP3V1w+vAwhXkhkQEgNrtNIasMG8jgBnTsHmxf4gi4BUMX+qanNPlwsku1Smj379eEP7TO/7UaF/RcRdKLOMcXKyzdiIiWbJJnv4ZE1WqiSKMaybj3FIaKhtxXBcrLOnG9XiIcQ6hqPZ2y9llAnXCCB+FCrj4Onxu2sT7bT6Rmue88F+PdjVdjvcrLzvzXhPm8Vlt
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ot8-20020a170906ccc800b00a35d6482fdbsm612246ejb.77.2024.02.01.23.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:56:35 -0800 (PST)
Message-ID: <41d1bc21-ea4a-4af6-93a6-b498ac1896ef@linaro.org>
Date: Fri, 2 Feb 2024 08:56:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] dt-bindings: usb: ci-hdrc-usb2: add compatible and
 clock-names restriction for imx93
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, peter.chen@kernel.org
Cc: linux-imx@nxp.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-5-xu.yang_2@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240131114324.3722428-5-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 12:43, Xu Yang wrote:
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
> Changes in v5:
>  - rename clock name
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 35 ++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 6ad3582051b8..12466f7af00b 100644
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
> @@ -486,7 +487,6 @@ allOf:
>                - chipidea,usb2
>                - fsl,imx23-usb
>                - fsl,imx28-usb
> -              - fsl,imx7d-usb
>                - fsl,vf610-usb
>      then:
>        properties:
> @@ -497,6 +497,38 @@ allOf:
>            minItems: 1
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: fsl,imx7d-usb
> +            - const: fsl,imx27-usb

This does not look related to imx93.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 1
> +        clock-names:
> +          minItems: 1
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx93-usb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +          contains:
> +            const: usb_wakeup

No, clocks must be fixed and specific. No contains allowed for new variants.

> +
>    - if:
>        properties:
>          compatible:
> @@ -504,6 +536,7 @@ allOf:
>              oneOf:
>                - pattern: '^fsl,imx5[0-3]+-usb$'
>                - pattern: '^fsl,imx6[a-z]+-usb$'
> +              - pattern: '^fsl,imx8[a-z]+-usb$'

Aren't you adding imx9?



Best regards,
Krzysztof


