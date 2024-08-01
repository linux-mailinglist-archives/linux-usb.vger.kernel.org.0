Return-Path: <linux-usb+bounces-12863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70032945368
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 21:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934601C215D2
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 19:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26111799F;
	Thu,  1 Aug 2024 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkUb8HzP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A6A1EB4BF
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722540640; cv=none; b=H6qgbFEeOsbZBMQMm3p3JinQdG5PRCO/NsvmIZ2Gqak7nYZ69mRx9xcgD+bJJMfHmfB3y/Cz3OI5xSbLz1TiM6U3FwXbCwf6OSDlQmrhOyS9EpFGkrFPTLaJ/BjFZa5xmydQnNe7lWXbGi8O62WqUzSG125eTdQekQX9MzyMBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722540640; c=relaxed/simple;
	bh=CV/5T++UO2MD0pMWx0sHBAVs0Edh74GTn1C9saOlejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mB47JqgXAOPFiJupXnOY3/A9D3+9m2lJ6CVUH4ILA7WJ2aGgeIZMvVFpRb6e47Cbz7vxreI3EytleZ9xN//jXlhGuxA4Cz51IxAoUDfVBY0sgDnsP3VvSwZ1ZzaKkPg4zbSzzszvZxfmUREtcGaB5ZXmTo24+rrFGnforC+Huu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkUb8HzP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so16092158e87.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2024 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722540636; x=1723145436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl4XS3WUjBaaPZ57sgkK+WuC+L1cKpw0Puffj1HgsgM=;
        b=SkUb8HzPsJ8XFR2X9hfhtFBDLgPG9WU50mMrH/A1eZr6mPycK+e3ADXIin6LH0BvIi
         73xAQkVRyESGiAFWI9QNWvLOLA/k5ICqaXVeQuJxsljob/0Go5/iAkc2UMgjUyIQkqok
         9IEhqRSQftblVJUXL4jWxA6twD70IBmVrpma6ebxE1zoZK3XwzkuTs1pLWx2X2ZMFk4/
         LKmeyqYxys/j+TjE5z8fhs7+txIZ3inAlf55HsM2z/V76gLEITY7z2KtYvND1KvxG7qN
         TA1aWMr5tta+pyt9cOJZTv1bF/BteYf/RtgoGHfB6R7o09/TutfRkZnhLplNY0uupoCb
         22Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722540636; x=1723145436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl4XS3WUjBaaPZ57sgkK+WuC+L1cKpw0Puffj1HgsgM=;
        b=AFmjsYXFHaRQzU0mGW/U81ZLV1UJ7aJ5uPnfXoaEj29mOGal17WPFPdy1+8DlmAR5d
         xTkS30HDYT3oyhOgWCVXe8dZNGsUB1gAkxsbu6vzyn0VaSMizrOozLHQ8aqGkN73SsKn
         Lnw8JflCSvL0x1Q+EUrYiqW2KYdCQlWDwt54iiVxu0vFvDQ8pDoMOzyehMAiq63oKZ+Y
         HmyB7yAVWLQBPTKui0C/kc2KPuDo2A1rQUb7PUFxoWry230/0eQwbDdk29FNqJRApkd5
         fUKfM2r4tEzDNPe9JD7hcv6wlClziE8NaiKHPQK6oTx2yEifu7EW1+RIAdwcd9Cihhin
         O7mA==
X-Forwarded-Encrypted: i=1; AJvYcCVkNaGu1zsyHUo0xz55LMZO3J46kgaU5/xwZj9j9sndVENsbeAsPhUzIpbnLbwaLodXKgx+qNZ0/eo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3tx9WEA8thsDOOBmNKwPfAgOh0KN27XuyRPdi9i2z5ISxySG
	46U9X8FjX3HCKNDId6O5mcU8D5GgvTs674vnTPx8baHZE9ND9AY56K4sHe+Nnc0=
X-Google-Smtp-Source: AGHT+IF+fQISwlNQQAd55q0eA0+6wHKsOJIFh01nL17s+tQVD5GNsE9pxJ2rZPIoF9c/DZKs3MFdZQ==
X-Received: by 2002:a05:6512:3d20:b0:52c:d76f:4604 with SMTP id 2adb3069b0e04-530bb3b4664mr915571e87.46.1722540636197;
        Thu, 01 Aug 2024 12:30:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10db7sm36496e87.74.2024.08.01.12.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:30:35 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:30:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mp-evk: add typec node
Message-ID: <2x2u7fam2pzvnnbudjazhyfpgb5admm6p7pqlgm5yvnchuz5z2@qes67wpndrd4>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-2-xu.yang_2@nxp.com>
 <lzbqvgpla2souin67crolhwyun4rxy5r6ax424xnd7ypuottjf@hyvhzywqu4u6>
 <20240801140856.cadyjvjoidexaxqp@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801140856.cadyjvjoidexaxqp@hippo>

On Thu, Aug 01, 2024 at 10:08:56PM GMT, Xu Yang wrote:
> On Thu, Aug 01, 2024 at 02:51:06PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 01, 2024 at 02:49:06PM GMT, Xu Yang wrote:
> > > The first port of USB with type-C connector, which has dual data
> > > role and dual power role.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - modify endpoint label
> > >  - fix usb phy tunning property dtbinding warning
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
> > >  1 file changed, 104 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > index 938347704136..ef9b821a0ae2 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > @@ -6,6 +6,7 @@
> > >  /dts-v1/;
> > >  
> > >  #include <dt-bindings/phy/phy-imx8-pcie.h>
> > > +#include <dt-bindings/usb/pd.h>
> > >  #include "imx8mp.dtsi"
> > >  
> > >  / {
> > > @@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
> > >  		status = "disabled";
> > >  	};
> > >  
> > > +	cbdtu02043: typec-mux {
> > > +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_typec_mux>;
> > > +		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
> > > +		orientation-switch;
> > > +
> > > +		port {
> > > +			usb3_data_ss: endpoint {
> > > +				remote-endpoint = <&typec_con_ss>;
> > 
> > Where do SS lines go after the cbdtu02043?
> 
> I got your point. I should represent the signal route on dts even though
> the driver doesn't use this information.

Yes, please. Bindings / DTS describe the hardware, not the driver's view
on it.

> 
> > Also could you please point out the datasheet for the chip.
> 
> https://www.nxp.com/docs/en/data-sheet/CBTU02043.pdf

Thanks!

> 
> > 
> > > +			};
> > > +		};
> > > +	};
> > > +
> > >  	hdmi-connector {
> > >  		compatible = "hdmi-connector";
> > >  		label = "hdmi";
> > > @@ -535,6 +550,49 @@ adv7535_out: endpoint {
> > >  
> > >  		};
> > >  	};
> > > +
> > > +	ptn5110: tcpc@50 {
> > > +		compatible = "nxp,ptn5110", "tcpci";
> > > +		reg = <0x50>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_typec>;
> > > +		interrupt-parent = <&gpio4>;
> > > +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +		usb_con: connector {
> > > +			compatible = "usb-c-connector";
> > > +			label = "USB-C";
> > > +			power-role = "dual";
> > > +			data-role = "dual";
> > > +			try-power-role = "sink";
> > > +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > > +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> > > +				     PDO_VAR(5000, 20000, 3000)>;
> > > +			op-sink-microwatt = <15000000>;
> > > +			self-powered;
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +
> > > +					typec_con_hs: endpoint {
> > > +						remote-endpoint = <&usb3_data_hs>;
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +
> > > +					typec_con_ss: endpoint {
> > > +						remote-endpoint = <&usb3_data_ss>;
> > > +					};
> > > +				};
> > 
> > SBU lines are not connected?
> 
> Not use SBU signal.
> 
> Thanks,
> Xu Yang
> 
> > 
> > > +			};
> > > +		};
> > > +	};
> > >  };
> > >  
> > >  &i2c3 {
> > > @@ -704,7 +762,41 @@ &uart2 {
> > >  	status = "okay";
> > >  };
> > >  
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

