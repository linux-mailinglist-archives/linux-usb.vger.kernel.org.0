Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CF443A686
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 00:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233971AbhJYW2Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 18:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbhJYW2V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 18:28:21 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43573C061767
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 15:25:58 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r6so17697558oiw.2
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WFDwbjLin57JuF/SW9mFY64wQd0e/2AHNQmaqQ+zAzw=;
        b=hfK9d+6sqAbG17oSuDhj5y6u9w8qLXtsFL/VMBOaea0q7mFEKscsmbf4qSERmi7GPR
         nMrTraKNOrwWzb5iGo8HeR1xfI4PGbHSlebDkK03yLardVyeDEeCKG/cccpWNIOK95Gm
         BCQW10Ucl0LWO1HxYgXe/Us9WYWmIbv83bHuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WFDwbjLin57JuF/SW9mFY64wQd0e/2AHNQmaqQ+zAzw=;
        b=QhWW2mwz0Yn0tRhav6vu3PWBx/YGkRxTGZ5yaYSf0A74EXnJpO06T9MawzR+3xTlvw
         roPZE2iLhzzXOMzQwJet4R67g2q/0BLVbEPI0EGqu4m2cdrUxmfJevrBLwA4nZlVICsA
         0AAKzkepXidqjH22nC8aNE/Dviaj1wbt5NRujy8QBCpdkooKyZXOSIq6mB86Xn7hyrZf
         Mh/kGhOPWrCN8PzkRClut0z/kGDS9MWcTndDEfGrfcPwa1rAb1CzMup5OUJfx560RFnZ
         Z3s6zrWG7HJq9KLHMjX90JUjnKYvAe1Nn4As5wD7RvSk1468Ndk9Izs3zJJuS2j8Qlet
         6+9w==
X-Gm-Message-State: AOAM531KuLYX/EgkrmYW/VR6gBMb+nlT+SqdH0uY8XQyYFnsl79JSaZb
        aJx57tfUtYrtPZ5NlhW9HLwMYXr45txMfB05jT1JUb7rRRw=
X-Google-Smtp-Source: ABdhPJzzpQ1i3ICHPwTO0aUU1Fwdimfo83m8s5VOlm3vJvVJnxPlnRUx6c+3XcLyUvD8Ng94h5nwNZISc3dIfkOouv8=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr25563747oib.32.1635200757700;
 Mon, 25 Oct 2021 15:25:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 15:25:57 -0700
MIME-Version: 1.0
In-Reply-To: <1635152851-23660-4-git-send-email-quic_c_sanm@quicinc.com>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com> <1635152851-23660-4-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 25 Oct 2021 15:25:57 -0700
Message-ID: <CAE-0n52wGtyd7pUTHL4XtFGz1_41OETi3t8CVVL-yG06RYvsVA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add cx power domain support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2021-10-25 02:07:31)
> Add multi pd support to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
> v2:
> Changed rpmhd_opp_svs to rmphd_opp_nom for cx domain.
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index d74a4c8..9e3b6ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2538,7 +2538,8 @@
>                         interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
>                                           "dm_hs_phy_irq", "ss_phy_irq";
>
> -                       power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +                       power-domains = <&rpmhpd SC7280_CX>, <&gcc GCC_USB30_PRIM_GDSC>;

Order matters and thus the order here can't be flipped.

> +                       required-opps = <&rpmhpd_opp_svs>, <>;
