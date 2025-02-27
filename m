Return-Path: <linux-usb+bounces-21118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6DEA471CE
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 02:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C5D3A2269
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 01:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD04839F4;
	Thu, 27 Feb 2025 01:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xu7j209p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3F374FF
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 01:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740621350; cv=none; b=kc4u46Qg0ycAcCcXph45mGkAfhgwUtPFiR/+pvuZ0uyQSdF/7c+mUGc0rl1p1Un1teG/bI1T8sF0uuFHKXplue1I4iEjG6Hv+M53GsueC3z0rKAd0jVSOltsyfjVo9ClsSCBN8OadBTrawIbrJ8lrLoK3R2eVwT1evR7UKK8JkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740621350; c=relaxed/simple;
	bh=DC0eGp9v8d1QZfBU9fMOar1qrRj1i2mRnNeM6GJiBVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BU8A9IDGicC7rd1VeUcsCW0lSULR35F1ORPI6V4auO4kdvtpG35NhQuDd4hNK2ZbmjS2JBX8vjLMm653CvEWHp+iZSQgI+J6OvGPXXMUtk0WsNDXA249mFCC+SGCUBqJOFxQl4ZnzUMHq2R/HmSJlZfrkOciYERbEhtMRY+XRNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xu7j209p; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fb9dae0125so4722767b3.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 17:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740621347; x=1741226147; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7ylmtH1h1K8CyuUFBBRJ+T9/XYWZO25bwG+O3oh1H0=;
        b=Xu7j209peftU5weHwQO+Mrog9ooBGx8UIogelSH2jhI0RGhBbs3hUOtK+N0EWoklSZ
         LrjnnO8osBrjd3F6qRP+nfq/FcIiX6dPWLFFcG9F4XT/eMArAmbIKHRkKYqM9ewYvo8l
         UafmbOzNVXla+MpY8W6kSFFA07JtjPWEO5hbkfz6SYcmKO30L478mecwLLPaBDj4K3A0
         PekRFJDuh0z+Q6MDvdyB9u79dbxcdBgCtEbUlYXksXu08mV11cpnD9dn4sT+KQpGX8I8
         YuUvnYN9ogjIzg8ItkIFVUIWk1YJl28MQZouInDDTRNhZNZUen4s3iNP4A1PvvFP6hAr
         tf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740621347; x=1741226147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7ylmtH1h1K8CyuUFBBRJ+T9/XYWZO25bwG+O3oh1H0=;
        b=UeTbS8Y3yT3QLPgMy2JeGvR7MRZ3rOjA5o0+9PeOyOQ/7q2kmGrmQndbBIeR/wRteF
         O9twfyBYkhwGJAV0z7DnYAku/adLrULSIkY1Jh6gkStQLpTfogcNfXbzQa3aRBd1xEqe
         vgnkcFQXYtvh6a8RcwtL7RG9JoSQbC4OmBqdtakPqKUcG/Nfralc+KWJvpIa6+D5Fk5k
         r4dfMrZgX7ZaFCziw1vJCV6neiKaXwzL8SIm6XzJ39pQzaWkpQ0LYIJx3k6UMcBF2Wxb
         BI3sWgbazX1xSmXs+DQrXsGA+ocprSIWVfEvmz8KcqcL8MZAkoT2QcQI0RBrjoTIrcMy
         DVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRF336TKWJDByp0EGEiKVAPVzGLH8VKh+XdDxpGzIsb3cB+n7KN/2oZI6C9VByJLOX5rOtEi15FdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8N/GRar5jcM9PPl80shoAM/dsWEuOL5QyqQ86A0GZuB1WubGx
	K4mn0vABvJ/Fz7YBHa1elW17IM2SDD3WJCxOflD/TH+CG1Cc+itZjqkEpcfVp05tQE1Ms0yFFOO
	4zRRl/jxRltY2Fd04tgPRA13YJmhn0voekAyV6A==
X-Gm-Gg: ASbGnctyyJu1KiYSNGInAbg0eARmnamTVp+DVkJb6TXZUX0arqGHJubFyW0OAQ8RkJF
	cq4cew118EvGAdUNgYsXaYK6klk2CvzJgTF1ZyIJrVoJbBGxPBC1M+6/KB0AD7EMLSDWftGFp+Q
	Cuv8boZwQ=
X-Google-Smtp-Source: AGHT+IHzvdnR1jDhSTQ8qilflEhVDXXhrfQPEbKHX390Tv5HVxnb5kCDP/uDUeA+G1lHLQvrrevPA0tkD3CkUNLb6+w=
X-Received: by 2002:a0d:e543:0:b0:6fd:2587:cb32 with SMTP id
 00721157ae682-6fd2587ce9amr37319607b3.31.1740621347348; Wed, 26 Feb 2025
 17:55:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
 <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto> <92b42216-c409-4e21-a33e-54c29fa5f8a0@quicinc.com>
In-Reply-To: <92b42216-c409-4e21-a33e-54c29fa5f8a0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 03:55:36 +0200
X-Gm-Features: AQ5f1JoWpbR4msT08jh6oiWBnd9arDDGPKh6dQcrHSO5lw25XXPxGsD4vcj6_h4
Message-ID: <CAA8EJpobfKD=WjapG7Vx0mMFrGYSbadsrsakWs65Lpt43z7wVg@mail.gmail.com>
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 22:23, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
>
>
> On 1/14/2025 2:34 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> >> sequences to bring it out of reset, and to initialize the associated eUSB2
> >> repeater as well.
> >
> > What does M31 mean? What is the relationship between the eUSB and USB
> > M31 PHYs?
> >
>
> M31 is the vendor.  I'll reword this to make it a bit clearer.  There's no
> relationship between eUSB2 and USB2 PHY drivers, as the eUSB2 based driver
> would require some additional components such as a USB repeater.
>
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  drivers/phy/qualcomm/Kconfig              |  12 +-
> >>  drivers/phy/qualcomm/Makefile             |   1 +
> >>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
> >>  3 files changed, 281 insertions(+), 1 deletion(-)
> >
> > Please run the patch through checkpatch.pl --strict
> >
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
> >> --- /dev/null
> >> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> >> @@ -0,0 +1,269 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/err.h>
> >> +#include <linux/io.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/phy/phy.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/reset.h>
> >> +#include <linux/slab.h>
> >> +
> >> +#define USB_PHY_UTMI_CTRL0          (0x3c)
> >> +
> >> +#define USB_PHY_UTMI_CTRL5          (0x50)
> >> +
> >> +#define USB_PHY_HS_PHY_CTRL_COMMON0 (0x54)
> >> +#define FSEL                                (0x7 << 4)
> >
> > GENMASK()
> >
> >> +#define FSEL_38_4_MHZ_VAL           (0x6 << 4)
> >
> > FIELD_PREP
> >
> >> +
> >> +#define USB_PHY_HS_PHY_CTRL2                (0x64)
> >> +
> >> +#define USB_PHY_CFG0                        (0x94)
> >> +#define USB_PHY_CFG1                        (0x154)
> >> +
> >> +#define USB_PHY_FSEL_SEL            (0xb8)
> >> +
> >> +#define USB_PHY_XCFGI_39_32         (0x16c)
> >> +#define USB_PHY_XCFGI_71_64         (0x17c)
> >> +#define USB_PHY_XCFGI_31_24         (0x168)
> >> +#define USB_PHY_XCFGI_7_0           (0x15c)
> >> +
> >> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)      \
> >> +{                           \
> >> +    .off = o,               \
> >> +    .mask = b,              \
> >> +    .val = v,               \
> >> +}
> >> +
> >> +struct m31_phy_tbl_entry {
> >> +    u32 off;
> >> +    u32 mask;
> >> +    u32 val;
> >> +};
> >> +
> >> +struct m31_eusb2_priv_data {
> >> +    const struct m31_phy_tbl_entry  *setup_seq;
> >> +    unsigned int                    setup_seq_nregs;
> >> +    const struct m31_phy_tbl_entry  *override_seq;
> >> +    unsigned int                    override_seq_nregs;
> >> +    const struct m31_phy_tbl_entry  *reset_seq;
> >> +    unsigned int                    reset_seq_nregs;
> >> +    unsigned int                    fsel;
> >> +};
> >> +
> >> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
> >> +};
> >> +
> >> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
> >> +};
> >> +
> >> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
> >> +    M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
> >> +};
> >> +
> >> +struct m31eusb2_phy {
> >> +    struct phy                      *phy;
> >> +    void __iomem                    *base;
> >> +    const struct m31_eusb2_priv_data        *data;
> >> +
> >> +    struct regulator                *vreg;
> >> +    struct clk                      *clk;
> >> +    struct reset_control            *reset;
> >> +
> >> +    struct phy *repeater;
> >> +};
> >> +
> >> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> >> +                                    const u32 mask, u32 val)
> >> +{
> >> +    u32 write_val, tmp = readl_relaxed(base + offset);
> >> +
> >> +    tmp &= ~mask;
> >> +    write_val = tmp | val;
> >> +
> >> +    writel_relaxed(write_val, base + offset);
> >> +
> >> +    tmp = readl_relaxed(base + offset);
> >> +    tmp &= mask;
> >> +
> >> +    if (tmp != val)
> >> +            pr_err("write: %x to offset: %x FAILED\n", val, offset);
> >> +}
> >> +
> >> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> >> +                                    const struct m31_phy_tbl_entry *tbl,
> >> +                                    int num)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i = 0 ; i < num; i++, tbl++) {
> >> +            dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> >> +                                    tbl->off, tbl->mask, tbl->val);
> >> +
> >> +            msm_m31_eusb2_write_readback(phy->base,
> >> +                                    tbl->off, tbl->mask,
> >> +                                    tbl->val << __ffs(tbl->mask));
> >
> > could you please check, what actually gets written? I suspect there
> > should be a -1 here.
> >
>
> The __ffs  uses the ctz/ctzl built in, which counts leading zeros, so the
> -1 should already be accounted for.  FIELD_PREP uses the ffs builtin
> directly, which would require the -1.  Confirmed that the writes are being
> done as expected from the programming tables above.

Ack, thanks.



-- 
With best wishes
Dmitry

