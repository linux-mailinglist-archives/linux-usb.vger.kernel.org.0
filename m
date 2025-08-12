Return-Path: <linux-usb+bounces-26757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F862B22848
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 15:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2A3171A77
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 13:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C36127A92D;
	Tue, 12 Aug 2025 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDrXeQgY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185D275B19
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004631; cv=none; b=W0JrDjnGF7AyGvq9sSC5lZymEPwGajviuvtdzRfI7uwUyj1F/ceyJGlW1/QGEg6oAaoQAH5F6C05V1hWr4IqYkOI2MnuKJ6Af3DFcC+n9TjSIJ6ElOr2TqUj4VVvzcuii3p3IejORX1X9DZRKlBnUBK1Ddb+xNHsEJfX9tSEVRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004631; c=relaxed/simple;
	bh=9GOTihJBuOwMzHItXprgzBEqmo7JXup58Cct4ZI98xU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJiHzyqAsMVQtV0PB9pLFNW8nhyhu53n8zF0o0qELVbFMKTVzyhdJEtnG2ZmK5IrOwOE4lmTXt4tbsWoh1kl0FLnr1n/hqtgfdlv53GHmzB4nG4axrTBqSrYRBL8ESMiteZQW9u4NAkSqfjkFduR2OVGVsligpAp51dvzjcEfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDrXeQgY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvfnd012897
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2upwTPsLE+/5VtMc0v0f/00llRULni1iuYl8L3Q3s4=; b=BDrXeQgY67A/Xrea
	HOl1BCf0KLQdPoxnoulVj2BMxREOJulbRJWd2UcUk6bLWiM3bftuKQi/1mWOOn05
	lblziLyCqZ4DO1NSdEh3kbNDGnqeFK4Z0g7l+ICaoSDvnbqKLq2gFx3sVujt6rv+
	3Pau29X0ggrPzKv3q+KaEPMAMRgljI2teTsh9GXERrOu3JR+FPzBog5sQ+T/xQQ9
	x0PxsIlJ4LplF3IJVg72FR1kwg0uQV7sTxZDW8tPuWkvFBrhjBSTokJTNn7rONQK
	NkUGkxvssi16Oob6BQcDFfKH14QR5mai/SMYQn/pV34bf+YwFSHDw/c9zllQAowf
	kqqTYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbbck1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 13:17:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso3158741cf.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 06:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755004628; x=1755609428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2upwTPsLE+/5VtMc0v0f/00llRULni1iuYl8L3Q3s4=;
        b=prbZSaF0DLP7Ri5OKRQqBBTL9P5+9ymFqqRG1HB3Reqe9F6LI5XstwVU8MKB/M+JQ3
         SIcvb1NuUObor6CuBCvaoCCcqC4GcjVsKTyEaE9go3hM9EtuSPJQyOPoFpF0M7Nn6HDf
         uPi4mqWJvZq0pWm+Ct0fjA6PeA0XEU+/9QzBuDoD1mH9Mp99WDhn4TYn+k36wXHitdcY
         vm3caQeGuWmMZURXdb73mrUYQwy8P4KPk6PNkC6BfkXdu5xs+xf4cdWKy83PnYMWC+zk
         gbz6oAevifh5NrUz2DxpNfQLLpKg8w97fsphee8Dt9v75M9g/mEy/6hQxiLyUQg51PWp
         eXvw==
X-Forwarded-Encrypted: i=1; AJvYcCUS1WjbmdZal2bo8rXBSzniSg1XfSzJ5K6JnzpwVFjBu1JnZWjbY7sWNGlhBAouTmjTZDLTju5NhJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzET4C0Bm4xGtHzVTa2NCGK4VCoQxqbWYLurIciex9Tf+aicy4L
	jNwg7KSdSMNDSRZJ5/+aDELoKtp4MpgMJbJmcoV88bT6KXHhnvWjcjqttOl9GqXCJKd+AAuOJuo
	VYiZnB68Jf/1bxymBlfj+JSsfCHFUdwY/2uOza1EWw2CrgrQYknAIxz34wkjITjA=
X-Gm-Gg: ASbGncvCpzeekU4MM6fYei+IqQBgnRRQywbXpYTHQ7Q7fDgFvK78rLacWWBLYBRHOBk
	6FMYYyMaDtaXQkHH/iOcWGERdPikPRj2kOiu8luvHCUmpr63CJRUnyQYnMpMtM2OC+ooy5t3xLD
	URRfUpsXotQmAQFHjALXJiamI6eyXChpUiUP7vVghAiTeUSHvWm9AFtQJXUBvNc/q2GTb8aF+y0
	9dkf2HKc7XwSk+1tUCeQRJ5JLYKvrXTM+rDWGLK7BUZgfgZMzWCxiExbPBgzgrXTkwYGVDUPs4o
	WZbKtYrL0z2u0EX4t1LJa4qQWOwfUNFfUJIjF8iLfxv6q56cFDQffeVdwMgxoIhcx2lBK3WdqzD
	lzidHl+H0alSSckMGIQ==
X-Received: by 2002:a05:622a:1353:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b0f7d274c7mr3642221cf.7.1755004627686;
        Tue, 12 Aug 2025 06:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1MVa9nhoYbuYsNAwhLp8pzIqERivc6KY3noJL5VjtEyUinG56UBKRTBVgGu7ny8qV2Botdg==
X-Received: by 2002:a05:622a:1353:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b0f7d274c7mr3641831cf.7.1755004627105;
        Tue, 12 Aug 2025 06:17:07 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9584b1f55sm1801993566b.55.2025.08.12.06.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 06:17:06 -0700 (PDT)
Message-ID: <8f757a56-6f8f-412d-a476-ac179358fd94@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 15:17:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
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
References: <20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz>
 <20250812-tb16-dt-v11-3-4923d2cd7121@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-tb16-dt-v11-3-4923d2cd7121@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689b3ed5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=J8-AfOrCmOG6-ZXwzD4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX1Qlb3NF/eGSg
 mbd+zkK5ewPW3u/FT3HPi0xLqbJvJflJaQbM/X2kRD+rV1QISNaHKvpSEQJwm4AHl7YXrv4pBQQ
 kS3sbTk0hu4BQTruq3Q/OJ47N7wr1bBLG3KKDGQkDfPWHRu4C6bX/TgK8K8OXFu1CtHgFreLX4g
 mbyLWoDTV5Fljnn9fBeJ1Y5MUYHZSf9133ChweXGKHIc3q/JJwHizOXfgrpiBg7aPAmjQSvxewe
 y4EC40xVzTp0Etn525/sOfbSw2bSX4mnkMWqSdOFmxxHMRzO7W9rs8WYMx+CPd84HdTIrJ+qxWl
 cjO8LkLEK51rXL8gtyZMuCmrYl/rZcBKCF7dUK+/h5LtSKP00WVhPYkKeYku6v7E5s28IW0xFtu
 zBtetfwY
X-Proofpoint-ORIG-GUID: 1FyHC2NnA6EjeLwCxWTolRYsJimrSY8h
X-Proofpoint-GUID: 1FyHC2NnA6EjeLwCxWTolRYsJimrSY8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On 8/12/25 3:02 PM, Jens Glathe via B4 Relay wrote:
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
> Co-developed-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-LENOVO-ThinkBook-16";
> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",

See b49e37de8e70 ("arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies")

[...]

> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddaon-supply = <&vreg_wcn_0p95>;
> +		vdddig-supply = <&vreg_wcn_0p95>;
> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
> +
> +		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wcn_wlan_en>;
> +		pinctrl-1 = <&wcn_bt_en>;
> +		pinctrl-names = "default";

this doesn't seem right

Konrad

