Return-Path: <linux-usb+bounces-22446-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB54A77FB8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 18:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B4616618C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1D520CCDC;
	Tue,  1 Apr 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2BzDNkD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F220469A
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523194; cv=none; b=s8/fKBOpLICK8r9kpc8E24Caxh3mSmhv+B+jTLQCJjnMz7X+PIxiTwzp0U3N03G3woNmTOC969tMB5aIOZn7hk6HH4BGv0CXNX6l+l+GkX+koh+8qovYSQUovkRan6cVzoDAwvh1iUCFL0GU/HaeapINAytmAWwsCGRIeIxPnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523194; c=relaxed/simple;
	bh=s5G+D4Y4H48hG+JqN8iTc8KNENEqqJ+iDJISsHqOWj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDL0fsYmSwFhoGj6uuHsH9VkTDF3TwTsOqVHW0qi6lLRCZTN2K+qX4sa8hUCGnGNocDKT6ytlgkueLX3j6W+/vJUMqgMtECINPon8iI4X9i/UE929bybTdQQqusKUHOXnEWiHQUs1WEMdE5tYRyV6bqeGXU5ZchjzA/3yq7i508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2BzDNkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531FUGuo008415
	for <linux-usb@vger.kernel.org>; Tue, 1 Apr 2025 15:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVsiqH8BYsZ0fSUtLECQBLTo683Jv0XmjiQt/jiR8+c=; b=Y2BzDNkDrnHvj5Sr
	5ZWeCx9WABWv4Pdu5vqPYZLVVEhtJauoKguZa5ZJU7XOInjoKTXavRe7TxhcoBJS
	/wePpE3vtGLO1UeY+iIiTMyO2OVFcGbULvwCm+J18qwvYD++S/Nd/Q0EoLeAIOGK
	CsCvTNo27wxOna5HIw2ouVsFoiymWSo4PZPBErZYULJqGZuzNC6t8FactF4CoI6G
	a2garVXJhEVdelujTVZurNj7etbHTgDzA5dmnClJd0zlLiiL5tOPKeY6fZPlQFlW
	xuXsqP4UnZbnAQ558EVMhp0dsWWhuXNNzun9UIT0Ggg3yr++fsfqP7/fbOpy3q/a
	3Mi/Iw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnk057-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 15:59:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ead1d6fd54so9918256d6.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 08:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523189; x=1744127989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVsiqH8BYsZ0fSUtLECQBLTo683Jv0XmjiQt/jiR8+c=;
        b=WmXKEWpT88Ntc7nIKMnhFbDJQYFMKvBzn9wZP+wFXQIWRS3gHddebfJm8l9a8xrQFE
         3nNEq8VDH90M/0k5dwxsP9XxRYu7K1/BGnWwapYvaSEuC/QUZ0xAIKyBz7R7Hq+WwIGI
         JmX6W7ojnbpsEbWIqTelCfNfeS2idIzv+tAC2z7O18X5jJY9chbIgPP0K6EYYitxX/TA
         A6rNtSo8YKYpoD6trbcl6nMFQKqW7oS/0KW2OaNUjVIGizUt6WcMSoJWe87fpLtSL2bP
         swXGE7dM7/xSo4irzhYwguzZwUM03uzeNYU2lcMUpJR+hYeXZYSySk8jDroHGuOoFb3E
         laaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0/pZ5tLqTwnXY4Zz9Ql671gCzLJ4sIKxoFza6kA4wSMVizPcsq4u7rBdq7UEBwrzMQ62IKj0Xmi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhseDCUIq0ZoPf6lRJ+xymUcPGW7BBSbTV3YKe2330LK1GNnnW
	WJ/0WgKC7uMSSzWNL+Hg/WhMKFkKSO7cctKIsMm4I7s6qBi24riLxxe9M/XgfYIbHGazf6N2PI8
	w/dVAdae6MgarjLXJiCl0E072TiH4vY+02DVcPu98fHHAc1eJWKqkY0+LtVw=
X-Gm-Gg: ASbGncsjaGGSZacktlWboDVKFRAefSmYQ1KGOkkVum92zTcBQjcKaRxhSJlwV3wSBYV
	4KEtoF3AyHoPfP06dQrm6PwnM9VpPGEoOR0qZJ0gW4IMI8P7YnHl9hm6xfqKL6SrN4lczDhjplW
	7lMHeM+6QRXuNE6BNjqNR7moBeQtzu7Czj+KJTAmeOgOS84NC1SuNCiJd23qGDgNGhGXLgzUHQl
	HZPXMdcz7I0AJrqfM7M4A89/Xdb4tFt4LAY+0H9JLXlb3oNzqbirWnYgmH04e24J5xzdP4mLmFX
	lNNhF5Eb28+VQsBJYP0akg7Owt2lWDnG4WEqco899kiWiJn57iswtL3TVoporVRlctACxw==
X-Received: by 2002:a05:6214:27ca:b0:6e8:f589:ee3c with SMTP id 6a1803df08f44-6eed5fdc4f8mr68482416d6.4.1743523189632;
        Tue, 01 Apr 2025 08:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcj6DyVh3s44alBnkASPCCH0lLtilsnzjnLJjgoTmTdUdo3LYZcKFQUcOnrnyfNVz01bfZug==
X-Received: by 2002:a05:6214:27ca:b0:6e8:f589:ee3c with SMTP id 6a1803df08f44-6eed5fdc4f8mr68482156d6.4.1743523189250;
        Tue, 01 Apr 2025 08:59:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16ed61esm7201988a12.34.2025.04.01.08.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:59:48 -0700 (PDT)
Message-ID: <ef783edb-c966-4ef7-b496-564420c1b852@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 17:59:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-7-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250331215720.19692-7-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p1fJ8LSMAJK70c-FC7mw4wYWACcDWgpP
X-Proofpoint-ORIG-GUID: p1fJ8LSMAJK70c-FC7mw4wYWACcDWgpP
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67ec0d76 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=E544tAf0YMCSjjrfBEcA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010098

On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected

[...]

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_indicator_en>;

property-n
property-names

please, we're trying to unify such small things even though we know
it's "wrong" in a lot of places

> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* ELAN, 04F3:3315 */
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";

It's also customary to leave a newline before 'status'

> +&pm8550_gpios {
> +	rtmr0_default: rtmr0-reset-n-active-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */

Drop the 1.8v comments please

[...]

> +&spi10 {
> +	status = "disabled";
> +
> +	/* Unknown device */
> +};

Does the device crash if you enable this bus? Keeping it 'okay' would
make it easier for folks to poke at it

> +
> +&tlmm {
> +	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
> +			       <90 1>;	/* Unknown, TZ Protected */
> +
> +	bt_en_default: bt-en-sleep {
> +		pins = "gpio116";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +		qcom,drive-strength = <16>;

drop "qcom," and please keep the order of:

pins
function
drive-strength
bias
output/input

as you did below

> +
> +/ {
> +	model = "ASUS Zenbook A14 UX3407RA";

There's no strict policy, but variants usually go in braces

> +	compatible = "asus,x1e80100-zenbook-a14", "qcom,x1e80100";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> +			"qcom/x1e80100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> +			"qcom/x1e80100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;
> +		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> new file mode 100644
> index 000000000000..b6c9a707090f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "x1p42100.dtsi"
> +#include "x1-zenbook-a14.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
> +/ {
> +	model = "ASUS Zenbook A14 UX3407QA";
> +	compatible = "asus,x1p42100-zenbook-a14", "qcom,x1p42100";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> +};

This file is not going to work on this SoC, you can drop it

> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
> +
> +	status = "okay";

Are the DSP firmware files actually different between the two?

Konrad

