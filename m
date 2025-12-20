Return-Path: <linux-usb+bounces-31657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F93CD335C
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 17:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34C653009872
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0B430C368;
	Sat, 20 Dec 2025 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zx27nNTr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evNTr1At"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E530B52B
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247444; cv=none; b=CVXY0hj5QY73TDtuKjlsytdY5fVhkRuYeuORuunHsnvC6YK961zto+MIYNfZQAMUpNtDZe1CDx1RFm6ghz1THZdO3eY2dLausHJjDrXks5nBY+334WN3tnCuYg6CtYY8IuzKvCRrQVpBBXOUo9x8oKCLYkFEYQQMSf1iLLilTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247444; c=relaxed/simple;
	bh=cBr2Ix6bV9/X/B3OD1fnchoOCZvTmPSbnajjC5bh4+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTHCG6EJz6vgAvLBVBJuwooBF+cevv47YguAOEocr7/jbnn9+O5QQ0dm2v7JnCbPt+JBIkTKeutFMwq+KEMm3CYBoH9SRCUHz59At6GwQ3kdkgJ1Z/4rOQBNqgolawGfB86toMHVUO1TyaLuvRB9jdTW6giazQo7oV3zGLS23sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zx27nNTr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evNTr1At; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPAuq4095092
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 16:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pntOVml1Wl40/QZmxb4LOcVa
	EqLgIPDSq4yorT79Boc=; b=Zx27nNTrTa7rXzuLhFTKZIK7XaW6crM6xMcKwpPw
	lPBaumVwDqelYzwBFS37igEVDnqszAjwMOYbV9ORS3XIN8pxtNLq5mzzfCDSvTek
	L3kbMnCDMvfkwCrKSk1lnqJFCQtp3fw2DrEzAYfoYxhmBslk/2/NOghpOXrd9U8i
	lF0kzUKd2LF2f/j7LWb1JAWbev7Y3fhiQ4aaB5D9y7QBwM2CmT3g6FTFGUzK9kdR
	sXwWSCiduZ+n1QaKNtRjdcuOXHYsUQrj+HM0OYxfwRUQ8eLE/9B1ZMbUby8YSudV
	yFi640s7lSmYN+bMJz1btsCvc4zgkX3k4rQJfeZSOMxjsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux0wje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 16:17:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f35f31000cso36475921cf.2
        for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766247440; x=1766852240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pntOVml1Wl40/QZmxb4LOcVaEqLgIPDSq4yorT79Boc=;
        b=evNTr1AtcEYcv1xRa9rmh/XEjxanz07dMNVX+8ZVKdJ5CPA6TJlpA5XyPEPKBY5wMT
         3YXLDX4Z1QZJEENlrkuLKAdjSYEChivDZK1S9473Ihn/MLnELONCKVDRV2QoRucr8fE1
         7sAGhFuStan2O25FI4CBIsXC2Jim+CmU6XW3l5qevaZEudibooJRAG4ZWrNDyN5auU7J
         NvZv+MHO6FhhuimevMDZ/ksJMTF2i6L0+rAAKtRX5D7312MnDvLUgwQ6t5RS36Rvndy0
         0Siot20UqBh7QehEfSP0hPNLnT6spkOSi7saBPA0yMwzQiCduwLwCjd6pupBR+jgr7wk
         itcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766247440; x=1766852240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pntOVml1Wl40/QZmxb4LOcVaEqLgIPDSq4yorT79Boc=;
        b=RfH5ZpX/+taQ8M0Lxhunr0/8jFCMefBAGai5VkG2DI/lwMgLxIe34gQT6P1stCh7ew
         DiiScvtK62CmQgivpYeWuNfLIYtHrQGaLE4jB4Hbh/uIGYGLa0vv4mVMHIKAAXTzPH5Z
         TIvXJ6r1M/tRX6++vgV0Co+fYgpHVJmsBodg3DHPwPY5hN4zGRjm3Em9DZSciM2POg+1
         O9GZ4RHfFrtC9ahRFP+nOngY+5+AIzhZ2cBua/bRLQj31yvk724Ub1aF6JQqq/IfDzAv
         r2BGOAoctma63e5Xmz8LO7jpwECf4izCMAWJa+HC3qOZyHDnWRbsdFQ+Y/nm1hvT4omD
         qtiw==
X-Forwarded-Encrypted: i=1; AJvYcCUufGrFFt97AHEp6XluGRngyVT8v9b1WJccCCz0qVcFo+DmyrfDYL6Zg0D8vL4HikadniuISinRa9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Gq6K8xYtTBSgLobzULNhOMFBIspjJFECwewfwJiQC4qNbsTW
	ZJaED0J+92q/RgFSwZDZCY0xyA/JweMvlYhWuqkn/ABHbMSAzsG9Bs5sWGsfRcaZdSNiUnoeY6i
	CvqNgnqzmlQhkMDL4YIDnCKI4pbDKOy+TcjOOVqQ7XJYSqCx3yVDC7VT9h00J2Io=
X-Gm-Gg: AY/fxX66tESM1tE0bwokquhuAUSoNdWnv/7+rrggxDHLnLmynsmBDB+JT2Qn12OlWpG
	samKkx3rZgEZMPGL1Y95d0ynSAXZHf2t8uN0aUaHKmOMp7yEkvPV0EE2ywxp7uWAcdFrC0OF4rj
	OdIfnF76HXxSzZokmSuvc/2vzLqUflya4Bo17SYfLbwZm001kq8SaelI6nQU8zCNobeWY/hZc56
	kAnkYk5x8O5vUEu6hZDVjPRs0Q0h8m8fYpzWCe3+jLCjpqk2gPP+m8vP9UDaJpz4k2P8DCuItVw
	e+Ms3Q+NUWMViLoNC5zUQ0lp6L4rTZGHT5wvy1euihf79JtNKX8vtXq4hTZM4lJM6BQQGl0EW7h
	S+X+KI7atWWh4vYbjP3bxrgbOs4cUCIoZNKhe1C0P9OHIu3eJPPRW1NDQ0ZdM5Pq/X2ftfAy3yI
	nLNugm+7lmbg+EJ5ljccExCTs=
X-Received: by 2002:a05:622a:4d06:b0:4eb:a3e0:2fef with SMTP id d75a77b69052e-4f4abd608a4mr96386991cf.39.1766247439836;
        Sat, 20 Dec 2025 08:17:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOJ90cnKqUj9Wt6jLSIrKmBp5wsmBu9beWz+RK+s5f/KTLrhtl8o+UnWgV+2NoO2i+DcQO2A==
X-Received: by 2002:a05:622a:4d06:b0:4eb:a3e0:2fef with SMTP id d75a77b69052e-4f4abd608a4mr96386431cf.39.1766247439325;
        Sat, 20 Dec 2025 08:17:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620296sm1569592e87.82.2025.12.20.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:17:18 -0800 (PST)
Date: Sat, 20 Dec 2025 18:17:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Mo8mWFZS1gf6-cqh-8XqaKKZn6i2AQE9
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6946cc10 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ah03NZ7Jbj8FVjhBhHcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Mo8mWFZS1gf6-cqh-8XqaKKZn6i2AQE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0MSBTYWx0ZWRfX3rWj6wU+MKw6
 Hps3ZJYxPSrF+xsgPZC8OOsM5fg17t7GtDCect7YEQcY9FgGhxXnvhJtRRwiQ+qABnYY9rOd7fz
 +gcHCEM+BD+wUH5XZNUJTSgWrbDhgXPOW/rowHj290cZoGgzV8ImuAO8BVtoKW2TLfNSiFsPCc0
 tL/O6wXQAQGOEvwSZIuTsevc/lDgFzR01C3bIgtlTcsODXkE2kK/FX2dfdSVVqvhNA1EHv+nACq
 /uFKK9JAoVrJNhq5DJKrVz9eY/G3M6mZMtuDNItr9lhpPmqJrelhL/cClnLri3kjuhcxqvro9Cb
 +Xe+Xk+R7hY0dRP9wKgoUDctUDqEeUruRySX4vj7NEu7MABsuzgNZCtDmwHRwhVeiXskjawl5uH
 3tabRMJpJMXqjFtk9Ui/HvsNsut0ZqEMy9m8gnMGC4B9Ivm3uX7Tn+qwlWTi6CsxaUmGbPmW7Uu
 vX5qJueiD1ok6RlIcaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200141

On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> lines run from the SoC through the hub to the Port controller. Mark the
> second USB controller as host only capable.
> 
> Add HD3SS3220 Type-C port controller along with Type-c connector for
> controlling vbus supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 70d85b6ba772..d72639479d75 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
>  		};
>  	};
>  
> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "dual";
> +		try-power-role = "source";
> +
> +		vbus-supply = <&vbus_supply_regulator_1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_in_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_hs_in: endpoint {
> +					remote-endpoint = <&usb_hub_2_1>;
> +				};
> +
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				usb1_ss_in: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +
> +			};
> +		};
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>  		enable-active-high;
>  	};
>  
> +	vbus_supply_regulator_1: regulator-vbus-supply-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_1";
> +		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";
>  
> @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
>  			};
>  		};
>  	};
> +
> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +
> +		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};
> +
> +		};
> +	};
> +
>  };
>  
>  &i2c18 {
> @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
>  		bias-pull-up;
>  		power-source = <0>;
>  	};
> +
> +	usb1_intr: usb1-intr-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
>  };
>  
>  &qup_i2c19_default {
> @@ -849,6 +935,12 @@ usb_id: usb-id-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	usb1_id: usb1-id-state {
> +		pins = "gpio51";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart10 {
> @@ -903,6 +995,72 @@ &usb_0_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_1 {
> +	dr_mode = "host";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	usb_hub_2_x: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +		peer-hub = <&usb_hub_3_x>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_2_1: endpoint {
> +					remote-endpoint = <&usb1_hs_in>;
> +				};

Are all other ports disconnected? If so, why do we need a hub?

> +			};
> +
> +		};
> +	};
> +
> +	usb_hub_3_x: hub@2 {
> +		compatible = "usb5e3,625";
> +		reg = <2>;
> +		peer-hub = <&usb_hub_2_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_3_1: endpoint {
> +					remote-endpoint = <&usb1_ss_in>;
> +				};
> +			};
> +
> +		};
> +	};
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l7a>;
> +	vdda18-supply = <&vreg_l6c>;
> +	vdda33-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l1c>;
> +	vdda-pll-supply = <&vreg_l7a>;
> +
> +	status = "okay";
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

