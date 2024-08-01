Return-Path: <linux-usb+bounces-12849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53942944AA6
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 13:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85AA41C2342F
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FAB194AF0;
	Thu,  1 Aug 2024 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MuKbrDKA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA7194152
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513216; cv=none; b=Jb7pHPmj/ynmiUVSVG8SWuqnREJ88lCjwmbcOHXmc3iq/XfXh/pgmYbPU2sjVoVSAUvvaEefLeGNw03bVgwtF0mHcyvJDM8fG4pd39P8ajRjA9ys7+mAkbigKT1lBsncAN/HBPRMYzYEYcZWkg6EF+CXcO4u23XVQJJi9m6Ny7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513216; c=relaxed/simple;
	bh=4T2J2s9duqZxb+9v8Ghu8wRhFvtAYX9kXersZCxQf28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHpxTySxQJQd0VxYsxKRjRdpaAdItc963FQ74oF0+T6ySsQtSSXP/nNVp7bXnxx8x1uk6BTrlH2/+xD3pg9zbOZDyqiem1v5uRtbQcbfCSpMbMPBWU0G8e8tO08Fs5uxVC9RV19TFEjn2U5Udq5Y1alPe62Ao0YkECgac+xSwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MuKbrDKA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efba36802so11341222e87.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2024 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722513213; x=1723118013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bbd6Xp4n6Vbg1uGGwVqlSUaRWaDu6ao7nozZz+TGJs=;
        b=MuKbrDKAWElOLcuRMS8SHiK13onHkupbmo/iOA6KKBIVr6hUqnTdVwRkvBeVtwoqaD
         MOolrifThTU0w/I+SrLMqygB+UTdqxxAT+vwkHNA2dNoJPINXZ+XvsFK+7fP9rWjIEn8
         L14LicZyoDLAI++PN2jwpjsbz96KS77YA1Lu2EY3lYA1jyDT+rwEE8WfkYaFRYZl0j0S
         wFuNDtczWWUG2c0yEKlby9tauVfwWOO8l4LQNCktYb1wiwqyyyZtZaH4KTnC61+rt/+W
         3yMuowGgdhz83eFBMws1AdmiHqB0DASWW4W4wiX7WJiOWfKaMvDsidQSWjVWHs5CO6JS
         5Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722513213; x=1723118013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bbd6Xp4n6Vbg1uGGwVqlSUaRWaDu6ao7nozZz+TGJs=;
        b=IpAglcQ9gBMukiHDSiAV1twxQ4rDhJAZ06O4LH+Mxs/MPXclEobESpftb3UhhPxwFK
         FuR7L5qVjhiuz2VPnhiO501djiS98LfHrgLw4eGMa6wY9nmwTJbuOKmLpxsNjpZPjh1n
         1dgzRXrb8qV7m0zu/O/2Cnl3nNKmNdRPAIjPgTa8z/byJeWyZD33FHt3WdJvG02Xtuuj
         HkR+Ge0NJJltI/wh7nOUYRM2rjZ8HaJJ5lNAD3SRqZ3ggoB1TjNqmxM4dJZrLQjNlz9k
         ltM/5D9CyQz4mqyDVzPXnKyAuDLLao8NaN1AMFqA02VWK8IuU4JhIrXn3DWDw5ZjEvkE
         eukg==
X-Forwarded-Encrypted: i=1; AJvYcCVShKI/Fzr6xBhDaBlRg4VVWfssMJGofH4MGCbknaTokTc0rC1oRGcEixId+vrg4YiV0wuBQvW1eEoYKmz3w1YmUdhjYJ/XimKA
X-Gm-Message-State: AOJu0Yw3RFjgkzGxxc4ROFSi0JVJxNU1FtGfd0tJYSpWgv6gYtwAd0xn
	MFfHEiIippDLf5Q4a6qFlTR+oAGOT239kVC+4Mkxzh+MZwO6OXgV7LrFk7Dw5Ec=
X-Google-Smtp-Source: AGHT+IEWBghCHBmUnquOCBeh7BgDWoFFzqvzlEGNdmNNkRqQNvPx7USWTdpENhwDy1e+zzUB1WQiWQ==
X-Received: by 2002:a05:6512:32ad:b0:52b:9c8a:734f with SMTP id 2adb3069b0e04-530b61f3346mr1259074e87.50.1722513212500;
        Thu, 01 Aug 2024 04:53:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd0f6fsm2592680e87.97.2024.08.01.04.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:53:32 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:53:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mq-evk: add typec node
Message-ID: <hxqisqspywda7qqsxrkfpyuqjbbyvcexsue66hppku4souxmsa@p2nlelq7czco>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801064907.3818939-3-xu.yang_2@nxp.com>

On Thu, Aug 01, 2024 at 02:49:07PM GMT, Xu Yang wrote:
> The first port of USB with type-C connector, which has dual data
> role and dual power role.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - modify endpoint label
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 93 ++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 7507548cdb16..8169ed7c7968 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -6,6 +6,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/usb/pd.h>
>  #include "imx8mq.dtsi"
>  
>  / {
> @@ -27,6 +28,20 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency = <100000000>;
>  	};
>  
> +	ptn36043: typec-mux {
> +		compatible = "nxp,ptn36043", "gpio-sbu-mux";

PTN36043 isn't an SBU mux.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec_mux>;
> +		select-gpios =<&gpio3 15 GPIO_ACTIVE_LOW>;

space after the equal sign.

> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;

Where do SS lines go after the mux? Please describe them in DT.

> +			};
> +		};
> +	};
> +
>  	reg_pcie1: regulator-pcie {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";

-- 
With best wishes
Dmitry

