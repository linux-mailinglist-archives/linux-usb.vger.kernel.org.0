Return-Path: <linux-usb+bounces-12191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E936930658
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 18:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE381C211AA
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 16:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821FD13C677;
	Sat, 13 Jul 2024 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="indgmcJT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9713B599
	for <linux-usb@vger.kernel.org>; Sat, 13 Jul 2024 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720887695; cv=none; b=DXJV1KjE52jG5h0R6QyELF0GXCEIP6tfgxmFK7TdASTGCDjEp55aa8hARRO1r+9K/8KTRvaczmcBenGEgqYNA82EI5+sjZncehZbioobmK2xLtzeaL1BFM9ZpIoKAbFmzG/P2Bx2YwX4Mi59l5sDBaiWRIoZE8EkQ3/9Ydd6OBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720887695; c=relaxed/simple;
	bh=RGu5t9fq+Gwj1ue/OlUbeB/Z/w6gGnri4eNigjCFeMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge54VGb3YcA9nH0daKK/B12XRH2uRgiW0u9YWgieASAxu6ofl9EpWVmKuFHCJhWq6RkIAXKi45uKy1TlkBWfnq2koMoWNeah5Na8prNRc1ojx7wmzeuSpVsb2dPtgmerV20Vh+aikas61N5WXkOg7ysmTeZ2gHSFV31kEYVcWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=indgmcJT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so40985211fa.3
        for <linux-usb@vger.kernel.org>; Sat, 13 Jul 2024 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720887691; x=1721492491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSMThvRAo9pmovVRN14rKunXMUYZuHRsMvJiDzKtBMU=;
        b=indgmcJTlVA48sldqql7EmBIpclLhEaFXgP2Iu3wAlT+l689X45W6XjZYkzjSWuTPP
         ChZsOUfMY/f2JHUzeZ2XdaPNCPdzt9qZzdesrFDUzPEbIfPf3CILXWIlJ5xmqyROhnQv
         tekMJMU1UdpqwB0pqu41jrXNOdSba7wCDTofaD0S+0tdkBL5v7PN0g7LRrOjZfHTZ9S2
         aVtaOCLIX/ASXm39T0GcTYWozbFcadp88Nbv7GrJbfo6YTVGwdZW3wX1IEMzFw3upOcZ
         rtWS6QBkU/LxDfThd844AlbAYX0t3z+WJCw+czdREqWCQc3Bp8Pg8fYSghJCS1aEtBYs
         UU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720887691; x=1721492491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSMThvRAo9pmovVRN14rKunXMUYZuHRsMvJiDzKtBMU=;
        b=xGre2ZwkkCqJ4ANjDMlaA5KFWqTs68mV64j5SFXQI6Dlro0weSEN5U0/Et9MHfGYK8
         +hBxmomw/pYObEkg2gPWET4Ovmnt3gyWTenJN2LNwPJ85I8wsApY5tC6Z8nIO/01q7Pn
         9uIyjxyayNkIq4HL467MJOV3fYrJqGYbMEs3EF313uhqzIoz4bEKElaOXRemtgi3ZEA1
         c0QfpwYw2+Ah3mIexl8iFPBUk79GaVvGyqku3OGv8pwME/1kEhg09ZmdYKI8W2oGporv
         h+BLpRmar/Tmo3dYJgMw171Zse03enrJWL+BBXSU07WOYFDxT14CbZxwRp7LeQH3a9q0
         xEdw==
X-Forwarded-Encrypted: i=1; AJvYcCWlhVzg7fZGYOw9EjEULIV0pkacz7mqBYSRHG99BwCNPTEuTXzYwUXSzAaH23dQg1Aapq1ZBpfwdAxiEyw8n1hUUvfj+JaLAWVX
X-Gm-Message-State: AOJu0Yws06ThAay6kdCd7llcXcOmHtH5BezgTFT8opU6pVpsWcwS7Woe
	1hbR5vBWnXFVg4VkuylMWycYzv5jsTi5UBYc3Uvw+Fj2DMvT1pxcPHush5YCl6Q=
X-Google-Smtp-Source: AGHT+IFxjnxFBxILxeAI4QbWroaSsUouY5N4Hn5ddE/vqCHXgfDQegcXUigo9LiyRZiaaNkqHQ2/yg==
X-Received: by 2002:a2e:9dd0:0:b0:2ee:8dce:2fa0 with SMTP id 38308e7fff4ca-2eeb30fd48cmr93869131fa.25.1720887691330;
        Sat, 13 Jul 2024 09:21:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee17ad43dsm2535181fa.42.2024.07.13.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 09:21:30 -0700 (PDT)
Date: Sat, 13 Jul 2024 19:21:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: ipq5332: Use icc-clk for enabling NoC
 related clocks
Message-ID: <iwdennlw4njxefulw5e2wofu4pylep65el4hiiso6xqmoaq5fb@i4hrltrn2o6z>
References: <20240711113239.3063546-1-quic_varada@quicinc.com>
 <20240711113239.3063546-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711113239.3063546-4-quic_varada@quicinc.com>

On Thu, Jul 11, 2024 at 05:02:38PM GMT, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5332.c | 36 +++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index f98591148a97..6d7672cae0f7 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -4,12 +4,14 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5332.h>
>  
>  #include "clk-alpha-pll.h"
>  #include "clk-branch.h"
> @@ -131,12 +133,14 @@ static struct clk_alpha_pll gpll4_main = {
>  			 * (will be added soon), so the clock framework
>  			 * disables this source. But some of the clocks
>  			 * initialized by boot loaders uses this source. So we
> -			 * need to keep this clock ON. Add the
> -			 * CLK_IGNORE_UNUSED flag so the clock will not be
> -			 * disabled. Once the consumer in kernel is added, we
> -			 * can get rid of this flag.
> +			 * need to keep this clock ON.
> +			 *
> +			 * After initial bootup, when the ICC framework turns
> +			 * off unused paths, as part of the icc-clk dependencies
> +			 * this clock gets disabled resulting in a hang. Marking
> +			 * it as critical to ensure it is not turned off.

Previous comment was pretty clear: there are missing consumers, the flag
will be removed once they are added. Current comment doesn't make sense.
What is the reason for the device hang if we have all the consumers in
place?

>  			 */
> -			.flags = CLK_IGNORE_UNUSED,
> +			.flags = CLK_IS_CRITICAL,
>  		},
>  	},
>  };


-- 
With best wishes
Dmitry

