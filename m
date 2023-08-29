Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1890878C7DB
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 16:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbjH2Opj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 10:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236984AbjH2OpS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 10:45:18 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70075139
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 07:45:15 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d749f57cb22so4212181276.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693320314; x=1693925114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sYJFL/oP3SaDlhdD3A5BVkBBrDmASIKsskxYu/T8gOk=;
        b=GY0rtHFHuTCGCTm11spgEUbsSzmNYPKJ1piASOWE3ElhgJN7T+MNyYtD9MdkmLRGHj
         YykbxRufPy04Pie620zQY8M9JF9lGQVFlc4IquUKpxBHibg53HW6y+iBIfXaQC46uIvZ
         ntgj4qOqt8V7eoSSYpNSsACFZprYH3cuMTJ62c1z2WwenCA0CCZfK+czw+PoiYk57xKk
         PXB6DeOeDUor2bkWHnRyAEigbWq5I5CksfcVZk+dxjohBbLmeCUQFwTBstwU6FmbQUCj
         gXyu5ZLuGcjiyu7BekuXsBmqPyp6V455ezYy+EZvQQC8JC/VvXByKYEAXheoEBtj3TBR
         2NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693320314; x=1693925114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYJFL/oP3SaDlhdD3A5BVkBBrDmASIKsskxYu/T8gOk=;
        b=jVxrVwHCJJDN8ORp5eu+OYcGI0xfYi67EM1WmLB58HhKco1mEK/LKeh4hkqfoiMoL2
         zGazDwDArHOHHS4Tc/byzoI5NcccFxrcCUrUmgqNHicv/4WAM3ouqUmYmjkYkBy4jpYs
         BLTTB0LCzBNCO6oBt63QzUI4DzSBqYfXIjU7ykmWZ3osXaQwLQ+6x+WL+IxcWLC+klX9
         JdqvQtW9f+Odb1dMJz04bfN9Rv5o2Oz4l39y7rfLnb19c6XOhWglRM+TKG4jXlkgcpYT
         BLqkl1rdZ0JlZUMcvmRjnqP5FviGf9cr8xIUDuqmSfEIqbIOLIWY3SJHjoiNtNDokIUp
         2YPA==
X-Gm-Message-State: AOJu0YzFJC002NNzuSz8uMvy+6IEnrgs2S9jfDqbDDPvxUPn4D/wPKm7
        M0dU+qNgekpMhhQLAxRjuiYDeoN3RSs/bn4isuPy8w==
X-Google-Smtp-Source: AGHT+IGs1a1lOiAH7BmcROycjWaFcW0bQVi0E8yagxKqODme69iYwdaPfRNKIXre8FrW8ccNKSINi3f6JinWFQR0BBE=
X-Received: by 2002:a25:b0a3:0:b0:d39:fa2f:8b63 with SMTP id
 f35-20020a25b0a3000000b00d39fa2f8b63mr30342451ybj.25.1693320314602; Tue, 29
 Aug 2023 07:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com> <20230829135818.2219438-9-quic_ipkumar@quicinc.com>
In-Reply-To: <20230829135818.2219438-9-quic_ipkumar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 17:45:03 +0300
Message-ID: <CAA8EJpqraO6UXBs=aPpWNuhEPjdcQ01FyV_Np1KtuJtEkJE0Hg@mail.gmail.com>
Subject: Re: [PATCH 8/9] phy: qcom: uniphy: Add ipq5332 USB UNIPHY support
To:     Praveenkumar I <quic_ipkumar@quicinc.com>
Cc:     robert.marko@sartura.hr, luka.perkov@sartura.hr, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com, rafal@milecki.pl,
        peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 29 Aug 2023 at 17:00, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> This patch adds ipq5332 USB SS UNIPHY support.

First, please read to Documentation/process/submitting-patches.rst,
then rewrite the commit message.

Next, I tend to say that this driver doesn't have a lot in common with
the ipq4019 driver you have modified. Please consider adding new
driver for ipq5332, then we can see whether it makes sense to fold
ipq4019 to use new infrastructure.

>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
> This patch depends on the below series which adds support for USB2 in
> IPQ5332
> https://lore.kernel.org/all/cover.1692699472.git.quic_varada@quicinc.com/
>
>  drivers/phy/qualcomm/phy-qcom-uniphy.c | 37 ++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.c b/drivers/phy/qualcomm/phy-qcom-uniphy.c
> index eb71588f5417..91487e68bb6e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-uniphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.c
> @@ -26,6 +26,10 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>
> +#define PCIE_USB_COMBO_PHY_CFG_MISC1           0x214
> +#define PCIE_USB_COMBO_PHY_CFG_RX_AFE_2                0x7C4
> +#define PCIE_USB_COMBO_PHY_CFG_RX_DLF_DEMUX_2  0x7E8
> +
>  struct uniphy_init_tbl {
>         unsigned int offset;
>         unsigned int val;
> @@ -37,6 +41,12 @@ struct uniphy_init_tbl {
>                 .val = v,               \
>         }
>
> +static const struct uniphy_init_tbl ipq5332_usb_ssphy_init_tbl[] = {
> +       UNIPHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_RX_AFE_2, 0x1076),
> +       UNIPHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_RX_DLF_DEMUX_2, 0x3142),
> +       UNIPHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_MISC1, 0x3),
> +};
> +
>  struct uniphy_cfg {
>         const struct uniphy_init_tbl *init_seq;
>         int num_init_seq;
> @@ -83,6 +93,32 @@ static const struct uniphy_cfg ipq4019_usb_hsphy_cfg = {
>         .reset_udelay   = 10000,
>  };
>
> +static const char * const ipq5332_usb_ssphy_clk_l[] = {
> +       "phy_ahb", "phy_cfg_ahb", "pipe",
> +};
> +
> +static const char * const ipq5332_usb_ssphy_reset_l[] = {
> +       "por_rst",
> +};
> +
> +static const char * const ipq5332_usb_ssphy_vreg_l[] = {
> +       "vdda-phy",
> +};
> +
> +static const struct uniphy_cfg ipq5332_usb_ssphy_cfg = {
> +       .init_seq       = ipq5332_usb_ssphy_init_tbl,
> +       .num_init_seq   = ARRAY_SIZE(ipq5332_usb_ssphy_init_tbl),
> +       .clk_list       = ipq5332_usb_ssphy_clk_l,
> +       .num_clks       = ARRAY_SIZE(ipq5332_usb_ssphy_clk_l),
> +       .reset_list     = ipq5332_usb_ssphy_reset_l,
> +       .num_resets     = ARRAY_SIZE(ipq5332_usb_ssphy_reset_l),
> +       .vreg_list      = ipq5332_usb_ssphy_vreg_l,
> +       .num_vregs      = ARRAY_SIZE(ipq5332_usb_ssphy_vreg_l),
> +       .pipe_clk_rate  = 250000000,
> +       .reset_udelay   = 1,
> +       .autoload_udelay = 35,
> +};
> +
>  static int phy_mux_sel(struct phy *phy)
>  {
>         struct qcom_uniphy *uniphy = phy_get_drvdata(phy);
> @@ -396,6 +432,7 @@ static int qcom_uniphy_probe(struct platform_device *pdev)
>  static const struct of_device_id qcom_uniphy_of_match[] = {
>         { .compatible = "qcom,usb-hs-ipq4019-phy", .data = &ipq4019_usb_hsphy_cfg},
>         { .compatible = "qcom,usb-ss-ipq4019-phy", .data = &ipq4019_usb_ssphy_cfg},
> +       { .compatible = "qcom,ipq5332-usb-ssphy", .data = &ipq5332_usb_ssphy_cfg},
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, qcom_uniphy_of_match);
> --
> 2.34.1


-- 
With best wishes
Dmitry
