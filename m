Return-Path: <linux-usb+bounces-24758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254EAD9F82
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 21:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2455C1890FD0
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 19:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DC928ECD1;
	Sat, 14 Jun 2025 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvVdejBK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837CC188000
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 19:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929971; cv=none; b=I8fkbINW/9hW+2PbtnrIyxPcQNTRON6K20Gp+KI1vXUCaznWkplJYuoF54lbmakZ7tvH6RK5+ronlIZWeAyZzBtNURjgMPmocmhQck8NSCysS9bIPlyAqlNTdBh0cnyya2ugWcBXGdHIczEtDOlJsBsRychmh2+82GCGHsAx4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929971; c=relaxed/simple;
	bh=zSkcy+9QC/FsH2JbyDzo+e5oYZeRb6hCJ+NReJzsy5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyNPzmEnFX41w1lTFZbRDBFQtlyqoNf0/aQTQXnmImSXJLUJS+moloSc2ChhkQHxRVlm2Z6uwGWBBZW9yL5afaAqWesPPEBEj/CQF+Q0EKGFR+JutXGlN/P+r0dZfClqKIJAr2xsf2/Cs3rkOn2LZi4kGPax5tRB0/cseTCR+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvVdejBK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E8vJP8016883
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 19:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcxiXXKnkOWfPgGikwQVTCvvEomIPuV/EyKApCfjq2c=; b=WvVdejBKlY5Z5fvW
	qQhz/3eJrRsNKCmoVpRynF2+3ysfqUiq8WbFJGC58zxaZJ1+8dA2kz8Jv5q5KKZa
	o2Y3pEVayJMHLogafs3k7DrkAY9UUlSRcm7x90+NTDy3gP+7jLv5zVMkxYESSMP1
	J6Kfp4OVdnf1KVU3gdo4cDH0I4ao74DWTuB1xl8ImytKoCQkN7TC6WPvotfDq9Da
	HbSToywQHpwF59NOg092OeU26BTNeww/wrBZ+hJJLeLd3bTK5yEO0cddwwK55r08
	BuPSsgxMS60G7EZSBPUAaNnPbHOFoF6CXpD8C1YifYzbYqUy/W0vvBZDQJuF1LwC
	U/paiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928m8wes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 19:39:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a517ff0ebdso7558461cf.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 12:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749929967; x=1750534767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcxiXXKnkOWfPgGikwQVTCvvEomIPuV/EyKApCfjq2c=;
        b=Jbfj97DzipeQZrr1Z8dWHd5aY4qRrJpdADbx6F5NP/IwaVtDeRZWxdK0SmMBKJDdB0
         9P6LY/F5HuN4KiwwT9dg8AxPAwUDAIQDm9OMS/DihJJjVM5crWem+x502p+hshDEqKtn
         d6Z04QI9Y/kxv+NTwmhLlt82gtnM5/el4/qn6Ml+Z2RC7AmNNnPeO3M1L8nwTiRrKuoH
         +Z6JprQg6J9CFj4IU/mTlZnGA/jWHwM0SX+EdGkktaR2GSlAr6J6nM3A78OI7gym5AQx
         WFI37HO5OyiUgwL9wudXkL/MSpcS8WWFGmMHCfVvwIZXSfCsXfk9t794XnPI7ItntmGg
         nejg==
X-Forwarded-Encrypted: i=1; AJvYcCXKVtpTbAcumpGLGgZ5f3TwuAsAhe8laULKWs/sgXPE+GL6vMhMuXsalEPU6KtaZkcVhDclIeFxLFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMlTeXtFpCHIKYQajHheZev78x8YsBxLogTQpL4/cIeH5+cEYc
	yKZKjcvl2ovpAxDr/ksiBUC5FwjAeThauLogMVJYNdgwya6dQKXIslOKKfYnOuTIJVoNchk8THN
	53sqTFI76jq4cqLO9SY1Fmq0WPxDDsOEq95p6fU/zC/lC9sZeZ1MJ1V/vQYkEEVo=
X-Gm-Gg: ASbGncvI1oEAM6MdAKyVO+bAhZzx2Vsd+pN7xL65txyNJZaUQV4tvXWN6yfbsZZ2CLc
	yNZr7kITFILTbNacCJ81MEv1Jomiq310aKKJIyfBFkBu5Hhv/GsVW9YfNWah5DXykxTCkQL7S+z
	T6Kkv2dYRqXuHwe8CJQ/xPXlt5P9yIxTwjQelrYMYH62KNQUbo7bye8s8mjgYflxjcIR8gdynu5
	Co/alN6spvOylWk4o2LkmNecsBv2OZhRxUBQSKdLNsXUFS6zP+5e+sEqDPkZVJkWuxQ1PoQKY6C
	bXsUKq8SqQab7r8rIqr7T10jc1racwyqX83qjmay2dwKKCjyAdHI2khc8Tgy6t13Pp5x1o3PH9M
	NfmM=
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22710911cf.6.1749929966902;
        Sat, 14 Jun 2025 12:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8dmtvab1DD72NJPA+fqrTATOvFUC8Y320lY5T4Vp6J43nwiKHvw9BkAW22BjuNAMnhrTD7w==
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22710791cf.6.1749929966424;
        Sat, 14 Jun 2025 12:39:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48cb761sm3224336a12.17.2025.06.14.12.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:39:25 -0700 (PDT)
Message-ID: <ee088b5a-e792-4704-8f1e-e709f1b0c5fc@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
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
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NCBTYWx0ZWRfX/C8v209mXkpf
 W6nWYsnO0/90DjkyKvtvuQqucfpCK0TC6DZGeQepXloMyuGbDCvZyoH0Q3iy975Bc2eaERBWZZk
 BqBffmYAObB0hW4YTXrKsWMlQdGXWIUN1rUWIbCRYqKHIe/+7S2oh4MXH/CtjDtQx6UFHHk6JVp
 WQBNXqrOz1HHkxa/et83shAuFzsYCOutyo+2GmdwRijHakEKu90I7E8NmeuatesRUiWsdVx6IXR
 Wf1JreQL98g+pLKpN9G3rG0U8Ud1a5fnwzrpps5Kri4CoeMZr+L3iS5SwXSInux39psrQXk/6ks
 +bQytKRXU6mcK8GKwwp9DfuS0Ccd8qtydIHQPZEtYLcEJohNR38QVthwNMD9b+of57rY+vaxJi7
 zAOe/QX8VtLEzPhQY5ok0BcXIOa7q6Co2+knF4QYBuA3UOXs6iork0ZE8XeN/bI3h6ACRGrI
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=684dcff0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=Lh12ZzDr1oTyhi1fLBkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: vBKE9eYKX2GNFNFuDYxNQrGXpAYiMl-U
X-Proofpoint-ORIG-GUID: vBKE9eYKX2GNFNFuDYxNQrGXpAYiMl-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=935 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140164

On 6/7/25 9:19 PM, Jens Glathe via B4 Relay wrote:
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
> - The GPU is not yet supported. Graphics is only software rendered.
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

[...]

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

please

[...]

> +	/*
> +	 * This is an odd one. The camera is physically behind the eusb9 repeater (confirmed) but
> +	 * if it is placed below the usb_2_dwc3 node, it will be switched of after ~30 seconds.
> +	 * The whole reason it is described in the dt (as an USB device) is its requirement for
> +	 * that additional regulator, and to get power management to switch it off when suspended.
> +	 * Defining it stand-alone does work.
> +	 */

Looks like DWC3 only does of_platform_populate() ("probe drivers for
child nodes") in drd.c, and your dt sets everything to host-only..

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +		<72 2>, /* Secure EC I2C connection (?) */
> +		<238 1>; /* UFS Reset */

Please align the '<'s

Konrad


