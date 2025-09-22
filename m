Return-Path: <linux-usb+bounces-28462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0FB8FE48
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 12:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7287C172424
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E8128726A;
	Mon, 22 Sep 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7Yzv5JW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EA182B4
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535313; cv=none; b=uMzMoOU9umasuvoHmtoB78o6uw3BoGxZ3hYyeAaGQK6Q4DnUuD6EYi3FGg6QIFjjjRWciw2tkHmm8U/ELZecl8iB+k65tWIBAXHryzJb3HsVg2MMyFsEBcWk+bRxaDAVKBJRl7D2ZWzkz+xZPZmM8LS8pmR/KNToMEWTK+cqVjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535313; c=relaxed/simple;
	bh=kmtBnFX9cPzIhV8jePoZbgCrPoLPtjXSYEzZso3twiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIWxGKOWNCxLMY3eI/5YK6NJ3ZvgYwwb/ydadgXTR1ZLT+FV54oKAH0bjm/Y/QcNZh5ExueGjx3KK03y5YbQVhD+Y9ewMe/Vzd7FBlSMCVm2cGkkyXbSt8z6fcmSZmt+bHYrVsBnBGFo5CMKvoD1OwwkJ82S1Awj95t6kIhD4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7Yzv5JW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8xfM0007783
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XiYvYz09Ku6t3DKDC+/4pI6q
	fS4bj3bJjEj9wOzslhA=; b=M7Yzv5JW0kzo5jqhfuTrRAr2NwtyCdfXVTLVHncP
	tYI97i8LcDHQB5HgXes9kVdNM0fTPrfKEikVW5TvqhegrojVEAyu1/H2qs8MNc1Q
	VoGZZ2bvd/2C2225s7s7U2IXWuu/zxXLD83t1PfAVQ3Ex8YzYzw0wNK9XuifolUL
	qqRXE5YC0eTFuK2tGjUDYH6nA6ORf7KuA9VYoRVFUXn0VWb7pzvJvozCpd3h5gtV
	/REIvnhJ0oIMAcL7e/3p4yZFYBjUDllStnUmYL2t9DGEVn5PNJv3j6oZfV4pORIB
	3OJcgmPs9kjwgyNQzEhh7tJjyNTuVaYGLy7e3Tuz6HfQTA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg34ac5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 10:01:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78f079c7120so49578656d6.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 03:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535309; x=1759140109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiYvYz09Ku6t3DKDC+/4pI6qfS4bj3bJjEj9wOzslhA=;
        b=iRy1Y1oiJUP27aFh1oQk+peiCqIB1qb5V4ndpUNFr+0kqhywWeRWpRMBAsotlzxCln
         Ld8kwwpSCVcGSHyCDwR5jrkeC+en3vhRO2NZBITdOwMnAqKpSAfO+CwmBmzQlxdssxOF
         McQoX7+SskghUZI+10FUIShPrSQEm8MIzcKjUkUqN8ewShY1j6jyBVG22rIhL5vP0WKn
         Y5HSiTHkx7vXJf3tAHpsOdLp5evhYjtJb9GoLGnL7A0aq/3neRGgJvVEycBa33lmTdjr
         mvyHQZmkFxJA9ET5rDP2/x8EPHQwCsiRnO66wz5039o3YEmWH7Hf/nC/fARDoCe7oyw0
         pG7A==
X-Forwarded-Encrypted: i=1; AJvYcCULbt6Q1IulbDzGQexprgK+l9WQ9CFiy9IMU9WklrdGeMoFy/cXhU1xhh9IShZa+nUnTYtdUUhX4GE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLjmy7As5IdGulyn+eh/zkZzmnnwc5Tq93EjgDZwPYRSWwpJjg
	5puIjv9Rvb6GCSHdSBePRFEhQIeVanF5KsPPBSeSGGB1nKYzYc76OBq5AcfeOA42r1bPMM/ue9O
	mvW55Exu2l48ARjWu014dyqFc18Rp2ehlTGQBHg/QVxSixZREVnsDXo/p/rm6wZI=
X-Gm-Gg: ASbGnct+RipHkqLef2IDPdHstrD/1Bu7irZVF3WEwYcfuqiz/7AhyZM+ycCj3sC6W4T
	0e8umDEjjUGH/cYs8elvm60rUeKZCiW04cIlkad3fu7SsFgYQSqNC4Zm2zoduOu1l1aCrqLyYZc
	y7r3LoKoLVxJLAI/MbH0cGpM5x2MZYjvsB97mhVMOCtf2KfTnf+jNHXaRxsZiVIGNxdL8rbJhUf
	VXJRTB5rZvmRJ/gR3Kb4sWbNpDzMVM3rgqpN/aw8zFitHh1I5sg2tPbghj8g/3x+ZneUWGEgePd
	FJJi0ZSHB52S+lE/b8XNCvCUHFY2PIBq8Vf8+5McY+k9fWubMvJ8OyJLl56yWEOvLA2PhPFVe4A
	7B9EWVrNEKW9U00epY1tWhAu3V1aI9iqygQ+XP1SCHYHMt/Qxhafq
X-Received: by 2002:a05:6214:2129:b0:77e:dd3e:a0c9 with SMTP id 6a1803df08f44-79911fe849emr152956686d6.14.1758535309168;
        Mon, 22 Sep 2025 03:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3dwdmnAT8Ej8kna6zU+1gThqQvOHecwhWI8VJSZtuu94b0HchIuEq9o+Du143hQaVFqG97w==
X-Received: by 2002:a05:6214:2129:b0:77e:dd3e:a0c9 with SMTP id 6a1803df08f44-79911fe849emr152956006d6.14.1758535308504;
        Mon, 22 Sep 2025 03:01:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e077d0sm29027191fa.9.2025.09.22.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:01:47 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:01:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 4/7] drm/rockchip: cdn-dp: Support handle lane info
 without extcon
Message-ID: <gcgiszrrpqkoi3mhajn4i72awbffqv6mayahmnyswoitxxmrgd@nr2z4cpurbwq>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-5-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-5-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfXwfpbWB0bZWdV
 FeOqjSBWcUwQ3ZNrbpDr0Ravun+dRx9XkQbh6RFtF09lqOXkRNERdAj3frz0RuaqxS8nbj45VdL
 Z/pOxrwDxOaLR0rrJPExvlsQtpqRIjLadTWIB0sNabTwTH//NMAvKp4l0sNpU/SKbvHEZM7YUBt
 lkZsitl1zn5cCzFT2kMnyRt9g1l7wgjnwBDfb3zTOPaVzxQt0OdKuacPLoBgvkhEXMUh8NpEmXN
 GMlvFWgvAzAwDUYuT0GInrNPskZB9xGBZSGvxzYGLmggMVON5czzv5sFe26DQCGysnftTTn6jFw
 t22Fe4HcLjPyTtZky4btEN8J6ZlafDWrW50Bdbzv8kGPwGPCLtVOXsqC+Oovc4dJ4urMV852jRI
 LySsEJ40
X-Proofpoint-GUID: 1piLdno0jOcF_K4QLqSyDQGMy1ecz2L8
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d11e8e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=k09sBhBf5rVv_DnywOQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 1piLdno0jOcF_K4QLqSyDQGMy1ecz2L8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

On Mon, Sep 22, 2025 at 09:20:36AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for get PHY lane info without help of extcon.
> 
> There is no extcon needed if the Type-C controller is present. In this
> case, the lane info can be get from PHY instead of extcon.
> 
> The extcon device should still be supported if Type-C controller is
> not present.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v4:
> - Remove cdn_dp_hpd_notify().
> 
> (no changes since v3)
> 
> Changes in v2:
> - Ignore duplicate HPD events.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> @@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  		    PTR_ERR(phy) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
>  
> -		if (IS_ERR(extcon) || IS_ERR(phy))
> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>  			continue;

This will break the case when the extcon is present. It should be
(IS_ERR(extcon) && PTR_ERR(extcon) != -ENODEV)

>  
>  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  		if (!port)
>  			return -ENOMEM;
>  
> -		port->extcon = extcon;
> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>  		port->phy = phy;
>  		port->dp = dp;
>  		port->id = i;
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

