Return-Path: <linux-usb+bounces-27901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE3B523A5
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 23:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8CA16F1FB
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 21:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB066313535;
	Wed, 10 Sep 2025 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfLYVKQq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0072F746F
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757540534; cv=none; b=Fy4Dk7b0t9lq/xfh7nPhoC98Y3nI26N7hjPWRRu8Zun30b8ZXRmxdCPC8EBFnYwAFiuqkv0ivtlPIxn7y7nOuqre5F2rSb1WXcyNUhlgxuxKMwAh7DCo5omGqlFxw3V0WHLzfSYAvskbiaB8IxGm2QVw6fcpycbK4hrgMGNfbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757540534; c=relaxed/simple;
	bh=Vtc1GyPAcEF1ugP0+8GLjXhPqu7RmIfd/JlyHRAC5OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYjMMrkasBAkzusY7M5FACtGF00EsXE6+v6mo1jsQEzCmBZkeHdxTp+zO1zKAPq3FzJNLUvtZNP7BZSA26ZLJ+nKwafVF9bdxiskBTBD8nLQiD/h8caL9E1lrtghEQNhLMg9HwWLnkEAib9ui6zFmFwSAKQqlORgIxyNLqCLoGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfLYVKQq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336cdca667aso761641fa.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 14:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757540531; x=1758145331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfssQgwNNt3owWOCp8M+EybKjyUjEnQDrgLOR0WxhvM=;
        b=rfLYVKQqBg3m+PCSqF8Ff3HBjJRMFayIcx+9QL0hYpVq5INVsma87iPG1M9ODDT8kj
         UWwXVeohdq2HVaXc2IphtiF6sfyrEuu0xzbcvlSS+dunZgJL0eZJ1WFunfJ0Iow0Rt3n
         P/IvDPb+Kc03Gu7g+Ag6AY5A52g4KunhLmHJAeFaI7e1tlEoyOAF12yVgeox+8XHIwkX
         FiA1wn8WMDHOtTkb/LZBlVrjX/bV3rqiYWnKwBQ6uZK6OMu/BtZJV1ipjz1Mb0XH4un1
         +d/dpHmMUw/63FpFIyxmsJOmPCVoC8JRzaRB5Lr1Rxt4sjT8cQgGht9WKvP4x6uqiOMl
         4Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757540531; x=1758145331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfssQgwNNt3owWOCp8M+EybKjyUjEnQDrgLOR0WxhvM=;
        b=sTlsCAzaLaGLUe0Hqtul/SFbUzvonxpJBZfGACkmZRRTVPclG69coKqwuQHv/lUyxn
         0eErXK2zzvdZQIAgiLJC8et77zuUVjZZ9DeiN3dvKw8GzNPhSbG4nJ3HZz90q5job3fV
         +7JFKKpAGI5WHlVPVTiu4ZWN+icVE+szxU/7Zw1Mfi4hNzB9LSuLZ3uYWYxy65IA2d0k
         YQcMh4Dfjap4qYK+E65VYIVVjyKHTYvIdAUAh/Hca0GqndFqYHVIbm3N+vUh8X9kFlTo
         Un7DETUAHI2JqKeanjUMLmn0KqPD5+lTjiWK9/FWO3SIoTJlvFEZXSXOexBCe7cW+1Kz
         dWag==
X-Forwarded-Encrypted: i=1; AJvYcCUVP/1Auvc0w8Rad2EVpArTdC8jv8UlK0tpwA8UE7gITdG+M10Pa57HTsCzNiPz49sZxitNqnR1bmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgouN225e9AND27ZzRHLEJhscbwzh7cnWZJxmkOgnOhZtylsho
	1zXnDkEKmfgghM587gJfV4d4EZWQ2NLf5ZthPheR7VIVwvW9+L3SmwzJGCaauADEQbBwBvUlLSl
	KAXgdhhulPtwAMrMu99JHutT7nH8qQgCTUR6ZboV76g==
X-Gm-Gg: ASbGncswaFDFv0UU2cEEmRfuPmUPNy9LfDdBTdTzlTyiXMNheYMMjceNDstY8PzNvyz
	xWkD5goca64t8Hzw1l5W5S+Z60gt6hT5FEOYpq2h/n1z3dKnQv2lmwwmcT7PclM88UB41SXyMCv
	xv4SGJM43d1v/atIMkShR8zaVHXbPYQh1kJ3YlKA3biv3Bemp4WBKbRkU5u6notozNQlEgKziU0
	VrUgHI=
X-Google-Smtp-Source: AGHT+IFutlHIwj2lsj+jDT7k42Zm8eOFBZR4KCwk+hGGTQIBylx/YAPLbGuT5vRdHvQdR6a4Uk4sEKHn5d0jQ+26HUw=
X-Received: by 2002:a05:651c:20ce:20b0:336:e1d6:8920 with SMTP id
 38308e7fff4ca-33b537e751dmr45597001fa.31.1757540530806; Wed, 10 Sep 2025
 14:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910133958.224921-1-hansg@kernel.org> <20250910133958.224921-3-hansg@kernel.org>
In-Reply-To: <20250910133958.224921-3-hansg@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:41:59 +0200
X-Gm-Features: Ac12FXzOvkO2a9fvYJf1s2WB79zSocSiy--29h2HtuNVqHlSwVgZxm9T5NCVWzM
Message-ID: <CACRpkdaZHfb_FtimCxoLphnvLswpHSEubpztWwEQoW42qHW3Gw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

thanks for your patch!

On Wed, Sep 10, 2025 at 3:40=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:

> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
(...)

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>           This driver can also be built as a module. If so, the module
>           will be called gpio-ljca.
>
> +config GPIO_USBIO
> +       tristate "Intel USBIO GPIO support"
> +       depends on USB_USBIO
> +       default USB_USBIO
> +       help
> +         Select this option to enable GPIO driver for the INTEL
> +         USBIO driver stack.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio_usbio.

This is in the wrong submenu (and the GPIO_LJCA is in the
wrong place too, but that's not your problem...)

We have:

menu "USB GPIO expanders"
        depends on USB

So put it in this submeny.

Other than that it looks good, so with that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

