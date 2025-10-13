Return-Path: <linux-usb+bounces-29190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613ABD1330
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 04:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17CD3BE5E5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 02:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FA5280014;
	Mon, 13 Oct 2025 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBt1V/4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB962A1AA
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 02:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321528; cv=none; b=GxoRdN2kvXOTDmQYhyiEjE3zQA2WRWQ7YPRJ/DO0Ncp1M+XD05ArDF+crv97ttWfH9tWNb/Y63e5/vffcfXAu5G0K4jVF03h+G3QNuf1093Pd/D8wnx1yc6I6ziD4badSi1eGoWDRI+ax8tz3mIctazyUMma4p2tSjwtdK1GDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321528; c=relaxed/simple;
	bh=x0LwWrdaES//1++J0BCHAr5V+/KFaqAOh04QCmwHVD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paTV/W7t+/cDb+DEmJBgcDCZOTKzbD9Jd3wgtEiqD2SlG/qNIR5UgZP/aVHIKzOU4ZHJrk1JYRBHzHfp19nboLW4rUFY6ugH/ZiyupGyrRPi9VTVFP6WqP7rd51rM81bavs+JY5yVz0pu2RCRO7UP7wnbkpggDjOmDC/fJVYLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgBt1V/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CHfnXd005295
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 02:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86ZWYyPnzwyBT1SEdx2OYD4Y
	N65eSOUUs/UhqpCdnLU=; b=DgBt1V/4SL91g2tYdnkd8pnKY7IuVA+EB+yRk0Vq
	v8PHbqTD0VzuzZyY21lKErYPzBoXYywy+s4e9jCOvA3kPBADojpuhoAXBxGvmtgc
	BT4BG9IFTTf8n2dEjw2F/8FWrtb31sviYrI5Se30CpVvFpocz165YwzJHDEKo1fX
	frSI4/nEPXQqFlP2+MjVLT7S48x0lOc+kmYEdEaEKYzGPP5zSJxvf65fBjKr1EPQ
	38PCMSI5I4C9C61Kd9DqFv0aJrFSHpfv19sw9sqCiu1xKoh27NK5iv8bqgbbvXIi
	YOqcZu0byPqYfQcYHIC/NJIBC6pMoZTkbHOFEA7f67qLwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhtyk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 02:12:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-829080582b4so2155622585a.0
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 19:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321524; x=1760926324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86ZWYyPnzwyBT1SEdx2OYD4YN65eSOUUs/UhqpCdnLU=;
        b=SMSVNICd+mGST6AUjGfWkK5eLQ/FEb4CRo3pLaTF+f1eiOiaEgiEMJKZmsz9nkizKW
         9dhETiwK7XB5zhZd8nRzdh0Tx3ArIP2OPElkDglY54x3GOsLw5EtfyW+MqKOhxv3sG9G
         4HjS6ocy+1T63eu90xn/60l+heA5mlAYCqU6uAkBbuU6je05J9ut/kVsrv7o9JrGCWaH
         cmdgz9qgykQ5VM90wCDAxkAZh8kvsUjGO9wwj1BJWQTnbpgHmSlQB1FgmqBKOQiTCbxB
         FyPLFU1/+9yKbSepBMtn/zQAlzWuz9h3EogKRc9BRMTWoPUkthrRJXSsJ/+cf9APp6yf
         PX7w==
X-Forwarded-Encrypted: i=1; AJvYcCVsosu8yBZfpd9t24UKsjjwyyXFJsrBlBSPUux3n+89SbyePzkLqdXiWTKrO0fuC5bLzCIb9q/ClrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAskBY/atQq+KZitODhr5kJz7SzHYKj22xvoMRi7kXQeDkMzB9
	Q8TcJjZvTpE6VTpfwETVYzx4Y95/ExzrmvJsZgv9vton9MfjumXJPQ93lTVhHPiLHw4CHQjACby
	d8XX5OVbECyoObtCwVcC3Eb6upI0oaU8d1PRjE8SG/1hnpNiGv6r0gvfmLppjqew=
X-Gm-Gg: ASbGncv+T62ENtEpGQeS1+mAMp9iCuZjiWYD1ezoEf7dlmnqx5FYB9DstXA5MYM7W+w
	VRo7fYSIXYi0AoI6nkLUnyg2BxDEX8Y1bv6idW74apc6RSWwZuEh0DSWXzUVBKN6OBJvcCAoIuZ
	gHeEuT4p1rcnYmifqiLJ+RPtA8zfcwePN0LkVSncxSsSziYBPWxYe3k2wHetlrdbS84Rafe6+Z/
	jyzU2FVhWQg+9ofWX1/FMtN+6X0SeB031NQack9SKAL4fzIK6s9QxEG5+xqjbkD4oFb4MkIilSe
	5eueyiPgxgGxbETB/zb6O7JjxM9DdK3Gz8nkDJMdaTnJN+zmrBwm13A21HakrmlnZV4aKEzLRLx
	jd0U5+1SjWS3zh2JNLId9XHbgfmB4l7V1A680AhstOHndgPt7eDb7
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id af79cd13be357-88352d9a142mr2371626785a.78.1760321524317;
        Sun, 12 Oct 2025 19:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMoQF7op5MF9g/GW/8bpQeNO9MGh0k/WN4mxk7m/kz0sYWr+GEzFx7kK0Z0muN7KMj1v1Eng==
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id af79cd13be357-88352d9a142mr2371624385a.78.1760321523808;
        Sun, 12 Oct 2025 19:12:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5909a119fdbsm2285439e87.112.2025.10.12.19.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:12:01 -0700 (PDT)
Date: Mon, 13 Oct 2025 05:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <6hilafgpdbsppeeib75b5uamwf22kbu4likcp64ahb4u7zehhw@c3mtlzwx7qcp>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-7-kernel@airkyi.com>
 <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
 <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+X5YLYaEknLU
 FuNzgz4K/7On6QULWZdm/rYzasYNTZkmVoUojlONNepiRJkpvcrR7SSiKkxMuIgz4PZ6Z0EYQ2e
 fKnHO2pATzjxrZpjw5QasVTMswZl5aXa5vwHgbxS8R0AKwjA4lqmmM3pkCkCYNqsbAuSf/56F0m
 P+NsVJE0CW6AMyXJvIqcpX+W/bCHKw4dLVWskWnyxZUmNfZTryXDMdhPXOKsGHz7UcDTqAJsmKg
 E7KlfZdLXhOlk/rIdo09Xnol3VPYsyOgE54gwbM/rii+enCBkKbySrpDvI9UkuxSbR18LN3WZVg
 AJsTsNBkorBpvv6qgx8yTrYbK76n0RqY6k96hhiv8+fazp1xz7F/J7xFtwSbBMigBM8pFbvwsQy
 8jwTWS0rsU3ojCwJNcsHicGgVGVQgQ==
X-Proofpoint-ORIG-GUID: ynhUZMxrZ7IbFXs5oM6Ogolxw-kOjGM9
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ec5ff5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=46buKmVFnKFTYA1G4KoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: ynhUZMxrZ7IbFXs5oM6Ogolxw-kOjGM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On Mon, Oct 13, 2025 at 09:26:06AM +0800, Chaoyi Chen wrote:
> On 10/12/2025 2:52 AM, Dmitry Baryshkov wrote:
> 
> > On Sat, Oct 11, 2025 at 11:32:31AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> > > the CDN-DP can be switched to output to one of the PHYs. If both ports
> > > are plugged into DP, DP will select the first port for output.
> > > 
> > > This patch adds support for multiple bridges, enabling users to flexibly
> > > select the output port. For each PHY port, a separate encoder and bridge
> > > are registered.
> > > 
> > > The change is based on the DRM AUX HPD bridge, rather than the
> > > extcon approach. This requires the DT to correctly describe the
> > > connections between the first bridge in bridge chain and DP
> > > controller. For example, the bridge chain may be like this:
> > > 
> > > PHY aux birdge -> fsa4480 analog audio switch bridge ->
> > > onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
> > > 
> > > In this case, the connection relationships among the PHY aux bridge
> > > and the DP contorller need to be described in DT.
> > > 
> > > In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
> > > determines whether to register one or two bridges.
> > > 
> > > Since there is only one DP controller, only one of the PHY ports can
> > > output at a time. The key is how to switch between different PHYs,
> > > which is handled by cdn_dp_switch_port() and cdn_dp_enable().
> > > 
> > > There are two cases:
> > > 
> > > 1. Neither bridge is enabled. In this case, both bridges can
> > > independently read the EDID, and the PHY port may switch before
> > > reading the EDID.
> > > 
> > > 2. One bridge is already enabled. In this case, other bridges are not
> > > allowed to read the EDID. So we will try to return the cached EDID.
> > > 
> > > Since the scenario of two ports plug in at the same time is rare,
> > > I don't have a board which support two TypeC connector to test this.
> > > Therefore, I tested forced switching on a single PHY port, as well as
> > > output using a fake PHY port alongside a real PHY port.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > +	/* One endpoint may correspond to one HPD bridge. */
> > > +	for_each_of_graph_port_endpoint(port, dp_ep) {
> > > +		struct device_node *phy_bridge_node __free(device_node) =
> > > +			of_graph_get_remote_port_parent(dp_ep);
> > > +
> > > +		bridge = of_drm_find_bridge(phy_bridge_node);
> > > +		if (!bridge) {
> > > +			ret = -EPROBE_DEFER;
> > > +			goto out;
> > > +		}
> > > +
> > > +		dp->hpd_bridge_valid = true;
> > > +		dp->hpd_bridge_list[count].bridge = bridge;
> > > +		dp->hpd_bridge_list[count].parent = dp;
> > > +		dp->hpd_bridge_list[count].id = count;
> > This looks misnamed. They are not necessarily HPD bridges. There can be
> > a random chain between your controller and the actual output / connector
> > /etc.
> 
> Yes, and more precisely, this should be `pervious_bridge_list` . Will fix in v6.

I think the typical convention is around next_bridge, not previous.


-- 
With best wishes
Dmitry

