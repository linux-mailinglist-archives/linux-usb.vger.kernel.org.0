Return-Path: <linux-usb+bounces-24414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CADACA98E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 08:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C3543B990C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 06:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FD11A01CC;
	Mon,  2 Jun 2025 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+2fSjoF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B315199A
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748846337; cv=none; b=UaABaOb4v7ivv4zyeYkYPkNCI+sgMc9LjZPrN6cCaB1pTpdcKoLM2XO/Ie+nSNCbzdE+By1eAgiEV15pjL6Edv87jrwq2AMDT+tMnukKxmKFg455iFiawOOymWVS9Jfa1NBwqePdGhnkWhzCLS4Yj8gr7Mf3yk3m19lpMbwtaiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748846337; c=relaxed/simple;
	bh=H+8hGcc842VAoSFMkYka2oWdV8tk0M9H+OQ/c5+ATvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDzMsJHTd+9IZJCGMyreaH1q6z4L1jzG4LOuBUdAXVW8P+pQOtv/9HBmkKxgyg1yPkkleVKkUucM9rrSVB+oZJ1vT59YDyK5wrUwLiRlofN0k2SlxuShrSQvJ5iuSslN+Ah50WgSsNKsYQ8NHGGsO5Gdk1pjQsiBxWZ5amB+CkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+2fSjoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551Mf4h5004569
	for <linux-usb@vger.kernel.org>; Mon, 2 Jun 2025 06:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hgWpVsIqocxgnFNmFrMMXpBx
	7pW8ByX+8nWPO0pYioI=; b=c+2fSjoFh7WeBjQikGYXsMtaxntSzjiLRWVr0Ujr
	bC46VWaexDO2BlDRU2QMNVLfLXw98WJ8XcONky5QbZha/BhapV4fUfN8eQMWTb9y
	AaKk8VA2EbymeOFGfxPN4+6BieDeXGdpxBW6KKmf/ThOLaHd0tlT3y8E1+rE7fFD
	z7SXJNkGkUG4M47vm4cyC6jAUhodtw8W+Gmq37F1PdHjhI65yO3jxqtgRU5Shlln
	p/Q7jm1qkqXsGM2asyaXvgIvj/MTi0aUGCDz0zt0VCWvNcHMI7IcWTCI/JrNsCiP
	2C6hhkHJWHzmcmp7/M5xaMBGBMlo2Z+irN++40giZsLuHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkr3jug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Jun 2025 06:38:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097fd7b32so928864185a.2
        for <linux-usb@vger.kernel.org>; Sun, 01 Jun 2025 23:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748846332; x=1749451132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWpVsIqocxgnFNmFrMMXpBx7pW8ByX+8nWPO0pYioI=;
        b=vwO7EGlO+52aCp4LVXJmD6iZcTDwnTi6rqitj/jplqnMnDrQbpE5LpDO+iFzZLhUca
         5EI8GjJ5LR/AEiIqFD4BD3zs2vXjSPPyqLTZYHbLy25spRPxtsPP7Lrtl2VHHrEXgUgW
         q0crAaBFUdkBbyeekvls745IWQt1P9BK4JBb2ZfCYr5PmThXne/xvB2Ct6NsmP0qLFrq
         3RAxAN4upQKn/ZEWF/Cz5dwxMcnZGOErJVJowfeF4VjNfa+bHRt51YTxNaXV8VMzYQ/g
         EgTKSO4l+jBrE/8D1pTCBKJRsCgJL80dQMCYVOckfl1Fq2/3tcT/s7wJSaWmNNZrLSp7
         3xMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN49jzJj4WdNwReITJ8YKb2ORfjKjtxZTmsym5ghCCRgCEmIxzCY4whR8G0YbNa0dnORCapw6bqT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybaE858ZTpmmR/OJ0UB41JcETdO7cvucks0C4Ig4QDAVuuzvap
	zLeztawq2vJxekZuD8xdsyMnZza9nvAfki+VmFmrN5uqNKocJ4cExDIcMo869xS2a9mD7XrmhaX
	Me8lR6g5J9PZyaPfauPRtsyVEslF5McHTsKCZjHTcW0I1bRwQFb9y7R4FfpOMytA=
X-Gm-Gg: ASbGncuwA2nzY7gGq0aaGiH5bflkmC7dbIG6xEWXcAkYu9/uYPJ+2XqWlXoLHTEXZzw
	g4r4Z33c5516RpXlxW3L0Q9/BOtltGxsZXFnwWEtklrmy1w4qTjQUxvr5ehTNKvIR+K/qPbSmeX
	+NObCwFUao8cQOQCWkxxaVpDGmJgeGS1ZRsqJkpvSMS96PRg5IKEgPpXkYEtQA4yk2uAtZVKAZV
	GoKnWH98MjGO57N2hkAf/DGBiPlcfR3RlfwsFUWHhjW0EdlNaDZ5B75qaMWJw1vET9w6rP8CbEG
	WL+ejo3cJAWSIIX9oapVLOUXaZj5mFMU0D092gz4nKyrBR/sVfGKDHeOIJEBrH/sOuZ6IkBg3Cg
	=
X-Received: by 2002:a05:620a:31aa:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d0a4aef53dmr1398544785a.15.1748846332391;
        Sun, 01 Jun 2025 23:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAH7lHJMHtm+wUmKQxUSIBCKgWZpMZBY9hHwWCQqMr0n2nY53V40/nig5MZ05K/Bkx/ImbsQ==
X-Received: by 2002:a05:620a:31aa:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d0a4aef53dmr1398541485a.15.1748846331792;
        Sun, 01 Jun 2025 23:38:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378easm1498469e87.240.2025.06.01.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:38:50 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:38:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
Message-ID: <mdxfitbkyfwt7efjshygpjvg3s6mvlq75sa6hatk574iocd2nx@kvn2o66nppih>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TSbcLJtTvqd2J6dMkMYf1aJ6qp2G-2dd
X-Authority-Analysis: v=2.4 cv=OMMn3TaB c=1 sm=1 tr=0 ts=683d46fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=EhlfILWT9FdnabWGdsAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TSbcLJtTvqd2J6dMkMYf1aJ6qp2G-2dd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1NSBTYWx0ZWRfXz+9mrkwIolEU
 IWDMAgdo8sZHnQ/tyVYEcleX+wgt3GKFcO7yuNa/zd2Yc7Gq7hiuZktiU5BkZhn1RvacUPVpTX0
 +UcVBIXV0vgsJ2KmhAY0r/xLRuCg94jv9MZG9f88bEeFFfxyvWFQt9X7/ArcHrA82z2P8kZ3YKj
 DigcwsTkE6eFxWbKcSbFfmoPiZeu8VAlPnhYAYmkOXBk2jLTBetQKjniQfjryv13diLLDX+uXMO
 NABBa3sR7uF6VyJkU6ZztL3aM3+hmOUdDFtWiD1l9iIbZCBuVCnhElINJ6ngIVeG7EC9aGN4Y2v
 axgGunIfNgapFQDyLoEJy4lRJdpdwNZVqzlg1V5UCF+e3czNjOgZNnzgPXue6NVc9Ppzx0J0tn5
 Z9RtOc66bxaNHJEjc84zRaJAZwvsHaE25bKJg4wIkOE7LxrZIYMT2/Y4SdOqfbXXnPRoOArU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=773
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506020055

On Fri, May 30, 2025 at 03:35:11PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.

Why?

> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 4c9e78f29523e3d77aacb4299f64ab96f9b1a831..972bec151118f2e20e1f3b4e0c0a8fbbbea7ab90 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -39,9 +39,11 @@ properties:
>            - enum:
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink
> -              - qcom,x1e80100-pmic-glink
>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
> +      - items:
> +          - const: qcom,x1e80100-pmic-glink
> +          - const: qcom,pmic-glink
>  
>    '#address-cells':
>      const: 1
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

