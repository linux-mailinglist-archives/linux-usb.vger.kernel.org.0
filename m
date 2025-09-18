Return-Path: <linux-usb+bounces-26269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE181B15AED
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 10:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CB1517E05C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 08:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416E0292933;
	Wed, 30 Jul 2025 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JK5ZiiVb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0712153D3
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753865463; cv=none; b=T15pv9MH7XnsEEaHBMQ0sG/YSWrybblmfkNKiWeOi4mhjpNlV+iknE8nRO6rij8xUDMvS6m0d5ESyCcxxRkGODYrk20nrkgPWT6Lw3fvzAGkiHvhO1LJRJEhGjte6ULm/1OOLnijNGfuOhnTzXXyi/tZZyshh4H420hRT4DaVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753865463; c=relaxed/simple;
	bh=cnm7gUWT4K1m1gorlL74OiveZaLuR7e6ktTKo3UnIag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjD+kyZAMIK0lCt25CZmtQgQoeeJ0dNOfsNSOR2Py/p1L5HOVU0UbAs4Lv6F86ZihNz0XqzCDnTm9+v7WCvnYo4BZ0nxSV0aky4zdBMVjAO0lJMOlM4Y1ibeCBwVmTCukVYpcXOHbjVqQjO+UIp4Z9bjF/cKS1QGtDCg4aQfdmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JK5ZiiVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7JxlN031498
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 08:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqmpfuwY68b4/PX6d4P+JQac1Qgro1GSUaG1n/KUCOk=; b=JK5ZiiVbE5EHAt31
	HA2DlnVSzqrVmJpWqlunWTwbDZ+4bM+4nrehlWGdRQLdzEHxFEI/unm3QQY+H2Ud
	VDQBCLzAXKmzWoudy9XZh6/lSrn27TWwJ0ipFYkViaKDS50OnplNZbEakMeX54A7
	cRnRjwDpv979pEczKML9QiEDZvB5Kq9gho4WdCP3/jKtkBjJ+La8QuEeL3U32ys1
	RgsbJoCNqaGtw5uZDLcQtVFFS6imA0Fvv74hA2F2PmFkfDxHZjGO7eiTVlx6obDT
	X382ZMRZL0BZPXxblyzCFhlUS7I+o7lZ3gEKbpuc9Sm/Ojf8IQ0+OV647l0Kom35
	H9fABQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm2xj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 08:51:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab716c33cdso29641781cf.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 01:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753865460; x=1754470260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqmpfuwY68b4/PX6d4P+JQac1Qgro1GSUaG1n/KUCOk=;
        b=SdCZlaShOvvqiorghShClwMNdcCiRYCUGBeoXLUtHj14FZkRHN0j9gylh2dnZu+1Ij
         3IAo9Z87ymipa3W0zOUOWOLbhry7hz5BdInX6hRAC9S5IP+EzvKp27A6kgPrSLtrKyRm
         hjhVmtKsOQ4BzGmQAzu9L+GI+GppuNdrhNpvqp3AsEvsRR3UqCwGSY7nPUorrCoEfUJd
         pukO/3DZHIkAy+PxlrjHk+BlCEYsZUWdSchWA/cLB7n8Hsb8nKj99P8ttOZ5gArmSK+I
         9aaGpRu21EriF78oaoHoHa3oioHGGq9QGwnJDP3L0yjYMbHQefe+0r1xsQDgvdPgjqoc
         rHjw==
X-Forwarded-Encrypted: i=1; AJvYcCXBgRGiKHSBmWP3MkrZMVoLD1Th++42bNQJ0TYUIgfwDbp9fXppGp7+gMvABgJUFZzoqdXMaGF1D4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsx+lxpG2CHPyo3iZbWZVs3eCIsR2kdpWIq+TbLZdcM/KXNGc
	IxZ9Hv477LvxKYaqEm+wapSq1TWsFz+/ZhJQbHUuQ0AKsBIUxerL1kkUU3YlsWwMZorRxPLT4KR
	aoEnPgj3CRdpBy10KvXHOtbm9Hb4vR4qsfWhFuqvnsWExAi5HmJtv/AjWHF4w6ywvoN5BnCA=
X-Gm-Gg: ASbGncvenrhefCbrwefsHSjq1DgHyvvGIawC0laADPsWqrQp/6CKWnk0ZKGfDuKJ4V8
	Kw/nFN8tj6PJDpsjdQhfrdIdXpPM2eq3n68e5ll+8bQv05Ej7NhU1gk5EMxd02oV3QibBYoHSic
	y/pQflWlEpCBeOaHFdqNUBCGdlRXR0EqJwn/yoUsnqUqgl7Jv9qDz1c4hhJyAeZBl8gOrzhi2PU
	4BkFj6skm8rPiK05xUe/+BBDPS/pjrdrWFr6SBnkLwqGa38ndgWyCStzihAP6/aV297NWIlzErj
	FGi3FMteGXoTJtkfvwnwdWOEEK/jeXsZTykuCU2EdPlNJfqM/0T4LrAsyPsOpjIjYziy4KAb280
	By/tt6bOnIDXC6LVo7A==
X-Received: by 2002:a05:622a:118c:b0:4ae:6b49:4d7c with SMTP id d75a77b69052e-4aedbc5f883mr18142551cf.12.1753865459558;
        Wed, 30 Jul 2025 01:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmvclCHzWAaYHfQI4bS0nUaGn564PqmzPDblDwtxwKNRM091Yd3gey/eoAYJa9b8OgyLa+xw==
X-Received: by 2002:a05:622a:118c:b0:4ae:6b49:4d7c with SMTP id d75a77b69052e-4aedbc5f883mr18142451cf.12.1753865458877;
        Wed, 30 Jul 2025 01:50:58 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63589ff78sm716927666b.47.2025.07.30.01.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 01:50:58 -0700 (PDT)
Message-ID: <cc139316-03da-41e9-8bf0-f792bfdf5bb3@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 10:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz>
 <20250701-tb16-dt-v9-4-7d9e280837b5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-tb16-dt-v9-4-7d9e280837b5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889dcf4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=8mZ0GnmNcxpObUtPvmUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MCBTYWx0ZWRfX1LOw/s/9c1XN
 s44Dyr0lPzA+SYMWoTR+ZhPNmLou5r91mVWFwy2kw5V39DzwSbLDuihSqdBKyWN+prOARBNQfbe
 MjWw+Ajh5FRqqg1bQCxBbprxzLEJaA3Azq00Zfsnbuiu8Zk4qWO6D0sG4TU9nQkEz3sz6+xOGjZ
 ssF7dk2+Aa06/oYnND4cK5OAw0oRN5GVOoSf/ssVXLIOPoTBJBDg5c2BK7vcCm1K1ByugBfiGic
 GPjcvbsHnfqYzNfbvX8mEqmOVsZrrOGq7oUJ5PKALpusyDudSIiZGVQoxR4MI47CroKOYcVHP7L
 Tu8TmMbV7YEho/nGVZaQU0EbmkRqVxwdohUm7FzY+7OTii5c/Lc8OX4BLfilYr+/jlVtL5BRxMa
 ZFCZikrz5FBnlcFy0imtycyTSCAi/oAd5MIKlIqRmsFIeWNV4ONACM5uMsU9tfXFGLfSyFSw
X-Proofpoint-ORIG-GUID: b98AA2ODQR1ElGivYoGCuaRWPFkVqdZE
X-Proofpoint-GUID: b98AA2ODQR1ElGivYoGCuaRWPFkVqdZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300060

On 7/1/25 7:02 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> - X1-45 GPU
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not UHS-I (SD104) and UHS-II.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    2 +
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
>  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1657 ++++++++++++++++++++
>  3 files changed, 1660 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..6b1d71daff5a778237c5e3706aaea8e29dafa001 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -333,3 +333,5 @@ x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index e3888bc143a0aaae23c92d400d48ea94423e0366..378635f7cb0bfe37cf10644a16bd8b3cca447f3c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -170,7 +170,7 @@ trip1 {
>  			};
>  		};
>  
> -		pm8010-thermal {
> +		pm8010_thermal: pm8010-thermal {

Let's rebase on:

https://lore.kernel.org/linux-arm-msm/20250701183625.1968246-1-alex.vinarskis@gmail.com/

[...]

> +	/*
> +	 * This is an odd one. The camera is physically behind the eusb9 repeater (confirmed) but
> +	 * if it is placed below the usb_2_dwc3 node, it will be switched of after ~30 seconds.
> +	 * The reason seems to be that the dwc3 driver does not probe for child nodes when in
> +	 * host-only mode. But that's the default setting for the xhci controllers due to issues
> +	 * when in OTG mode. https://lore.kernel.org/all/20241210111444.26240-1-johan+linaro@kernel.org/
> +	 * The whole reason it is described in the dt (as an USB device) is its requirement for
> +	 * that additional regulator, and to get power management to switch it off when suspended.
> +	 * Defining it stand-alone does work.
> +	 */
> +	camera {
> +		compatible = "usb5986,1198";
> +
> +		vdd-supply = <&vreg_cam_5p0>;
> +	};

If the bindings checker is happy, I think we can keep it here for now..

[...]

> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u

[...]

> +&i2c2 {
> +	clock-frequency = <400000>;
> +
> +	pinctrl-0 = <&qup_i2c2_data_clk>, <&tpad_default>, <&kybd_default>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	/* ELAN06FA */
> +	touchpad@15 {

5 touchpad variants is a lot. Does DSDT give any clues as to whether
all of them are plausibly present on production hw?

[...]

> +&mdss_dp0_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +	data-lanes = <0 1 2 3>;

Does defining all 4 lanes not upset the driver without additional
patches?

> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp2_phy {
> +//	vdda-phy-supply = <&vreg_l3b>;
> +// 	vdda-pll-supply = <&vreg_l6b>;

The regulators are usecase-specialized, feel free to trust what
is present on the CRD

[...]

> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			mdss_dp3_out: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};

Please rebase on:

https://lore.kernel.org/linux-arm-msm/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/

[...]

> +&sdhc_2 {
> +	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l6b_1p8>;
> +//	bus-width = <4>;
> +//	no-sdio;
> +//	no-mmc;

Please either remove the '//' or remove the lines

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +			       <72 2>, /* Secure EC I2C connection (?) */
> +			       <238 1>; /* UFS Reset */

Try removing the UFS reset block and see if the platform still
boots, this turned out to be a false flag on CRD

I'd also suggest removing voltage suffixes from regulator names (i.e.
turn them to e.g. vreg_l6b).

Konrad

