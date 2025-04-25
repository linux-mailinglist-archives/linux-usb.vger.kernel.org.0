Return-Path: <linux-usb+bounces-23470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44294A9D10D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 21:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81E9D7A78D9
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 19:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA8C214A9D;
	Fri, 25 Apr 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCmfGND1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30C218AA0
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607805; cv=none; b=HVpg/QcXZvtlTnvZOr8Fg2mZ3elj10E8iGPBFMs+iLLlmu0ohM4xYa0eWAfS3SoOiXx0NYaMESUIGKgy3XhU094wDr9QJz7CYZnSEci96Tr7MBD7Wzvg9Lj2Qe2vnrT8Wkiyz9REAjSabwgx7dY8MSbanMKOTUlaprAe3o8mmbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607805; c=relaxed/simple;
	bh=5mLfWj+jwzO9e6XH5KOBOGiPhIhid9kotKcL09TSRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSetKNGzjwUZ2KKINjJXogr95V07t0nMZmU+EDuBmZX9iat/AIJAn2EPLXEozYQMJJe3du1kdYflkTN/aajNz5z3L9SHd1kobLHXNI1dwP5FUqzdF/GXZ8FVKIbAtxCQNYtlWibq5jkstRyqu30liDLOQv09ODjEURlZ9G9ajLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCmfGND1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK1mS032096
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+OQsF8WR7J3ezadmXnGj6/J
	nTpBzTLVUrnSMduU/PY=; b=gCmfGND1WyskeqeTPo8rwftpd/r4wPc1u/mM3He9
	bWUJ3lH2ZBI/phlFp1WSu5xVJ7/DCClDgWQFBtYDtOebx2aBXY+L6Kg/C+JSoebl
	/OElJDXtP/z3Q0Ut80KJP18w8F3i2Hc1yxZuMDjuHENOw3GdxhP0/33OhIh2dHRW
	ORLNZqN91ZxJwqMw1qmRNZ6oA7c+YC6VGaMnoLbxJYQRyaR9jnh45EBDZ7LXg0Ku
	RyhbWB6d8xjn10Qo/N/ar6kcWfemIpfixTyFMyBdV+tQtDBewr6hdVoRihjh/Chd
	SJzf/ig/sxz3VWKF7W2wEtfb8f1UB4qePBjzJtT3zHqQMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya1h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:03:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c95556f824so277149885a.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607802; x=1746212602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+OQsF8WR7J3ezadmXnGj6/JnTpBzTLVUrnSMduU/PY=;
        b=u/1HtN+0/cWFlwuPl6sLIvgrqzl7NpS+QJ3pmh99EgPX55yJBHGwAE+kLpegkN5luF
         vpShFcgfL0hFT6Lxp30JJ5Nj5O0p/mx2V3hDeXSTlgBcEKk5Aki6Lx5an59Sw0tgRnX2
         7oEf9vfxp8bqV7nXvpNSAc94RHnrHpyKTxBpmw6MnGXZW7HRhzstc4iroP/XZhuS+aL7
         pGfEIv6EK44BJWLoYd52Prn5TTmXN2GEnTS8HlZxrL4OrnSf3ORykwQV5p8oATSqu7SZ
         73x/ULoIzuAh+8CHtfHuo1b7WKKSquJqA9o87feyFczD1Va1Dp70OZakNwWrh49Ae9hT
         qNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUlmH2muzEHDJ7lHnnaxOvCLehNw0WKHhEjwxmkb04O+KeMOeDfni/RX6chdaCLFYWZWxyNeES7vtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ig0aY30XDDPv3PPd+/JFBXBqmn2150P/cy9S0dZL7FL0OCQ7
	dF10HOJbm0VPj2XozG1StBYwwsax3zAK2EsZPFpCuvI5yaRGLA0bS6r9DPIM6KWfAx66/uGTJFe
	pvFuuL3GxkNQWZIHlbs1wTVHdhq0/yJc3YL7SNbjbMzjNtz2hK7oibXE5uWw=
X-Gm-Gg: ASbGncsBOOW36L/dVfyyoIz5fDrRZEPIkDAcLJHxl6dvN2Y7Iw4s6O/xJlKmfbTqA2i
	BBdFSQKnqStCMys/4xGvemmtSTkcfMgLWG547r1ZGwlcTrPSC6DqiKEM5ziWED/T5y8/2JPjNg7
	ANPfqXJtAj1oTa82IZ1NmN89JL0PStg00rhjQqONVFP1N2kQ8ZwCD+Z9/0UKdEihyOPmTKrYPqg
	9NmaYlj/PJ0Bg5nWqyn1nRgWzQ06dVdjHah8mc5hwJqgG3lDJKZFZ+5krB3OjqRZ8dAUWpaIs8B
	WsiPH1zN2+gX16Lis/jnuFE90QnWMjt7A1e6FFG74h8xLDEyl9ASopRAqugcZDfDI6iq2L15hZ0
	=
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529028185a.25.1745607801883;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pRYAFM9obH6sLDqc8iWZTDFSyA63+5Z92vfE4mhmS0Il4CaGvhCSgEYk/JEQXTzgN8c9+w==
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529023685a.25.1745607801481;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7b48sm693665e87.160.2025.04.25.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:03:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6350: Add q6usbdai node
Message-ID: <7cuouqnka6w26tnfhdtyzo4c2jwohgy5gqyzv2yu662gvkg57g@n6amazzvznew>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX8uhnqSzvvXF7 G8ND/gOhQ/wxHw5js/bd18eLMykKFsn7Sl0sobQRTUHE/SKbGLVa5uBQVOlzGqlCBV14qbiy73/ eLZ4gukzWmUGDTf1lyCrPqVljPLQMKo/+9nMq2d2ZRfJRR5tSTZ0+/tEf/HSsIkRuUaj1MbLu7s
 YIByrOXItf1Ecm9IJJY6e3o9JLFdc00EkZWsuB2GjAov28QDi5ZzD5h9pt1pPsGYEYqIlYhhOPp RC8LVmVZNIlI94vif2FfgibqmfQK05wAK2Hfw2chOWqvt1X0ycH5nwylA7usxdeKSgXSAVxxQZ6 Tyc1vmxdPD19lAP7HOQiLqWOR184nR3llmkQmJU5oXbCWr+TEK2j9UkHorF5hmQ6NlObGWLC6Fq
 SoLzUBLLDKYWdCdzyYSUWIbK9Hc/FawjCnMO9Gaqs5UvKPAHbAW23ztKEFoxYHL68t6S6hVX
X-Proofpoint-GUID: pPzcv7gpE9rb9fYDfEQJhLCmfmB0yQki
X-Proofpoint-ORIG-GUID: pPzcv7gpE9rb9fYDfEQJhLCmfmB0yQki
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bdc7a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=774 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:55PM +0200, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

