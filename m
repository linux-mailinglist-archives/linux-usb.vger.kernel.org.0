Return-Path: <linux-usb+bounces-6903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6185FDE1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 17:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24FF81F260BA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4244915099F;
	Thu, 22 Feb 2024 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8DQOiir"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171914D457
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708618792; cv=none; b=LsxiUGTrnVX3jxTZO3mBUwTqnKIX95DJeA4pGY6uV5WC+LOK27P5UXR9mkfermB6cSVQ5PSBPIrsfJ988Wn5O7SyG1rTX5camPxtQF+f8ehDlu9kMY6AGTz0/7HpUfSDmLHk2sZe7LNjW3CPLgLUTezfVoqOgMHsF0eF8R9pBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708618792; c=relaxed/simple;
	bh=1pW9/wqs6T+ZFUgQVVGfPgOghYjuLzXUH0MDZwgQqM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0VN4H6c3DJmliBwX3Z/3ZOdv5wR8dsqc1WNRw1d0wmrjuFvLSJvQjolaveGoUGBOkPPuONeHLTVja04E3IEVB6N8xoBYu2gvzc0YYpvqEccu4efWiPHOr04wR+7xugmE/PeAE0wzNNzF3y+ZV7GPhTFhSiB4+xFLJ8fq396RaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8DQOiir; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so2902897a12.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 08:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708618789; x=1709223589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5w27VNOs5/uxzHBOfJnfDu6qPKPl+gXMKhUjXUHD/ZY=;
        b=F8DQOiir02lekIe0MU8ZCYRVK355do75p4+fes2cnvQu7w3X947r6JZxOjUbmT5Z9f
         XFGWWaE9TUlMGX+yGHsoQtsaPPxrU6GQyUHlFlnxechw9H7rWy+BUGpmXlwVFM5eakjP
         xsrQ1RenyHLns2Ln+d8X4We3ujG9VXFMkGcQV5PosZBlDMc/PjXP405NKnbzxcbk42aP
         mjfiZqPI4yBmDqZwJThyg+v0g+0U67zNWaKmiYIAUKT9SS7MtIS0ztR0DzJvUw9K53rn
         SZ2ao26aRwXm1FZrXH4zWyZdrHWC768tALqh2TqslOBnOFjMYfQHs0RC30QSGMw6lUkd
         x/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708618789; x=1709223589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5w27VNOs5/uxzHBOfJnfDu6qPKPl+gXMKhUjXUHD/ZY=;
        b=H2XOAXafNg4Z01hegGF3SUWQRElEN+AMrytdcI5nHO+UtH/Cl97bnzx7hXSDF+LN0y
         gquF2QlcCBgW9qmLHgqsOBc9O9LizcCPwj+7cTV99n8BEeaSM71mR38hACPY4gsnIpFI
         OVd4ckner7ooK62uZa2xaE9qveBTeo65eWkphm2hvU/h3sY3P0oFaFxYOHhTt29V9RPf
         22Dbafwde2bpAwCz/b6+G03vd/rp1kwgGJCSlZNQC2e1qkz1xrj069FGJPmE7Ov8315q
         qz029r2X+e0YVfQtZMh4MURHNt5Qo7A12mfX0y1lvp6BddnMSytj+80DRGycG0UboTT5
         DASQ==
X-Gm-Message-State: AOJu0YyEyV+E2M19f1YilHgloBG9/RPj5JHEaGYZtOCGpBL3Q836xoPC
	MjX5/fjVKHEEr+nRPDdRqWyjUnnLo4A85nLr4z4Sn+A+lsue+/NHcBmkH+A45a0=
X-Google-Smtp-Source: AGHT+IH2RqCtTkjBEK2VTEP5OMNOWsOA7B3BRsI3UAbZyjVfet8G+h/Q878gSNgd6AEtblqog6G2hg==
X-Received: by 2002:a17:906:5907:b0:a3f:1d89:61d with SMTP id h7-20020a170906590700b00a3f1d89061dmr4486998ejq.42.1708618789297;
        Thu, 22 Feb 2024 08:19:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id x19-20020a1709064bd300b00a3cf168d084sm6090410ejv.165.2024.02.22.08.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 08:19:48 -0800 (PST)
Message-ID: <4e464a7a-6a38-461a-b03e-442cc43d1719@linaro.org>
Date: Thu, 22 Feb 2024 17:19:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: typec-tcpci: add tcpci fallback
 binding
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, jun.li@nxp.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20240215212852.1202339-1-m.felsch@pengutronix.de>
 <20240215212852.1202339-2-m.felsch@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240215212852.1202339-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2024 22:28, Marco Felsch wrote:
> The NXP PTN5110 [1] is an TCPCI [2] compatible chip, so add the fallback
> binding.
> 
> [1] https://www.nxp.com/docs/en/data-sheet/PTN5110.pdf
> [2] https://www.usb.org/sites/default/files/documents/usb-port_controller_specification_rev2.0_v1.0_0.pdf
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - rephrase commit message
> 
>  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> index eaedb4cc6b6c..7bd7bbbac9e0 100644
> --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: nxp,ptn5110
> +    enum:
> +      - nxp,ptn5110
> +      - tcpci

That's not a fallback, but enum. Fallback is "items" and then you could
also send a follow-up patchset (separate, so Greg won't take it) fixing
DTS (if not, let me know, so I will fix it).

Best regards,
Krzysztof


