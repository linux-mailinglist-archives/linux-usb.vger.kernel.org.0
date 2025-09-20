Return-Path: <linux-usb+bounces-28409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF83B8CBAF
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 17:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58DC1BC27C4
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 15:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41104223DF1;
	Sat, 20 Sep 2025 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bawthGkb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19301F428C
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382390; cv=none; b=EJof6Q3VUMAxYzjrT0AU9OLNbLYQKd6dQ62wC26YYv+nYKqQLdVCxIPjO5B/WKXUTdLvOILt6ts/Db1drkOZHVFwULevKazB2+++dS0LW3vmEChB1NXYtzL7xoV8ISqGAsiZj3JNs/QJuPYLc3h0xvopQS0IbVHX/NYgDF1Nrt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382390; c=relaxed/simple;
	bh=oxlPFphhvCPjKkEPOgU7to0mFE3Z7RnHaXKvEgUGOCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHMGgMdDgSxsmkzk/9wmYk1Rt3Ed6BjWAAl9kfXkdH48kuaGyUim6cdivC+vhQ5SXobXTOkxJl6oAuTuPAhbmbFUZrXEQ3Kz02gq92M4jEa5mkYnLJsWs8C0SBPby8FycOIM4rCiUlyJ9Vn0L76q0MGwbXcn9PXsAitFcD46xvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bawthGkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FWmM032165
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8bnu4f5gPl5SUZdfwK3pQt59
	3FcrClm0g4bcABq+Y74=; b=bawthGkb4c/dfaIvvDVYLHg82YXoESMSj8qYYBtN
	/Cj1OHZ93axMaIAZyp/GYAuB8b0zKIQr8ln7xC6yi4JcUXv0CSvGoEs4qSku3dc2
	KtzGCOZiSlK8W1+BK6Zkvg8bhYk4cDRJY9pbAz+NtBVmmYN49qkHEWnyGASt9Kgi
	DXjH5P6ErnQN2Uml2twtia+r8BuGKtVBmDHTDiHSMVCEeL9XQo236+I9SKAtp9vf
	uwh6raavFqsW8I5+0hvtgHPK53TiZqt7cHpTYpcX8o/s6oUeNaj+Nse/Ms60Wk7j
	uPLNbikb1neY+/D5kEB5A0yRnHxalNb4blwDJ2kfjLSehw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7ss0qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:33:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5d58d226cso65486411cf.1
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 08:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758382387; x=1758987187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bnu4f5gPl5SUZdfwK3pQt593FcrClm0g4bcABq+Y74=;
        b=QdRBYdg3SzPPSoKi+w3UhyIV7oGgvtu4e0cPdrcaGz0tDYd4hy4eiOp+PORAcSidwS
         HEvlMRqeWZRLwig8MW1ZtnxRcbUmBTgGC1hpASOyM7zbK4h6OVwbzneTG35O1lTIL4ec
         Hf1jrUOnZYi8EQMph9gxXGFeyOiij4i75t7L0/CNeLTv0GOFAYChXG5V5SM6ueq2L5om
         H3AJy27OcNtr4aTtb9bwJ/0bjbS72HD8FO0vW0Gaj5DVHEeeBzpsQhA4h8cEdciriO83
         yITeyi5XXsamASYFqIjnnIUiJ6CbJF8RpVZ4IIYUT/vf4l7botQOHayF+B//Td0mUece
         XRag==
X-Forwarded-Encrypted: i=1; AJvYcCWJdsylZs3rV5CrtOyh01gYLeowkTvh0ssz/172dCWPa7gcPonTlG6ak9BP6XmRP6lq1JZh5ejLOv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sgDQf/fsEcRuHaq6z8OIsUaDBj7hz0zFQi9Bf6xqXQWmLSlG
	FvzYMw/2NNUKgf9pnkB5pAqXtS8ZqcImqt+K6Cy7DTqXBM+h33YJbKzl8l0brtP05jVvaR+JnDT
	KL1jjENvK7aJl6oFmtz3dONx98/YVM7m2KNCeXE/yfunJE6ASITYENk/asWRvzL0=
X-Gm-Gg: ASbGncvuaeV6boGvEuad8Mi5CxfNmXqf1zglxebDAq8ujODthFDBFShIhHxYUIYk2aC
	nxCjE1Mr68QoWzJtq3id8kvjyGk5r+4jbFihHZB9m24xLvm+bmf+jsvzrLrvQAz3tCNrvWCHeHQ
	UoZf7VZWF3E2+SpYYpkxM8cFPuGtg34GZH/xPWIMqUe1SKQaVtchinzVLJd3BdFaqcGwtK0T2Fj
	lRj+JQeGxrZKC7kmLdMvuUUwnvEh0yoHdHm51JvxqDz1pAURmSzFLC0YIDuoU8/XuqPmQYj8ILE
	/SrRQgZq1x1qo9n2rySJDaIcWff+bgLT56Q5H7hP+iQ4hPKRK4tc/UqQptdYc4x2yO1Gfma+lok
	jyARh82+Ti5YqhnK/AezUAKRlGuEvl7e0BlWTcWeb5XNS2jfD3u9E
X-Received: by 2002:ac8:7d92:0:b0:4b5:e644:67e with SMTP id d75a77b69052e-4c06fc182ddmr108612581cf.16.1758382386807;
        Sat, 20 Sep 2025 08:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhsq2yGXKWZNR1YFIQu7K60DKJhHDOBc3PQQe0AV272Fv69oDaxzvCOqzXIvhTLTtKvwRmCA==
X-Received: by 2002:ac8:7d92:0:b0:4b5:e644:67e with SMTP id d75a77b69052e-4c06fc182ddmr108612231cf.16.1758382386385;
        Sat, 20 Sep 2025 08:33:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a28b9e23sm18579691fa.27.2025.09.20.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:33:04 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:33:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 8/9] phy: qualcomm: m31-eusb2: Make clkref an optional
 resource
Message-ID: <nimhwt5glueufk3c7br7f3gzxrch5dklelod3sh5lbj33tg5hv@j4u5hdtspdv5>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-9-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-9-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX8Z3q5KGkbmoi
 K5K+KeR2QiQdc6vApq8JNy58sM0m84Qg+E6kFlakc6DLpcbW1L3IljtpPEvpUmAHpgkUVaXikWR
 VqgYa7shQkCqOdNzfZrYPTUYT6/aq7WyUQNJgbZAAtBr1T3XJpTTTI6qou22PokWJipZ/ZnRrWz
 yPAvpIkmCDNMs9/2uqTJ7kTolgjLd+F2mEvEx3EahkPiayfgFgacffyVrOpTY80P2Xtq8QraUpv
 GARnW8INxFdFZTFgM0PGnngZbCcG4QlSLWFkeXNbDDNKPBlDjOkJUhlO1FBPTWeiGU6GEQ2OoDL
 faDNQp+89AssmlBHRL6kj/Y4BkWPqPX32ggOAYQ3lleX3k8o5RcyMcWVcxmguCYgpPjHu3htjrt
 /iwqC8V5
X-Proofpoint-ORIG-GUID: N-K7AsOZtLeepJxZA5Ye1Yfq4eQ-9LhK
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68cec934 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ugsTjJi9MLqOfrGJaKwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: N-K7AsOZtLeepJxZA5Ye1Yfq4eQ-9LhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Fri, Sep 19, 2025 at 08:21:07PM -0700, Wesley Cheng wrote:
> Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
> One example is the Glymur platform, which contains 4 USB controllers that
> all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
> and secondary controllers do not require a clkref resource.  Due to this,
> mark this as an optional clock.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

