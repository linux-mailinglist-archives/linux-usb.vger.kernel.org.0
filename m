Return-Path: <linux-usb+bounces-28288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C982B85852
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 17:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E50933ABDE3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 15:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAA1286427;
	Thu, 18 Sep 2025 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zp/SOqSq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463DE224B06
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208506; cv=none; b=rd0ge5b9gb4xCl49DhZ7Fzri8o4Z0bfEUR5QnAileAEAq0tvz7jJ/Pvi0JGTBE5GQ1CVbO5uHP9a9uzuHKeKQWm7SWXe2jTUx5VLU7+Tnu+/AO6uooF0PeVXtRh+SrtFCCzdd87V2BAgZNq46ehgwD+0QAVdSh8WTaYh7+Uyuyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208506; c=relaxed/simple;
	bh=W5nTjMEiqZnba5g8e3Gi7lUj7gQH38jU4DdLi32iJEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3CIONUwlfRcjNnCxGTR8FyUHysYSCJUYEyESi1CyVK7NN+7Z8e0PLQ6U+2r4+N+RRnxmUh92R0fpSEIAsI6n0X+8fULBGndeuVRkJU8kHoEhSy47wuPab4xyYN00qFw+xNLWOxa9s69qEblizvj8bTKr14OilLVk7ZtxiucsrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zp/SOqSq; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-73b4e3d0756so3433057b3.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208504; x=1758813304; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=zp/SOqSqSMI5TW4vac7YZCkoM9yhF0pMqb0QTI0ezQjs1cYd0yO6U+s5kfa6TAT35K
         EuEhHFpdmfWDaWGY/EQkP/ejyIhf+H8vvhUMfYXBq/x0xjBcU+Bllk6lXsr2eccMd528
         4P8EpBsktYPSTCPwv3th5y8rtpFaUwFMwSoiRSGleDnx/TXO5dJE1t0VXgLBnE8L+02i
         gUChk7v08DwLvgwe0mwyPBWDCSFgqvUwk4fN5kwbX4ZaknTZmMS5Qo4UFxrqcm+KagT2
         Unnl6S72aYIYHH5+vX0CFZ6YeXuRLd+WSz1LsN310YMoO608Hk4933mL1tRto5OOVAyC
         KuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208504; x=1758813304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=tggqYdZVxzHXEIagKm+IXV1zW3ei/bRZrMD99y+kXVTZtcvyuER8T2770LWjpgEE/1
         MrXD6teF5nnLk5csjJ8UDcw0+XyzmRcGDYa6ezN2voVTf+F28DdCAA+XAFQyFQJt+Wpz
         Mc6N42hoi3ZSfkYrO/DxYuQXVrfDxqwUwoJewJjDYK6eKo7AXYKnFiTmnf7t8F9fstPc
         w0HKPvpYafQj0/HXgJxInTjH4r/SAsT/HweV6xCDqaD28/jJxupC5SKfdLvBHA9jYQaL
         DqJoT2ufs36Lm4yc7FMvhTWH2u3lOyig5VikznQqnioA+lkhuPUOS+D4G3Hz0udxPWaH
         XS9g==
X-Forwarded-Encrypted: i=1; AJvYcCUdIa1jiunqYPmJOO30OuK7QCowQhK7VCRJuk1WutVM+kU1zy4h/2VEDkQ/DjK4UsQ4ex2EoKus1J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb+DnFAaULP67uEWYFM1DchiSoaTG8tQcehvtQlLKiVZhyMSWA
	GAsBxuzOXrcsnWeOo/VkljoXKrNDV56aBiBh5zQj7X7PsNj3Kh83cjxDzx0w0261fRPY67g1ZOJ
	N9RXv+JGCtaLU4wN9Pot+Q3PTcUYYWRDfaRoj5coAYQ==
X-Gm-Gg: ASbGnctu0sW6/5XhvSOtPUqE9pAC2TKczs62XxCHNfaDqPYzQDcQAEnBeU6m/914NYf
	jcYFTayXb10KAOCiQFzIM4/9UvRAajb8Ie6POoj/LWb7rslA9KjIK4II61In+LPCOhiGYKlNE/9
	lKrIwom7qgyhILQQ1ZikBjdh38JXYK5w08tBCPoZspnoRX0tkPQBN0T8us9hR7k6UQvhhl7VJCE
	hKLXhpO3/1GIJDcREkr3KnjnYY=
X-Google-Smtp-Source: AGHT+IFWx6n1PzkYYp5utqUHYs3cajDfg2GyxSlUHuEjN16hnOdbRT6rrrmIdLRynF4h/+ErT5T1ASVcKks2d63Qrt8=
X-Received: by 2002:a05:690c:7281:b0:731:6570:132 with SMTP id
 00721157ae682-73891b87069mr62837047b3.35.1758208503588; Thu, 18 Sep 2025
 08:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:14:27 +0200
X-Gm-Features: AS18NWCdTZsclOkAHpdSQCQjKeMfCrt_EDcLieD3X8xYbm6A6ARROAgFxf2mSRY
Message-ID: <CAPDyKFq1Coz4rbdam01s3pOCDa=Et2ePmf7niLSgOdjCbnEANg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] usb: chipidea: ci_hdrc_imx: Set out of band wakeup
 for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 USB2 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure usb2 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 8 ++++++++
>  include/linux/usb/chipidea.h       | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d7c2a1a3c2715967203b98c819fa864e06a00a32..a2b3f673dfc1183a02783bf6ef92f8570c6042cf 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -79,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>                 CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>
> +static const struct ci_hdrc_imx_platform_flag imx95_usb_data = {
> +       .flags = CI_HDRC_SUPPORTS_RUNTIME_PM | CI_HDRC_OUT_BAND_WAKEUP,
> +};
> +
>  static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
>         .flags = CI_HDRC_DISABLE_HOST_STREAMING,
>  };
> @@ -94,6 +98,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>         { .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>         { .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>         { .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +       { .compatible = "fsl,imx95-usb", .data = &imx95_usb_data},
>         { .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>         { /* sentinel */ }
>  };
> @@ -570,6 +575,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>
>         device_set_wakeup_capable(dev, true);
>
> +       if (pdata.flags & CI_HDRC_OUT_BAND_WAKEUP)
> +               device_set_out_band_wakeup(dev, true);
> +

Based on my comment in patch1, I think we should set this flag from
within a system suspend callback for the device in question.

[...]

Kind regards
Uffe

