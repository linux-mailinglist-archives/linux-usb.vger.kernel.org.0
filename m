Return-Path: <linux-usb+bounces-21374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E21FAA4F4DA
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 03:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F5E3AB8EB
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 02:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B402B9A6;
	Wed,  5 Mar 2025 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1S7pBLo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC638460
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 02:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741142749; cv=none; b=pk/5bbZchBV9QEX6omUi/GI5QnIS6eAvcvwgIA9ewjd/6uQVsQS+KiCtggh231Gl7kBTVy2mqWj6pgGAfbcxpkZTiay305v8/CJEQ7gN/TnOlOAsranD5s+pLrrC+XRSJkNMH09efyfPixKoc8UzeZO6n2+avTvZduNvkuoAijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741142749; c=relaxed/simple;
	bh=bxPOt3iOvm+8dVMBnFydRKzxiZIpympehaLaGAcgz1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHTGD3KH9ofIeM059+ypCFymj4J3R66IDHKo7uiLth5wN4IvhtIADyQdys0YncEtfUrykmvqJQp0mrBJoMROGws3rHKbLV9AiRERqLi+AqweeC3aFyPYGM12QpBy6cz1QgV/XSFQ8/lTw4VogP/XH2r6TrXukURYJBiU/3TUf5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1S7pBLo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5496078888eso3252503e87.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Mar 2025 18:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142746; x=1741747546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnCIdQjyvJoIw+09MQfZJbNjZFzCmtvJnm0G8vRNJh0=;
        b=X1S7pBLowpmNks6vOvQrzCO+mk16mKpIWw68Zagno5iXhR+RtaNHKpCWrEc/9C1ssR
         vIf9h3o3AVCZ9SWzYSBMzRd8qjPkM1+ngXDCVGrIjXrdPjmvQhB85ZLOlCPW+czPCjg6
         KvybFsswS2kh3TvcEy4BRDg+VKWmsZHA4dxfiWin3H/GIZoS/g9A9uMFBK1xbfzey0rE
         cTAZm7qXzmvjIhBYO86dhEit1suBcKG4A61Cc+nb/mVsjUf202RSg6J86oFeUaMnOKqj
         vD3x0+4f0s81tRSorrfEAL9j29qb2pBba/Eib6L76uN8t4cFdEbWs7Nivpe1DrZbqRsh
         5Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142746; x=1741747546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnCIdQjyvJoIw+09MQfZJbNjZFzCmtvJnm0G8vRNJh0=;
        b=Bdn4St/vZjFDn7IQAkc3X5G7nFVCHoCCtJ2fbbo6JOuurMDQHwyyalcZfioHtdyaJ0
         nQUSAj089Fy7VvPGNnMrcx4tr45xwtRXcuxhm67HVDmsJnytV4pv62gF9AvoRDvDDEPB
         D54lY89Q8goSo03wG0DwSPUR7DievbykW4WgOGMytF1J9whfl+iyp3kqX/i+2ok1tDg2
         /HQWCkU4g0rG3Sf9zYZS44xND+iNOUFpLwoBNtYvoR8dEhMAA8+oLCa1HlkMJ5fsspzH
         LRR46oh2IhkxdvITi8THcCxr9Dp8uqchD5r120GNQvuN5Df4PAxxOqM19ql0pZLrkaDv
         L1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX+lWA4Ln5/BMDREtgQPSeyJL06h8IyJ8Az49LoPf/L4Vbqmfwxui6KFWKQLN58rhBwIZAmpLM8Wws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtW2cvvkFJHmhPaO9JTah1KU5i4Ww249SJAd/v8j9p/Lbg9FI
	FV6uoX46OXiaHPiFojnECvE0rEEHhCy7cDcyTK/iOojUEPOz/dQoieCcQAfwM/4=
X-Gm-Gg: ASbGnctfhA+P/9JD+Rbx5SXxyD29fK8OazhcgivZ1G6wrMuqqP6nqlZi+M6kNVV3L7U
	dKPJrUgJa5APO9U+SUAxBcJPufv5WOkFse3CmvUQyY176IN+Z4I30KBNS2BArTsvxvOd1gyS/YQ
	WeHIgoQ8RoyJvHm/9WvKoKmsJ9QmPafNObJBfnjWK2WWlM+dYgdP1XcsFrih+4aquAYGosW02r9
	Yt5QajTR+e08zejHAHnggwOFKRw3LDLQWeyZ0O1rftBFp6ct4ZbVkIukY0fGtH8/ePbNgHvSam8
	C86A2kSABGJuHdRWMjqhfVxH0fc4g+xsTUZxp4HGOeEmrqJ/y44WNqrdwXzjTwBhX0DAf4ZwBPj
	bBcvGtV2OCmc7DzTN4R56rgR6
X-Google-Smtp-Source: AGHT+IENQirHPPtkH1C08buo5FlxHD+bBXarik3t8IBthupg5sNtQI8Z2GSZNo/BlNfNZfWRiNGXiA==
X-Received: by 2002:a19:5e5e:0:b0:549:735f:f0f6 with SMTP id 2adb3069b0e04-5497d38ecfcmr346846e87.50.1741142746049;
        Tue, 04 Mar 2025 18:45:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54959d33af7sm1173076e87.215.2025.03.04.18.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:45:44 -0800 (PST)
Date: Wed, 5 Mar 2025 04:45:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <dfpqg6u7kdvurgajufaldvpdxhe2pawmgum6ngtbbstdxrngwx@i2masto6nnwk>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:39PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 296 ++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
> 

[...]

> +
> +static int msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,

m31eusb2_phy_write_readback()

> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +

[..]

> +
> +static const struct phy_ops m31eusb2_phy_gen_ops = {
> +	.init	= m31eusb2_phy_init,
> +	.exit	= m31eusb2_phy_exit,
> +	.owner		= THIS_MODULE,

Strange alignment

> +};
> +

[...]

> +
> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	for (i = 0; i < M31_EUSB_NUM_VREGS; i++)
> +		phy->vregs[i].supply = m31_eusb_phy_vreg_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, M31_EUSB_NUM_VREGS, phy->vregs);

devm_regulator_bulk_get_const()

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get regulator supplies\n");
> +
> +

[..]

> +MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
> +MODULE_LICENSE("GPL");

MODULE_AUTHOR()?

> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

