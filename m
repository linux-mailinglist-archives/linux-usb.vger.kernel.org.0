Return-Path: <linux-usb+bounces-5949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C784B7AE
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 15:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D4F2866D1
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF80132C07;
	Tue,  6 Feb 2024 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FlXAsXjU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6FC132C09
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707229279; cv=none; b=HGXQVxqU9HXPORHwOxLds7hGgej+YxLcMeyUH2xHB8LAKLTgf9PJ2y+BeHTrfHrAo3nM0yKN3806sM1NzjR5FGWADqEKpAn+5eB+JEG+0LrerEPt9e3wd9iJC9svopTL+9yL0JxLUUj246j39xRGZUda4JCLvu4g/U8HYWVVdJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707229279; c=relaxed/simple;
	bh=LiejjhJldns9/CwXgjLlx7FUsnvu4YOFLFx4q37VyFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiM0Sc21Hr9DtLIF9icyd2nsmVnddUhskK9p8+ygeiL3JpI68CgGvN1d3RQEhW0W9eGfHbYFGZaySnxqCKkQRWbRzSkOjeePZA0+jA9WUE8kA5t0ZBDMPeCAb3N6GxaR2geNYYoczuas28EneWWh/gW6K28wN9zt4kzzqk9qwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FlXAsXjU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40ff0bb8592so2669635e9.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Feb 2024 06:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707229276; x=1707834076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEVHEQG5cx1jR636vp5ThpG19lmZOiX7ZO1B1ztw5qg=;
        b=FlXAsXjU5V60LX0hIUlwL2S/+N7Fx+teH5f7DLFS+aI0JPcS6ihJ5dWl53FGtUBie1
         zGF6O2xztYdkf5H1lSOCvC7TV4SAjD4cpC2CBJ9Ju7BrT/+xd8nw9lhqVDKckmrw38xx
         1neQapXimFsgByb13RcfcsmG49asqZ1VXhcZUW8Wgdzb13ISkV3nIJdNF7UiM2AYnfRb
         cl229iPkI1mVEiz01oCmk1jsZtcw6FvOkAQ0DLRvwzUdrBhSjNdQn9/hh2e05is5M0dk
         TmEdxGovwDih+mLVxxttgRZRqfZHiLQKfZgGZzTpCEw0aJ1KkjqEdybQROBPbotV4Wd0
         K+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707229276; x=1707834076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEVHEQG5cx1jR636vp5ThpG19lmZOiX7ZO1B1ztw5qg=;
        b=bQ682MdE8hmKSbXjH7OxX64nSCNRZ4m6QsO67dOaKKwCo3KZstEav1yT2LJX3HaQNh
         Jb3jzoHo73DYq4hU5XID8h3XhjBEwYVfDemw2iL8+4C0O078ynPL94sSa6FXCVDr/uNl
         pWumz0UwtGiiIhvgd2H+CWmTzSZKst/tGNzpPwKtOWJD2CXWK3OU5LjixEugyiPc71dx
         0Hr0Q024agKLi79sFQDkUBXwklH88aHiuYYLY95zg5exdxdCsYhOEMFi6RmXlzgK9obu
         9FglSNPW1uwq8zANBLMbwkvKkLHU3vzWL4kFtEOaGdHgehhO68OknGpWFzeDiu+rtWPb
         hqaA==
X-Gm-Message-State: AOJu0YwCd56NV7NaqVajlj3SRjgEeMQkk1+OkbrnBKW00RzbgTe/4unZ
	l52BOVxDmT7GLjHpNTaa9U+QNb0Crh7zn06Dkqky/wQI+AcT3xIG7z99ly10dpg=
X-Google-Smtp-Source: AGHT+IGPshfEwBYwLXXWgXo6v6L8NEAjSjC6TQD/K2/S6Mq7EkLsOS1fm8ey4YLENSjuiUe8VW9hpw==
X-Received: by 2002:a05:600c:468d:b0:40f:d34d:d4ea with SMTP id p13-20020a05600c468d00b0040fd34dd4eamr2185121wmo.31.1707229276029;
        Tue, 06 Feb 2024 06:21:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrNneTBvrxnJRYl+lqM/RpXBGxO8LDn2U/Srp5BgyTWe/B3JcUn7MusEerL9dsRVS8AcsucZ0WYGaGH+sg6qf8M/+7PaZpnwp6zJYI1wc9x1v1N5tqFICBbx3HiUMxl4kEf0NVO9kHIZqpLMpVUSLuYqHtX9QbIlU0iTxAZbBL6muIa4Lqwf4U0LroCD0fj1B65j9I/nM0lQmHTHkjdYbyXZ+SCsvWF1w45e8osSPElBLLW6UXLP9gwk88ninfxYcEkdH84UKeiBMoLGjt6vNzL+1nt+XDEWFiCvpcOojqZUsaCrAuWDfks9uJhdmzZK5wyvpJ3FPslS0Igy9CBwGzbXm9N1OPfa891NtEqnZFU37Tr9FGdnwe5x7zAg==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id fm5-20020a05600c0c0500b0040ef702a338sm2205087wmb.25.2024.02.06.06.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:21:15 -0800 (PST)
Message-ID: <004dbeb3-f863-416c-a4e4-18739302ae58@linaro.org>
Date: Tue, 6 Feb 2024 15:21:13 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: typec-tcpci: add tcpci compatible
 binding
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20240205164316.805408-1-m.felsch@pengutronix.de>
 <20240205164316.805408-2-m.felsch@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240205164316.805408-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2024 17:43, Marco Felsch wrote:
> This binding descripes the generic TCPCI specification [1]. So add the

Typo: describes.

No, this binding describes PTN5110, not generic TCPCI. This is not
accurate commit description.

> generic binding support since which can be used if an different TCPC is
> used compatible which is compatible to [1].

Sorry, cannot parse it. Please run it through native speaker, Google
grammar check, ChatGPT or some other way.

> 
> [1] https://www.usb.org/sites/default/files/documents/usb-port_controller_specification_rev2.0_v1.0_0.pdf
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
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

I don't think this is correct. First, this is binding for NXP chip, so
why generic implementation should be here? I would expect it in its own
dedicated binding.

Second, we rarely want generic compatibles. Care to share more details?
Are all details expected to follow spec, without need of quirks?

Best regards,
Krzysztof


