Return-Path: <linux-usb+bounces-12888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B7945EE3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 15:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D02B1F23D84
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 13:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8081E213C;
	Fri,  2 Aug 2024 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2kRNgY6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F31DC468
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722606732; cv=none; b=PX84BiIhn5pZkZBJxI6kLTkph6LNOyeOORVDv4p+ZoX5HYP1tLMVAW75qd51vZ2Fn3Er8rVpH6j5Cm7qCz44eO6kW3z8CaQKac3OJvP8T6HSoWxUbhs2smHKRBPWBa4/xqt5ZZQB3e0V4C1WiGDr7l/nn9kLf9A9gxNdpFmfY4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722606732; c=relaxed/simple;
	bh=ou0DITIpMt48ak8JPLbfXRmSg/K+0yvdjanPFGT+N/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPSOV29UrwnmsVsO1BhBXbzLzk+h7QoUfWu4Rr+1SRa4BOqI3/bhvMfaqLu6DAvCXFTkhJBQ0pD06uCCkkTSFt9M1iiSa/OU4h+9z0XCa7tAyX9iYr6cjdSDNEEpXOWTznoNKL/JARJi5EsjyvFAhDfe4FFPcvRolKfvVnalLSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2kRNgY6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so11934305e87.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2024 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722606729; x=1723211529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ux3ZfNQ7ZOcoxTiKnqgkpQxKEOA6xyXfmnITSx+smY=;
        b=H2kRNgY6O8exEdrS2NcMyhoqOSyemNdNZYVKpvgBgjC6BFYrRfNYWoUBPT5ESblZNY
         YSOLyzv7T9xTQvcgfoh//woOiSeGvgCyndxpoXwZp+H5LExqbNqclD0RAwQcwuE8ECfo
         +umOa08cIGgUbTmPnMcBdRbobQeYYGe1FtVsnFOI8sqUQDXmB6xxvakcx6+p9NditWyy
         5x0tqg2h+PemxGRTXBr+nXklWtN14jMTTh4HWOxZ8nbuOJhqxc23ee4ZzqCT5IDK6jtP
         an4I/XVzEw5GLvSMPTv0A/+m+xk29CA99ngI4Eon8j1exky2lgF2wZWgdpkF3iuioE8j
         /nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722606729; x=1723211529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ux3ZfNQ7ZOcoxTiKnqgkpQxKEOA6xyXfmnITSx+smY=;
        b=XHrjyHZMCVOo4yVBp0KtL4gm1JOvwTUu2mpMRz6qJLyitFFzGX8aD53Soutq3muVnn
         5cU0hUKnyMjOb6ntH66jABSn4PKxsz+PnY11GvUUQTa+QgiFwjhUbA59kcZDjlVr9K6z
         G0lHpPGj9AIICyS9PkX5LMca0l7rvNzw5Z+wsl1j2RbGr8g3BuyN5V/lJkpOj+5cp6z0
         0Ar7l3HDVORCMeFrDaNKT8sla4X0QiltEs/LmYkRQ4qdsd4eZ53EltU+uYKaowlFEhwd
         nVrZBVjVD+35iPD3c2Lyw9CpYZrAdHS/2pjJyr/cFeZUnKG3iuf236so5rOtd1x9gi9k
         ouuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl4MuPFfHTptdL/Wk7iPvFLLXO44r9H7BfaDjiqY9wnSeGxMdMnJx2xyA3Gwg2B1mRL10hoQa6OH9FJDYw0lpzb111S7w3O6BV
X-Gm-Message-State: AOJu0YxYm89/xYTCT0nQ4L8Jx+DMJZjr27otMfvlq0ATB7ijurNG2ryU
	yemS6FjNw15hc6bhB/Ls7rO4NLDTdFlLqgBMKVE7tKY8B89txb4R1ZREt0zq7Is=
X-Google-Smtp-Source: AGHT+IEINrdmFAx3zONnth4QNFrZH1h1meVudf30GLFqW4gmfs8ViUeInYhBNlmQrFmaR8IU0V+aZg==
X-Received: by 2002:a05:6512:108b:b0:52c:8a12:3d3b with SMTP id 2adb3069b0e04-530bb3c8259mr2169856e87.56.1722606728406;
        Fri, 02 Aug 2024 06:52:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba35252sm233281e87.196.2024.08.02.06.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 06:52:08 -0700 (PDT)
Date: Fri, 2 Aug 2024 16:52:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, Frank.Li@nxp.com, 
	jun.li@nxp.com, l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/5] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <i2o5pk7jnni4bgc6txktus26dtnd6quivxkslgqkelmyb334k6@s5waxd5ep75f>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <20240802091702.2057294-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802091702.2057294-3-xu.yang_2@nxp.com>

On Fri, Aug 02, 2024 at 05:17:00PM GMT, Xu Yang wrote:
> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>  - switching lane for flip
>  - moving unused lanes into lower power states.
> 
> This info can be get from:
> i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> 
> This will add support for TCA block to achieve lane switching and tca
> lower power functionality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> ---
>  drivers/phy/freescale/Kconfig              |   1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 238 +++++++++++++++++++++
>  2 files changed, 239 insertions(+)
> 

[..]

> @@ -398,6 +624,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(imx_phy->phy, imx_phy);
>  
> +	if (device_is_compatible(dev, "fsl,imx95-usb-phy") &&
> +			imx95_usb_phy_get_tca(pdev, imx_phy) < 0)
> +		return dev_err_probe(dev, -ENODEV, "failed to get tca\n");

Pleas propagate error returned by imx95_usb_phy_get_tca() instead of
always returning -ENODEV.

> +
>  	imx8m_get_phy_tuning_data(imx_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +635,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> +
> +	imx95_usb_phy_put_tca(imx_phy);
> +}
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> +	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

