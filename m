Return-Path: <linux-usb+bounces-23173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6CA91299
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 07:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E455E17F840
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 05:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4431DE4DC;
	Thu, 17 Apr 2025 05:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArRtu7vJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960B1D79A3
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 05:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867282; cv=none; b=Pvb55Ip7mzVjXYwK0kTPJifegUG9qdmWFaXeno26RKkarGVnase9jdeFeVw2mXtXFKDdad8Qi6m25cZXUU8861tzvyHNk6s8csLIar6bqXBp47lN4EBq3k4tO1OJCG8QAFP/UVeci4dK4X+jsKYwRK3ALNx2YCPauwOFKPPMAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867282; c=relaxed/simple;
	bh=w+h3e7TAQoMqlc5nMP1JuizTOm6Jiu3Qh7PHYAdONAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs+gbQkZP1A/r+ZC1D1toI2OYrHeHEHqZmZdmXN46Ynqyuf+lRb1YEECxiH3DYYAz3k/zfKsYO8cCiZO2Pz7T9hKtUDQOmY56Zr1v6WsX3CxqMtP4Z6OhMSgwV2EXlj6xmW3eWrwySV/EKW3ggd7z4WcFchDblyDNblvgARvi7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArRtu7vJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so592465e9.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 22:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744867279; x=1745472079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o++10cYSh79bhm0RrT5ei8xFI36hOzbtcQx90u0B7PY=;
        b=ArRtu7vJNktQoZvEOmwFpcGXzuhaLT0h53TRzgHKZUjQefrzFNYkKehoKTu4tLaQ5z
         m18GN9mUJcZt3NNE7PKNgJ599SqTwQbqfAMQphRncA+d5MRmZTEPCrJcpQQSNYw7YCdG
         MK1CiouxiHczuhGlMNQ6VnEbY4KWEHyHQGOKhHZHtOvnOE20XxyICkBSYAeHoSQb25u7
         3tzLq+/CCR40iI9luFnyxWZl2Wd7No9ToKx1Kjb3fFwDl3oJupu/jWpgw0kdWs8/ipM+
         /NTTAngQto2yanzr9mp2hvXSzsFUltr9eyVhpJ/vXScrzkaXpsn8QpPwzlyhm1D2G+az
         x5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744867279; x=1745472079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o++10cYSh79bhm0RrT5ei8xFI36hOzbtcQx90u0B7PY=;
        b=ivgvwAp+jrhaYbsG4RCFbUDVA3r/nUJgPVLPM6pjUwDoWp4tK/rQykgJUwr2ysqCcR
         bLPYOLkIjHU+CyCgXmY4gQMvKR7TleOCFDDmc9IscOsqrknsoYZGuVpquNAuxI9sAwLD
         FhLlWaymSV3//g6bNF8iHCr45O3/y6l52n8Ks4jQIacBSvnNoQi/h2bKna61nhIdLTC1
         J/X0TCC2+5fGc2fdmhS4adJpNhrFOkZaez5FLFx3D8cx3mpGu8zhfIGzy+XG+NAPLJvY
         w527l3GIlEAUvAywgCoQw5/RBj1DiZSFGfElirVbDWqXnE94KmKkMD8kcpyz65X+Jlp9
         NqAg==
X-Forwarded-Encrypted: i=1; AJvYcCXHiTK/sdit0LLozUsiv2+vVC5QxJHI2mD/aInD4cFeUxE7XFE8q8n7y1As8okRf5QcMmX68/FCeaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHq8pGmjJ6TlJ3PQKqjKY69RTf5xOcn4Oj22hkON7C0aDwBU/
	7DU2dEPjb0rj9x8039gDDx62vhQ5Bs0D9Xmd2yVQcWF6Txa/Ph0NHxVMb0Pya2E=
X-Gm-Gg: ASbGnctnM5clMgs9+O9ZORM2Nbfb4mfHQJSPIPDhLZOg9w6hYTDlSuL26cs71VxWUbS
	2vTJItUYni28AQtSGZiZJmdIx9RknHXzdho+8wVjlHKv2H+KWt4c5EnrH1ROmVCSXrT5fLcEIQi
	epOm5Kh8p41dpISHHvCSlOYw47j1+0SpLuFLA2mG6k2Wk74Y8AN+ZVfmPBNV7a6jTGTAXoiXN82
	9D5uvN3Z3rZng9D8E2yJyODfUM3LT4IgDPjUCNM1a93zOxQMaAPR8ODi2IjIrGTmpIKguSXtr1l
	m2z1GwcH6WD8+2Q3LOv6PuGyQ6JN0cPXZzKJm68/qJGmCLrWeusBxKmCd63uEi9PDvKcMg7vFnA
	Ixpsp1BB5UajL/Sie
X-Google-Smtp-Source: AGHT+IG97hp14t3RXVZ1cJfeRsanAmICn9QFKZ6rXurlpJ44PlwtjIyFWDhnuYgoSl2UBx7U+PpAtw==
X-Received: by 2002:a05:600c:1c87:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-44061e5adb5mr6327035e9.4.1744867279327;
        Wed, 16 Apr 2025 22:21:19 -0700 (PDT)
Received: from [192.168.0.101] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8028sm40044775e9.8.2025.04.16.22.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 22:21:18 -0700 (PDT)
Message-ID: <b3d4e576-f68d-48d5-a2f6-e61fb44496eb@linaro.org>
Date: Thu, 17 Apr 2025 07:21:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: qcom: Add Asus Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
 <20250416232345.5240-3-alex.vinarskis@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250416232345.5240-3-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 01:20, Aleksandrs Vinarskis wrote:
> Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
of patchset, under or above your Signed-off-by tag, unless patch changed
significantly (e.g. new properties added to the DT bindings). Tag is
"received", when provided in a message replied to you on the mailing
list. Tools like b4 can help here. However, there's no need to repost
patches *only* to add the tags. The upstream maintainer will do that for
tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

