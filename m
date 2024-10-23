Return-Path: <linux-usb+bounces-16572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED49AC0A6
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 09:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864901C233A2
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 07:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B81155C82;
	Wed, 23 Oct 2024 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMZ9Zw+R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E4153801
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669869; cv=none; b=F7PjtudOw8WRn5Qb1awTKzG0VHS97DANQyqvEAxvBGq3JLNaLjhon1Uk+KG5vc3CvnADf8Y52MhCOmKURGzw2poieOttERp9e0lb3r7j2qG/h/bkNnLiZEyuyKiYd9+XV3Q784OdS0LHw237343SENsZigV+6ELQpVToNX4n/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669869; c=relaxed/simple;
	bh=jKHdoIjtRqxfJ55vBGRP5JlLPI3n6f4w6R9TxFgyG/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y95/SEQTo0v1x02yY+7D+YF2oN1a8k5rhcJXiOT/U/A+RkR9/8ddZoxvUCCIpM559zL0bdAVQkVdaEUjZZmiPTS0/m+GVQ2Ypc5doKKnS03TUnc8z+2ZxX5f0W6PITu1KTJGZXvr0+ZvHd2xbbxgnwQqluAOQl3I3BfLCJF/kKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMZ9Zw+R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so5821056f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729669866; x=1730274666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+XapBmDR0uZhfjYOvNMk0XBmZdhBIAkvxBqQIPfMd0=;
        b=uMZ9Zw+RgcFIwGNEtBLAOvBghOsCasyV84AXKJ8zv0tnJGbgWumBlVpJ3f8MrSbUjW
         OCz6Magyq4q8GTSRA13V0MmUhuXvKRDlqE0ygG+ks3umdnmjN0uHpKB22/akVmVecMBM
         yeUG3XToTyLjs0xYlK7VVVrYDMxIYkk/OweAqlt1UjsY8BnBFrTOA0na0U8GG2wAkLXi
         aV8kUBl0KGOL/CeWqny0Mg5fRvHP5rDixyD8mIwcR8KJ6lOzvqHZ2krBM+Yoa1/4jwXK
         EqChsJIMWfsd6a+55hZVJsqttIWQAZu7fSa+JIvTpNIxix3POahYqOF+s4fricpVS6S/
         5KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669866; x=1730274666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+XapBmDR0uZhfjYOvNMk0XBmZdhBIAkvxBqQIPfMd0=;
        b=Ewd1m25YIF9eDrlKoX9Ddbfy3ccISBMmM9ZNy0I4PzvuQ+yjoSwOXzIosBcjC+D05d
         WmU8I3ptqd2FFPjRTQtZx3Qqknbr6Muq7jy9ka5Z8m4JCZbzNGgSi3Bzb5i/XYzCqvqa
         GJWxSZcRAdtf3jWjOx4yzM4cdn4f91VSk3Z8IKE0+9/lLeu/3l8XY8D5+CgLr68yyKnT
         nsOalh9G3FjC9pVpLXguFGhr5wppfzHMPEofD4i1mLFAcrEgZtrBXeoVEZ4sErJ6eiB3
         iwqM08oEFw52VFIJ8FhoggyzKQd/KHz+gGDbUjPPluy6RA5dO/UirWV8kiiPs4a8BCe5
         PYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8hbuJhcAQMAO7KmwR6PKbXwCac71j2QBlcmUYVr4UXRBdfjFnhCH4c9Pqb7izvDtHal6eiQPmMSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnb6fR7PpBUIHhtYgcTgvoU0fx29NaehWnUQkzYS+S9Q0QGEV7
	HMHz/G4dVK4T1VrJ1SlFQ7N6y59Meu9Ttt+yes6L1kBXz+JJJnrrwT9q6BUK2Rk=
X-Google-Smtp-Source: AGHT+IHBf6IWOPS3k5EcHah0IeyN3Y8A0cACYMmuxzbj+ATa0KKIwoEZpzZPpqAIeGB3YhP8+s4gwg==
X-Received: by 2002:adf:fe50:0:b0:37c:cc4b:d1d6 with SMTP id ffacd0b85a97d-37efcf15f35mr1264266f8f.27.1729669866070;
        Wed, 23 Oct 2024 00:51:06 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a48564sm8313364f8f.29.2024.10.23.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 00:51:05 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:51:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: x1e80100-crd: Add Parade PS8830
 related nodes
Message-ID: <Zxiq6Dx4eU1PNvzY@linaro.org>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-3-68a95f351e99@linaro.org>
 <3i36qmnyzyonbzbsxgcdjwbshcl45vq75ocpth4redwrnqjkm5@wjev5ul7rs75>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3i36qmnyzyonbzbsxgcdjwbshcl45vq75ocpth4redwrnqjkm5@wjev5ul7rs75>

On 24-10-22 19:24:19, Bjorn Andersson wrote:
> On Tue, Oct 22, 2024 at 01:26:56PM GMT, Abel Vesa wrote:
> > Add nodes for all 3 Parade PS8830 Type-C retimers found on Qualcomm
> > X Elite CRD board, along with all of their voltage regulators. These
> > retimers sit between the Type-C connectors and the PHYs, so describe the
> > pmic glink graph accordingly. On this board, these retimers might be left
>                                ^ Here would be a good point to split this hunk into two paragraphs.

Will do.

> 
> > enabled and configured by the bootloader, so make sure the retimers don't
> > reset their configuration on driver probe.
> 
> It would be nice if there was a hint here about how this statement
> manifest itself in the patch.

I'll add the property in the phrasing.

> 
> 
> Hint:
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> is a good read for how to structure ones commit message - with a problem
> description, then a technical description of the change (i.e. probably
> not something starting with the word "Add"...)

Sure, will reword with "Describe all 3 Parade ...".

> 
> Regards,
> Bjorn

Thanks for reviewing.

Abel

> 
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 448 +++++++++++++++++++++++++++++-
> >  1 file changed, 442 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index f5f2659690915f9ba50d15a27c54e3c0f504a14b..7cc45a5cd7eb7e70915d04ea7e181b56f693f768 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -99,7 +99,15 @@ port@1 {
> >  					reg = <1>;
> >  
> >  					pmic_glink_ss0_ss_in: endpoint {
> > -						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > +						remote-endpoint = <&retimer_ss0_ss_out>;
> > +					};
> > +				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_ss0_con_sbu_in: endpoint {
> > +						remote-endpoint = <&retimer_ss0_con_sbu_out>;
> >  					};
> >  				};
> >  			};
> > @@ -128,7 +136,15 @@ port@1 {
> >  					reg = <1>;
> >  
> >  					pmic_glink_ss1_ss_in: endpoint {
> > -						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > +						remote-endpoint = <&retimer_ss1_ss_out>;
> > +					};
> > +				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_ss1_con_sbu_in: endpoint {
> > +						remote-endpoint = <&retimer_ss1_con_sbu_out>;
> >  					};
> >  				};
> >  			};
> > @@ -157,7 +173,15 @@ port@1 {
> >  					reg = <1>;
> >  
> >  					pmic_glink_ss2_ss_in: endpoint {
> > -						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> > +						remote-endpoint = <&retimer_ss2_ss_out>;
> > +					};
> > +				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_ss2_con_sbu_in: endpoint {
> > +						remote-endpoint = <&retimer_ss2_con_sbu_out>;
> >  					};
> >  				};
> >  			};
> > @@ -291,6 +315,150 @@ vreg_nvme: regulator-nvme {
> >  		pinctrl-0 = <&nvme_reg_en>;
> >  	};
> >  
> > +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR0_1P15";
> > +		regulator-min-microvolt = <1150000>;
> > +		regulator-max-microvolt = <1150000>;
> > +
> > +		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr0_1p15_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR0_1P8";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +
> > +		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr0_1p8_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR0_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr0_3p3_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR1_1P15";
> > +		regulator-min-microvolt = <1150000>;
> > +		regulator-max-microvolt = <1150000>;
> > +
> > +		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr1_1p15_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR1_1P8";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +
> > +		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr1_1p8_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR1_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr1_3p3_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR2_1P15";
> > +		regulator-min-microvolt = <1150000>;
> > +		regulator-max-microvolt = <1150000>;
> > +
> > +		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr2_1p15_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR2_1P8";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +
> > +		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr2_1p8_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR2_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr2_3p3_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> >  	vph_pwr: regulator-vph-pwr {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -709,6 +877,187 @@ keyboard@3a {
> >  	};
> >  };
> >  
> > +&i2c1 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	typec-mux@8 {
> > +		compatible = "parade,ps8830";
> > +		reg = <0x08>;
> > +
> > +		clocks = <&rpmhcc RPMH_RF_CLK5>;
> > +		clock-names = "xo";
> > +
> > +		vdd-supply = <&vreg_rtmr2_1p15>;
> > +		vdd33-supply = <&vreg_rtmr2_3p3>;
> > +		vdd33-cap-supply = <&vreg_rtmr2_3p3>;
> > +		vddar-supply = <&vreg_rtmr2_1p15>;
> > +		vddat-supply = <&vreg_rtmr2_1p15>;
> > +		vddio-supply = <&vreg_rtmr2_1p8>;
> > +
> > +		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
> > +
> > +		pinctrl-0 = <&rtmr2_default>;
> > +		pinctrl-names = "default";
> > +
> > +		orientation-switch;
> > +		retimer-switch;
> > +
> > +		ps8830,boot-on;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				retimer_ss2_ss_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss2_ss_in>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				retimer_ss2_ss_in: endpoint {
> > +					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				retimer_ss2_con_sbu_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss2_con_sbu_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c3 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	typec-mux@8 {
> > +		compatible = "parade,ps8830";
> > +		reg = <0x08>;
> > +
> > +		clocks = <&rpmhcc RPMH_RF_CLK3>;
> > +		clock-names = "xo";
> > +
> > +		vdd-supply = <&vreg_rtmr0_1p15>;
> > +		vdd33-supply = <&vreg_rtmr0_3p3>;
> > +		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
> > +		vddar-supply = <&vreg_rtmr0_1p15>;
> > +		vddat-supply = <&vreg_rtmr0_1p15>;
> > +		vddio-supply = <&vreg_rtmr0_1p8>;
> > +
> > +		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
> > +
> > +		pinctrl-0 = <&rtmr0_default>;
> > +		pinctrl-names = "default";
> > +
> > +		retimer-switch;
> > +		orientation-switch;
> > +
> > +		ps8830,boot-on;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				retimer_ss0_ss_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				retimer_ss0_ss_in: endpoint {
> > +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				retimer_ss0_con_sbu_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c7 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	typec-mux@8 {
> > +		compatible = "parade,ps8830";
> > +		reg = <0x8>;
> > +
> > +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> > +		clock-names = "xo";
> > +
> > +		vdd-supply = <&vreg_rtmr1_1p15>;
> > +		vdd33-supply = <&vreg_rtmr1_3p3>;
> > +		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
> > +		vddar-supply = <&vreg_rtmr1_1p15>;
> > +		vddat-supply = <&vreg_rtmr1_1p15>;
> > +		vddio-supply = <&vreg_rtmr1_1p8>;
> > +
> > +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
> > +
> > +		pinctrl-0 = <&rtmr1_default>;
> > +		pinctrl-names = "default";
> > +
> > +		retimer-switch;
> > +		orientation-switch;
> > +
> > +		ps8830,boot-on;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				retimer_ss1_ss_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss1_ss_in>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				retimer_ss1_ss_in: endpoint {
> > +					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				retimer_ss1_con_sbu_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
> > +				};
> > +			};
> > +
> > +		};
> > +	};
> > +};
> > +
> >  &i2c8 {
> >  	clock-frequency = <400000>;
> >  
> > @@ -854,6 +1203,37 @@ &pcie6a_phy {
> >  	status = "okay";
> >  };
> >  
> > +&pm8550_gpios {
> > +	rtmr0_default: rtmr0-reset-n-active-state {
> > +		pins = "gpio10";
> > +		function = "normal";
> > +		power-source = <1>; /* 1.8V */
> > +	};
> > +
> > +	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
> > +		pins = "gpio11";
> > +		function = "normal";
> > +		power-source = <1>; /* 1.8V */
> > +	};
> > +};
> > +
> > +&pmc8380_5_gpios {
> > +	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
> > +		pins = "gpio8";
> > +		function = "normal";
> > +		power-source = <1>; /* 1.8V */
> > +		bias-disable;
> > +	};
> > +};
> > +
> > +&pm8550ve_9_gpios {
> > +	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
> > +		pins = "gpio8";
> > +		function = "normal";
> > +		power-source = <1>; /* 1.8V */
> > +	};
> > +};
> > +
> >  &pmc8380_3_gpios {
> >  	edp_bl_en: edp-bl-en-state {
> >  		pins = "gpio4";
> > @@ -1093,6 +1473,62 @@ wake-n-pins {
> >  		};
> >  	};
> >  
> > +	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
> > +		pins = "gpio188";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr1_1p8_reg_en: rtmr1-1p8-reg-en-state {
> > +		pins = "gpio175";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
> > +		pins = "gpio186";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr1_default: rtmr1-reset-n-active-state {
> > +		pins = "gpio176";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr2_1p15_reg_en: rtmr2-1p15-reg-en-state {
> > +		pins = "gpio189";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr2_1p8_reg_en: rtmr2-1p8-reg-en-state {
> > +		pins = "gpio126";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr2_3p3_reg_en: rtmr2-3p3-reg-en-state {
> > +		pins = "gpio187";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	rtmr2_default: rtmr2-reset-n-active-state {
> > +		pins = "gpio185";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> >  	tpad_default: tpad-default-state {
> >  		pins = "gpio3";
> >  		function = "gpio";
> > @@ -1160,7 +1596,7 @@ &usb_1_ss0_dwc3_hs {
> >  };
> >  
> >  &usb_1_ss0_qmpphy_out {
> > -	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> > +	remote-endpoint = <&retimer_ss0_ss_in>;
> >  };
> >  
> >  &usb_1_ss1_hsphy {
> > @@ -1188,7 +1624,7 @@ &usb_1_ss1_dwc3_hs {
> >  };
> >  
> >  &usb_1_ss1_qmpphy_out {
> > -	remote-endpoint = <&pmic_glink_ss1_ss_in>;
> > +	remote-endpoint = <&retimer_ss1_ss_in>;
> >  };
> >  
> >  &usb_1_ss2_hsphy {
> > @@ -1216,5 +1652,5 @@ &usb_1_ss2_dwc3_hs {
> >  };
> >  
> >  &usb_1_ss2_qmpphy_out {
> > -	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> > +	remote-endpoint = <&retimer_ss2_ss_in>;
> >  };
> > 
> > -- 
> > 2.34.1
> > 

