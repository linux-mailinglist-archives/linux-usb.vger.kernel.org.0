Return-Path: <linux-usb+bounces-23612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29912AA65C5
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 23:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04D43AF9D6
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 21:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5872609C0;
	Thu,  1 May 2025 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6vyi+7m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401551F4CBF
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135930; cv=none; b=B72XvYa1gcN4KCdBaHCcUXq4SUdHvXcFdc7cl/NHeuLbOru/7SFYm5yhzd9vneMHtWWeufLBMf5F2tcPIJP9Zjm/r88A4sUTBjlpJ51jiIAWZ3x6mWdUhMJYSQi1yXwssINQgHi5wvxhs/bcpAuEwjpQ43HX1GDtvBIw9zqso1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135930; c=relaxed/simple;
	bh=Vl91YjoG9bqUjwa4D3IQmMOeHqOlYv+Ub5TMWghr/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OglF9cG8F2BghL8++fnrPH/dB40jkh9q3qxwSj+rSVKfVhta4y93sp5tirCs/rkm7y5M03m81YxMnw7Wgutt7ZWOnU7komsoca8w0d7I5DO3BIf0fLOMGEbHWlxaEMbSZ0EPUXK0ULy0jaMKo02NBderLzG/x+ovyOuHIITmfpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6vyi+7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541HMMeM026544
	for <linux-usb@vger.kernel.org>; Thu, 1 May 2025 21:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZWvEe+y9fZ95LVZsDUiRwMr7
	gR6HVKRq8+OepTYfaZw=; b=K6vyi+7mToNIxjqq+Ofgd06E3o9S/X8ARJPRxMz6
	Unhkwgq3QdDdgB7/LoNv13RljEQ2wjstmw4D4y3PKkA7L+u6j2+3OBdSH0eklOdb
	trR54Z6tA+VB0OfEqSFs+thq2Yi/aStvjKUNbNSdbEJbaPV7bChyArEVh30sUFDx
	vr5NUHdJoS+pOtJbUDH9x/GWeF3PzTsOrp6tjU/Yh1ZR2BugoAqMJLO4qzW8WNR/
	spOs4ksP/c4jHEHpbSp+QCDAwjcKIS+x4n2rqgzYGJBU5vL6fM4nWtgbDF8cJUtk
	41i2MzIdzp/q9BCiI+Fv+N7hsX7bay5REUyT6LwjaAr+vA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9xeug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 01 May 2025 21:45:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9255d5e8cso258655585a.1
        for <linux-usb@vger.kernel.org>; Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135927; x=1746740727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWvEe+y9fZ95LVZsDUiRwMr7gR6HVKRq8+OepTYfaZw=;
        b=U6SuBsbLFRKp4B+2dqtFniRUshu4vXlh+qvI+KePP5BTRBsPd6D7Jw+kiDu8ZhqEz9
         pIjvpvRGKSQjxkWfnuzrP2eajVAVku9Agph610KoMigCu2vq6n2P2n2ie6aRdjfE+URK
         VvLU/NRyqL0zuqnSPLv0/UrG11+Rs4E64oG6rSA0AMvcRFvX3UOsJA3DGuCdbH77v6ZN
         DbvC10I62mkMFitMMf66NIBM07orexurXw+PNQSozwSt5+tD8OxJiLOoy2/08JUFbtPl
         F6dlg3NC8pS2saux/KGOA4T5UcGwtUB7eVL0nmMB5irZC7ePK02clkdfbuE0Sl/gk10r
         6dsA==
X-Forwarded-Encrypted: i=1; AJvYcCW4Cd80ieOHilk9w/hKDU3I8uIJ/TLMoijbWK1vbp8yEOygjqzUeCayJL8h8RP5IP5YA84qbNqqTuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDyghXkjXRi/8Pdkk2aT95+JiqESs11g1q7kltYYvXUV/UiGe
	K2LYPnaogoSvTVvjuMzc4cAuXNBGp/IYFo/4rIvqcVTTL+cEtYFAdMD151id+MnkIoFoprEGZlc
	9GLRtssYL0hdfhF8LmLXqbhDGeE63yQB2dqnv2UcXa0zDW5WWII111nLQnA4=
X-Gm-Gg: ASbGnctUHfkuvoIcBRru/Lu0kjNs6R5dEBisqUB239kzjR0aUyLib5HMIXxDkh4h83K
	dQ/xEzYI9dpyoSgPp5Pl+MxDs/i3ZO6GfljnDeBVD4aPZECoPgFjljoqV6vSoVKPFucCG4JdKXh
	4tsH275naWlMrLCfKo5KTGG2tG5NhvjzP8s6bhEEg31cBd1BeIxdbB7JBWlP8kp3tRWQjetaB6n
	GdP/bXfiXCO5/RrMMKdweOf/jhGVySh+bPqV2IqZA3dG9h0Mel2odZeT7CvbGHhVHPXlBFXbnvX
	hjs2Mtj00cyQSc0HUA0UGCs32fzK7Ifgk/3T+bL2fXWjd6e+B+twyJbHmoGHh5cCCjZEtjMvR/4
	=
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cad5b8e24dmr91835585a.37.1746135927300;
        Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2T3LiQpLagEU33hPpPGBOSneQuetQ2NiGG7X9LR4oyqvviiI/t4vmBzHx93FvWEjq2NtFA==
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cad5b8e24dmr91832185a.37.1746135926940;
        Thu, 01 May 2025 14:45:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202930c92esm1997371fa.54.2025.05.01.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:45:25 -0700 (PDT)
Date: Fri, 2 May 2025 00:45:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/11] dt-bindings: display: msm: sm8350-mdss: Describe
 the CPU-CFG icc path
Message-ID: <spvg6kmgzkmkknttwrzjonn3pshj3vvoqn2ffv7euucnkysbtc@vmiqfocytvar>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
X-Proofpoint-GUID: WHITxxf6V3MYNbKB8Y8JUYTZkQwVU7El
X-Proofpoint-ORIG-GUID: WHITxxf6V3MYNbKB8Y8JUYTZkQwVU7El
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6813eb78 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EuULMs42TwgxzVLzQZQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NCBTYWx0ZWRfX94CCUoO0fiVu iPzUUpX90jcIFLzdPmQdtW5vlBLcQYe/CKtQD+X5Pdeep0H1fNuUiWMAQcBrhX7DIo9uGVXeUMm Qxgy412N7t3zz62hNtMiwavAXFfIkMsxlvU/JZ0UYVtmT22wJOwTyZ4qz/JCKNe97itheDNWqqI
 iunn5dUcJJ1sA2WSAS8e+6FQuPelxDH0YJPGKTNLUcJWHhAIGbJQn6ARBerm7ulv1Th6gGny12p w5ULc2YZ1Ffkdu/zuBm0IIHWz1dyO0XAswTdXbw1tqRgVrC1+JAA8aMk+kSCrFYuV5tfXhADx/W XVREUhmAt0aGSkQQB8OS0BT2Wdtc7QlVLeOm0E26coZD4IMXLM1qum1O9DICaR237kBVwtTY0fz
 raeFDsm+f1m2SwxUBCEeuJYeGZFq6alWrJweYGsJZTA1t8sfGJsgK+2lPtMF5/VnpDWhh2is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=561 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010164

On Thu, Mar 06, 2025 at 07:11:14PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's a separate path that allows register access from CPUSS.
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

