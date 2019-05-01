Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AECD10CC3
	for <lists+linux-usb@lfdr.de>; Wed,  1 May 2019 20:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfEASiX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 May 2019 14:38:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfEASiX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 May 2019 14:38:23 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B40D2085A;
        Wed,  1 May 2019 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556735902;
        bh=v72lZ0mNNyG4uZ5ndNBI1kcDK5K/AMuSayYUTPc3KmY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IAL62/s0AAB91djQRkfxl70b/gOmJnv3jihZ1jK0iyjVPntL2b24zn1mzkEMsVTvu
         FW7FaNNXrHKxQaWphgz44g+oqLXJ6x07Xm7gHMgZ6NAaby7oxzl1OMCBnfaltWubc3
         vt7IQggy57Xrq/zwJk1AZHejYtMAoJtsFQd87dHg=
Received: by mail-qt1-f180.google.com with SMTP id j6so21010267qtq.1;
        Wed, 01 May 2019 11:38:22 -0700 (PDT)
X-Gm-Message-State: APjAAAViZ39gX1OXbRbgQKWwIX6i9tf/xq0vQsb4kCJslfKMjVOuzwn0
        38ZHlgnU/ayqa8YX443ngt0fUTtkD9LRTaZPUg==
X-Google-Smtp-Source: APXvYqzv1teS15/DSUMuFzoBJjdr3g1ZKU5TuoEQs8UKcGWGgtMpNz17lIOdTkhgDQOXQk//a7aRWJfXCsqoDUinmbw=
X-Received: by 2002:ac8:610f:: with SMTP id a15mr51742092qtm.257.1556735901386;
 Wed, 01 May 2019 11:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190428024847.5046-1-peter.chen@nxp.com> <20190428024847.5046-7-peter.chen@nxp.com>
In-Reply-To: <20190428024847.5046-7-peter.chen@nxp.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 1 May 2019 13:38:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
Message-ID: <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 27, 2019 at 9:51 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> Add imx7ulp USBOTG1 support.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  arch/arm/boot/dts/imx7ulp.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index fca6e50f37c8..e2944f98eac6 100644
> --- a/arch/arm/boot/dts/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> @@ -30,6 +30,7 @@
>                 serial1 = &lpuart5;
>                 serial2 = &lpuart6;
>                 serial3 = &lpuart7;
> +               usbphy0 = &usbphy1;

Drop this. You shouldn't need an alias.

>         };
>
>         cpus {
> @@ -133,6 +134,35 @@
>                         clock-names = "ipg", "per";
>                 };
>
> +               usbotg1: usb@40330000 {
> +                       compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> +                               "fsl,imx27-usb";
> +                       reg = <0x40330000 0x200>;
> +                       interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&pcc2 IMX7ULP_CLK_USB0>;
> +                       fsl,usbphy = <&usbphy1>;

Don't use this for new users. Use the phy binding instead.

> +                       fsl,usbmisc = <&usbmisc1 0>;
> +                       ahb-burst-config = <0x0>;
> +                       tx-burst-size-dword = <0x8>;
> +                       rx-burst-size-dword = <0x8>;
> +                       status = "disabled";
> +               };
> +
> +               usbmisc1: usbmisc@40330200 {
> +                       #index-cells = <1>;
> +                       compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> +                               "fsl,imx6q-usbmisc";
> +                       reg = <0x40330200 0x200>;
> +               };
> +
> +               usbphy1: usbphy@0x40350000 {
> +                       compatible = "fsl,imx7ulp-usbphy",
> +                               "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> +                       reg = <0x40350000 0x1000>;
> +                       interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> +               };
> +
>                 usdhc0: mmc@40370000 {
>                         compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
>                         reg = <0x40370000 0x10000>;
> --
> 2.14.1
>
