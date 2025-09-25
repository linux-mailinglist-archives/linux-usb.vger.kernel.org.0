Return-Path: <linux-usb+bounces-28640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F0B9CFB8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C7342257F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC9F2DE1F0;
	Thu, 25 Sep 2025 01:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GW2SESp0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA37A14A4F9
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758762730; cv=none; b=H9DxEmOL+8M21yvMpzAjkeIKb6VFl64ZKrrj+/EnkCgT/PjEbl+UmILgzMFC3fd2SUAXzQU8d/5c/Byw+qR6InkUGCVImWag0MxV8FH+1QVHyiVRvo9enIJ215+Jdt4H8UOW4BsUthCNcCXe3y6KwcdG0hQ+za9Mukig5RIyZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758762730; c=relaxed/simple;
	bh=DrXL8HLxC9CP4klpaZkd6+ccqYpqaBZIzbay4Qvc77o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecj6PhB1rwnCJL9QzDy7/HGevktUIspza3sFcIP4MjR0L81JUuFm/C1hp3aYcgGzKlQfS/hXF6UvvQzpRSx1Val+gRyLIaCn7vlfH73z3lJIyrwX9oxx2b4SkOL7nhJixjBnyebFHF8USsgCUysZlGhxYb0nmoU8o1SnY8D+JCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GW2SESp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P10Uj1016528
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MQ6UCFt1uTELNNSw3dM2CC6N
	2IBuWYa+2G5IROr44dA=; b=GW2SESp0Y2UoreJfxhsyh1KpoIzdgPedByV7K8GT
	xnezcHj08w11Pvw++EUhS2lAkKRNHvhBaXOyNh0gtSPHpmFXdUbiNdE58fX1mb47
	Yh/PyOSpG/GIE5e+R5cl6NMbrVb4uLE+HudYfzVl7yr5JMYizzXoBQNv/3aYWEZO
	gA9kQ7N4WwNqWWv+3Gg22pXP3riAaHFFRn8bPM5YgNwgZj9sLcx1JIR5vli8E96l
	Mk74PeRqjlNX6uselFBQYO8Yl34rz6ToNda7kBT+1eSDSi6xWCaUwo/HnPRu0fSy
	5oT/n1jS5xxxPGJ7pQjK4LSwql4D8IylfOy6lleO0KGVRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyj2sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:12:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b47b4d296eso10171251cf.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 18:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758762726; x=1759367526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ6UCFt1uTELNNSw3dM2CC6N2IBuWYa+2G5IROr44dA=;
        b=X+4tB3bIUlws93yaRO4DgzDfrUk7lmvWA27vEKOJjYPmFYFU6WVuw0+IDlF5RQBy3a
         t/JKUNZ4gD/vFxSAwoulI8nzadNGbfUqyLoZzyn3HZpzTFoZJIsd6M+nTOc41cYHjGPp
         lWbY+CdmM+buymduOpQD5iPdiAUHcd9B4MFysUJWhcWtZrv1AYX98lX33tJP9u5mYCzK
         G/lIPyLNgVjvuAwAVECi0X/oFMhTihHZFjMqr0l1bSAcoBF+6aPL8mzi7ymoFkHkQsd/
         xblewk3hzhfCCWxxN62ueWO/po0Vna2sMTA6YZRgaDXK1NjsatctehBFAOEOUYQx0qhy
         9Otg==
X-Forwarded-Encrypted: i=1; AJvYcCWHBN4ywEnIwDCmJ6KWaZdvs1cwaXjhglE7xWydWPPYiIV+tc4mRa0T+R+D+Ds1dlUHlx8mnLomFpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4CCmvj77fArfXH7uuJCXORxOnCoQCKQlFz3EQcyz2g7D8j54
	v8YaHrT/9olpWUAuRViaiUDuJW4jGNpWMFBYwWfM2aa0eNDJK1SKiOAlz1p6ZrnQoawQA815zeM
	34N/FRnvcQS1g2wif+95Q0o+NvZzfJEl2M53UenEKCroA8QWftsMFxsFG+5oaJpo=
X-Gm-Gg: ASbGncsc8uKTxuea+WISyoTFi+Wm5c+Bhyxh5zzbsmPg2TT8vgVh6LJtONI/H5oQRdp
	jCdxQGmjaZjG73kNE/7SS9s4Gz3iNdo9FzJ5ALNSaEZFJdr9CS1OnbwKAc68YWkIi8VezljsvrO
	/FSsnLL5VXlappnjjFHu/o7s/IcOdP6Mr74Zna5OzDAO2ADqKCHSkjQ1MV/EOAtliFIL/FUGIyk
	YOp88n8dyOzwNGU8SkIjE9/ha3GgNisMEgXRIY3AirhO5UtMUYy8pbLHp0B6iProum1tq3UDvE3
	div4kecTp1iRC/BnNsWsEr1zLYRWQqiI5AR3STNMCOTtc6aZayLM2yPqXbUfaX2V3oQUa4jEjMz
	fg3onDvQtE0pljODxlC4HGzcTz9XxWHGMDQB8sssOAbEFDQEfs8C7
X-Received: by 2002:ac8:5f53:0:b0:4b7:7d98:d3d8 with SMTP id d75a77b69052e-4da4dcc6b08mr24709251cf.75.1758762726581;
        Wed, 24 Sep 2025 18:12:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW8TqfUiIdyjOYKHmfe38ArP3DQyQEl0zmpp3cjDaI2nOnb8fwmpNUD155WV/L9oKMabVPXQ==
X-Received: by 2002:ac8:5f53:0:b0:4b7:7d98:d3d8 with SMTP id d75a77b69052e-4da4dcc6b08mr24709041cf.75.1758762726137;
        Wed, 24 Sep 2025 18:12:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc02c1sm198591e87.60.2025.09.24.18.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:12:05 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Message-ID: <5mwqf4djs2jee4x6edplwmd5ugucoi4wazrzjoiw2p5ndiv6h2@6xqnnavp2a4i>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d496e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=95jUwCB-LgHD7RhpIBUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6glCJwUsjkmPrXYzyNynYV6DlB9RCyDw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX8d/0MDKZAqkv
 Xrw7bSxNsEsA2wJ68PqyOl/8RXc+jmIIVJEeFe1OIO5LfrvW3S7O3ulIItEdvDJKDNBHoSFvaBJ
 btgcSX9VVLBSJZU5y+AnD5cSsCarhgrHHo/DAO9jn7je1jH12xkpeBX1SMzK6SJRnMCEU75GclQ
 RMPuvn8Mld9E2Cfis5oqsfusgCu7ED5OvkwPrw9onQ+3s6PReUx2XMlpzCuvnCeJhFL8+jPeBKZ
 G5Ehm4fXlPLqcRBIpB6XBI+tpzBy4VE21mWgDozxYXWppKiVTr4rvsWpdST/FpZGW2YpVTKqy1g
 EAoSshAOkECSlYk3jKJgr/nFwlmJB8bPPwU02IfFrc57Is/I0Y5YNFXt+qBONJ6ICkXHfG6gu96
 goUbTjmV
X-Proofpoint-ORIG-GUID: 6glCJwUsjkmPrXYzyNynYV6DlB9RCyDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

On Wed, Sep 24, 2025 at 05:52:20PM -0700, Wesley Cheng wrote:
> The Glymur USB subsystem contains a multiport controller, which utilizes
> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index a1b55168e050..b0ce803d2b49 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-qmp-usb3-uni-phy
>        - qcom,ipq5424-qmp-usb3-phy
>        - qcom,ipq6018-qmp-usb3-phy
>        - qcom,ipq8074-qmp-usb3-phy
> @@ -62,6 +63,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true

Which device is going to provide this supply?

> +
>    "#clock-cells":
>      const: 0
>  

-- 
With best wishes
Dmitry

