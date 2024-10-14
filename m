Return-Path: <linux-usb+bounces-16183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A999C835
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 13:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58B228E512
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 11:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B37F1D3624;
	Mon, 14 Oct 2024 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKV6P91n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F401D5AA9
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903722; cv=none; b=sXeEFKyGpKxd3Yyoov7TZL09FgKZ9LIux8hcK94snICHdeKo0XCjaIS45stCAI5A97arRr0xqtwzmmnMgJL1RsgsiM2AindCinUdBCOetlh2tFwaSFs79ds/rWOBih4fMxRmvwET33q669PCaOsW3HWeynOUX6dwkato4IE3hA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903722; c=relaxed/simple;
	bh=Hcyt6dDuqY0aSDTvuC1F5iZRN2geNVOqKoyMoGUq3DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvFkkdgYevjFZC9I4B+K2MH6IZnyedtcOrAdj1G+HuXqZjtpaswybvKOlfXB0Exo31zenamGjsI9CFTxBrLvbzmzloNzsrLf9+ckz2GUJ8r4GiUPhNJ6pH9n7vL1rwCBCZ+k7+Ma/y9GlkMffzJsdaR0aPT7S3B1Nk+n2V/a0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKV6P91n; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539d9fffea1so2815484e87.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728903717; x=1729508517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VKpzCOMXDiogLxX30wOP2UvN2nyiYIuu5MpkOOY7CK8=;
        b=fKV6P91nI62UuSV4EtrWqUQVf37IGWMsYTg2pH9pvywtgs4mV2s3wxaJBTlQCNoH0e
         0Yhms/di7AfPjyHBKO2EpCEq8Bj+QmkRKTDIOD9h+WCDh22HXLB6mX7FE4lllBvQqp9+
         F3dp2DHyxQyJu+FP93IWISWtlTj7kf39T+jC1HJ3XHN3KoOi4I5I0Px/WE4S2AQBzmwW
         t+XEL17t1RWTbuSFeeoe3MQB3hmnHfnS0ToEGNKOiX+iil3YWW9pKhaQYNzRMeCpmNGQ
         H5BfbdOrIYXwo3z5y9Ty1Wbm2Oqym/LBg0d88JiOkvLi4FqBuXjVnmonIVJdzE/R2NFv
         JANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903717; x=1729508517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKpzCOMXDiogLxX30wOP2UvN2nyiYIuu5MpkOOY7CK8=;
        b=MOkLPK8eEIUssQH09jbJBPtW6wUec45oLNBRHcdI4UylVAnFS9Vjikblx5moC89UYX
         uebtE9bXngqggjafbBUWnUSME3M7iRBMYR+NWqRiLJnnND6YfSaWAd9N1SGT4Cll+Jrd
         bDW8Ve8mi7exFOyG9qq2XlbfrzyYML3ER9QxOFlsm9mBZHuwLYJxNj6k+BdIimg9Lumx
         RF0dNCR4QGh8BfN+s4QknuD9p9ZeCTBifhSdZzshTK/xG+BPymBTDxTQegNToKjFDMJX
         enD8Eh1VCLqkVzXrHvai376/OgGYoAepypbTuIln48cAd7TShrCT/gb2fO51+PWm8+F2
         d3kA==
X-Forwarded-Encrypted: i=1; AJvYcCXmVKtFx9dtloZziSNPl69VKioEcU0RcYUTf0zq80S/2iFpfP4EQkPfSXsmOcEE8ebsoUZ9L4v2wOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySja7SyrNhL6fJm6ANwrkuCWFDznNVuDiFxG9uHM+Q+L32/Ll3
	7Y6CokSv3JaVD1O6wODxm5q5wj6KqAzTaaJD60/dEs2kYoyM6+Y3u2aht0nx5/o=
X-Google-Smtp-Source: AGHT+IGQSb0K8lAOmKTKazlWY9udy/M828sx4SUbiGbOle9pMo3c21JNq4Lq6GrYVpjPk+GdedJWEQ==
X-Received: by 2002:a05:6512:1295:b0:533:46cc:a71e with SMTP id 2adb3069b0e04-539da5954b8mr5060410e87.54.1728903716948;
        Mon, 14 Oct 2024 04:01:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ee16a07asm620043e87.45.2024.10.14.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:01:55 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:01:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 4/5] phy: qcom-qusb2: Add support for QCS615
Message-ID: <zvrvhcemcozy7swsvrwcngm4k3qa4czkbfsq2s33hndu46regx@o7xk2g6wqpdf>
References: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
 <20241014084432.3310114-5-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014084432.3310114-5-quic_kriskura@quicinc.com>

On Mon, Oct 14, 2024 at 02:14:31PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for QCS615.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index c52655a383ce..227041e096bc 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -151,6 +151,19 @@ static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
>  };
>  
> +static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xC8),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xB3),

Lowcase hex numbers.

> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x83),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xC0),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
> +};
> +
>  static const unsigned int ipq6018_regs_layout[] = {
>  	[QUSB2PHY_PLL_STATUS]              = 0x38,
>  	[QUSB2PHY_PORT_TUNE1]              = 0x80,
> @@ -331,6 +344,19 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
>  	.autoresume_en   = BIT(0),
>  };
>  
> +static const struct qusb2_phy_cfg qcs615_phy_cfg = {
> +	.tbl            = qcs615_init_tbl,
> +	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
> +	.regs           = ipq6018_regs_layout,
> +
> +	.has_pll_override = false,
> +	.se_clk_scheme_default = false,

Drop false values, please

> +	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
> +	.mask_core_ready = PLL_LOCKED,
> +	/* autoresume not used */
> +	.autoresume_en   = BIT(0),
> +};
> +
>  static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
>  	.tbl		= qusb2_v2_init_tbl,
>  	.tbl_num	= ARRAY_SIZE(qusb2_v2_init_tbl),
> @@ -922,6 +948,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  	}, {
>  		.compatible	= "qcom,msm8998-qusb2-phy",
>  		.data		= &msm8998_phy_cfg,
> +	}, {
> +		.compatible	= "qcom,qcs615-qusb2-phy",
> +		.data		= &qcs615_phy_cfg,
>  	}, {
>  		.compatible	= "qcom,qcm2290-qusb2-phy",
>  		.data		= &sm6115_phy_cfg,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

