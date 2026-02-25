Return-Path: <linux-usb+bounces-33696-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDXkDiHonmk/XwQAu9opvQ
	(envelope-from <linux-usb+bounces-33696-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:16:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D56E197230
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 510AA3033E53
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AB23AE6E2;
	Wed, 25 Feb 2026 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gn5FKNkQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7R1l4S8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40973AA1BC
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772021790; cv=none; b=CeP+Z1gnLwhq/EMfPGa8aLFR2oSVfiCS+PtIPuAJBt6Mcl4uiGuKNCB8QM1i+ZQnc4TdKdgrzlh4UKhh7iRwuLaZCRGuyeYCmk2sD/HMhtmiFuObdSGeV0KwFNPT+uR5LLnC1FDLl4cCDyJhiPnLcuslY7OXQiNZT8Xx8eUH+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772021790; c=relaxed/simple;
	bh=Py6L3hagYDzz0Ng1G8j7FJcdxCLOYIUmht+ZEoRKZh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC5Lr9Xz0MDNWF+cAQDs23VlEyxj56oWJkX3B1BVkRyescdKUqlGIu4K1aoi5O/6yO4cnm4EAFt8mZWb6qQLCdeS4ngYOYMc3YIo1SSvMXTa+r8GjnkUmodzI8awSfxtz9tAtrhVFBJ4PokvBPFtj6IsTqy1heyl++ltrIGCOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gn5FKNkQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7R1l4S8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SJWA1024997
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 12:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4wyuRamqWJKyH9ajGZbfcZ6ZVKLOfxB2WpU2a9Acv4=; b=gn5FKNkQqfMCY9zJ
	2QFhTBljXxrV7Id8kgPc10kt+EzaJngre6XGuOZj8CRTy0q2odo65OcYsJ3KL0F9
	Z6NXvdH/TJsCTdBn07f6ZmVM9ZGBEH43A+CJOz0s7DtvETSXSmzexxF/egGYMQm/
	QogTE+ZRINL2T+5VAJSWUkWhO+mtOayG47z7LLG7nOsZg1Nmy+Q7llydLPM3Ipt3
	/it1PHDgiVatahtuH/TvX8FbT1FIz4GN78zstImn83eV9Pfn/A4ehZLqqiPigyH1
	uVQC7NP3KniKPTg41lHponjTLa18ICANUEtyejuiCBWoEFd5jOKk3lxR86rc+g9s
	wh64WQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57sqtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 12:16:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so593857085a.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 04:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772021787; x=1772626587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4wyuRamqWJKyH9ajGZbfcZ6ZVKLOfxB2WpU2a9Acv4=;
        b=V7R1l4S8hifwe7O/kPjyZl4xczS2xqvuPYfrmXEKD+WaH1cCcpBb+LQ5juV5fWMBWH
         xx4cC3ozFPQ0JR6n9I3+PfIqlZFpNVEIZzL7zyccT9px0JyTdbFD5KoQwOlBZruFOS3i
         i9W/SAZXMrmqDJohX+/XYQao9Sr2aGnM7y9TeLy44fp+PfyqhBuyCjt2MGnPan3f9yUf
         nw/srrT9PjJPjC4ycsWuBvUbsHGAj3PqvsSkFF0NBaHFAmTHbgUcXiO2abR4zQm+KD/m
         L3yx9ZsR0JJzmAJY4mLSeL6QfYT1974sIaj9SP88epXAQOi7M5W2LZIWVFv8wl3sF+yh
         wehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772021787; x=1772626587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4wyuRamqWJKyH9ajGZbfcZ6ZVKLOfxB2WpU2a9Acv4=;
        b=CNpYID1uzgdQfu2YLwd5j6YZ7tjj4W8mfk81GUn6QbZ8f7Urk2wKcw6rjbTCnA9zYC
         A9VpRtYxjxMpNAZgZpRcHaXBjhkOsiL/OsPdanKIrGN8YQN/ynAj1/JuD+iMvYWEv5Yc
         JESQiRXCOhFaoiR9LpQ9Xg3AgUjnUKQQSp/FaKehTmhzWzSYYnvZuxDVSZqmB8sQb7dw
         Ysr6GjEZMg+JNoSFP4myxOxakZj5u4AtDBS7J4K66fwH2/0a8AZSG+kIi+cwZ3PudVXj
         74t+hYj8jaJRrfBYWaKh3XA9hP16mwSOinxF+7Byj1otMbFk4FH2b69av5ZgcuuZliHM
         deng==
X-Forwarded-Encrypted: i=1; AJvYcCWCTgoNMOD36XR/3fQQl8qNSZ367vzZaAL4/Zz5WK0sjBhIwDrrHskdc6goyVEod8FyofEMI8eHvis=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUGVEy8B/RDS2BA8cSZZwf0d6PdFW9IpdgM5i1B+wlp5FYV9M
	Lm1nXd9O3AIsCDQjLUseQeyfTdKTRC0jpfCyGFTyFlF3TqSYNhPRquusu5I7zm0JoFFxUN39uxf
	K2RF2t9QoRvQp196574zxAaDajbyNgxImdWfWP1hbIcB6GfwrELk5llBU/moKbpQ=
X-Gm-Gg: ATEYQzz32KgeiW1qRSZAw3YWCJDTCjh16KK36ebl28YF+mUoEiNIoybxlzDZ5f2Bwog
	EZcQzBFcBflUCJsvNOLi/vXDsXOvVBga4SgU4oeStSCkCG9998EugNvhDXMO5mW0o8cuiDQvrOO
	gH2cpVECpg10UQAkLNJVbQGsZXzJ6OVkDs5D/OIVQGMbcbKh6L/jjUU8vbUmQgLUSO7AYfBpVmM
	76U744NZTFkUZ9kxK5ypvrMdnkqO4Q6hINvKXcFB3ZxxLT4IiKDoMO9H/f41KM3jp+3cZD4Xm8g
	1UJpbxZUTd4a5FT6KzqexlwMr+TBzbjPATpXVVmaGFPIbaF7UoO3NQLBzlrJTvsELYxUNqh3SRZ
	SD//9zhLhkbr3SmXaej/y5Y3c/IrGVqthYLuN8nvd1gy1RfPI/HnawAQdyjEZHJWtGZo5LD8MSQ
	VtUMg=
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb8c9f491fmr1445428485a.1.1772021787246;
        Wed, 25 Feb 2026 04:16:27 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb8c9f491fmr1445425685a.1.1772021786628;
        Wed, 25 Feb 2026 04:16:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b92f9b0463esm157430366b.2.2026.02.25.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:16:25 -0800 (PST)
Message-ID: <42716b92-9814-4697-83f8-4983de0ce57e@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 3/3] arm64: dts: qcom: glymur-crd: Enable USB
 support
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
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
 <20260223-dts-qcom-glymur-add-usb-support-v2-3-f4e0f38db21d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223-dts-qcom-glymur-add-usb-support-v2-3-f4e0f38db21d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699ee81c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LTLfZVuacMrGcq3gHoQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YOGIz9S-WUgVzt063KoiO8EL8bChYqx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMCBTYWx0ZWRfX8tu7WKu6aepQ
 eyA//VqXYYU9IbJ3lto2jABG8BuVbYojVFLV7ubxA9RYvS81tf7rzXBZ8DlFc54PxHY3F8qTksB
 aRVicM6pNSWtbCqTWd1b6/RPciH6SC1/0qlgS70tZ2EJe49WjBknkmbTtvLK4shiMbX7EPnCWlR
 PBIFnktyDpIv0jZbP8T4R3sGDDiJT5kebwdQDx7Kxu2E6Vgc6IPDoKvSrZKoD9NgI6VuWAvQJ5Z
 JvgCkEFvQPZKcyK4k7+QQgJGt4Xs7MsbyxKk1HqZk7GN4MtYa9RFy8VJ8yrurjCDm84zLwFf0yH
 Jijxmb1QohyBrWE7XYGG+r+bWZF+gl/axRxlyoRazC+2m92a2obGZU+sGcfpm5J3RjWzmRt1GD7
 Hw/i086nbEkqRPw1ETURNGX8/6paPVm6nhdzAuDLK04b0KbfumoUtzHla1kvo8ZRzZGLVLgmiAM
 yU9osljd/p1y4mxyqvQ==
X-Proofpoint-GUID: YOGIz9S-WUgVzt063KoiO8EL8bChYqx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33696-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D56E197230
X-Rspamd-Action: no action

On 2/23/26 4:37 PM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> one USB Type-A, and a fingerprint reader connected over USB. Each of these
> 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
> is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
> dedicated NXP PTN3222.
> 
> So enable all needed controllers, PHYs and repeaters, while describing
> their supplies. Also describe the PMIC glink graph for Type-C connectors.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +	pmic-glink {
> +		compatible = "qcom,glymur-pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";

there's a newline above here, but not in the corresponding places on
the nodes of other ports, I think we generally skip the newline here

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	ptn3222_0: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +
> +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
> +
> +		#phy-cells = <0>;
> +	};
> +
> +	ptn3222_1: redriver@4f {

At least on the schematics I have, this one is not present.. but there
were a lot of variants early on, could you check whether you can 
communicate with the chip at this address?

The rest looks OK

Konrad

