Return-Path: <linux-usb+bounces-19328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9DCA10453
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 11:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBDDB168350
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 10:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F5D22DC50;
	Tue, 14 Jan 2025 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmzPRxu/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D722DC20
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850901; cv=none; b=PgkSetq/vSJV8dQOO7XDTfrG21m5W9yChgvbiiYBCPIBaVitGI0YVLhuY9Q3wj2BVTQWqrR8uRTbjcZafEGPamRmWzogNBrFnEAlUjzODJoXJ3DlQ4Xn8DnKzbplPj8rS+Tk8ad3ZeIWC4HDlUBRhCK01YLT+XgluvyWGLbLW8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850901; c=relaxed/simple;
	bh=oBY+3eZc51Y6fF6g/l8GEc6MeyGaj+xttfDQd4bfPhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMgvJSVh0DWvY8I1qjJmGY2TZ8CBr+ZA4l5urQhHwYnaolL1DrWUtBsLdcSPw16o7TiuylkySJ/sWDNz0kgD+2zCeomnyHGCWaHIkoS0oDhe0ZGuFEPAFZUDABCuQmgHFNVo8cdRbeGolsyxq/ajt4o2koSbT6s0YLrur6l2/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmzPRxu/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54024ecc33dso5535480e87.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 02:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736850897; x=1737455697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=;
        b=gmzPRxu/O9WthVoXIcfrpQWp3mNRQRuQnLIFI+Yk2GGYuFtoEvFABbxrLFbzFyKli6
         lB0LnXCU+44vF4KjLCogQoXIbDhLL79r1bkO+uPkupWeNFz3thx7uwjZXCvnXw7s/EG8
         zZhPuyPYsU+SNfvgVt4UBXK4l1TpnbWhsR7Kpk0Sy0jPBayJ5kkjQnh5AIC1RhFmutCr
         FIxJ1a9VRFpGAPDW/VpEk230NiTOwUqq6Db/lGtKSrqGaEL30DQE04qPtaie7A0x6K7H
         MmRrhlCtprYLwBtj6ayfANmNp2xd0yzpkr0XUBJxhwVfovZ+fxTx5fMFFuREAwwpdTz8
         tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850897; x=1737455697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=;
        b=jO1KYgqvVfPa1q+Xb/44pZi2U18a/tBlHrJmFD1vfOjiv4c7Ucd4Cow6XMr1AWAgZm
         S71n5vkJ+A98d10U5gQtpKEywlV1npvrH0vvu45VylGcbJAfZqsgj2cuDzNJVXC/eO+8
         3qvzISvdsU9evehWr8eW+5tnEwkV+QVv9oYnLEcOcTXI4doCxEkDmvhMYJY9/QJA3NbS
         tOoiYu5U8yXnqEcECRBF25g7NP29R3zJfaL8fOD57PjUbwMV7umyY0H8I0j0I4nPxR6e
         i2NUDqHbtyXsNGjOH+fQOlhnf1xeJvSprTaW29jQDLivF/LjUidtwhBae7UbKKYX6cr7
         olPg==
X-Forwarded-Encrypted: i=1; AJvYcCW916Ddli/Exms43g3FXi7NgKUZBEro2/NAAnVBFigmqLMeIU38nCGi67TcuzjFZvzgGkZUyw4t7eE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/SixkhazDAN1iVV4K+MXsWltf7qG/vO+pgOfoWFjpOuxas55z
	EO6VQweKQewLjTxxlIYZqAoPpU9vT6M50t5PRd7lZa0HFpxlWpyW+HHMqUjcXHo=
X-Gm-Gg: ASbGncvgDxZeZHBMhvST0EJtoocuflhCjqPkS3CGw9j27XS4rYPAZXhtVjtu9w2sdc0
	MBzHAIeu4BIBa7UCI2K3UoCj0rlC59vrf2iFt/8e3wBJOC1iY9shNOpdIP9gX8jaO9e9Mx4mrqW
	/o/5t+uUtnRKacx0GtdB5b8WUfX1M6Jh3pjEe/nB1LW5z0Yw1iYYjX6uhobQCb7/3SaQtwaIw7K
	p8+0yM/1g6O725IStIeveBDx28VDrW8P7NhWBeXy8sfRQX9xWU6jhwhAl6rMkwx5z0pdUnRsw95
	R2r4vHlX2gfCPyMqPNj0RnF5/EZnM2irt4aV
X-Google-Smtp-Source: AGHT+IFwrbLGTrG2dyiu5uP2+GJnDGK0/StK5LmN5McezpTF9gNRaaageIc+tg7gnEcGTINdnMPa7w==
X-Received: by 2002:a05:6512:ba9:b0:540:2223:9b20 with SMTP id 2adb3069b0e04-542845d1b75mr6413752e87.53.1736850897244;
        Tue, 14 Jan 2025 02:34:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49ee9sm1623927e87.52.2025.01.14.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:34:56 -0800 (PST)
Date: Tue, 14 Jan 2025 12:34:54 +0200
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
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> sequences to bring it out of reset, and to initialize the associated eUSB2
> repeater as well.

What does M31 mean? What is the relationship between the eUSB and USB
M31 PHYs?

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  12 +-
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>  3 files changed, 281 insertions(+), 1 deletion(-)

Please run the patch through checkpatch.pl --strict

> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define USB_PHY_UTMI_CTRL0		(0x3c)
> +
> +#define USB_PHY_UTMI_CTRL5		(0x50)
> +
> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define FSEL				(0x7 << 4)

GENMASK()

> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)

FIELD_PREP

> +
> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
> +
> +#define USB_PHY_CFG0			(0x94)
> +#define USB_PHY_CFG1			(0x154)
> +
> +#define USB_PHY_FSEL_SEL		(0xb8)
> +
> +#define USB_PHY_XCFGI_39_32		(0x16c)
> +#define USB_PHY_XCFGI_71_64		(0x17c)
> +#define USB_PHY_XCFGI_31_24		(0x168)
> +#define USB_PHY_XCFGI_7_0		(0x15c)
> +
> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
> +{				\
> +	.off = o,		\
> +	.mask = b,		\
> +	.val = v,		\
> +}
> +
> +struct m31_phy_tbl_entry {
> +	u32 off;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +struct m31_eusb2_priv_data {
> +	const struct m31_phy_tbl_entry	*setup_seq;
> +	unsigned int			setup_seq_nregs;
> +	const struct m31_phy_tbl_entry	*override_seq;
> +	unsigned int			override_seq_nregs;
> +	const struct m31_phy_tbl_entry	*reset_seq;
> +	unsigned int			reset_seq_nregs;
> +	unsigned int			fsel;
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
> +};
> +
> +struct m31eusb2_phy {
> +	struct phy			*phy;
> +	void __iomem			*base;
> +	const struct m31_eusb2_priv_data	*data;
> +
> +	struct regulator		*vreg;
> +	struct clk			*clk;
> +	struct reset_control		*reset;
> +
> +	struct phy *repeater;
> +};
> +
> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val, tmp = readl_relaxed(base + offset);
> +
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val)
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +}
> +
> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> +					const struct m31_phy_tbl_entry *tbl,
> +					int num)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < num; i++, tbl++) {
> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> +					tbl->off, tbl->mask, tbl->val);
> +
> +		msm_m31_eusb2_write_readback(phy->base,
> +					tbl->off, tbl->mask,
> +					tbl->val << __ffs(tbl->mask));

could you please check, what actually gets written? I suspect there
should be a -1 here.

> +	}
> +}
> +
> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_enable(phy->vreg);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		goto disable_repeater;
> +	}
> +
> +	/* Perform phy reset */
> +	reset_control_assert(phy->reset);
> +	udelay(5);
> +	reset_control_deassert(phy->reset);
> +
> +	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
> +	msm_m31_eusb2_write_readback(phy->base,
> +					USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
> +					data->fsel);
> +	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
> +	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
> +
> +	return 0;
> +
> +disable_repeater:
> +	phy_exit(phy->repeater);
> +disable_vreg:
> +	regulator_disable(phy->vreg);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

