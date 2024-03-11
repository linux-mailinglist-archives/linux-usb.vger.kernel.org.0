Return-Path: <linux-usb+bounces-7816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DABB877FB1
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 13:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340362822E5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 12:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA33C478;
	Mon, 11 Mar 2024 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="To/mIZ2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2863BB48
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159093; cv=none; b=XqHAgXWeBaI8Yj/mGtl0j6X/FfGrhBPZFODscDrzzLzuPPfmQUtnup9D622pAJkeGzVZNgs+qbyB6IDwDbr2i0JxlJ708iuEjMoClwZWz0WIzc8rDem+FUZFXIjG9ZnEZl16/gqm7DVFtddb3i//yR8PhO+ybPpUv+/S7RP7fxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159093; c=relaxed/simple;
	bh=hPCVMa6Dg6Dev/02Qlr2EszqiAAyEsxvBg5lx8hr1bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8HLyrabU2N0JsXl7qH29+lg+Sg443yjqQfmEYH58LBra4EGosSDXz0yeMYebKQ0Wo717ySEjimSEPBjKU8L/+6ztYXt25CY2nhsj9v8Ha2QEOYHRHZYjxugiQwtjIejzEQzWpZhrBALIrnLW7E9LYQOpxzt3ocSy7rcmCi3rzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=To/mIZ2a; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a0a54869bso19290077b3.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710159091; x=1710763891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Df2BGMbvWb2FVi+eRBRBYDqje0ymDCBi93nT5jupjk=;
        b=To/mIZ2a/NT8WwzOsnA38kwGMfoew/534sla9xvfbdwCGDypvthEq3zJDT2ewT7ELO
         yCQK+TUMZF8CpmIa9dKABV/K78FZYcrOiS4MQQk7PDytRa0pIX69WgSWyJYExkyUBhiR
         sQWsc4jYjyOpzuJLuXBUAFRs6jZowOjG7ZsOiFl9s/4CPOF/7oHsGIh3efYUOuHcVWf1
         TVEcUGIJSXkOhvkxCPB1QWT4l6lEb4pwAtCQIIEqi9cgdw2NAroDoftWHhrTL23PG4/t
         UKjhlfnnV4m7c/SC3frH/DCVC0RYNl4bEO4l/SA3KTDbBRRyzvnPitnbo84/eEV0g7P/
         QUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710159091; x=1710763891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Df2BGMbvWb2FVi+eRBRBYDqje0ymDCBi93nT5jupjk=;
        b=Z3FijQ4oclwrpVIX+ShxX7gJfAdB7t/MY5er3qckaLn0MHNtRDoLyi7mPWXgeEHmmS
         7Ou79fbLrr9+c5b7XQj1G1KWU1fBkHZVgR8+4jt2fF6szSxJ7rF0zvdY4sZOA0J4jSKW
         /7DkovWkUY2zVFi/BTjP+4txh+1sVOa+HN6d8100PcK+sZ5vN/E4DwBxKfDH+/1WoBlp
         OHYhFD31jo5qky5haPpQYEuS/+ftK3jmEVpuwouJ2oK3ufS2a+JHPlvT24cFXIOnGoVv
         LweUZPjSPHGtDPM8P4oilJvrHL5NIBXuwxyf5G6ecoqWVKqKfeRIY+FTLZ2UDs60Hj73
         vibw==
X-Forwarded-Encrypted: i=1; AJvYcCW0PYDUUpyJrA9wknZ9pLUg2d4TSlTlTvSmvOlDKt2ewmQiqSwiJ+mYnFRsq986ReFEjQtBAWdf5soRESwOtFqQdTGuT2y8FzLa
X-Gm-Message-State: AOJu0YxVl3Fp5DGuzke9ui/XDwA2EgvY8LwB53eQYQV1WQlXJvdg+mmu
	PL4ku7ZdWramHf6QJUn85eD0UlrEGiG9UE1o9n655qb5U/VIuKvezWXFWFxUh7hfGHc6BtmUv0B
	PrttUtvkyVNtJHh8qrW4G49+PxKjRl7zSVKK8lQ==
X-Google-Smtp-Source: AGHT+IH3uEU9Y3NgSjn2ucTTnuKP0tLiafc9xxzHXN2G6ScWOy3+Ws7ZAt0RIOXZIhqarb09H4oVYpgLcqNXFBV4RIE=
X-Received: by 2002:a0d:eec1:0:b0:60a:36c2:fdf8 with SMTP id
 x184-20020a0deec1000000b0060a36c2fdf8mr1469676ywe.18.1710159091155; Mon, 11
 Mar 2024 05:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311120215.16845-1-quic_kbajaj@quicinc.com> <20240311120215.16845-5-quic_kbajaj@quicinc.com>
In-Reply-To: <20240311120215.16845-5-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 14:11:19 +0200
Message-ID: <CAA8EJpo7Zd-QxAxKFuo5zaR-=N8eBefpL=LcLQ9j+akhFQYUrg@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: qcpm-qmp-usb: Add support for QDU1000/QRU1000
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amrit Anand <quic_amrianan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 14:05, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Add QDU1000/QRU1000 specific register layout and table configs.
>
> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 52 +++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index 5c003988c35d..e067574bea7a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -1441,6 +1441,32 @@ static const struct qmp_phy_init_tbl x1e80100_usb3_uniphy_pcs_usb_tbl[] = {
>         QMP_PHY_INIT_CFG(QPHY_V7_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
>  };
>
> +
> +static const struct qmp_phy_init_tbl qdu1000_usb3_uniphy_pcs_tbl[] = {
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xc4),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x89),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +};
> +
> +static const struct qmp_phy_init_tbl qdu1000_usb3_uniphy_pcs_usb_tbl[] = {
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +       QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_POWER_STATE_CONFIG1, 0x6f),
> +};
> +
> +
> +

Please drop extra empty lines.

Also the tables are more or less sorted out. Please move this to a
correct place.

>  struct qmp_usb_offsets {
>         u16 serdes;
>         u16 pcs;
> @@ -1693,6 +1719,29 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
>         .regs                   = qmp_v2_usb3phy_regs_layout,
>  };
>
> +static const struct qmp_phy_cfg qdu1000_usb3_uniphy_cfg = {
> +       .lanes                  = 1,
> +
> +       .offsets                = &qmp_usb_offsets_v5,
> +
> +       .serdes_tbl             = sm8150_usb3_uniphy_serdes_tbl,
> +       .serdes_tbl_num         = ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
> +       .tx_tbl                 = sm8350_usb3_uniphy_tx_tbl,
> +       .tx_tbl_num             = ARRAY_SIZE(sm8350_usb3_uniphy_tx_tbl),
> +       .rx_tbl                 = sm8350_usb3_uniphy_rx_tbl,
> +       .rx_tbl_num             = ARRAY_SIZE(sm8350_usb3_uniphy_rx_tbl),
> +       .pcs_tbl                = qdu1000_usb3_uniphy_pcs_tbl,
> +       .pcs_tbl_num            = ARRAY_SIZE(qdu1000_usb3_uniphy_pcs_tbl),
> +       .pcs_usb_tbl            = qdu1000_usb3_uniphy_pcs_usb_tbl,
> +       .pcs_usb_tbl_num        = ARRAY_SIZE(qdu1000_usb3_uniphy_pcs_usb_tbl),
> +       .vreg_list              = qmp_phy_vreg_l,
> +       .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> +       .regs                   = qmp_v4_usb3phy_regs_layout,
> +       .pcs_usb_offset         = 0x1000,
> +
> +       .has_pwrdn_delay        = true,
> +};
> +
>  static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
>         .lanes                  = 1,
>
> @@ -2620,6 +2669,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
>         }, {
>                 .compatible = "qcom,sdx65-qmp-usb3-uni-phy",
>                 .data = &sdx65_usb3_uniphy_cfg,
> +       }, {
> +               .compatible = "qcom,qdu1000-qmp-usb3-uni-phy",
> +               .data = &qdu1000_usb3_uniphy_cfg,

Please keep the table sorted.

>         }, {
>                 .compatible = "qcom,sdx75-qmp-usb3-uni-phy",
>                 .data = &sdx75_usb3_uniphy_cfg,
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry

