Return-Path: <linux-usb+bounces-21526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D2A57B07
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 15:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4583AA119
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E882313E02A;
	Sat,  8 Mar 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZoN4OB0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82C1A3144
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741444420; cv=none; b=J6/TgBokIOaZgnQ8f5prFn/hPl8p2jUdvTNhAAx/IYkn7rgquRquDHS7Y6ljgx7lyD6AwYfIlidV2RYL+yZLKC0ZPIgXp2c7aj88vurjz/uM5wdWccgYm3evxQMGFG+BhoFADYNXwbtXED5t4nP4buZKMO8fxFGHLouwrRMqXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741444420; c=relaxed/simple;
	bh=A8wdDXXUAMx0cPjkhquava877hNK83fGc0RAFxV8+YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJHMBtl/2QNdrq+AX7uXm1A0sMPwrbZUH2crFgSV8Q1Pae3DM3j7mrXgsFPmzu8AUmDPUQr98Q6ZLld5L55XgdUMzIR9yi9q5+nsdtVvoXggv4/RcAw8czZHT3SzZRU8JGoJ6KRiBzl7Xl0QKX+St15q47Cxcou89xOd75o3F5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZoN4OB0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528E0ePZ028887
	for <linux-usb@vger.kernel.org>; Sat, 8 Mar 2025 14:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ksfv3EfjOI2GzDAtuyZf4+GHBAlf/L+797z5FEAT+XU=; b=RZoN4OB0VGzLP8dn
	1+FixeVlC6fBdYYsZLA3TmXiSeYcWoTj2pLVLKydWvgbLlb8kd4FDjvZ8CioP9aK
	9OOgEVl29SdfwVVoJIpUKp4g2cobhlkH+5eZtwN/nFcKNnTJ7Vj6QwJwZB/oyuG+
	/NixhdV1uJMGvSj8GW614VYdiEpv8F75D/SxjzzD2ljjUUjZrdWxAachRD8sRAxH
	CQ8uNyOv0ISzrvwzueRHNZX1Zj6eZidM8I7h3rk2L3K6FYj7UhAGTwRF21CsNhzX
	WSiceM3IUgRPaG03jIf7ezQw61EVG2D0+I1XxAgOfs2kiFDfZtXeuw1LLtUgHhtj
	jyHswA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0prp8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 14:33:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso7169586d6.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 06:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741444417; x=1742049217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ksfv3EfjOI2GzDAtuyZf4+GHBAlf/L+797z5FEAT+XU=;
        b=qxJGIa93Zc/ni2RU8IpNXkHWWjeED+R4Jbup9jFmBD/yOcAbJ6wQpo7SxZSsUQ83Z9
         TgzEp+UagAa+UnA+mXYNz5VBSR3M+FKzbTjAVCyci4BrYcAkU/KvjubEvBAcD7+MOgBy
         6xxd17xebLoomRXpOAdQfTsy9GxrDfGOKuRduh3EmarPqudREesVF+NfksmrDuzb6Zsk
         y3w7WQ2UfGddHqpBb211XEwWq3nj6J0XSjDtxLIalzO96Mtmen3XERpWw+KnGNSS5GY7
         5Fr5yVYeOa64wlviPP+hq63Y93vEFcrpY7kAsBcHK8fBPCNNwwHRiiMNkhAcpwhiyL60
         SDiw==
X-Forwarded-Encrypted: i=1; AJvYcCVCorFDC1Efa5gId84gpE4kiPnJxaAwUTapSFSVmhxb3o6PjMsnRVjfcPKvyieqxaThbTDmqKRlNwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX4wH3eJOpXUj/mRzMsAZsybziYzfnlZeqXM+Bcz/wf6AKBAi
	C5ZZvu2pSApYSb2P/LIIW+VOR2cnTjdGUy8n5Lddvi+0ZoGgxqDTm1aYAmCpI23B5VPlKzfg+sF
	A1TNlJpaLHqTYBsepS5o4ytIRgl/zWPjyz+IxNeDlTP7dgq/PbPofa18Lkc4=
X-Gm-Gg: ASbGnctHdwAv2l9r6r63xnROwGFjhWgMiMK6WGSQpi9QVwNj0qc9Y1o9KmcvzMtmykL
	2abwMQhihWQGSYDRXpqI5FUeEjdbnfrpmG9Ct08vImMZhRoUBOrwi9OprKQPImd6RxIj2/0xpne
	KLQk4HQsIvhAqZajYpp/0Fo0U5+2XJ/NsntF2JyYmuU4i+iraI7/jZSxdnXPEkRS0+McA54EXUB
	V+dMYtH36ReFHyplWjgQR3irQCj+bPrs2taShZwNhFQNdBYDILFaZrK5XmYLhPaPw6HyrPsc1i7
	4j/x9TDeQg/IKrghd7q5b0h3gWTLAtOLzoYCl3J9bkimtedsNN4sZ1bfsqv/B4cbf/UHdQ==
X-Received: by 2002:a05:622a:88:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-47666f7bc60mr16609841cf.10.1741444416841;
        Sat, 08 Mar 2025 06:33:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyEFW0H2hxCyi2WwfzN3+z4dl5ktT+/35092XkyZuW2tTKE2+hX9TWmWLNewQKFMc3jZEcnA==
X-Received: by 2002:a05:622a:88:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-47666f7bc60mr16609591cf.10.1741444416516;
        Sat, 08 Mar 2025 06:33:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394399aesm443169766b.30.2025.03.08.06.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:33:36 -0800 (PST)
Message-ID: <d1fdbbcf-f3dc-4233-b2b8-af5102c1feb1@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:33:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] phy: qcom: Update description for QCOM based eUSB2
 repeater
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
 <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VzpPLS8_y8ZYmehlIgHgKUhzrooaMr84
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67cc5541 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=d_B6GAGhsxUSwkCc-B8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VzpPLS8_y8ZYmehlIgHgKUhzrooaMr84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080109

On 4.03.2025 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
> different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
> needs to be updated to remove associations to a specific vendor.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 846f8c99547fd5132feaa1e41093b8eab51714f9..f281e3b7f3f20b4a4bb1602be94b8a1b041a876f 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
>  	  on Qualcomm SOCs.
>  
>  config PHY_QCOM_EUSB2_REPEATER
> -	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
> +	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
>  	select GENERIC_PHY
>  	help
> -	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
> -	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
> +	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
> +	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
>  	  on Qualcomm SOCs.

I guess the repeater doesn't really check the vendor of the PHY, i.e. if
someone took a SMB2360 and hooked it up to any other eUSB signal, it would
happily crunch through them..

That said, I'm just spitting out words and this is probably good to inform
the user about the actual real-world usage

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

