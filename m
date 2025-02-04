Return-Path: <linux-usb+bounces-20117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3AA27538
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 16:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF7081885EB0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9952165E5;
	Tue,  4 Feb 2025 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXQmRbUe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A9C214803
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681172; cv=none; b=L0svJPTBDMsJx7JITXy6SJTevx0pHHJ2oeNySfsQ23hrwHEtUZnWVwrU2K8VGUwCwelcYqu1CG2j1dswipNa+4jfPsZPGAr/DdLpfvrQ5D+TXriQmLzBLBahoPkWFvWK05ay5RlY4Ub0Chqei4XXL8ai5T7BEjGDiuoEngGOe3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681172; c=relaxed/simple;
	bh=KWQ4BG3za9QufMezrdbyMAgIcWYZGzuv+UP/bPj7EE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjrljK/SUI2fzGjRhHiEasLfPEEKc+KGhxEtk0OqR2MznQI64vq9v54Q8G/VnVjz1L/2IqkK7l7ffTCcKHk/aTaXOCVT1tO1ZdOX/44sv21svRklqOEXJUdvu2yBmO5dfQcaLZKTSdTEKp4stJ9Sca8vnsX8jD9rnw3Mb1ep5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXQmRbUe; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401b7f7141so5260792e87.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 06:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681168; x=1739285968; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t1DYlp7BOgCsO/bvivOkdwsvShb36ZFFcwsQF/5DCtw=;
        b=OXQmRbUevyIMbv/s1yr9i9rQchDDc7qJ2hGP72sdA8jx2zTqcoGQuSMhbYS0/S5GLL
         e5jwxQsSUF9HIhS5wGr0ignmOWr/G49rpxUJtQonGLalESeFRY/ubEPvrm4XmgrLQKQO
         wjSNfQM7qvjZ0dBmcC7YxT3qnQLYfSQ7EQfMHpk6+LHsA6qV8E+W1g3+DLKmwhnix4Ui
         vIK2dhLVBtHnw78NRy87HHvu9nA+NYol5lOXcfsasSlcV658DYyLsLvqERRjCMaaxnrJ
         EpzIekiLMPSs6iY1zvK+8Bg9lE2JRaieDzZ/2VFWpcLcVfehoIMC70VOpsFu04/Ut/go
         +Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681168; x=1739285968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1DYlp7BOgCsO/bvivOkdwsvShb36ZFFcwsQF/5DCtw=;
        b=B9vgXDqPE9Jjv0SaFgwNiky4PUXsQGmOh9b3SOs9InQ07xk/kzVdhHEeCFEqsnM2hM
         u1Pvn16WE3cADCWEarzBk7oB7oOP315YUF7B1wpJQXKLy0lLV+dZR9e+UJpipoeCDPDC
         /1hm808qLmNxAc1P7sV3hNA8Cd6TckFPOVtzFTfKtIfO68AnJswW5T8xI+KY34YtfB0x
         PzQf1U3R95pFLsBPgn2pYp5QvUX3stp0ZxXPiApCzSYOtd20gBYxudZp230MwQxw3Alu
         pqRL89exU5RsJsCnxShA+7QMYmX8zyBnpgH/BSFbVLfZ8Y8PY+YCG82SA4VawIXWTIXg
         Sr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL+QjJYPzt+DnTMhrEvL6UF06PVWt7DW/gWgoe1MstQlYU7/dx8wSyQmg0cS+f5eEoJCYMSSbX+As=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR4YHPFlAiLJSsER22FBJlufbWr7Z/W6IS8/7XYs8S0Jc9Dy9O
	UEQ0ZTuZ58yDvyKxUiOejlC2bGknutgjfit1YYEdNJ3QAR6SUB+y7z00ct8Z5uM=
X-Gm-Gg: ASbGncv89SSKgwYM61RNXuHciW9Op8PO8zpqzsdiZYleUtbNTuuUbTW1Hiw3fOLBup6
	GJ7enGPjLzgPiwYKUgDuxaEH6yNz9KQjswQVkC6DFcQkTN/uTfEA16sW5zYDBZhkht7AhaVYcqZ
	LcB+u9fd5TJ0OHJfH94SY7b3K7BxvMQoMfkakLZHMzvgWNEb1xqwO5ZH6Si8LXG/u96lQvzJpGj
	eXIgDFm7ShQIA+LCHS1qzPAUPGmDMf1YHSqm36AmfEDyetZ+bVXDiDpbsQ2zI322VvTMsqipzd+
	vSmh/mTkp4ZkYMfzZHGzSFabJTwdvv+kBhJYxIAuMhnjo5e1ZbW9TGvY2jsnPqunI+zGot8=
X-Google-Smtp-Source: AGHT+IE7b+udRsOmYgAUchqywxLPloRDcPecM5jIJa9qMOD6OPTAHNII/xMHMBXskhTGDDkZ3IE7zA==
X-Received: by 2002:ac2:48a1:0:b0:542:9883:26f with SMTP id 2adb3069b0e04-543e4c3a1demr7204191e87.50.1738681168494;
        Tue, 04 Feb 2025 06:59:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0f8f5sm1636690e87.58.2025.02.04.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:59:27 -0800 (PST)
Date: Tue, 4 Feb 2025 16:59:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <ofaioilki5qxdq2x5fpbpuk6mid6i6slpyqzwol4e2s4cwdwsf@lgpqy2zil4j6>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
 <tcm2hn7rpzaazntp5r7ag466ynacexnke43e6ypm4q5mrrlkdb@nem3gzib2l2v>
 <0ec95cca-45ed-4805-8ebd-03563d55627e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ec95cca-45ed-4805-8ebd-03563d55627e@quicinc.com>

On Mon, Feb 03, 2025 at 07:31:29PM -0800, Wesley Cheng wrote:
> 
> On 1/14/2025 2:23 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:10PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> Add new register offsets and PHY values for SM8750. Some of the previous
> >> definitions can be leveraged from older PHY versions as offsets within
> >> registers have not changed. This also updates the PHY sequence that is
> >> recommended after running hardware characterization.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 ++++++++++++++++++++++++++++++
> >>  1 file changed, 198 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >> index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f8c7d27aaa58de39ed758 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >> @@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
> >>  	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
> >>  };
> >>  
> >> +static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] = {
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
> > The only difference from sm8550_usb3_serdes_tbl, it has 0x37 here.
> Not sure what the suggestion is here.  I think in general I would want to have a separate table for each chipset, considering that settings may change/evolve.  Currently, if you're asking to re-use the sm8550 table to avoid re-defining this sequence, I think it'll be confusing to folks when they refer to this SOC's PHY settings.


No suggestion, merely a question if both tables are correct or not.

> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> >> +};
> >> +
> > [...]
> >
> >> @@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
> >>  	.dp_dp_phy	= 0x2200,
> >>  };
> >>  
> >> +static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
> > Why is it v8? Is the actual PHY also v8 rather than v6?
> Yes, actual QMP PHY major rev is v8.  If we want to, I can generate a separate v8 based header files if that is better.  However, most of the offsets for the registers we're taking advantage of in the actual driver has the same offsets as previous revisions.

If all registers of a particular set (QSERDE, TX/RX, PCS) are the same,
then it should be fine to reuse those (although it creates some
questions). If the majority is the same, but there are some differences,
please create new header file. It is definitely easier to verify that
the patch is correct if every piece has the same version.

-- 
With best wishes
Dmitry

