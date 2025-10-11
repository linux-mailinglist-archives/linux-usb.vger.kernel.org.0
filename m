Return-Path: <linux-usb+bounces-29164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7119BCF871
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 18:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A620B4E0714
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 16:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E65627F163;
	Sat, 11 Oct 2025 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvAdmvm6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD697205ABA
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760201510; cv=none; b=rv7NdJjdlC4u+MlIlLb5uWJU99izyGPLca62s7oDR57XFv3jUjDQQWisIvQwPbXWM8cuBXnr5sgnlXQf7wFCRqTTG/ZqBCgzlmESiE8nTEfHpfZZxsmWIjZhgM7BsHNhEBk2PlVaNFmXGD8U661wEYuxpfmgl8WKQ9RumXhwAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760201510; c=relaxed/simple;
	bh=756nAZI2HsvJeu3L8Lk2/V/v6E2LwBB2KcFEklPlkNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4i1Mek04I9tDE61pC/+DkxEqnhDf+v5uMelw6qYKYnNLXwF9i427ilqqTipEIiovwnPqMJq7s5d0lWfZMYcSe1fGqMrNIIb59qb435Zt7LmyQThQrieQM3CbZduPTENWLH3f/3spdmHAHTP9q/YH277r/Pv/xJM+VbYpANG5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EvAdmvm6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BDQNYC007513
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 16:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDql/hmPHmbhLyPjNWGht0Ir
	lePqDSoVlgpyDaLxB/g=; b=EvAdmvm6JMiBwFtspv0DVRebMaZ0aXzHvBjDTmh6
	Pl60vwPGKB0cy3LVeUlVVjqCfimlC7XL7NnbIhmMZ5worXFZG91+Siul6cbVZs0L
	/tYDYwhfev7fPrgJq8VIpAhQ7xY1tndC7UIOZzQNtAtgIOpFU9lLhrlSlZ/tMh00
	G4rXeTkQIwVKyC9ovm5cMzFOzx94tfTYYTPcIji09/iwL63WTS2Gd45X9PBAW6MA
	YYde0awJMTCsglI/bbJwhzW00Y2bz+0MQmivyjvX1rPJD0xqfMcU8RutgBgNGbY1
	HiCWWxsnlZUDXyE/g5bcjD72dU2gQvJZLDvITIxdLDojUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0gwy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 16:51:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-870d82c566fso1593178685a.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 09:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760201506; x=1760806306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDql/hmPHmbhLyPjNWGht0IrlePqDSoVlgpyDaLxB/g=;
        b=fQw5wlZ5UycUupoyNQ1KxtLSQgK+aOcN6Fs3rDANRhRLZm2oWGADHGG8bUo0IKjdXK
         uUplrrjRGyi8ffyh570EPsJeExPXYYjhabS+SxovE/iObjQMTUrNp3UNEVKj6cMJSLYx
         Vcx3BNt/a5ZNwTz/6+e8xaGFILmAmb0AGjaeu4+j9vFCnrBmItdBuPTFk6fgU8EdY488
         VZjQnzLrv3h/1J0Hs+ErIffd5riHb6JquepK94/jh1Hy8+tjU4FnLU6kVBwvP6ETTn3x
         jCtJBo98cp9etoUXsTNJDnn1fbypOJVsI1H8UgZ9pFSs3tGL1jL5mL/LuJtE1bYUcMDc
         lccA==
X-Forwarded-Encrypted: i=1; AJvYcCWHAvdUvzfZMKjPJptwEKEaHK7db/JaeXTp/+MaqTvLpQosVW1wZy38Q7C1UstTNjmDjb8RmB3HR58=@vger.kernel.org
X-Gm-Message-State: AOJu0YywZP+6kkh9LuihozA7IUSDGjUsajhzUFcQkGSzl0tfopig1KvD
	mLbM9n+3CiZmxttbwn3/S4TmrLhAh25kcrPkFDwZw65SB0v/6xWkr8k9hzGSYytx3wReZMgxcpW
	BitQgmC+fc1TpnevtuAociCL2i5e563WsNky0BRU5oDOfHGpM5fzfawk0cmCk7fg=
X-Gm-Gg: ASbGncs/fSBaxSTutl9sB3OCD2EJE25B8qeUkEfTNpQ9CC3ICsRnX3OeQLRRf9D6hVk
	/3XmRmoSUNyz44uLG+pSagQvClTp7njwKKzCQnhgwlCFuGxI+8SJB8sibgAoCoEi9+25sMZZXx6
	dVUDrmfyyoqb46NSWFWKxC+2gLB8ikKhUdCFrFndMevWxDuLPF6RgB4PMKFOb/1mH5L/jtU8gd3
	G50sELpYp0Re3DT9WnyJ9CeNb343BYSFZwgjkDBS3AzBO8GGVdIDZs4JnKu8BnwolSVlDybJtht
	9wycfY7eq8j2n6GDiai9GT0FM23muq6mVr5AZl/gEdUydmoW+JzHdoTsT9NXVI2wQfr72lDJlSI
	k/8Vjl5lPpODTCPjNbQ/wEBXhCOi6blYkQXvA5uA89tbn5IxtIyWa
X-Received: by 2002:a05:620a:690f:b0:878:7b3e:7bc4 with SMTP id af79cd13be357-8820b47d5cemr2727436085a.11.1760201506227;
        Sat, 11 Oct 2025 09:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1knLg1ejAD4VBlbVpVAYhUPHuhDgVtfBnPSvgk3VxA9bjqCPn8ECh/NUyGL80y7radiIDxw==
X-Received: by 2002:a05:620a:690f:b0:878:7b3e:7bc4 with SMTP id af79cd13be357-8820b47d5cemr2727433485a.11.1760201505751;
        Sat, 11 Oct 2025 09:51:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856394bsm2060654e87.66.2025.10.11.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 09:51:44 -0700 (PDT)
Date: Sat, 11 Oct 2025 19:51:43 +0300
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
Subject: Re: [PATCH v5 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <4eizpzejw43gqt5jauvkeij65rracols2voa2osflwyjrwbvun@sovgqfuhg6mc>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-2-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyDFRKMa4IGEG
 aRZoTFfMleOKiFaS2ELlDY4NDh9SHqmB2EfFwk15vi3KzAknkYI1TpI3epkAk8ibFV49tilz7Y5
 2nIXv0OfSRsun9NLyX0zZLOoo7vyZCVQ52A+66YvSVZ0Gm1/wEsHXdbqOXEi0E+jLKrKY1yoP3K
 LRqlEUr+sk0FKUfjnF8YX1chbqju5xGl0jHQlunsAvqK/+y4f/oLNPU0sEXLIddnEWlTh6eE2uA
 4xa4HfALMBPWY5Mvp1vk0eFftDnBgYDEVu6vwc7olFzhw1Hb2b3SWhb50R5uOLULVwtMH+74+Yx
 sAUv6wBWozbKgHEuKP8FwtQ8UcizU0/rtEfojIAupdKAgeQrMGXGuL9FL5pwcdEuKiWvmvrnJ82
 r/7WRT0N1rqOrySNZJ6SzMSYfLGHzQ==
X-Proofpoint-GUID: mTqnQfUtDYn6mUEWImP1uhqMhfeBvpfq
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ea8b23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=RXhTPAuaP42idGtAG2cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: mTqnQfUtDYn6mUEWImP1uhqMhfeBvpfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Sat, Oct 11, 2025 at 11:32:26AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v5:
> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> - Place the helper functions in the same compilation unit.
> - Add more comments about parent device.
> 
>  drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>  include/linux/usb/typec_altmode.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
>  
> +static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  to_of_node(alt->dev.parent->fwnode));

You can not do this, unless you make TYPEC core:

depends on DRM || DRM=n
select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +
>  static struct typec_altmode *
>  typec_register_altmode(struct device *parent,
>  		       const struct typec_altmode_desc *desc)

-- 
With best wishes
Dmitry

