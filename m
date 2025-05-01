Return-Path: <linux-usb+bounces-23602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E50AA5C1B
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58E249C176C
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 08:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B56220B7F9;
	Thu,  1 May 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY2qu8m1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C3B26658B
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087863; cv=none; b=oZ0bqxR6z3fsql7E8Vpp6DKuzoZ/EumvvfsreTta4iX1PNrWsFuF9hi2D2CFvxnWCB7fVC7YARqAuDujNXXH6P7OTbkx6ZCzdlGRwWtyNaMfIimdhmAuQuc8XE0bYAv1xGLcyJjmAW77Z3SUNeYApOJL+3hL8Ryj2XzrqZk/54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087863; c=relaxed/simple;
	bh=4SV0SWjjN6to74Ybm0U5EvYj7KZjdi/ydl2GGsa9zMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKhQNIpkt9gPNEUwpXAGhYhgWjCxSd1Q9lLRvPyJ2WHB2lWa7tjRpMEqGmDuq9Qv+bx+MC1CEq1oP5syN4RVGyEf+7R9QQzjaeJC26Cb2fFlXvKIEUI5SCKkgLG5TRplNgKffneEda9fsVA2pE+hbboBXDl3Ik94tEXFq17hOc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY2qu8m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5413fh4N010510
	for <linux-usb@vger.kernel.org>; Thu, 1 May 2025 08:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=; b=jY2qu8m1X6hSNi17
	CxNR0kONJEiMG3GE+/f20utQJaBfcdQ6dPTu4EIV5dGJb9dmyj0xR7TKJQ+cGoGH
	CUCiJxrzBOZvsqAPxq1namQ4s5YkG2oNh6PVJJmyTxO9YSD7tkbHrVGt+ijSXUn7
	NzXJfcTeHpmFG8IThOecK/i9YdXROO/8ke7hcNeQbBriutYHGldwnxgtQUHkXOrg
	lL2FVdt4waPQoBUsB0LRlg/rOd1KUPQm3Qzl3vCW2EhwRHwcY9C5wRO03bzBas++
	+teqycKSivS5McBZM/Lehbf0d6LM+QJAkYjti6YcPgs0c+pLyKmElQKlIN2bKmBt
	XEN5bA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubmtjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 01 May 2025 08:24:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so2155601cf.1
        for <linux-usb@vger.kernel.org>; Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087860; x=1746692660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=;
        b=HGgk21gXGoRKpplIkBDOlf2eggr20C+DrDJH5FXhU9h+rnriq06EoeEE4AoQ9yplaD
         aXgBhopx31zL1BTComsW6Kl32M3p+zs+pm1CIrf+t7h4+7VtiDntQydWPhNzl2ijAxwg
         FJETaHEL31ObD1Ug1xoaJ4kRtrDgAD+/SId9th1fu12JlCPpO8S/0tept1gRwdI1MZtA
         4+b6VOO6srQ7IQcADVJKKGREwcBNy0YDo20vnMK1aipUnb3bl462ETl4OR0jWlF87H0k
         WFw/RRW4gEslByloPVxxTHLJaIZ/Q7LkAP+DTzEEf/MBzkviCP04u8qUN004Zv3vi2LX
         kBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTj9DIrMqSXDh85zlk75bgj1oFwh/Gk8od+8FnKsuVPFwxmrbHPL/CpmpVNXeAzZ0nD1JYMMG1J7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6m/O/FKyZsTRYUD6NnC9bQdnPxEDcmUsiwoaJBT1w67K1QMyP
	Fl9bWluO4kGAFYRYt6q9L2f5UPDqiQfYWObG+qLG8DKCThMjBKTm1cQeXE6Tu8NM1lVrYf55BAM
	OkaBKHzzbUpjiDqpiceqUlq6YC9e4PDpxvCSSfZJaBuyYW9KU2EQB1zoAIIY=
X-Gm-Gg: ASbGncs/OKwq3MHUaFEz9j6X7S+s+gtmQ0cYLj02vdLPvSaKHBFe8254ZUFpdMyNf9u
	CvlAiDUp3q1NeblbllC1bbCdXE59vpOs1XgU34LXa9qRP7qHm4uj7K/EuQ10zB0pseUnEJeN7WP
	MnX7tD7/+yrVSA/M+SgJSFuoLIuvrY6C8oNtYF+iefqyEcDVlPZhqRMMK4xAojAelijZVf96Ctx
	81wP9ayJ/+kD6bCS/RMoCvM7S/AlFVVtmiMiCetk3MxcM317jlwYqiW0VukDI8Yrq8iBEJyoXSN
	Qfp8KXP0eXgSwlEN0Xbx22+3jDsvwObmg53UJEch39Ri2ETFmZCvyhg0Aa2VS205Jcg=
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056541cf.9.1746087860196;
        Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ46MXi0EjwqtJAjYukm21R5nakopvue7J6cRNX84FO6gEnUuzCCno+YAn+6cIgvTftra0vA==
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056451cf.9.1746087859869;
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55afa1sm7690566b.131.2025.05.01.01.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Message-ID: <f65228d7-fe5d-46ea-9331-2491cab778e6@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rlE30PVYauE7gR_0mtCO-NeSJ1vYHdAE
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68132fb4 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HmAel4GXUpO_Sf_o3M4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX89Vm49ECXeX8 jTNpeDKDNlX/9YLICMhCk2sNaGQ1by72Cj7QXuxiQYiyVigL/4gTpBAYuDaai4M4KetxyvZ4dFq IsbiyyR+MDF29KhLgFFvagRUtet97/7ADJzzlBUh8LIwSalJmEfYd6TInZGMaSAjQRW+ZgJpxV1
 dlXSU8ItqMKLiSrneQMg+RYopw04RmoLFoIui0v8ArJpzlGZjv9/DkZCkQmyVQIcsoecRlTSjCp Nydm86pEYANJsr38VICq3cSm/TWZPJ+kiv87OUQI3/xWy2Tk9B9VDUA+KMqHGmQ78MVIiz2ae1e H7iWw731m9nKb0U19zGkqHc5i13Fq7rmGq4/WZSLhyyrKCYuFlJyMx+M1oWy7bLQRfmXrbFRjA7
 hK69CDL1vJKYvPtgkdVLqq5Wsy/sm5hLs4EOglysn+bH367sNXo7WDsOvC2OYBjxdYlcxC/v
X-Proofpoint-ORIG-GUID: rlE30PVYauE7gR_0mtCO-NeSJ1vYHdAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=953
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no xhci-hcd
> interrupts appear during playback, instead the ADSP will be handling the
> USB transfers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

