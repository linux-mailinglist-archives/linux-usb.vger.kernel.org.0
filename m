Return-Path: <linux-usb+bounces-28666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E2B9D5AA
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 06:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21721B247FD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944922E03E6;
	Thu, 25 Sep 2025 04:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd3iiixg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA12B9A4
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 04:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758772895; cv=none; b=hy6AvBjAIOGDqvwTkY8oRBgRTNuHbD/G7k7oH90s2IVX4iaCDXPS1LE/sjFleefh5hXr8BxkD2IVaidDiK0LLNpEvmLfN4rt382lSdNzZ86mwZXySRs3EVIMznMglj17XFzpHe5tUGa+IL6v207FxIQAgOWBoxkNMRGRXg5NGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758772895; c=relaxed/simple;
	bh=mltzWSoRo4aSFNCSSfrIEvvKL2bYpbzc1mxn6znqqqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaKbqvFLylQNd7ZeLUZ90lkuJbzfDmPJw8+PtYc5XYjT+RIPU7NArpANljg8GrA2zj/VUFj3DYHFWkONhGkKriEctBvAP/7Z07sbWW+nIy2+yvc04zC7Tj4jSc1e4gvkvF/Xese7ojavp1cOp8J8FbkIvhjKPkR0hASTQTYP6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd3iiixg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0JSlC017434
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 04:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=; b=Pd3iiixgXSsj/gci
	E3l4G7wAxQyNa42+rTKII4AMq+rUVNsGkBpa/g5SNNPnOf/hI1BhC7MX0Zm/dK0i
	Xg5dPonGOJ2QBpcTTrHrbJGJRD2WQLjandGmfdUEONhh6bwc+9v9UGe+Dp2+w6Tt
	tTY0XzEcYKzya1Ti8L21OaqMELHUkrzM95KGvQviKfIiSkXYXlGiPEb6XYa0ch5Q
	YIs6a0SDge50q2pxK5cLXKYO9RV0x5C9FO8WTE5CpZbK92u4C5UOi7156BOgTBXz
	oRaGhF4DEtw6Yu0ojWnFbXJYYKAWYu5IZ5Jc9px4mtpyWmwsZzVyU3bISfeVmtty
	DE9e8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk00gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 04:01:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d9a3ca3ec8so10250541cf.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 21:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758772891; x=1759377691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=;
        b=DRXJ2iV8HA9RluuTinOuT00WQmALvbVPiwARWkhCYt47PvnBY3ehDs579MQop2jgnG
         jPQ0BNUSWHavDLjJNxRutZ3l59ZzlWMAhamHxhh1nXyktJuhqfkGG+mdVeeOp3sg6x/3
         iDRQrgfqJ+178EaYwSCj2abDs6ErFVylaBrh6xEryOp4zECs9IqWvLo8m68xBI3rqiJ8
         2gEXoDoxpa0Ta8IEnpNThXpqTLwWZEua50yyoI//bKdfGrCzpV88AnQjFzCGrRYKgPmO
         ijF4gBYg+WNaTHetMCL2rNIVDAK/D7IVZX6WIbZuEC2MyXR0vvFY1fFCkXmYOlkQF94U
         BA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXR8rGadWajE6It+QvXbhNrpLblJ1+v+kW1GXTZ+UL1rSL1OyYXe6oDi7KWeXH2DN2LNQjmzo/WDCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTnl3RuKhaOnjIiXCzz30pedB27UWcqXx5pa13w9M9wIooZ/o
	1bQbfWtbCdAIOqughztrfjqJ1ve2Q6/OUP15kZKHDZW3OOHqU4ULCuykSh9KchqX+Pjp+2Qaa6Y
	OnydnPQMLkwTr4Ru7YF/QgAX1vIavaueJJGXgDFz7OvU9FI+pXOm+uiBsfsXQy5o=
X-Gm-Gg: ASbGncve6B1BJxSVo7Cqoc/rE31M8b3KbGql0KrXKunqtNMjTY/Q1yc3+X5cCmfjzuw
	/EalQmagHNnVG6Hp0lDrzDJY5GsxZxaH89OQK0u2T+ENllyH9tl+LM/e9LpN29T4ljSL+ToWiZ7
	Af6k/M2yQFxg8z/moP0StxCU8mFWXCy3gxKkU67e6PDZHuXhTIGl1vMY0zmI04qiloPuhJsAVqr
	NazD6BjVe9l2hcla2C/ykl2RthDs2vgm4TSpNdd2kfFiXM2qrqwmqd6+3VR0bQbaNEUDVlUaS6D
	HO8Za3GH6qJJGYF/UBwNDDber4Y27QjUR7fpohQ47a7R7JzQ82ZPlnu+E4cdJNEP5YNktweGOjq
	lA3K1LcLrdnE+BnhdP5fMhO3KIDmdcUqjH1IRexc65aMoE0T9R9+9
X-Received: by 2002:ac8:5949:0:b0:4d8:fb05:d12b with SMTP id d75a77b69052e-4da4744e2c2mr27729791cf.10.1758772890808;
        Wed, 24 Sep 2025 21:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZca+Iw2GZZsul8eiKgFQhtN//Wh11qIWaGFhGrwSz/NV22XiiNrfgNPym6U08AZdNqARbEg==
X-Received: by 2002:ac8:5949:0:b0:4d8:fb05:d12b with SMTP id d75a77b69052e-4da4744e2c2mr27729001cf.10.1758772889959;
        Wed, 24 Sep 2025 21:01:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4773b19sm2521751fa.13.2025.09.24.21.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 21:01:27 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:01:24 +0300
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
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <6jlv47fgiq4anpflbs6agre4irf7grgvzorrk7roxwprtyuek6@edrya2syhchi>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
 <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
 <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
 <sgvrzhbhkzxbuybmws44kyenhfyppm3blijkarypcin4fiscvx@mnajrlmicyxi>
 <18f55fe7-7c68-4982-916d-11752325c667@rock-chips.com>
 <bh73nttewwhom2pqccfnapnfkrys3zljkykgqmh4hsdalqgyzi@gbl5oejxsp3z>
 <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
X-Proofpoint-ORIG-GUID: -daVDc4lXqTYFVaUOLYsi0tBflU7X9_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX5efq70uYvzxZ
 E6FUtU0pqmuy16kD5S3MpEC0vfbtVgswNLCI03a+vPHktktaf1enlKLQ6fRRW19tyhnAiQ1csOq
 BcPg3oUA3VKJ6QU1+0ZQShLyJRxO+8pdyDUi99PDvnqmW+rtPm00bcVshcggsnznU08Rog/4+U8
 LjYdeg1cwzuj2dFRK4H7ldPjv3J0UgvcUQuvXZgZNS9hBaZpaJfnoZYFDYoWCr56e8JJhMWD55P
 fvUQNSluugI1uuJaWXJNe22MaeSYFRhcCOvrv5kRVsPabg+hogsK7Sr4VzuX+2aiwYWDpDRwUtB
 bDu+S2MyfsBPj3yVqXEtCul1pa+3EgWFn2icDCXvMNcuzm+AoIwhRwdZAhWakJjitfvR5Ca9oVp
 Lo28JXki
X-Proofpoint-GUID: -daVDc4lXqTYFVaUOLYsi0tBflU7X9_X
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4be9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8 a=nLKCdIsASqLPV_WZ6OsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 05:55:39PM +0800, Chaoyi Chen wrote:
> On 9/23/2025 6:40 PM, Dmitry Baryshkov wrote:
> 
> > On Tue, Sep 23, 2025 at 05:07:25PM +0800, Chaoyi Chen wrote:
> > > On 9/23/2025 11:11 AM, Dmitry Baryshkov wrote:
> > > 
> > > > On Tue, Sep 23, 2025 at 09:34:39AM +0800, Chaoyi Chen wrote:
> > > > > On 9/23/2025 9:10 AM, Dmitry Baryshkov wrote:
> > > > > 
> > > > > > On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> > > > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > 
> > > > > > > Add default DRM AUX HPD bridge device when register DisplayPort
> > > > > > > altmode. That makes it redundant for each Type-C driver to implement
> > > > > > > a similar registration process in embedded scenarios.
> > > > > > > 
> > > > > > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > ---
> > > > > > >     drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
> > > > > > >     drivers/usb/typec/altmodes/displayport.h |  2 ++
> > > > > > >     drivers/usb/typec/class.c                |  8 +++++++
> > > > > > >     include/linux/usb/typec_altmode.h        |  2 ++
> > > > > > >     4 files changed, 39 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > > > > > > index 1dcb77faf85d..e026dc6e5430 100644
> > > > > > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > > > > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > > > > > @@ -14,6 +14,7 @@
> > > > > > >     #include <linux/property.h>
> > > > > > >     #include <linux/usb/pd_vdo.h>
> > > > > > >     #include <linux/usb/typec_dp.h>
> > > > > > > +#include <drm/bridge/aux-bridge.h>
> > > > > > >     #include <drm/drm_connector.h>
> > > > > > >     #include "displayport.h"
> > > > > > > @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> > > > > > >     				dp->pending_irq_hpd = true;
> > > > > > >     		}
> > > > > > >     	} else {
> > > > > > > +		if (dp->port->hpd_dev)
> > > > > > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +						  hpd ? connector_status_connected :
> > > > > > > +							connector_status_disconnected);
> > > > > > There should be no need for these calls. Once the HPD bridge is added to
> > > > > > a correct fwnode, the drm_connector_oob_hotplug_event() calls should
> > > > > > deliver the signal as expected.
> > > > > It seems that only drm_bridge_connector can do this. I'm not sure if I remember correctly. I'll give it a try.
> > > > Other connectors can implement the .oob_hotplug_event call. Calling
> > > > drm_bridge_hpd_notify() also depends on the connector setting the
> > > > callbacks via drm_bridge_hpd_enable(), a step which is done by only a
> > > > few drivers.
> > > Hmm, let's go over this again. First, drm_connector_oob_hotplug_event() requires a connector fwnode.
> > > 
> > > On the Qualcomm platforms, the fwnode corresponds to the USB-C controller device node, so
> > > 
> > > drm_connector_oob_hotplug_event(dp->connector_fwnode, ..) can handle them directly.
> > > 
> > > But our platform doesn't use the USB-C controller device node as drm connector fwnode :(
> > This sounds like an issue to be fixed. Alternative option would be make
> > the AltMode code find your fwnode and report OOB events against it.
> > But... I reallly think that using connector's fwnode is the cleanest
> > solution. In the end, your final 'display' connector is the USB-C
> > connector present on the board. If your display has a USB-C connector,
> > that will be the socket that gets the cable from the display, etc.
> > 
> > > So I use drm_dp_hpd_bridge_register() and drm_aux_hpd_bridge_notify() here, I think it just create a simple hpd bridge to bridge_list.
> > > 
> > > But drm_connector_oob_hotplug_event() use connector_list instead of bridge_list.
> > The OOB interface was created by x86 people, but we successfully reused
> > it. I think that addign drm_bridge_hpd_notify() calls just duplicates
> > the effort unnecessarily.
> 
> Yes, that commit comment said,� "It was proposed to add the displayport OF property to the DT bindings, but it was rejected in favor of properly describing the electrical signal path using of_graph."
> 
> But in the embedded case, we don't seem to have the opportunity to describe this kind of of_graph relationship between drm connector and usb connector in usb-connector.yaml. On the Qualcomm platform, the DRM connector fwnode to correspond to the USB-C controller, which is a clean solution.
> 
> However, on our platform we are using external USB-C controllers. In v4 and the previous versions, I focused on directly linking the USB-C controller with the DP controller. Referring to your suggest in [0], I think maybe this can be achieved with the help of the drm bridge chain. Assuming the bridge chain is like this:
> 
> 
> Other birdges ... ->PHY drm aux hpd bridge -> CDN-DP bridge -> DP to HDMI bridge or other bridge or nothing...

Looks good to me.

> We can use drm_bridge_chain_get_first_bridge() to get first bridge. In this case, that is drm aux hpd bridge from USB-C controller device. Next, we can obtain the fwnode corresponding to this bridge, and once we have it, we can set the connector's fwnode to it. In this way, drm_connector_oob_hotplug_event() can take effect.

drm_bridge_chain_get_last_bridge(), yes. That's what
drm_bridge_connector is doing. You'd need to make sure that there is a
drm_aux_hpd_bridge() registered for the USB-C connector node (from your
Type-C controller driver or from the altmode driver as per your patch).

> 
> 
> Would this be a good idea? Thanks.
> 
> 
> [0] https://lore.kernel.org/all/p3kgqn3euumhysckh4yyqavqv5y6any5zcrgkrcg3j5a7z7cyw@lfpkla5p3put/
> 
> 
> > 
> > > 
> > > 
> > > > > > >     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     						hpd ? connector_status_connected :
> > > > > > >     						      connector_status_disconnected);
> > > > > > > @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
> > > > > > >     	 * configuration is complete to signal HPD.
> > > > > > >     	 */
> > > > > > >     	if (dp->pending_hpd) {
> > > > > > > +		if (dp->port->hpd_dev)
> > > > > > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +						  connector_status_connected);
> > > > > > >     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     						connector_status_connected);
> > > > > > >     		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> > > > > > > @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
> > > > > > >     			dp->data.status = 0;
> > > > > > >     			dp->data.conf = 0;
> > > > > > >     			if (dp->hpd) {
> > > > > > > +				if (dp->port->hpd_dev)
> > > > > > > +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +								  connector_status_disconnected);
> > > > > > >     				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     								connector_status_disconnected);
> > > > > > >     				dp->hpd = false;
> > > > > > > @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
> > > > > > >     	NULL,
> > > > > > >     };
> > > > > > > +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> > > > > > > +{
> > > > > > > +	if (alt->svid != USB_TYPEC_DP_SID)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> > > > > > > +						  dev_of_node(alt->dev.parent->parent));
> > > > > > This needs at least a comment, what is dev.parent->parent. Also, the
> > > > > > of_node is not correct here. It should be a node of the connector,
> > > > > > rather than the device itself. Consider USB-C controllers which handle
> > > > > > several USB-C connectors (e.g. UCSI). The DRM core won't be able to
> > > > > > identify the correct bridge.
> > > > > I think� alt.dev->parent->parent is the connector device. Am I missing something?
> > > > As I wrote, it needs a comment (in the source file). No, it's not a
> > > > connector device, it's a USB-C controller device. There is no guarantee
> > > > that there is a separate struct device for the USB-C connector. On
> > > > Qualcomm platforms, the device will point to the USB-C controller (TCPM
> > > > or UCSI), which contain usb-c-connector(s) as child node(s) in DT.
> > > Thanks for the clarification.
> > I think it should be fine to pass the fwnode of the usb-c connector that
> > is outside of the USB-C controller device (if that's what your platform
> > uses). But I think this should be:
> > - the usb-c-connector node
> > - it should be coming from the Type-C controller driver, you can't guess
> >    it here.

-- 
With best wishes
Dmitry

