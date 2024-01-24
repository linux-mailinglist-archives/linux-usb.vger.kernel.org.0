Return-Path: <linux-usb+bounces-5438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591C839E19
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 02:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5B911F21F1C
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 01:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC221396;
	Wed, 24 Jan 2024 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ElDSDfQH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4723BE
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 01:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706059010; cv=none; b=m0TXuYtvH5GNI3IQTRxBrXnJ7nvfGhOuYHJEDc6LJjnBJ48JJjMJY2EMxNK5qrALqQnthPadP+n6cUOotwjkXgNerxkwB6InMBfDGa2jBt9EXxQ021GuWuc0p311Qj2LGrCzgEquJgsnkt9W0ddfvW5XtZ+hQQfYMSvlob3wVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706059010; c=relaxed/simple;
	bh=oOMJ+rqQ8wQ5HSdlC+ci8LugSWMAFnY2eQIk2KFhFeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfYtnq1rtLvyluErn2YMh7Y/xqrZ57w7BT92BKpkALJhW0PbB43qoxKs0WKOXqCSzjW5Y0sLc1tYjmTvZMrn7eWZaowsedhxUPkdVpPRjJCM+wsgPq0LftWI2A1uwq2KIsSWwT1BxLTpZNj27SZA+ZD5+yFE/UkSMiMM3v4XpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ElDSDfQH; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-db3a09e96daso4142303276.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706059006; x=1706663806; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XiDZPdJfTfPzimLT8ACIvzkmMThhwDufXcvlEt4ng70=;
        b=ElDSDfQHFiDEb8fcEAWjeMTY7b7MHRWhoyMxf5RHYJfnIQE3lfhvWiCtigYfRJBUik
         heCd0MJTdo3e79eWzbsbE8pII0jRQ1MaTapMSlFtlWJiKCjPyM96OYGXhifhP/LTvGH/
         0KCaB9QxVY9HPGRadnJbmSY7x85N4FJw2Xw1K+KMLom47WqvVeagXWtTJ8i2sOFRrwOp
         GbeVjHJ+Gal9OmU5UNZNvB75xzsI4aijyI6UO57ljZqozuGY3j5BPbBLNI+cYYPGr7rh
         99RtCK0TLVX94eoBHum2bx85yPs9VRjkpbIoeDWoLTvgz323SWhYKZdQ8L8E6M9226ce
         1SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706059006; x=1706663806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiDZPdJfTfPzimLT8ACIvzkmMThhwDufXcvlEt4ng70=;
        b=ORp8vFbA+DygcLgd/3JUpBXOuZPHXk05qPK2U9CG7pX02rkryEmcDduLo8gCHOVV++
         hWKgRYw7mFtV6A4QV6ZS2EyRiHTARR66kv2jU0sVZX8gKsRJU2nhP/aB90VnvWtEqxp6
         ydqj9XxwKYgj0O237rYOs6fLZk0jXe31b2SsQRtgk2O10oUto5Yvodk1dH3xd1dIpDbB
         UW1gFFdDFVHw6pkkQJJRhlsCT9LE5gYhiqzNVttXAKfEjgfPHCWLyoH+3XdDO3ZsWbhf
         ldAgOihmN9uMyBXQVUgHjs5yR5G56aUg8ffWxn9ehR4glPw3na5pefqouYG2uffMAwHg
         XH8g==
X-Gm-Message-State: AOJu0YxLVYzFOyJP/aXQVmInx/Kbkji5JT4ohNgrylcj9GfejfAL38dK
	5DVR37DoN3q5tIiq+sZgBL6POVLkMy4PCwTykdpMSr90mrnIx+58wilmYi5GALo+9R+75O34Ldc
	c/E3NoQZg6Q1+xf93zBBu2uBmAY1nJH+CISQj1A==
X-Google-Smtp-Source: AGHT+IGQ7HCSgRIhv+Wm9LSN6sbjwrzJYjPinkuCo89KnHd0kys9EF4OXMRQPRnVOV1NpPzxcP/YMnpDezw9TivlCAQ=
X-Received: by 2002:a05:6902:2189:b0:dbc:ab9d:4fab with SMTP id
 dl9-20020a056902218900b00dbcab9d4fabmr78935ybb.60.1706059006416; Tue, 23 Jan
 2024 17:16:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-15-182d9aa0a5b3@linaro.org> <CYMDEAJZ0TJK.K31XZB3E9QOG@fairphone.com>
In-Reply-To: <CYMDEAJZ0TJK.K31XZB3E9QOG@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 03:16:35 +0200
Message-ID: <CAA8EJpr-a1T_GTfYbUcaXv+mmjfqUYnx+fch-M=0-q89_UmeoQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 22:32, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Sat Jan 13, 2024 at 9:55 PM CET, Dmitry Baryshkov wrote:
> > Plug in USB-C related bits and pieces to enable USB role switching and
> > USB-C orientation handling for the Qualcomm RB2 board.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 50 ++++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi     | 43 +++++++++++++++++++++++++++
> >  2 files changed, 93 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index 52f31f3166c2..696d6d43c56b 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -6,8 +6,10 @@
> >  /dts-v1/;
> >
> >  #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/usb/pd.h>
> >  #include "sm4250.dtsi"
> >  #include "pm6125.dtsi"
> > +#include "pmi632.dtsi"
> >
> >  / {
> >       model = "Qualcomm Technologies, Inc. QRB4210 RB2";
> > @@ -256,6 +258,46 @@ kypd_vol_up_n: kypd-vol-up-n-state {
> >       };
> >  };
> >
> > +&pmi632_typec {
> > +     status = "okay";
> > +
> > +     connector {
> > +             compatible = "usb-c-connector";
> > +
> > +             power-role = "dual";
> > +             data-role = "dual";
> > +             self-powered;
> > +
> > +             typec-power-opmode = "default";
> > +             pd-disable;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +                             pmi632_hs_in: endpoint {
> > +                                     remote-endpoint = <&usb_dwc3_hs>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg = <1>;
> > +                             pmi632_ss_in: endpoint {
> > +                                     remote-endpoint = <&usb_qmpphy_out>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&pmi632_vbus {
> > +     regulator-min-microamp = <500000>;
> > +     regulator-max-microamp = <3000000>;
>
> Hi Dmitry,
>
> Are you sure vbus can supply 3000mA?
>
> In Qualcomm's document 80-PF208-77 I see 1000mA is the maximum it can
> provide, and I see the same value looking into downstream smb5 driver
> in sdm632 sources.

Indeed, you are correct here. It seems I confused vbus current with
charge current

>
> https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-4.9/+/refs/heads/int/13/fp3/drivers/power/supply/qcom/qpnp-smb5.c#414
>
> Regards
> Luca
>
> > +     status = "okay";
> > +};
> > +
> >  &pon_pwrkey {
> >       status = "okay";
> >  };
> > @@ -607,6 +649,10 @@ &usb {
> >       status = "okay";
> >  };
> >
> > +&usb_dwc3_hs {
> > +     remote-endpoint = <&pmi632_hs_in>;
> > +};
> > +
> >  &usb_hsphy {
> >       vdd-supply = <&vreg_l4a_0p9>;
> >       vdda-pll-supply = <&vreg_l12a_1p8>;
> > @@ -622,6 +668,10 @@ &usb_qmpphy {
> >       status = "okay";
> >  };
> >
> > +&usb_qmpphy_out {
> > +     remote-endpoint = <&pmi632_ss_in>;
> > +};
> > +
> >  &wifi {
> >       vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
> >       vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > index 76c429e8ebab..01dff6641280 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > @@ -878,8 +878,29 @@ usb_qmpphy: phy@1615000 {
> >                       clock-output-names = "usb3_phy_pipe_clk_src";
> >
> >                       #phy-cells = <0>;
> > +                     orientation-switch;
> >
> >                       status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     usb_qmpphy_out: endpoint {
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     usb_qmpphy_usb_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_dwc3_ss>;
> > +                                     };
> > +                             };
> > +                     };
> >               };
> >
> >               system_noc: interconnect@1880000 {
> > @@ -1614,6 +1635,28 @@ usb_dwc3: usb@4e00000 {
> >                               snps,has-lpm-erratum;
> >                               snps,hird-threshold = /bits/ 8 <0x10>;
> >                               snps,usb3_lpm_capable;
> > +
> > +                             usb-role-switch;
> > +
> > +                             ports {
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     port@0 {
> > +                                             reg = <0>;
> > +
> > +                                             usb_dwc3_hs: endpoint {
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg = <1>;
> > +
> > +                                             usb_dwc3_ss: endpoint {
> > +                                                     remote-endpoint = <&usb_qmpphy_usb_ss_in>;
> > +                                             };
> > +                                     };
> > +                             };
> >                       };
> >               };
> >
>


-- 
With best wishes
Dmitry

