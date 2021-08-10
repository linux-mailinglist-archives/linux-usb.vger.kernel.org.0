Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400293E839F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 21:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhHJT0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 15:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhHJT0A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 15:26:00 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BF0C0613C1
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 12:25:37 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id y18so690778oiv.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Qaz4xCN739RXFhIv84poX0ScDJwNuifosj/wmNYeKrI=;
        b=Gd5MAtaiKtZayubjDqRGAyI3XDiBp5Oem/dVLOHadExJW1CH458Ic5Ck696RNY4z7R
         Kcgb6rKMWcXpAHbi1BvRUx0qgqKUMotleU2XSfSD0qy8k+cAqzi8Q0uNyhxZ3P2Y56pM
         NFrITyTsXdq3Zo+x+4YrcOELrdbAWfqTIp/7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Qaz4xCN739RXFhIv84poX0ScDJwNuifosj/wmNYeKrI=;
        b=HMxjJCNfUg0bxuSfJGPV+yFhn28i6CIAzPraarv1XhR93ykg/KB41Ax/agWw83cUP1
         GFRQYm6SWB70v9b5r4uW6BvRqF0niIYKpTkybclNfH82Jl2yH+oMsllCa/Nsq40/yC80
         ZZ4gfYdZriIvDDitJPzCcn7W5MToo8164B51D3ScyPLIfivahOVtstl3T3aIpZqOJss5
         VhBI0BkFhAunZxq3vSQhtNYLJzg/ZYEqgk+ohuTkB7jYnYcyyIoc6VuDUfWKp9MmDE/I
         WkSgek28tA2yy8Z5TklbAKH0rLcY9P7Yjk1Rh6jL8NrpRX+1JQE9tdXFx0+JVeJ/rJTU
         ebHg==
X-Gm-Message-State: AOAM533e8bn6VovWK9la93VezC8uTPNwYBh2aLQI/HgJekjNWNaLYUH5
        nNLQADJq8WqgGvLoA1i6o6bHa7rEKuQPtANNO2gCpA==
X-Google-Smtp-Source: ABdhPJzqQGzY1mBI3xr7FZKkIXaGjwxBnCoAClVfvG9imfTSZkgRoR57g4wmu62dncETwlAoAKYBAKxJ0ASAVABb++A=
X-Received: by 2002:a05:6808:984:: with SMTP id a4mr4944772oic.166.1628623537400;
 Tue, 10 Aug 2021 12:25:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 12:25:36 -0700
MIME-Version: 1.0
In-Reply-To: <1628568516-24155-3-git-send-email-pmaliset@codeaurora.org>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org> <1628568516-24155-3-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 12:25:36 -0700
Message-ID: <CAE-0n532Mwe2OzhM-_UT62FpxqmpecBda7q0ciW1WzaOPm_Q5Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
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

Quoting Prasad Malisetty (2021-08-09 21:08:34)
> Add PCIe controller and PHY nodes for sc7280 SOC.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 126 +++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 53a21d0..4500d88 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/gpio/gpio.h>

Please sort this alphabetically, gpio comes before reset at the least.

>
>  / {
>         interrupt-parent = <&intc>;
> @@ -586,6 +587,119 @@
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               pcie1: pci@1c08000 {
> +                       compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", "snps,dw-pcie";
> +                       reg = <0 0x01c08000 0 0x3000>,
> +                             <0 0x40000000 0 0xf1d>,
> +                             <0 0x40000f20 0 0xa8>,
> +                             <0 0x40001000 0 0x1000>,
> +                             <0 0x40100000 0 0x100000>;
> +
> +                       reg-names = "parf", "dbi", "elbi", "atu", "config";
> +                       device_type = "pci";
> +                       linux,pci-domain = <1>;
> +                       bus-range = <0x00 0xff>;
> +                       num-lanes = <2>;
> +                       pipe-clk-source-switch;

I'd rather not have this DT property, but key it off the compatible
string.

> +
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
