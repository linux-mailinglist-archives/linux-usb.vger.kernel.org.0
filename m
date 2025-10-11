Return-Path: <linux-usb+bounces-29167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B049BCFA09
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 19:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C1E3B8DFA
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 17:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16503281529;
	Sat, 11 Oct 2025 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn0h0OcI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2FB27FD47
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202431; cv=none; b=fQQkYPJt54GWZnziGBSSIewjtuH5TMJ4Vo8lCZ49lnmjgkBM+fYRRL+9IUUltI4WgP79IUYd1YK/tpwKIgF5caILceBpNxL8IzIogbBya96SogQPBlu/E+9jEy5J932d29qrvZLzY2Y4jttpyV6B3f/W3tbSGv1NtQOwgfiu++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202431; c=relaxed/simple;
	bh=AkFr9QGDyeuz5kArh2v3+a2z3VK8A38QHCu5APZRPds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0GYgav1xizFzCiO29uQHjpl59Q6ZZTF/nT/bmoR+5TtDRphp/NpdM5d0nzbpe9VZOCF2KCHNzDctJkdYUkHEaR52lGU5aGZoZrTSx4cINlj7Pdpnl6Vk88UdpRT81O+KUIfmF1Xfv2zTH3OPlT4I/ZCsF8iuGzTEi0OqJgemQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pn0h0OcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B3VXlg019584
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 17:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFycPb6v8NKaDe6FYB2/8x+o
	vkGxvomJsSjcJN9pEKw=; b=pn0h0OcIRdlCvpvf8AjJVH6nVCXg8NEJeCQW75q2
	dsToMtpqSi+FaPkkcRIipiaBow3F8Mt0xdph6Ty33wqPLR2jpF+MAGyHWJFRDBVc
	2g6SrzzItdXMZJs4RIo5yF3mVzUscJ5f/jt/1v16S4qXdikK6xk/2yBSH6l5Grxa
	AQvyG2gx0K+oz9bWCm3Wd2g2wskZ6FpJ08hr+IkKiXAJKtNQQ2ZENVco/RnbZkqP
	0ycpTVwbCwXLwDB2OXc/DxiGSnhT3vqtijHOw7tdwBYTXNeYQdUS2/J9Fih49Fi9
	a/UE+LUVGdC+a4YIb1jekPmVYnHt4wT42DujL4yWW+rGPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8rxp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 17:07:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85a0492b5feso2700191785a.0
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 10:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760202428; x=1760807228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFycPb6v8NKaDe6FYB2/8x+ovkGxvomJsSjcJN9pEKw=;
        b=KTXoBH7sdDCsXMnFuOBZz/M+bYMj2N8Nmrp8Pnmer+8YY7wqOdHiHgH2qEveoFqtON
         bF4/CxNp3lr4EMCUsMcP2EzBfDcHBXKZlJHUd8RbSqVzLRpuJUX0IbSbTeIbhUnCcWe+
         9LxAmPg9H7kriKLF1z9MroKkAcV/B5qfYyz5A/olq6fjiz7l2+HRbAC+xEF9cr8wdPnc
         e20a42ZCRpt5BVrJ3thL9gQyFZyjNHncJo43VDmtqNZW6HYxX7LzouD2UlHaHQ+kg1bS
         P7DN0MW+HZHr5GPj1+TauNIZXyg81cPRCgU1HiXm9dbpRShUuHx/3MAreAndfmweOTua
         2j4w==
X-Forwarded-Encrypted: i=1; AJvYcCWLtqCel33DhyFugK1OwUU3ALhvk5P1ZLen3LuOmaACxjMYN+W+RK3lpM/fe4rkEbA63ndVDWYICEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPtgWv6TrnUnTgqVIs8VdheQRkSXw0YWWVQrcHq4f8wnSfGI4
	yo0IwPX2Q4pGMCyQoVvZlDjWxleLJXdavTQNXRMJEsvvQi4Q/olJ1avGp/MWddWVrykVJBOc762
	oz4I06SgkD8OLemUZ7/AlAnghS/NZLPYUekgZh3n9q6geDakFlXedh/4IO1aLEEHNJGGzEew=
X-Gm-Gg: ASbGncvqPdACh1npUPsr4txylumKob5roMWkZeEIPeJunEDW4Z4ajpKyG6/7wvxWzJA
	O/iUr6FzCw3ntCH2Zz6AQ8bLBAIb2XLw9nnpl0O1wIZPK9MDUfEF/r7D8qw0AoLoD2VYuv1hi4d
	mW7UFYosMLJHdN0IyknE+SpSLiKZnOCKrqh+VjOpK26aQwUuY+PkLgP0WWVJH+XTO6LzZsndHhR
	BLOU5DJ79r88HDAniniWRdUZy8rM5sHByMlagOPAGJJLRSTq8DR4Cx9iBlb7jYgatDHX0nm+4pa
	8f94Cg3vWxgcSTHnblrzDRdRlmzLIJItgvwE5kekQXh5/0kZytC+57Gzjvu2LWWyAzQ5kyoQU3W
	rLFn1l8HsGv7nlF500srHz9htkUOz1KgQfRKnXoljRpTckOq4cXUY
X-Received: by 2002:a05:622a:4a8a:b0:4cb:102c:56b2 with SMTP id d75a77b69052e-4e6eabf437fmr231238751cf.0.1760202427616;
        Sat, 11 Oct 2025 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGnG/nUOQfuTmf4P38ClaQ0pqxIsVT4KwQ6QvBre1kD+zoeTzKlRbXjaxIWC6ayUXFmCULHg==
X-Received: by 2002:a05:622a:4a8a:b0:4cb:102c:56b2 with SMTP id d75a77b69052e-4e6eabf437fmr231238041cf.0.1760202427149;
        Sat, 11 Oct 2025 10:07:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98d9sm1244485e87.24.2025.10.11.10.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 10:07:06 -0700 (PDT)
Date: Sat, 11 Oct 2025 20:07:04 +0300
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
Subject: Re: [PATCH v5 4/8] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
Message-ID: <jcmn6n4nbyjsmpvg4q47wxulgddizhiwax4dcb4dokrvj23eur@g3nvwkssg2li>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-5-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-5-kernel@airkyi.com>
X-Proofpoint-ORIG-GUID: cKjqbv1pcm6DDHotFzMxJOcwKLg13XSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3nZY7qYLj0j8
 R8J8x2klg2v6ZuYFRBPTE7P8zEtZeidV8K+WpQeCOaxepO5Qc1y+mGhaPPXU+gGiMxVs4RxXVoZ
 khwy5i0XbU65V8PeU7wxBqhB1OeJKEpJKO2qEQxM5jQkB9B1VjVG36XV0WrUI4YHXYN5yH6ZA/i
 6xSiMh9v/dHGgRz8FdblTSGQ6ym19ZhLKDhCVZ/pfkHsqXXUGmtoSzAsucpmGUjsae4vAw85ptt
 1KjtW1WWrSNlHOUw/v80NF/M+aTji/ZtQeSnpCg0j6C3hM0/aOqz65D30LQ1ZPKTFt5iywycaCR
 ghVR98l/d1fKgL/cOoNeUlbWTkwpqgoYu3po/Ffv+mc13XJpATXoaGIe+qR0QrXempieSJ521Iu
 L3G2m5hh5/WxZXRZAwZd1DQ5pWJZIg==
X-Proofpoint-GUID: cKjqbv1pcm6DDHotFzMxJOcwKLg13XSs
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ea8ebd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=-wB9imSA1xWJEod_rSAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Sat, Oct 11, 2025 at 11:32:29AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

        depends on DRM || DRM=n
        select DRM_AUX_BRIDGE if DRM_BRIDGE


-- 
With best wishes
Dmitry

