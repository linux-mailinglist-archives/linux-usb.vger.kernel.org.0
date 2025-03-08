Return-Path: <linux-usb+bounces-21527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7DA57B66
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 16:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E61A188FCA0
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1FB1DE4C8;
	Sat,  8 Mar 2025 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGy/wWVU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA751DD886
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446347; cv=none; b=jRzLfk5gWT7K/F8U8uJwnFmxvjtAYvuocXMSDUfruu0lWnFOUoO7tKeVTRN8YRTe9xuq6vdbb65mpWjZQMMh2cGZrogHLbtctoV1XoYWbuADezQbxeYZgTwnLettGCpOxRb3YdI6jd0dy7p17fMInSUYJJNubmi9FP8YNLputqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446347; c=relaxed/simple;
	bh=+PMRq9JLO/95gRsUy57YV2LRy+JkqhPp8sqPGDwcU8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NW7zzZRtk3LIRDn4b2OVkKGG7RQXU/M7ge74ikhiK54Od525J3Gn5tC210Ia8/jUxOwa1NkFMoghhoQyuGwM49b+f3y5AxHWeWue68DcNa5NrmXI1NlPN9t2+3T1iKAj0n6sDOyJfLhK01f0aWDapK/FhH4vXPgZnfHmV18E0g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGy/wWVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528Axx34024375
	for <linux-usb@vger.kernel.org>; Sat, 8 Mar 2025 15:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLFVWaUWbDPd+G73ejj5R7gNnqQGG++cPE30muP9uhc=; b=KGy/wWVUKlJqjl6L
	E1satjTApuiwsDPW06hbUqn1nu4dSUTFSgQqU/vi+kQn9H3cqWMjklHArAdOj039
	o5d08qFN9HrFdnc8Gp1J/CCkdNh+bUFa20y5djLBWDKN7KUie2kucNUimJg21s9I
	okgXWaPvtX5PdGcyRSAVjTRjw5eyvFOFxLihCxWDx+3SAoHjPqhVMuM/NSo7lMMk
	U+urL2S1P40FcpIC90M7FYbyaXOMqtcrHDSLuMc4kF6eOZha4oW+3rYWkdElsJVd
	rzjREZjWJSE5yOcEdbXUCZRLNRvWtr/OkW8fxEMwsMszmmbsS7zjE5dtTb5ONnsd
	hS/dQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyp8qt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 15:05:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso6392986d6.3
        for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 07:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741446344; x=1742051144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLFVWaUWbDPd+G73ejj5R7gNnqQGG++cPE30muP9uhc=;
        b=q23V71mtVFQmu80x0Fc/2vb4aV3oScV6O/tezAd5AIp2cCTBG6XCyz6wPAAcFpLHft
         JUvKDyfK2FOcRSqIA2V9V+TO5JrW6prMTP6Y6PeT46sMEuDea8hJwh9a1jsnLI/pMZDQ
         V+HGPiYE40ursWlDTlpp8YWvx2c4b9eSDDaV/uqF3mdCpOnA0efo0323UFsczYZmbSaf
         SRnilGGwLY5mUKI9mlYN/DeSoXYtEkPc3kd5BRmE7yoKxyGciuiTswzXXAfPrOZVhSWM
         N6KhYK4HZ/Cjd1Mj03835091vcKe8i38aXxkzNIT5RuIHmJe4h1VWRsm6ucRPhBQsDFM
         9aOQ==
X-Forwarded-Encrypted: i=1; AJvYcCURDsA2tQUjuQJt+5PEZj3hqhXDuGujag54LPHEh4IOCxjnkAri/VQayxAvgD7io6nnKL/qLezoLF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqmbwn3KxCMl1Qj30onEET2ZR3UV7jZtDnfNt6261i+ZMdA19
	WPSMwkP4Vs87mAT4MrOTw6pvvETRGAx1ddGhxE0Kt3nle9NRNf1p4iw08nY4goaNrrK0SQwo6cX
	XB8lKw6qvSfEPMKffOlTjU7MHLHHUmORtYw2t0gfuSYI5mN2mK/2Z9R/2Ldk=
X-Gm-Gg: ASbGncvXvE9GntIB3zTRt3xm+du1lj7oHvlKKUHyeu/tILKqV8xb46D7Z+m8rNcWoZ0
	oUoquvSb5k1tt2FRvMdED3/ZQmulg4I4KnriRGfLh+fglpfC1S8l/0izqUYdhBMOtrE0FHf0WNT
	461oenCWqCgVjmAzmayLpifCQd8qDSBd1MvHMMANTYc3eEDQpXrVl64xWLJ/ZzV+s5TN2WdkqNc
	q8fS7nIW6AaO2Tqat2HEzTZQ7kDYypv6xqYqHhrY1ogOXPFzoOUKEDTYmbfRRsXElF2ngFUv1Pp
	AOb7dJwnyiIbdu1KLWoA4EudzDn9uXRr+QVoqauEcVD4ilAoBu/smuuLXB1BZAsurAMlHw==
X-Received: by 2002:a05:6214:d88:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6e908ddb55cmr15428276d6.9.1741446344423;
        Sat, 08 Mar 2025 07:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIuPcR+e7Mz7IBRdPMU7doLc5Tz3u50vlpBjwRgEiNKUDEUQn8nQE/supZQEX3XVnVqo2W4w==
X-Received: by 2002:a05:6214:d88:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6e908ddb55cmr15428086d6.9.1741446344095;
        Sat, 08 Mar 2025 07:05:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2390fe76csm445972966b.0.2025.03.08.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:05:43 -0800 (PST)
Message-ID: <687a23e2-7822-4d68-8b4c-f8816cce3cc9@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:05:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP and QRD platforms
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
 <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67cc5cc9 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=z_dfX9dpdT3VBrYyFBIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uWrMMuc96IORg1CrMof2IOA0fTQ-T8FZ
X-Proofpoint-GUID: uWrMMuc96IORg1CrMof2IOA0fTQ-T8FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=899
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080113

On 4.03.2025 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants.  The current definition
> will start the USB controller in peripheral mode by default until
> dependencies are added, such as USB role detection.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Please separate these two indeed. With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SM8750 QRD

(make sure the latter one only goes to the QRD commit)

Konrad

