Return-Path: <linux-usb+bounces-6823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AE85CC70
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 01:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70EAF1F22466
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 00:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FE72A8D7;
	Wed, 21 Feb 2024 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tP9dvjRG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61F63D1
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473614; cv=none; b=TqnyPY6pOijvoVId3w0FsHPMJCdfrweRmW8aZs2PfsgBqNp5l67J8dpKKY4KbWkliggEW9eq/EUJWKg/imnsqbvQWBWXUPThPwqwbD8fDH8ziFmC8Kl/vIPW0bW+cpEtZ2qTISc8Hld9Z6uIy06Vw9oaKwGImAu7kqFrbaX1Edg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473614; c=relaxed/simple;
	bh=Fh6caMkYe61uViFBZBzQ+HmyTX9a3RMrY1jv2LVI8fY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9DaDcoI2IIrRVQDNgwwtj+Ub46abrJGJTnvlYPoP4/JImmTApuBhFxuHb/kE6Ml0GusrqvLMPDVl8TT7N02MWqC6HTRwNxNZclathFzYRe9UBkp7rHUNTj8joxazyU4Oz0snc0h+5ttxtwOtDDoOTEcxuqdXX1ywR5pIeAYtQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tP9dvjRG; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc236729a2bso5736052276.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 16:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473612; x=1709078412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjgCdWgm+jeXxffe5jtC5stBeOHgFK5VxNzXHMdiy4I=;
        b=tP9dvjRGa8D6qs/SBg4RvMSKOdgvrpLLfo3Q74xGDrm3KQIgaQ+uSlVQ0bAny+QljH
         zpToF5iU8qw1HDFHlVwXP+KZetuRRpQOF+MbgDElhCwlTdbgp0Zem9mndnM/TylMSFCW
         tzK1tFTaBRQFPUqnxXDpa+fJPrj/ihiccNFWbherIULl2CoErYcQUKmjQxSqve+RBzd6
         rHDFXZqODdL3vKelIULv4AGuXw3UweKcHm+9EphdcHhuwN4TksywQL1ZV/ANU/6G30vm
         1YQ4P4vBNGVC2Uq+UjQICCG0tlSqn6GkUqiYy8coHh0/xUGcj5fj3DjplFTIUn73YS6J
         WEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473612; x=1709078412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjgCdWgm+jeXxffe5jtC5stBeOHgFK5VxNzXHMdiy4I=;
        b=WfEXdGGBeVjf8TlUzSB/nOffNa30e6s9EgJqrZNwT6vuoVGSyMUptDARVd6QpSN/M5
         Ofq7ICXlTcvVgHph0L/oWPV7E5xzJOsCE86CsID7rETbxB/v/meDnXUPOi8yj8KXyQEO
         KYj0+SCaOuscnUAfUqzCxMAoxE0DsbcJfehIsLtNCKtL0YZdD1uQlci+dB7FGKSg5tRH
         J6b9xedwGBUv6fZRyNorXeLSVN6OcupiTCsWEoQ873Tfr9vBHG+5J4ORimg+IpIxCErR
         QSLqD7+R6zZMOrq/Ml4dX04KYPEQm1hJ5NSAXx3sAfL8zghhTgb6gu92qYgOER1vUOu7
         NXVg==
X-Forwarded-Encrypted: i=1; AJvYcCXH48YROFoXNZg/5kmIpLwy5zAs7lhDUitxPSWR3uaOhuAJtqpp+emBljH8mdNST3md+S1/74yzeY9oZ8fJKdkoPKxSbonoLoB+
X-Gm-Message-State: AOJu0YwAQLU8wzN+GxaVanzSqhM37WGU/P7EaM1gfszaosK18cjeBtqc
	0oB74IVqQnAE0+NVdD3VNqEda5YCkPacC4JQokfQwKNhvaDPCO/EWyPYxcjGvSYRyJf0Ak74oZT
	UDehwgslY6/2OaDV15tv0bo9arhVJzQzf9IWV7w==
X-Google-Smtp-Source: AGHT+IFYIxE/aIvzE3GVJaNksSgvpT2WTR632ieNOZSCViGD7deZhNv2LdnXfeWFaTMnwmuqPu8xH4C3cbN/hawz0Ck=
X-Received: by 2002:a25:8404:0:b0:dbe:4f15:b5cf with SMTP id
 u4-20020a258404000000b00dbe4f15b5cfmr16284159ybk.15.1708473611915; Tue, 20
 Feb 2024 16:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org> <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 02:00:00 +0200
Message-ID: <CAA8EJpps9EPCgwBF8d8DbVzSZQ5tbEnj3RyGcJ=ua0eigDWQzQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 01:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The PM4125 PMIC has the same Type-C register block as the PMI632.
> Likewise it doesn't support USB Power Delivery. Define the compatible
> for the TypeC block found on PM4125, using PMI632 as a compatible.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Making a fool of me, for v2 there was:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6c0c6b337693..5527a4bc9388 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -14,9 +14,15 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pmi632-typec
> -      - qcom,pm8150b-typec
> +    oneOf:
> +      - enum:
> +          - qcom,pmi632-typec
> +          - qcom,pm8150b-typec
> +      - items:
> +          - enum:
> +              - qcom,pm4125-typec
> +          - const: qcom,pmi632-typec
> +
>
>    connector:
>      type: object
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

