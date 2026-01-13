Return-Path: <linux-usb+bounces-32267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BBD19129
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB573304A137
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E433904D1;
	Tue, 13 Jan 2026 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THginQgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8RZB2FN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13038FF18
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310021; cv=none; b=bhhD14HpIPDl43STSYs20M0COt0Z88+mKz4sCYwEI12IlbC2ljtOzN+DQtdWK20ZLEI8gsBrEVVkwXFpDbwPmAfeA1yZZUGggPY32FBY/srQUJMqGebrCA7FywJdYT/FDlUxSYe9E2FqwriRj2j6FNWL150sUX5X/fc65yNew1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310021; c=relaxed/simple;
	bh=dk5jbImLcB2x8AUb5RmXedSgI5VU/00aSHRlIsFQACE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6GK+SwVx/AMMuzIWojc+twyjWMfBLwcbhCJ4mAtzPM+dyo58dsDJyWaqaN/39BMBeW9dLXRiA6mKpCf+O5xM+noqPGYWJPXaO0+OKUe/fTNeAgyQ4IoWmF/dj6xy3zLVCvGx/TsZ1iEM92G4skBgIS9jUDZv46DNFuXyLNVkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THginQgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8RZB2FN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC8iPn2835019
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bwgBAmS/C+0L1XuQ0SYs4qvA/Tw0QYyfHwE2EwIuVs=; b=THginQgtkhUQiSel
	ux3m7OHK2wyaIn7UdCvPp9UZZ1CkuJB94IKAf8QN43Hv6/SPe31DUBVU8L9jPp64
	4ss9W67pMYLJSQXrclEMgRilReHQCs/VCtMUzOgrTOLVNCiRE9ub2yWnLJBiDlJN
	vqIGjWrgCLKxOF/ayTYm7jqLAzzQB1HI/hPou5TiLHUROxgxjNNGbAJvZxvS0yYQ
	s19dRCvaBO6QpXdCFYmf6rbFqkY9t5SiHSW0ZzsIDTVTTKkYQNzcPBjaJOMTwWR7
	MjY1NxYPMgzJkUyu2XbbOfn62vNGecSZtYhMbs2xbwKmfRBAwA+YA8+cCs0Ove9T
	tulawg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9seav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:13:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so40012541cf.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768310017; x=1768914817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bwgBAmS/C+0L1XuQ0SYs4qvA/Tw0QYyfHwE2EwIuVs=;
        b=P8RZB2FNeS9xea/z6HWJF8tt7jWNSwDV4lkyergRnm+DQn5uWBFpeSPdJ9YcPF+vvh
         ljq/y/epzQxcyhcL7uUXb5CB5FW5UQD+R/qVbGuN1v/7t3lxtHI3A5j8GZqO+rrjNbvq
         OvM7Ljrs7A2embMs6NKdFv70ygQJw+oo9VqCFMpyspaBnrgahSdC0vXNMTGeNbSbWUeW
         9Y/5dT/WoIelkCjMoH2eY0bNx6zPpsyK/O9ngSlCBR4qQgbpvoa0tCD+OmVrUcx+dYh7
         f3Pce5avhPr+c06aTTbCw7/WctSnfv84/0HYTAGHObrunL+ka6hA4/lS5RI5STalrMR/
         PKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768310017; x=1768914817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bwgBAmS/C+0L1XuQ0SYs4qvA/Tw0QYyfHwE2EwIuVs=;
        b=chmdcFhrQqwQILKb+Jz70/1j66yrsPdAg1DWl0JxVT5EncEPpTOH+ZFKzjOtIMuqsh
         u/KZA2jroYx7xMp+zPsjbS3BMZWANdEp8h0bn3uL6V0bd4I8awFFV6zYQ7t2znSFab7c
         /rKDg4ODoCQCuc//Q3M7ZXbcl92ROZ8WLJCqPzsxyU9rVLmjN6V7ql9BmSF3wXbsuSNA
         GGIgJx8v5iNH8MPSIOYOCuNjn+B4Sxi3RciyulGyS93nrqd5KcoSAorfOGLra++6O4p5
         PYoVxXOlvJpyu52RqCgB2jG5AmxFF25AE461PBNSg5geJb6R418hdTMbr9oFapTIXKNh
         avtw==
X-Forwarded-Encrypted: i=1; AJvYcCUzc4EInIsaani0qaWFFyhb6OJU5+cVypzdGVl436j3h6EpgQ3B4s/G8d2R/h+bOFFEY/vYa2VHwQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWzyZlAWXvTfDfxV1A1z+D282KUGJ41+piNZsYbMCxSlYYBVp
	sROi0Xen070ugKsybXzKVYFIsK/BS2MZAOKbsnibS6XGvpqkGKcXBTqwT9y+p6+5lx8U2qMzab0
	qSfcGnF2zFhP2aQJY2x5HySnMBfCEbYsaQ8rAiE8qyYMRPoiImS/Rpo+ty2Lb8QE=
X-Gm-Gg: AY/fxX5JRyc8PyNdejgDWs53FKmORYEpHGMc9w0L4cNKVu9obfyTZs9io9Xs21/Wn1R
	zrGyhGu/WxanphftB6nhv7ckk8OKJevuqTbhd7++D+X/dqtilRvfC+ggxcIFZwEr5nyPD/3VsM9
	DhJynjWvhpMskUPRif38W1U2tKNNmPVxS6AR31l532+OYRdKDMhZwxm/CHf+5UfuxHYylKYqvzN
	fnO+J7VJPGbvXS5a2kRgUjbhlhQZzFZQVQR+E+srFuTxP0DrHBPfbPx0vu3/LPBTPlL0oKpKWiM
	YMCcGeF0uvrTOhnDst2OIupsC7Ml+bklfimL2mw6rfP0IyXzeZ702dG+8iIVnQxY/Of78hsaZyQ
	jbKyuD5lAVz55y/cNp86mMXckCrmGLNeCq5TnopLYZ7LIK/pYZagf2rLoeniArdJQACw=
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr254101041cf.10.1768310016914;
        Tue, 13 Jan 2026 05:13:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMnv/lcUVT4eP4KfERHWUj9va04jydi2ZLUZKaGU1BHKtNSsfG/3e9UddbuRq0n628WO/yaw==
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr254100671cf.10.1768310016477;
        Tue, 13 Jan 2026 05:13:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8720e090dasm514513566b.9.2026.01.13.05.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 05:13:35 -0800 (PST)
Message-ID: <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RGyojK1mkG2wKK4P9fnoWFFuFLhcr-du
X-Proofpoint-ORIG-GUID: RGyojK1mkG2wKK4P9fnoWFFuFLhcr-du
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=69664501 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sYW25ZiEPLqq09AedJsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDExMSBTYWx0ZWRfX76WXv5QA7ayh
 qFsYwC0qBFqZnPoqDBYtqQz+7BlozAyQfA4vW+GIOuls/5mZSitwcqakZudFkHbsI3FJiA9lDfE
 ZkYw5EAoFYV73yM8kje+LhUkGly/4Nel9EEoTpCuWZy1mhvgLhcf+fdi1UBk5gKlzAoQztj6sPr
 P9sNBL3kQjbeUE6jsHj+CWt/uvDQ0sAbWNd0eVSr5b4Y57PzkKmS1CK1RvA7+k/2dSoiNJj23Pv
 WeM7XuMbYw7R0YOg44/XvLbV+y6f0De6ba+5QSgv0FZdNqX2GncUh0AMzd2jblw8q0SKNwNP8p9
 OoMB7Kn/SNTR2uNiNG8SCsIuPqyp7oP9zUO+GyPuQIsl9Rr6cMoA7PDY42V31bI1XrCiYQXpzBm
 cNyTQWFQ0GRQlB9A+9GrI35zlI3AwcAigDI8btyWx+4KLcFieA+AXCbX5ZP8jfQk/kDFP7PkZoI
 xyrPssPf+4QOPGdyT8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130111

On 1/13/26 1:33 PM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  
> +		usb_mp_hsphy0: phy@fa1000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa1000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_hsphy1: phy@fa2000  {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa2000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> +
> +			status = "disabled";
> +		};


[...]

> +		usb1_ss0_hsphy: phy@fd3000 {

Let's not repeat the mess introduced in hamoa..

Perhaps let's fall back to usb_0 etc.?

[...]


> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,usb2-lpm-disable;

Other SoCs have a list that's much longer, please consult Wesley if
this list is enough

Konrad

