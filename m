Return-Path: <linux-usb+bounces-10508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54C8CE3ED
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 11:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C87EC1C21989
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50238592C;
	Fri, 24 May 2024 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuRcJ3l/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC285277
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544581; cv=none; b=jRy09zUAkpQmU7ZcDMiJg2id7x9l/lDGYg766R6EtdW3qHoRTMkvY4g12BYwy24lNgrnqezPi6UaFUX66k0yPzyN3NXTlEEsPCvPjSj78HN/e9SNXurod3kDJwvqn2KwqLagYm1xj5Ks8G3eNUvkM8OQ6ImD9asv/RQmW72nrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544581; c=relaxed/simple;
	bh=iRu9e78NdcDnTBDCCkCGyMazX6AFWYokoLWk7OrbVCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs4FlS9GPyuoTsQWs+E6UxD+MWgt5eRtqEMMQOiSNnScwdqwWNseHIzxzLnzcxwts3ec33smOEhFRxStszBqfN/LTfAZNXiWnwbsxFegmfoOTxitbFEZ1ayd5rG6YuOQR8O9kwTJTJBV7aI6iKtkBB0rBzunhqRhKd9H5e/e8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cuRcJ3l/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5295f201979so722686e87.2
        for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716544578; x=1717149378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OT/BHu21xlzrZaPBXSQr5kcpxtnJHEb0rcd2Xou+Ygk=;
        b=cuRcJ3l/rB43XH+eMxwW9dD6AtKvzg03JG2kHqqYc5xxUMktUm7V5P/sEPGlQIgHPf
         toYkjCU12uEC0VXyd3XBpBD+izMProTr9VoRG+uMjQxC2Xj367qLykNz3R6xPemU/pLW
         AGhcfl+uBG3baq2iFJ4fi1sKaleDb4HJYZNR8pIfHUH31SFBjU31hAMdu2w4SlnjJoVd
         tYYKMdX1+Ho0Uv2WeBrr+7aXLoYz8Bknh6p982tIBFXg1K291pbDGJmlQR8jZXUytr+j
         uRqMqJq0A4vdwwuWVxa3r/7aCqEcWJwvl/UvAo2vR/A/WEaJHVOdDQzbEwKeZbIRkjOb
         Xrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716544578; x=1717149378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT/BHu21xlzrZaPBXSQr5kcpxtnJHEb0rcd2Xou+Ygk=;
        b=SQXqIrwwEm5O03CTMEReMrEtEpQdh8voVWy6Fg/nQJEM9HmPSVRul5IsUf9N1bFzBD
         O7yYqVPHthro1EGXDmnkxoGHkhIgwI9cZiTVrbQHqL7x7D78uPTUkAATGbtKR/BQL/OR
         /vJuH7zFRdNZgOwCZovxO35i0X+JmPRxQIPddqum9LbfX7Js5eBdQW/InYoEqVlukEHN
         9MhQPITslXaFaXTJLXIc/fjjWbZpP5EHAIgFSUTq1PLjznEFscyWsQ9QlhQ+BiOKlqug
         AfASh8BenPJ2wqLGq9IvyXF7A1S6pRQwis100brbM7i1HTr3ql4LKbD6lptDvtHDswBh
         lmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXXByuyFydfYQR5n7+fg4MDsXwjE/FFSUaHiebAqyxuV8Mll313ks4cZuB26EyOdIpkT9c5JCE+Eu1UM/bkqXTdoutUJhilC+f
X-Gm-Message-State: AOJu0YzDkShqwIiwyUaF0MLAAhl4Drn5U+mtRG3X4c+6KYRw2gYLilon
	kmrcajLqo7JvkHmT8qm28EuhqUxLwTUL+iIp35JzkNGGvRX5pdfIljtNhDcaepI=
X-Google-Smtp-Source: AGHT+IFJQH7uxP0T6n5vJtUthNYdkzKrumtOMJhrf7mDjGc72AlYIsw25VDwEtSyryl4d5bZ1ypGUw==
X-Received: by 2002:a05:6512:535:b0:51f:315c:75e0 with SMTP id 2adb3069b0e04-529666d9470mr1016847e87.44.1716544577665;
        Fri, 24 May 2024 02:56:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066bb25sm142379e87.154.2024.05.24.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:56:17 -0700 (PDT)
Date: Fri, 24 May 2024 12:56:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: gpio-sbu: Make enable gpio
 optional
Message-ID: <5of64nmgpotr7fu66urgko5gfvr4ffhmff4dgkagkdvwh2dywk@etlw6rsmhki6>
References: <20240524071034.4441-1-francesco@dolcini.it>
 <20240524071034.4441-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524071034.4441-3-francesco@dolcini.it>

On Fri, May 24, 2024 at 09:10:34AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The enable gpio is not required when the SBU mux is used only for
> orientation, make it optional.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
> index 374168482d36..cf44259980a1 100644
> --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
> @@ -47,7 +47,7 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
>  		break;
>  	}
>  
> -	if (enabled != sbu_mux->enabled)
> +	if (sbu_mux->enable_gpio && enabled != sbu_mux->enabled)
>  		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);

I think it's safe to pass NULL to gpiod_set_value_cansleep().

>  
>  	if (swapped != sbu_mux->swapped)
> @@ -66,6 +66,9 @@ static int gpio_sbu_mux_set(struct typec_mux_dev *mux,
>  {
>  	struct gpio_sbu_mux *sbu_mux = typec_mux_get_drvdata(mux);
>  
> +	if (!sbu_mux->enable_gpio)
> +		return -EOPNOTSUPP;

Can we skip registering the mux if there is no enable_gpio? This can
save users from the unexpected errors during runtime.

> +
>  	mutex_lock(&sbu_mux->lock);
>  
>  	switch (state->mode) {
> @@ -102,7 +105,8 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
>  
>  	mutex_init(&sbu_mux->lock);
>  
> -	sbu_mux->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	sbu_mux->enable_gpio = devm_gpiod_get_optional(dev, "enable",
> +						       GPIOD_OUT_LOW);
>  	if (IS_ERR(sbu_mux->enable_gpio))
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->enable_gpio),
>  				     "unable to acquire enable gpio\n");
> @@ -141,7 +145,8 @@ static void gpio_sbu_mux_remove(struct platform_device *pdev)
>  {
>  	struct gpio_sbu_mux *sbu_mux = platform_get_drvdata(pdev);
>  
> -	gpiod_set_value_cansleep(sbu_mux->enable_gpio, 0);
> +	if (sbu_mux->enable_gpio)
> +		gpiod_set_value_cansleep(sbu_mux->enable_gpio, 0);
>  
>  	typec_mux_unregister(sbu_mux->mux);
>  	typec_switch_unregister(sbu_mux->sw);
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry

