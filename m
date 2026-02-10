Return-Path: <linux-usb+bounces-33266-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKD3OgOgi2kKXQAAu9opvQ
	(envelope-from <linux-usb+bounces-33266-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 22:15:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F511F575
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 22:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D5F13051492
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 21:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ABB328B7B;
	Tue, 10 Feb 2026 21:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZ0JhqP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knR3G5mu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC0518C933
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 21:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758139; cv=none; b=QZklibfNfERo1KUIpEIMk2suY969BpNYs6SYKQYy4HKDvMfSNu6x+El1J1dtiyaF4E5ntphcdiULs24ai7RGR4H6I104Qs+BUIJPKBVdwFsY9xIyuXdrqH576ZNLX/msZrhP0F3JVK3eXV83lObK+vKLWpMOBR73RV51zDBSoCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758139; c=relaxed/simple;
	bh=8E2hkUobsPxKAeryunZqhWOaSMjlJ66YiKjUplwZxYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMzd1Viq47dzmKQaE8EN0qEF5hIzoEfESXJ5D3/mtUfhdzdjjbDv79eAN3Rs6tmdsQxPTiVKviZCuQcieESLUc7LZCesP5xDRILR/woHJ/paH9ROcjIaN331VmXXPimlHALBonHlq2AQmXgiyqvr9/ts/NnaeNVxiLWpDqq+0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZ0JhqP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knR3G5mu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AE2Tg41151630
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 21:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MLbjb0Wz27XDS3dRZdPNRKdn
	PQ/Z3E/JZKsRw9FZxE4=; b=dZ0JhqP7GcSJoEy4ceFCLHP1yvoCDlzsieuEW0QC
	HIP9hQw18e43TExofpKME7gOko8JHP0SKBkVPOnmSB+v67Il3WiLIT12/QPkmHQo
	byd0AJIjS50q1EwWVylTLYgfkQxYix+1eAGKqLyVE0NpfnFPAsSiOaSdeTviKPvc
	Q1Gr57DDBDuEP3NilPSimtqe5W8bMmOKIJrJCFj0uwyvTKDqTVUq/m0uUz5M03uZ
	n8L13fzfnq+9J0mj5w54dcl3Eiih9qKaDrrGE8gW0TwMQvFYATzUaZ8MVhXfKFa7
	55aeSYraIRCsTvOHsnyXppjusE/3RlHTHOFkVuMdwFoiNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800jarq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 21:15:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a87029b6so426991685a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 13:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770758137; x=1771362937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLbjb0Wz27XDS3dRZdPNRKdnPQ/Z3E/JZKsRw9FZxE4=;
        b=knR3G5muvRRRSjHvhk+cXBALXRbp8eiU+jD7gtfnILVqVG0kUVpwL2FgiPRHqA4iMt
         o+MgqCW3Z5fsynpM/+Gr184mX0SnO6cSiRWkccVsL5Y6ATjLc/mu2WnqwSlJWUa3jO3A
         6TpWWtumtdZwKCkKSeTewVEyIzD2TVfbNsFz492gW20kr410wZBo9iQMaHqcKBxi1vnb
         Ldr6U1s3HOwJlEwOhH04EA8sJNYLHL/Ej2lCdDrIw7OZmPHUk23joAZN2EIbmdd9FUhd
         U5iPZw48XYjcGUi0Ry1PxtyzDMzPBCEAHsuRHaJG6nBWncvN35Z4HDVEQhckH1JbfHIz
         O5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770758137; x=1771362937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLbjb0Wz27XDS3dRZdPNRKdnPQ/Z3E/JZKsRw9FZxE4=;
        b=lL0iWIlBnguhZuTSsb3OYDH31GNXVfQTtlO3pLgLM+prtNXzgoVZHnb3RiAc3azgCn
         L0N6qkUjEQuzW5phnnSXWK04g3QIJsWUPxX3od+r0dHGK21NZau3RTcwMiZF7ygxEa7z
         5MBm0vZnvLm1CGC2lMkY+DNMA+nvI2/JbwW4JW8ia8ZtHBymT30nQO+5MzqTWr2S9ugJ
         J33e2IEeW3+3zbCdsEQyqxiaxmGH1a+KSt1PXpVa89tplUlBaf9mF+HxsII1yFP4D6b/
         MA6v/dqU6YXXkibMAwhN2inRJcTNyvqOHfnIa7IZpPzX9aiWW53FZjBRqYwlt59LYkgo
         wQXw==
X-Forwarded-Encrypted: i=1; AJvYcCV1VtwWF2OtGwOhvnypzP9DBRsSjM8phVc5g7BWdGP3p6n7cTck+3ThhaUIR6FtWuAjnGj2Lysgjdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNxQtA0vZnU7TgnPzCbOBPndikHIQBlCmXFxV2LrWe/V6b+BC
	eMu9PbZY7yvc/mkKK12+bkgD8enyBbGojaRo5XgtKDho+24FrXE3whxKZV18fN5/V4y5gkCmDSl
	kygaAZ9HBlUH9bdnj15J4BhGu8WN9u3nq+mHcbtf1drk7b9NDNTrnw1yikWfJTdo=
X-Gm-Gg: AZuq6aKWzBBmYnIMFJXJ42Vjn1f58Yba0lZ73z7Mjx34RPtc7PYzWv7xJLeJ9MyHuC2
	kGElXb4Eg0rdmXMWiLoVErdhd0znSKm9RdQ1WuS3X6YQgU2xCjj/O6T6ILk/6GuE89P82l9bMJP
	dEfwMsyL1BxL2SWYOPu2dZnVQ9UwPVZ1v6YRVxKhv65xeXD05mW7k3aOG1iCQvuKD048Hwq73cE
	D7iQ+kojKDzuzllbnv7D35kMgiIji6y85ziYtDmshI5JHKk74guqlvNKAeUeMI9tgnetujiAQrS
	+ujKFcKDLQMLy5TbumbkUXs8RhWtK9F9qAJWMYj37NRLR2KZlNVswbTYO7CxLvDyzJUKGBX9LWY
	PVMZMWgD/GzFk1XctuQxrNEDJNbyZ8C21JGxcLZdf310zj2L0MebgMPBkbC4L5jOQVDCuNTbgK/
	AZtlcgaoQijkLDCSVGyBxB7V/4/sSCAJylWGc=
X-Received: by 2002:a05:620a:4553:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8caefcc9f16mr2226501485a.38.1770758136624;
        Tue, 10 Feb 2026 13:15:36 -0800 (PST)
X-Received: by 2002:a05:620a:4553:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8caefcc9f16mr2226497585a.38.1770758136150;
        Tue, 10 Feb 2026 13:15:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cfd3absm3489035e87.28.2026.02.10.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 13:15:35 -0800 (PST)
Date: Tue, 10 Feb 2026 23:15:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
Message-ID: <y32g3rpgfjtr6qyic6goj24uw24tucdsenninqqok3r5ofahj2@7cxcwf4cn6cc>
References: <20260210143931.3324647-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210143931.3324647-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NSBTYWx0ZWRfX4MGhRLBDsIeQ
 iO7aki6CU5Iu7IJCdRxCbFN5aCjFylqm4hWB5YFH/4Md5fDaMSmgJfnSutioigvewXH6unrjrZy
 zd/3HyABV6HGsqEepUD6kU7oPQEe8erTpWAaeDACO1W9ydlGd3K4p4YZE/oFD6xB81r0/VGCIEl
 IEgH1SpArOrOmbbokTGDcV3H4ZFtf8UVzPbwpuKOl4F+QEZGSWCBPFulIVLhTP4b9ovjm8E1WAR
 zG6jQ3uKdAwdi5b8Ky2ofPH9jd2CpeoleWP9gvhfaLIosCsZi0OfCdsFEgnUpAFuiRN4H+Q3IN1
 xbEpeh3DoCr96421aI8EObgYsOIl606JGTu5kap++tTmD7yT8+yHbnas3gQdb2UnazLBBjyHYIS
 KGkI2k4rfux1z5Jea8LmtvgOOzaSoz6QnbcTEs36zrnIKaRjtEkKTZAwPmb+BnNM1/AIxoSlGbY
 ia9uMxiqB4EInm5wg8g==
X-Proofpoint-GUID: HzF4kcvZloBbLI0QZLRORzpNlhiN5R-p
X-Proofpoint-ORIG-GUID: HzF4kcvZloBbLI0QZLRORzpNlhiN5R-p
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b9ff9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=hyhx2qDMj039dR8EpDwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33266-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.0:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C3F511F575
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 08:09:26PM +0530, Akash Kumar wrote:
> Enable the secondary USB controller (USB2) and its High-Speed PHY to
> support OTG functionality via a Micro-USB connector.
> 
> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
> compatible to handle ID and VBUS detection. Link this connector to the
> DWC3 controller via OF graph ports to satisfy schema requirements and
> enable role switching.
> 
> Specific hardware configuration:
> - ID pin: TLMM 61
> - VBUS detection: PM7325 GPIO 9
> - VBUS supply: Fixed regulator controlled by TLMM 63
> - Configure &usb_2 in OTG mode with role switching enabled.
> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>   supply VBUS to the connector.
> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>   detection.
> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>   VDDA 1.8V, VDDA 3.3V).
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 68 ++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index f29a352b0288..ee472d8b2db1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -217,6 +217,16 @@ pmic_glink_sbu_in: endpoint {
>  		};
>  	};
>  
> +	vdd_micro_usb_vbus: regulator-micro-usb-vbus {
> +	       compatible = "regulator-fixed";
> +	       regulator-name = "MICRO_USB_VBUS";
> +	       gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
> +	       regulator-min-microvolt = <5000000>;
> +	       regulator-max-microvolt = <5000000>;
> +	       regulator-boot-on;
> +	       enable-active-high;
> +	};
> +
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -262,6 +272,30 @@ active-config0 {
>  		};
>  	};
>  
> +	usb2-connector {
> +		compatible = "gpio-usb-b-connector",
> +			     "usb-b-connector";
> +		label = "micro-USB";
> +		type = "micro";
> +		id-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
> +		vbus-gpios = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
> +		vbus-supply = <&vdd_micro_usb_vbus>;
> +		pinctrl-0 = <&usb2_id_detect>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				usb2_connector_ep: endpoint {
> +					remote-endpoint = <&usb2_controller_ep>;
> +				};
> +			};
> +		};
> +	};
> +
>  	wcn6750-pmu {
>  		compatible = "qcom,wcn6750-pmu";
>  		pinctrl-0 = <&bt_en>;
> @@ -606,6 +640,7 @@ vreg_bob_3p296: bob {
>  			regulator-max-microvolt = <3960000>;
>  		};
>  	};
> +

Stray empty line

>  };
>  
>  &gcc {
> @@ -1137,6 +1172,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
>  		 */
>  		bias-pull-up;
>  	};
> +
> +	usb2_id_detect: usb2-id-detect-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart5 {
> @@ -1200,6 +1241,33 @@ &usb_1_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	dr_mode = "otg";

This is default and can be dropped

> +	usb-role-switch;

THis should be moved to the kodiak.dtsi.

> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			usb2_controller_ep: endpoint {
> +				remote-endpoint = <&usb2_connector_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb_2_hsphy {
> +	vdda-pll-supply = <&vreg_l10c_0p88>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +	vdda33-supply = <&vreg_l2b_3p072>;
> +
> +	status = "okay";
> +};
> +
>  &usb_dp_qmpphy_out {
>  	remote-endpoint = <&redriver_phy_con_ss>;
>  };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

