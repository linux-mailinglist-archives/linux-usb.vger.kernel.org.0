Return-Path: <linux-usb+bounces-19325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6EA103F8
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 11:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FE41886158
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 10:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FCF24633F;
	Tue, 14 Jan 2025 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X99SiUf1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31347246332
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850245; cv=none; b=UwTbwG1jnA8nPpC0MC4wwEt4Geb38THEE/u792j00Wtcn4WWvKkAhiMQ7qS1lEyx2AbASrBd6FOB+8Y/OpzOXwdNM5gwWw2BIU+RFc+vxIP930np2Loh0DL0ctjzorKwRbL47qkKyCvpBJsOMUtPs8DkAll5mcWumtVF++wLjaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850245; c=relaxed/simple;
	bh=O440wDiBSoR574XsF6adFm93iysECJycE5DyWk9gM5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNoVq4BKmjzWbsr9oZMIXorOXSqsJTlqBIkYCsEjceJo3v43PN0NM3hs7+qxWUwKzXt7kqEMwkdCT3F5AOGaGYZ+ugVkZUMwfElttAJKm72jXqBkIgfRGXj8QjPO8OMoXHh/1xzckF0t4fPTLNnTtZ06xqFSSra+bSYizOK4gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X99SiUf1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e3a227b82so4543946e87.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 02:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736850241; x=1737455041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oI6vi2GoQLTi0BDTazm+sSUfItEUA/br8Yh1LQsmUM=;
        b=X99SiUf1KcSSPhtglFB2uGv3zRJuUjpS9qx9wpA1D+6/mSzCwwkRMwlBz7/Kg2MhDH
         46YnCLkjKwaqgycQWbD9Yqa9tlUqET3rKHck8DoAvRum20dqrk/HAkvFDlYs/C5KI+nO
         BP3CaEJELqwOjQ1ATApEMQultBoRZ+SDkIITvZPCjPveJAuH0/VbV6IEQTjKJtwBgcz5
         /U+4Q/64SaRFTsrFi0lotV21EM+MmWPUU363HI48HT20RDh99ZdUyq8h7aECSEu+QAfy
         I8qyEGPGSIBVrLIcTErSHderRqgjZ3gXnBipx9JAcwDuU3TldEeInlfaJCrOxNIRTTlr
         D4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850241; x=1737455041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oI6vi2GoQLTi0BDTazm+sSUfItEUA/br8Yh1LQsmUM=;
        b=P7fdf29cBoYO9cqeCHOLiOmP4Ap7FW/6uuVsH9k+9PLRPDOMNIL0qPJQvEZsqjd2N9
         z5Bz0sxbebQKUreLl+5Ysa/iV2cqhgfYGntKQamXquP11dmRGml+UeIbHnyUAMqZ2P/C
         6bMgwyRF6IAhZVUrxBC4ni9WVlipRl80i1xuDmLdj+H6ZnWeIZRu3rP59Nld+Se5G3qz
         RjFpblZZE4OvYyj+/+gmFFZClDvx9vjFzxrPLV9gZxO30TaxbkFzwSaYoS/AujAlrVnu
         8Q50NwFG9ZM2c2TLoOyv7H/aUWSIZz6AOhHpwQ1LRJFEvt80/otogAGGXBrh3msoGocr
         4hDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIx4tDzO4nA2Y4oRFhPmqovdw8yLzYV5JMZ/VzXiBhwfgbzyrjDfMaOXu480M9WnBuHIHaawqeP4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUjKHVaC3t6Y14ejSHDHdrHEYXQmYsNXNzzu1LrxF7faJYlJ+0
	/2cuRK1DOoDmoKAnBBODYJellxpqU8W5XZuwdEtRWAZc3S+TP/qDBFw8PrkdvRo=
X-Gm-Gg: ASbGncs7F/NcC+QT2pXSe0hhia+pxVaaEiSy5/OYJpAxj/IDW6l7NMupbgn800+Naj9
	NXdpDY+j90dlErgA5l1myqT+QzG6qN3NtC/KckauhgkVfdMygv53xNlGfrGBBSLmBczqa+u5zeM
	mc/eu+0mFyEk54wB5VcID5SWjGyMk6xUvO0NBYLfBxpbbJw/80txr9EvrhTA78Xu+FkNcl9Bi+t
	ingOb0MERHAKLykCyb0r2mW8l4l2ttELc1ctz7nePDjCD7lYlnPMoB37mvQOw2MZ0cImcDV/EmA
	2bQCgfarWokL6PDoieTGOGcmJDAqbmMUtBta
X-Google-Smtp-Source: AGHT+IEKsRHi3ewHQ3flyKmAEggsmIc5cWlq0d+tu6iEmD2+GVjY0LyFN7q1yTTso4t8mLEgCs7lPQ==
X-Received: by 2002:a05:6512:33ca:b0:542:1b63:2e52 with SMTP id 2adb3069b0e04-542845a7137mr6460348e87.6.1736850241188;
        Tue, 14 Jan 2025 02:24:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea8504sm1620977e87.138.2025.01.14.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:23:59 -0800 (PST)
Date: Tue, 14 Jan 2025 12:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <tcm2hn7rpzaazntp5r7ag466ynacexnke43e6ypm4q5mrrlkdb@nem3gzib2l2v>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:10PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 ++++++++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f8c7d27aaa58de39ed758 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),

The only difference from sm8550_usb3_serdes_tbl, it has 0x37 here.

> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> +};
> +

[...]

> @@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
>  	.dp_dp_phy	= 0x2200,
>  };
>  
> +static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {

Why is it v8? Is the actual PHY also v8 rather than v6?

> +	.com		= 0x0000,
> +	.txa		= 0x1400,
> +	.rxa		= 0x1600,
> +	.txb		= 0x1800,
> +	.rxb		= 0x1a00,
> +	.usb3_serdes	= 0x1000,
> +	.usb3_pcs_misc	= 0x1c00,
> +	.usb3_pcs	= 0x1e00,
> +	.usb3_pcs_usb	= 0x2100,
> +	.dp_serdes	= 0x3000,
> +	.dp_txa		= 0x3400,
> +	.dp_txb		= 0x3800,
> +	.dp_dp_phy	= 0x3c00,
> +};
> +
>  static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
>  	.offsets		= &qmp_combo_offsets_v3,
>  

-- 
With best wishes
Dmitry

