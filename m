Return-Path: <linux-usb+bounces-23485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE1A9DA10
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 12:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B54A7AD6FC
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7EF24EAB2;
	Sat, 26 Apr 2025 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmCnTwAU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D94D224AF0
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662767; cv=none; b=Ut7nJpLTcjGPh/8MB9hEukTiHhPWTeanVDXvOBYFnpoUgGF7cn3PvvC+vTDY02Sbib3ztO5+94N1C2BIbhnoJ/lfRG4OYvMa4JkUbMwT0KttU8IzcCOeli6ZXKDIy/Ha9j+hH6X7nDqPnszZhhaW/ilOMYKzXjRVk7bc5gMCoYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662767; c=relaxed/simple;
	bh=INKOF5iwpURN7Wy6Ds0XbNG4prjxtjbP1QEt2sqa2hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxfN4vdoklRIuKDhKu5U0pmR9w2AN9Gr+FDGjf9xMDp90lQ8FArUlV+P/1lEQt2dUAl4pNDlvx4NHnIXKrzZpFZaSnqPiiX8K8xtsA0HCAS9a5pE5Z2P2jDV+GNXEvE8lAq6tP81uhIorH45k3/wsVDsNNdu5YNCSiObyp3UC+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmCnTwAU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3Z2St002989
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 10:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QyAht0J6O/7/KVaYupGEkLulwUB5tO0FkOWN11lWFP8=; b=XmCnTwAUHkHcIktl
	MeTmYS6cicju3UPXiP06LO7tDuxCWlizWVPzmS43OKGjhPfvjhi+K8LcW/7RmET2
	VR4wfLvvlOCP2CpXMM5AkRfCHMY8Altnf/+2JB7omrXhuYfKRXbyzI7gu4S0QrF5
	77q3zE2ncICDUjhmsuDoebqScoDATqK4obnPU6JpECY7JQ0fwd2OL/t4Pq38F+ze
	WvyxQJ1eel8vg+rTXnJ9FmJWQI9iggrOoXS3eHUbscNF+y7KAvsGs3DzGWXOf9bE
	cxhNAHPkS8kRfQoHwv3tQy7DjCaISBa25ymTqb1UgWZGx6So/ufqA9K1MzzbNyfd
	0n38gQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq58umk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 10:19:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeeaf707b0so4102886d6.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 03:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745662764; x=1746267564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyAht0J6O/7/KVaYupGEkLulwUB5tO0FkOWN11lWFP8=;
        b=HUqDsFFapyqMiR2q8An2vEyNaZzXR26ju9IurVV6mtjK/1meZCrl7W7Lrd99FGLEAl
         xvv7kNXjnk6q/LHuqnQ/cG7AK/juVSBELQPIu97D0D5VG2BVYCOWPeqtqZVtWz2qQxZv
         /r8qVqBUFHUV7ZKwfAPyCvD2twtpEWjWn2EQ4UkRc6YSoTqpaAld250EeUw2LtigGmDo
         8/bD1HjLPCMBoaT08u8bXpWm+XNpM7r3RKPHh2W1aMmRyECa+dFPEE9wviLDZ1bVGSdx
         IIC3wrlAxChC6taUPj8PivewbUR/8rHuNmvhPj8kRX26iZkJpyLzCBRHHs7IWL0Zmb+1
         7e3g==
X-Forwarded-Encrypted: i=1; AJvYcCWBnIwbNK5NWjWHAj+yHlJEc294cd9+h76Vj9gdcp0zJquxcWgubFy5Pm+RGkoFBq5yNySXXlgMasM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76ZOhl0jgpaYuYuZwBb21UFM2G2UH+zDhK4e8iwsH6ILs8gG/
	8MhnuvVJhwYZ553tb8Dt3j3VX50ONStheMY/KpJoLQMbkHAmeh0GZKC5i/xAahial9k3BmBLc5n
	o2mQBKNS0fJHZV5rtbhkgOXYRT6X55dgvLwTbpmWSA4+W/CDKz8iuDbIxUIY=
X-Gm-Gg: ASbGncuk8Oba6TKjf5U9AqkA9rDQB5N1CUhKied2lTi9DM8tZs7T9O7lb92EAXNfGBg
	TwxA1YET7wTk6Px2+kn6NKtGYO8KJO8LUfMLQhe+XM3Bii14n4xXPu+6ATX6n27ZTtKlHkHSrfB
	VkxPUPax/KOT3oDNTB3qM2gFG+LM1ByWLS3vi+x/otCmzloL9MAuJaDGYBt8kFnlQG2GeLSW5kd
	RI9LvMCz4FVeYc9HIb8IXVAxmTie0KcC9g3IArzjNJDkJNcBA9j3soMowWvbZMwdGdbkQs354k6
	4xThMUvuYOLAPRNvBfvOA5SMiMfjOsP+nm9B61UCZ7W4ImzUZgd3qx4JDlV2notpBss=
X-Received: by 2002:a05:6214:21cb:b0:6f2:d51e:9d0e with SMTP id 6a1803df08f44-6f4cba5da66mr32572856d6.8.1745662764052;
        Sat, 26 Apr 2025 03:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe/6uGcT/gAWdQXJ0VdRORPe01PlSUisfr3nJhiprMSvRRB6X8CYs4G3ezfI/LfIkCU68DDA==
X-Received: by 2002:a05:6214:21cb:b0:6f2:d51e:9d0e with SMTP id 6a1803df08f44-6f4cba5da66mr32572666d6.8.1745662763729;
        Sat, 26 Apr 2025 03:19:23 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e6498sm267627766b.42.2025.04.26.03.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:19:22 -0700 (PDT)
Message-ID: <fb21ba17-88ae-4cad-b7ca-57b5e8082b5e@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:19:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
 <20250416232345.5240-5-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416232345.5240-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BkHMcvO-Fkie9B9UHUjuAbltodFPvLO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2OSBTYWx0ZWRfX2dVabgCUq0Ki +g+TFJoFs6zQ5sDtCQTjtJc0RKH9Qk8c1qSBhlFATsqM+XV0Ee6LyQNsrZbicspsFdXjwl/msM7 38dSFZZQ6RTtGiDkqVgLaxJPEiM9Zn489dV/czEdy+byfcRgZ05YP/ZFd5mxaiU8QON0F3tF39T
 ATdbT0LnWQNgT70KxekKqg1w6QQh9A/4xwvAL/T/nj9jaSgx/zpJI7c0tfEwNQjoao+R9O43Cxx U7wFZ6cFjE/tlgVXp8j/R694RfA/9XrrwYn7c9T17wZE2U+qB4+5Ga6X2sBaORQCyHiYuPisbnS 3b0zHRhGIdQYNMOHGE7YHkr+RX41iZlSJfmf+Arc/jTQICp+PZuKlnyHNhAOyYtfMEdNUIP/ad1
 PDDeF/cpXcoJ7q1VDH+1rbIXMCjhTM917Bri8dV6vw8VxfbExQPDd9PfqdBqEeqcG3Rd/Q7H
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680cb32d cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=04dXdBH-sfCwm-JsXqsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: BkHMcvO-Fkie9B9UHUjuAbltodFPvLO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260069

On 4/17/25 1:20 AM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +	/* Left-side display-adjacent port, PS8833 */

nit: The mention of PS8833 in the comment is rather uneventful given it
says so right below it as well

> +	typec-mux@8 {
> +		compatible = "parade,ps8833", "parade,ps8830";

[...]

> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		/* TODO: add pwrseq once validated */
> +		compatible = "qcom,wcn7850-bt";
> +
> +		max-speed = <3000000>;
> +	};
> +};

Drop it for now, the dt checker is angry about partial definitions

I think it looks ok otherwise

Konrad

