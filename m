Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5514D78E15C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 23:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241191AbjH3VY4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 17:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjH3VYx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 17:24:53 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6224ECC9
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 14:24:21 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d7820f9449bso10255276.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693430579; x=1694035379; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O8kGGZ+yYzic7Nawq3DNrmlWB29Qsh1OZYatVeF7GGM=;
        b=xBTBf26cotNnMZ/GNvioA3fhH8/RM7TRp0JqEmBY5P/rF1Rwd9twAeOtGR3zoNhIBJ
         936FOoi5cOrKXSCupEZxFCXt+x9sLN5P8mIJvOQwpekUmuVS1dxshkUc3pS3pm1W4y8k
         YRZgKADJvjeHirwLl+UuKL+ycEWbGF9KR36UNNZ+WG/JftPgeCvsNECrTy4r9AVoXESh
         Q3xgnXvna5OV10guRAy0lUrD9datujwatfDp1N9DUbQJwkqhhSSPjVkOOE7uVu6O43vy
         bJO9lvG0HeFZ8dSUDoQD4NWkkG3lYcdMp0fc5+WO/39RKP6tH67OtUiLE67lQvBHjCNH
         FuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693430579; x=1694035379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8kGGZ+yYzic7Nawq3DNrmlWB29Qsh1OZYatVeF7GGM=;
        b=SLexx0et/pkREo6atxBa5UhkSKuD5vK2RyONcG/T1m66JvJomTgWEv0Kt8udZsUUVQ
         ogziDV4jpi6QL5Pm1Edj6kKsaOUfWRay9n2VGlPiPvX/CTDgIP88zv0UZLGFmWDIeRYz
         Y4h/JXlBnQug+lNtMedxBMnVPC+NIM2qT7eU2xBY1az7EOk2gkxgzwq791IVqJ2GvnY8
         2K9LAe/Ch4Tsr06ZfrutlDSoSQ1/vO8tHSRZt2JXI88qqKOOJ51w5sYOBHsG4xaIwBfz
         I38VatHEtp0WoIKu7rV90XSDE13u6/PRFrGEtLYlYyvS2IoRpZomFy+XgXZVFUYDlubQ
         N6RA==
X-Gm-Message-State: AOJu0YyE6UCYq7sHrwDhmK6vP2EarQJIffxaeghtUfSGSX9DN5rEillK
        Jh/UEVryniMbJ2R9HmodWVqiS3t6i3miFDg6x5tMYNP3Iaxd1Fi4
X-Google-Smtp-Source: AGHT+IHUnyWfOFAYID1o0vf2VVLGaIROgv5s/xgle655lK1ZczFXhZacdesCf6ewIfvbJsm//wQo+EaiCbHfEE/5a8w=
X-Received: by 2002:a25:6b07:0:b0:d78:3047:62c6 with SMTP id
 g7-20020a256b07000000b00d78304762c6mr3414264ybc.21.1693426517530; Wed, 30 Aug
 2023 13:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230825093531.7399-1-quic_nsekar@quicinc.com> <20230825093531.7399-5-quic_nsekar@quicinc.com>
In-Reply-To: <20230825093531.7399-5-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 23:15:06 +0300
Message-ID: <CAA8EJprLwi3QKgTksTeSWkjmhFL69PO8Zmc=j3VMfAr_UpXJ=g@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq5018: Add USB related nodes
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Amandeep Singh <quic_amansing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 25 Aug 2023 at 12:37, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Add USB phy and controller nodes.
>
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..ff477923a823 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -238,6 +238,60 @@
>                                 status = "disabled";
>                         };
>                 };
> +
> +               usbphy0: phy@5b000 {
> +                       compatible = "qcom,ipq5018-usb-hsphy";
> +                       reg = <0x0005b000 0x120>;
> +
> +                       clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
> +
> +                       resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +
> +                       #phy-cells = <0>;
> +
> +                       status = "disabled";
> +               };
> +
> +               usb: usb2@8a00000 {
> +                       compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
> +                       reg = <0x08af8800 0x400>;
> +
> +                       interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hs_phy_irq";
> +
> +                       clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +                                <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> +                                <&gcc GCC_USB0_SLEEP_CLK>,
> +                                <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                       clock-names = "core",
> +                                     "iface",
> +                                     "sleep",
> +                                     "mock_utmi";
> +
> +                       resets = <&gcc GCC_USB0_BCR>;
> +
> +                       qcom,select-utmi-as-pipe-clk;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       usb2_0_dwc: usb@8a00000 {

Could you please remove the `2_0' part of the label?

> +                               compatible = "snps,dwc3";
> +                               reg = <0x08a00000 0xe000>;
> +                               clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                               clock-names = "ref";
> +                               interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +                               phy-names = "usb2-phy";
> +                               phys = <&usbphy0>;
> +                               tx-fifo-resize;
> +                               snps,is-utmi-l1-suspend;
> +                               snps,hird-threshold = /bits/ 8 <0x0>;
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_u3_susphy_quirk;
> +                       };
> +               };
>         };
>
>         timer {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
