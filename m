Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE0D41B8B4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 22:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242748AbhI1Uyi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 16:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242733AbhI1Uyb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Sep 2021 16:54:31 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00F1C061746
        for <linux-usb@vger.kernel.org>; Tue, 28 Sep 2021 13:52:51 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 24so184876oix.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Sep 2021 13:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3Jv+h2WbR0xCnK/aZ32tsYZMhSsRXzBhaqTpIfuiDho=;
        b=YRDxoPYUP1th3n3DNQ1RQ12iybGeum6noi5WCEfmCk+EY0hBDcTA/jcKyJoNU8eKVI
         yaLflsaZZ+5PCH3EcO9qozTaKr8Wnmm7bViTahh/TyeI43ujxzn42jvm+InPjx7V8/Wk
         /SfoCHzhCAnle+v6RfETXS76dLAJBDsMOlDP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3Jv+h2WbR0xCnK/aZ32tsYZMhSsRXzBhaqTpIfuiDho=;
        b=CO9CWAolTDCfAq+oV6CSfQoIETN2sPxMa7jREap75TnXtNSgba38JhSR4z6Ysj2kaa
         NqpPg7gglnNza5y87E/QN7DoLc/7DCWhG1RiqWK69oYvaUdobk5rNEfjfE/iT1ST4KOR
         jDabcTkuRyv2qWBJgs9nFJDHXGwRvmN9i/wllg+QpBOxEsiWfZANH2HYv3mnlRkSg1Q8
         wgddmAECYNDocApCpeYs2hFtPw+dOyPvIoJjAG9Do3MIlcFgSl/RLMhryduqwbIG6ul5
         uA9QbY5LT3fJiOafve73Fe9c7llSk+iXPAKhudBSTbC8E4ozPQ6//3Igyj/dFDhETvJO
         cJHQ==
X-Gm-Message-State: AOAM530/Mai+GqdLb0h79Dv92MtKv/k7k0oADB3ZUfk0QSQdNOf9kjiA
        Tcu30m4Gq5GJ93akLuKnoHf9+rTAxxOuJKynP7mcOg==
X-Google-Smtp-Source: ABdhPJw0mMipeCAS7vVd22Q11fDnciZcgmzICC4Qg/PuJcOVUzmex18kXMFcEj0EBIRqzYJUisWuVlWD/dVbuj8WBjM=
X-Received: by 2002:a05:6808:f8f:: with SMTP id o15mr5176358oiw.164.1632862371131;
 Tue, 28 Sep 2021 13:52:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Sep 2021 13:52:50 -0700
MIME-Version: 1.0
In-Reply-To: <1632837350-12100-4-git-send-email-pmaliset@codeaurora.org>
References: <1632837350-12100-1-git-send-email-pmaliset@codeaurora.org> <1632837350-12100-4-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 28 Sep 2021 13:52:50 -0700
Message-ID: <CAE-0n52G7=PFrPGr5Zwq43q55CWBSkaEm7HpC+C4r2+Gjv3JQg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-09-28 06:55:49)
> Enable PCIe controller and PHY for sc7280 IDP board.
> Add specific NVMe GPIO entries for SKU1 and SKU2 support.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  9 ++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 54 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  9 ++++++
>  3 files changed, 72 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 64fc22a..1562386 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -61,6 +61,15 @@
>         modem-init;
>  };
>
> +&nvme_pwren_pin {
> +       pins = "gpio19";
> +};

This should move to the bottom in the "pinctrl" section.

> +
> +&nvme_3v3_regulators {
> +       gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
> +       enable-active-high;

The enable-active-high can be in the idp.dtsi file? That doesn't seem to
change.

> +};
> +
>  &pmk8350_vadc {
>         pmr735a_die_temp {
>                 reg = <PMR735A_ADC7_DIE_TEMP>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index def22ff..5b5505f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -31,6 +31,17 @@
>                         linux,can-disable;
>                 };
>         };
> +
> +       nvme_3v3_regulators: nvme-3v3-regulators {

Why plural? Isn't it a single regulator?

> +               compatible = "regulator-fixed";
> +               regulator-name = "VLDO_3V3";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&nvme_pwren_pin>;
> +       };
>  };
>
>  &apps_rsc {
> @@ -220,6 +231,42 @@
>         modem-init;
>  };
>
> +&pcie1 {
> +       status = "okay";
> +       perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +
> +       vddpe-3v3-supply = <&nvme_3v3_regulators>;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pcie1_default_state>;
> +};
> +
> +&pcie1_phy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l10c_0p8>;
> +       vdda-pll-supply = <&vreg_l6b_1p2>;
> +};
> +
> +&pcie1_default_state {

I thought the node would be split into a reset config node and a wake
config node. Is that not being done for some reason? The pinctrl-0 would
look like

	pinctrl-0 = <&pcie1_default_state>, <&pcie1_reset_n>, <&pcie1_wake_n>;

> +       reset-n {
> +               pins = "gpio2";
> +               function = "gpio";
> +
> +               drive-strength = <16>;
> +               output-low;
> +               bias-disable;
> +       };
> +
> +       wake-n {
> +               pins = "gpio3";
> +               function = "gpio";
> +
> +               drive-strength = <2>;
> +               bias-pull-up;
> +       };
> +};
> +
>  &pmk8350_vadc {
>         pmk8350_die_temp {
>                 reg = <PMK8350_ADC7_DIE_TEMP>;
> @@ -489,3 +536,10 @@
>                 bias-pull-up;
>         };
>  };
> +
> +&tlmm {
> +       nvme_pwren_pin: nvme-pwren-pin {
> +               function = "gpio";
> +               bias-pull-up;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> index 1fc2add..0548cb6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> @@ -21,3 +21,12 @@
>                 stdout-path = "serial0:115200n8";
>         };
>  };
> +
> +&nvme_pwren_pin {
> +       pins = "gpio51";
> +};

The pin config can go to a pinctrl section at the bottom of this file?

> +
> +&nvme_3v3_regulators {
> +       gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +       enable-active-high;
> +};
