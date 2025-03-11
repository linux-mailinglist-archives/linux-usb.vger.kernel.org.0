Return-Path: <linux-usb+bounces-21631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FBA5BEC1
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 12:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0EF16F1ED
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 11:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AB3254865;
	Tue, 11 Mar 2025 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZnMDEV2b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E35238D39
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691950; cv=none; b=F+CYQqeowF4WpbZvSc37q9OW9LrPd8pkI7mqsFx43MfcI60tvVZuIKA+5WsY1x5ZBfoNkVcl60FY1DHb5hLNLN+IAwLvFzk/vNzF+eHod0KBkWi0pbvzRlyXPiixHpZTyvrVJfBzNcAJdR9E5SEbZOJbHs/3xjM8onIgjfw7R7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691950; c=relaxed/simple;
	bh=KG2B2zG131J/s0YjenddE96hvagPtolWZ0k0Q1oZF9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMIEK5wnDLhAf+rZ7AXdWJUffnyNN4x7+zIvQkUoxwTIW0oEqBw+QVZJBZDp+HtIDlYSvLmhujUsxpJBeIDyxtcfRfWQOTgomNOyEWuDawjyaa80EkcsgqktvSV2EQmRsLsP2tROhhQ8WVgV2yLzJ+C3jhB6tUuBJq/KtuH3Xwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnMDEV2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7xmpF027434
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 11:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/zsrPomSGC1iO5LSmQ+QJBzaniKLt0k5UGEjWJYgjM=; b=ZnMDEV2blLkM1v6j
	yz+sUf2hDI0q+GO8vzhQ4koX6CWHGWxt+USTTF7vdAR8pG5Pun5GL0xLGPYlFpHm
	VCercVTpc2OZNFgq1Sll8rcPHuSEMSkeUXkTWwDIC4JETfBANvLUmqAYvzEXbNb9
	9PXbp6u4k0bNY1+uhh6mTp377KkHSGDJ7g7unANHauZe+W5vIQGOoy9wXbYSKLRB
	fo8rNQvZvA1oRQ97U1Hbp4+soJs1FaqcTKjZIGA5CB1at82gqINh9OYZ9yy/44cZ
	BHksC5VzdSSS0lnRNBQ951k31rSH+lz+RdeKhnGtQakSzCUmmd0fdXHhUehU1Q32
	ygPmEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6agd76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 11:19:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e906c422a9so11235816d6.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 04:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691946; x=1742296746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/zsrPomSGC1iO5LSmQ+QJBzaniKLt0k5UGEjWJYgjM=;
        b=ZY87gzXVYH8PalCqbykpeyF6Xh/O66yJEXlmj7FXfaXKOD+8FRPmu+/pTXFGpZQlKU
         kSsCKMwI8GGqiKagIIRwe8sqa1RTBeMGHk10HYPAOH1JlmCpu4XIu3kb4bguBpzDXEIJ
         0u27DMcRDB295dddsISpNpT9CT0DCMLPEzAQEI/nmQGmzeDfk2ADQlOPnbyj6pkIosp5
         yPe5OaImUnwBMYoFJ4iaYiVUOOj3m+2et9a16DphiW7JRgHftvT2ITCgl//coKcvRrMm
         HHjgMl+YiUR9gzP6CR5bP46dgB+mOFzR67KNIGjTrG3J1R1B/BQ9pQgvhzL7nQycY9+l
         DRmw==
X-Forwarded-Encrypted: i=1; AJvYcCWSlxWP7leJ6CBwq8Y9JINqyZ5urWSifFlPxmM8GYEN0E6SB/qajkgMAXo/1p0tlh3wR4y4m8ppYpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiZIyRBqlf0YzvnRdDaGF5+IFb80SOXqnV/Bbaq6400Yvqegz
	uP/m7GHqwdwYeYe1dB69ZKuQijCgTxTBpBdMdzgpbMrieA72234s6Xf6ys6V1SpFx5NTr8rhr2g
	8Sxy98h+3zDPXXivmfFSI+yDAwdzWUgljicvWoX2vf+yse5XIJgFhYkQVufw=
X-Gm-Gg: ASbGncs4CGanuPNlE/3InCSCFHy+t3wdJqVNSGRVr7jbG4is0J4oYbD6x7x+ZjBanN5
	La8OA5yS6pqAJpc5yW/7qHo8Rcm9aLugrUKG4SWe1xdiGp1Z5x85680o3bZokLRh9PYUHdL9Evk
	b8ptzTmoKghurClqLVfgddWhVeTNWq6Pib8WqNZNVdXf3t4MQImgRdpXh0Xs6AVXC+31LWSSFgt
	dppahxrYbOnWSie6p6bvj9VmI5XHC0zav0jWJmdVAwUXSn12HfMvLA6blhiKYPOL3oq1alc5fBh
	gxn06Qz6h9Icdkuq841hRfu/mSwqIqchPLhKg30mkfyhDfI+X8pVKPpBkLOgkgQkpryleA==
X-Received: by 2002:a05:620a:1d03:b0:7c5:18b7:506d with SMTP id af79cd13be357-7c53e05f9c9mr737227485a.9.1741691945870;
        Tue, 11 Mar 2025 04:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMbOo9/SytOGUrUMo2XFyejsZDSP+j5JNs4kPwfKJu5yFVYu9xbBZSRIJg5VV2VeLv97QvVA==
X-Received: by 2002:a05:620a:1d03:b0:7c5:18b7:506d with SMTP id af79cd13be357-7c53e05f9c9mr737225285a.9.1741691945534;
        Tue, 11 Mar 2025 04:19:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394fda1asm904961866b.78.2025.03.11.04.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 04:19:05 -0700 (PDT)
Message-ID: <69fa7f33-e957-4dac-93dc-6fd40167873c@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 12:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67d01c2b cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=obrcSLqBe2MPJ_po3l0A:9 a=QEXdDO2ut3YA:10
 a=T1PIRxOFuHhLvSGs3xkl:22 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iY0JFrinUWbn6W0TkJGJ0aRVsG3QSjpC
X-Proofpoint-ORIG-GUID: iY0JFrinUWbn6W0TkJGJ0aRVsG3QSjpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=797 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110075

On 3/4/25 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +static int msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val) {
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;

Is there a reason we need to read back every write?

Does this have to do with some funny write buffering?

Konrad

