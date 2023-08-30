Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECF778E11F
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 23:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240005AbjH3VE0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 17:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239619AbjH3VEZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 17:04:25 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98CAF1AE
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 14:03:54 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-48d333a18b3so64197e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 14:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693429040; x=1694033840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VJiEYvthVUOcpYJPy9yFGFD2aO5cf2VHnVMOssUOmRg=;
        b=IumezxcRsuSUdUQFYUPwCR4jHC+H2yRtrgtYHW2UbUs6hFIxZ4J+pcqtZTe7xjJajX
         S7DyPGWIIY458jgrwdL3j06ZtbjTZMkJQMB5cdxV3FQXgK+k2nuIO+/BTmjFq5NsMVa9
         I3orFzoADH4wKvul4cOxjgmp9vXpdb325apt3NDisgUnM2nV58LA7iMC7LeHmjlOs82M
         LloqSD70aMOOV00z/zHDcmxp96wQLbd4zAVK/IU1+dhgGSmlqoU9Igf9FXzrclsBjJu4
         ZqcDGD9jAYz2A5vlUXAanyyimIxsTzs+PCQS977vVMjDjMlI1Br2UL0CnYG8l3FWQxfp
         Vthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693429040; x=1694033840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJiEYvthVUOcpYJPy9yFGFD2aO5cf2VHnVMOssUOmRg=;
        b=giFoRPkQVjp8k9A+bwSOQY/0FjI9l9cWWYJn5onnoZR0qSNvl4hco2tjYxRMy0yucY
         ZADIOVo1jJ2HCtIZjf4O/Ap2BLrEvh/Cp237jM2gLLSHde4T/qAHdoMC+oh6WVeO+af9
         nvk8LsRMAPu/PYV9M2skpwckyQ+mOAlD8IOvX8BTt3G60o7Z4zL9vqdxzJFFrdZSrhpb
         jLjqd6j38K/IT8ZwYQzGb4VkqeHWO9XcJUtaauDAaHUz8xKkU7c7jbBK0uauH6RUmNkw
         1jNQPC+2fl2chkOLfXTLfJ8egZL61IKJKVn2pvnUvXJ3NsoThkunGg4JyxpmbaGRcliA
         4QLg==
X-Gm-Message-State: AOJu0Yxr0Q3Wh/eXGmDljd3vkdqrgg21zeDbgQYG4ustns3ddWKlRLp4
        4homG5Gf8d1dYJA9xsx/Dgazl3Y+uDCjY3zZ1spJwBFIjkiNTnbZ
X-Google-Smtp-Source: AGHT+IE2iDDTjFTVDoB3gZ4fX5lg6uyzcQRItrwWgsQ3B9T43cbbiyZMI0KSJ+aavpFonXZjy3iNu1t/WvVG3AWOXxc=
X-Received: by 2002:a05:6902:18cd:b0:d78:48b0:21d2 with SMTP id
 ck13-20020a05690218cd00b00d7848b021d2mr3630806ybb.3.1693424624644; Wed, 30
 Aug 2023 12:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230830111722.19380-1-quic_nsekar@quicinc.com> <20230830111722.19380-4-quic_nsekar@quicinc.com>
In-Reply-To: <20230830111722.19380-4-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 22:43:33 +0300
Message-ID: <CAA8EJpr3SnEXRENAgzdemANnYWvwM7Z-xyZYe335O45Jps91kg@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: ipq5018: Add USB related nodes
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
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 30 Aug 2023 at 21:30, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Add USB phy and controller nodes.
>
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
> V2:
>         Fix ordering of the USB related nodes and use
>         generic node names.
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..917e4a2d8e64 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -93,6 +93,19 @@
>                 #size-cells = <1>;
>                 ranges = <0 0 0 0xffffffff>;
>
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
>                 tlmm: pinctrl@1000000 {
>                         compatible = "qcom,ipq5018-tlmm";
>                         reg = <0x01000000 0x300000>;
> @@ -155,6 +168,47 @@
>                         status = "disabled";
>                 };
>
> +               usb: usb@8af8800 {
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

As we have seen from the next patchset, this host supports USB 3.0.
Can you please drop the 2_0 part of the label?

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
> +
>                 intc: interrupt-controller@b000000 {
>                         compatible = "qcom,msm-qgic2";
>                         reg = <0x0b000000 0x1000>,  /* GICD */
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
