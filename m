Return-Path: <linux-usb+bounces-28505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE371B9418A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 05:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45AF47B1463
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D713258EEF;
	Tue, 23 Sep 2025 03:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpMoLxaw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54392594B9
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758597734; cv=none; b=ArCykY94Q3vJtl7b7SJVLBid2jslsS1qfz4orIc1OE0AI5ZC04i+RgSl4SDcQzfdbgDBa1okcTeYnxbxvbasMHl8op3UlrvFE0MMsWEySo4ma6OMLzkTygTgIk8UJXnqSgN+QoTSOG8QYKZUbwZHxlRu3j/hKzfKWpt3uTkES2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758597734; c=relaxed/simple;
	bh=bsw8t9ODvBJyW/fDD+gBzt83DN+MKjLzbqZA8VUIsbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI0xIiLJXsLyoqKL/4+dGG4+73f3CJ2DJcEfVBPvRiE/FdLZoByKEN6d2OiwvzZYUA52Ou1849TaY6uuwwG3r+1o/wfrppnlUR3XPPu2tzcGCyMe+aVuXcvYJ+YfZMv2lZsLoUZPS4jeuiR2F7Jdx+PsVB8krhnjMV1OGvFDrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpMoLxaw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHHAmj030265
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUnJ2CE0BnHDgBWcL76+TzXIrZ4HxTgehwBTbISxmcE=; b=kpMoLxaw5pxOjYcc
	CKzOGh6j55O1iok4v8USxkJW92/TEHIvWEMIX2HoCD+QyCNCKQTMWZFBCR6vsjDO
	mVO1uo8lPfJuI2O6eAFfXYgU/aSZHZ7rAFeOPKx3QxxydcsQj4fsPjwwZN0CwP2Q
	CXbX42afkayRcQwlSti38gjZN3+aciVwO1eRvdh8JBL13zdiLuxLrDIXFXP3yBXr
	S8K+Yk6HS9tE34d4EJYkCCP0ogAbwWWAwr0cZpuMN3IELugNUWvM81LB2MWI9YX8
	Oc1Z+yIcC7wzetn+4IEBU0Ck/a9GCTtrCg4cydfqaE+BFgmzn1nTEpTiliahtu3N
	amQ9kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98eyvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:22:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78de70c9145so88596026d6.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 20:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758597727; x=1759202527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUnJ2CE0BnHDgBWcL76+TzXIrZ4HxTgehwBTbISxmcE=;
        b=fBfNzgOgsFPWdgMYI8NktuFNw2oy/r+DWEJMWrriPixhMbPrFLuxXFR3zH5DwCKkqb
         hP81af0649rmUcUX5TVHqTtOyZKWTeecAK2r4n0p2EpZUmTyth79dLwOVRlEdqblLvmu
         dddyqpe14lYtWKzxDQHoEmixH+hWamShWVLH/zWAZRhayaGw522BFNEfs69WF0//acF0
         b5Bd3IwCAPEWS5w7uEQC3HDlVEmGh1Gf+GHN7dw0hN4+msqdyBit7b4DuooqdnugBE7u
         Gdy4CJ5FTljiwnlxWCQZ46C25dDWNXDSa4peHFvBREVKUClkz9YbnpBzrB0Awh1uWWJX
         J/aA==
X-Forwarded-Encrypted: i=1; AJvYcCXfraGgHVez/4/NaUmTziVSFVCOZbFuK1Qmvo77nyC5+Rpl5MR7wQEiMbweRpJPw+O7iWxM5ijxssk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ncSfHAY7Dkjwndaqenidt6NkIAaVrX4hAuEpBitTqDpsBKc/
	DotXkTa8eY6pKtCdQzPslgkY54OMa9v5imk3E54scYWW2VMlhYgJeLw1IWTTaxIiFPTbcVMrEW7
	xPQ9XXvHbHL9LCMJ9+a4s04LBKCCsc8siEsPqryatLpzVbWZTWw5zEQ9Mvfb8AXk=
X-Gm-Gg: ASbGncsuifluRHB13E9Ktdv1NB/ZmhHqyDd+OKsErH2w5VoZjRoPYutpeeBm336uzyq
	6PfPP8e065IbFDt8Ki4d440qF39P5Ed9GRbVSzWXSIWE8tYtcmPGz0RfH7n3vgMoJ+xyP5ACz8+
	2z4FfRwaS52PEz9panq9WcIMzVyYS+cnyPVjaD7vIn3IYy7yxB3aKxRKxq/pqX67ZuiqIvsmXHW
	O6577ZJ3n8tIo9b+JBaNPcSieYa6tSv+mWDS0BTPAlYIpn0LpVTNYe/hsu/WjiQRWeaDTOeZlIl
	HheYdPM1YmGiWjbz4R+HWUxsQYEtloppOfvdrnJSTe5X/n0f98vll87d+wRNYsDdUoCsfI8sI2o
	Ip6t43rUPjU4euN8KN0S3lfSutmfsEdxEiC9Jpvge4m4d7XBbwcBK
X-Received: by 2002:a05:6214:19cc:b0:78b:e6ac:7169 with SMTP id 6a1803df08f44-7e7131d6edbmr13878386d6.32.1758597726909;
        Mon, 22 Sep 2025 20:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIgFDuQXlz78aQgFJIuN6m1QzDuD7QbClf/2Di5vm32tNyLwxeGQHA2RXdv8rX7kJSHv2lUw==
X-Received: by 2002:a05:6214:19cc:b0:78b:e6ac:7169 with SMTP id 6a1803df08f44-7e7131d6edbmr13877966d6.32.1758597726347;
        Mon, 22 Sep 2025 20:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a8fad2b6sm3799691e87.69.2025.09.22.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:22:05 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:22:03 +0300
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
Subject: Re: [PATCH v4 5/7] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <3n6gvt2lcf24smt6njiqoqt5h4733z36hwvc2zfyft62d25uu5@vwl26mmsfzbz>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-6-kernel@airkyi.com>
 <idyrlzhd5sotg3ylr7vbwmczimglffc75nafxbnhhm3ot2jn4w@ixerm6elfmre>
 <e10484e2-fafb-4e50-866f-f409c12259a5@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e10484e2-fafb-4e50-866f-f409c12259a5@rock-chips.com>
X-Proofpoint-GUID: l4kmTB3q3Vv90t1fiCDYmbLMS7anRqxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXxI2oz9ljF8oo
 En4GqIu0Uev6+6U5Rq1Imh8pFF98QuNw8A80rPfQe2mo7b2P9yyH3o0BOpGryLmDmTharWao40b
 Z2D2BqozpS9kKMGYwTUt1yFOaS6wZ9JrC+iORHmVtRb1/opHl1UkJfl2iqCij7Mwd+K84ZNhokI
 EdTPIm0A/VdOMkv+1w9yYSPssmLbV3p/AJyzHd0Ra1HLdmTHSxg/Dz8QvJur/XVu2EksqA+LF2T
 97MFzGt1gF6Hb7P5l97O4NzIk4xQgOL5Xvnz8BK594cMwmEuO5JQUDVWrF4hjlhoQiGsmNkAn9+
 5H0HO9YLG7Cy5hxW3oj7G/btUUuBEyeAOHKzcEdiGSMbvvtXsO4tjtSk2HovVSi3bvjdQwm/yl0
 xo+NMsDg
X-Proofpoint-ORIG-GUID: l4kmTB3q3Vv90t1fiCDYmbLMS7anRqxd
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d21263 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=O6fFDK9WeBrGYpzTqrUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Tue, Sep 23, 2025 at 10:09:38AM +0800, Chaoyi Chen wrote:
> On 9/23/2025 9:50 AM, Dmitry Baryshkov wrote:
> 
> > On Mon, Sep 22, 2025 at 09:20:37AM +0800, Chaoyi Chen wrote:
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
> > > connections between the PHY, USB connector, and DP controller.
> > > And cdn_dp_parse_hpd_bridge_dt() will parses it and determines
> > > whether to register one or two bridges.
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
> > > allowed to read the EDID.
> > > 
> > > Since the scenario of two ports plug in at the same time is rare,
> > > I don't have a board which support two TypeC connector to test this.
> > > Therefore, I tested forced switching on a single PHY port, as well as
> > > output using a fake PHY port alongside a real PHY port.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > >   drivers/gpu/drm/rockchip/Kconfig       |   1 +
> > >   drivers/gpu/drm/rockchip/cdn-dp-core.c | 398 +++++++++++++++++++++----
> > >   drivers/gpu/drm/rockchip/cdn-dp-core.h |  23 +-
> > >   3 files changed, 366 insertions(+), 56 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> > > index faf50d872be3..3a6266279323 100644
> > > --- a/drivers/gpu/drm/rockchip/Kconfig
> > > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > > @@ -55,6 +55,7 @@ config ROCKCHIP_CDN_DP
> > >   	select DRM_DISPLAY_HELPER
> > >   	select DRM_BRIDGE_CONNECTOR
> > >   	select DRM_DISPLAY_DP_HELPER
> > > +	select DRM_AUX_HPD_BRIDGE
> > >   	help
> > >   	  This selects support for Rockchip SoC specific extensions
> > >   	  for the cdn DP driver. If you want to enable Dp on
> > > diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > > index 1e27301584a4..784f5656fcc4 100644
> > > --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > > +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > > @@ -27,16 +27,17 @@
> > >   #include "cdn-dp-core.h"
> > >   #include "cdn-dp-reg.h"
> > > -static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
> > > +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
> > > +			      struct cdn_dp_port *port);
> > > +
> > > +static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
> > >   {
> > > -	return container_of(bridge, struct cdn_dp_device, bridge);
> > > +	return container_of(bridge, struct cdn_dp_bridge, bridge);
> > >   }
> > > -static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
> > > +static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
> > >   {
> > > -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> > > -
> > > -	return container_of(rkencoder, struct cdn_dp_device, encoder);
> > > +	return bridge_to_dp_bridge(bridge)->parent;
> > >   }
> > >   #define GRF_SOC_CON9		0x6224
> > > @@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
> > >   static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
> > >   {
> > >   	struct cdn_dp_port *port;
> > > -	int i, lanes;
> > > +	int i, lanes[MAX_PHY];
> > >   	for (i = 0; i < dp->ports; i++) {
> > >   		port = dp->port[i];
> > > -		lanes = cdn_dp_get_port_lanes(port);
> > > -		if (lanes)
> > > +		lanes[i] = cdn_dp_get_port_lanes(port);
> > > +		if (!dp->hpd_bridge_valid)
> > >   			return port;
> > >   	}
> > > +
> > > +	if (dp->hpd_bridge_valid) {
> > > +		/* If more than one port is available, pick the last active port */
> > > +		if (dp->active_port > 0 && lanes[dp->active_port])
> > > +			return dp->port[dp->active_port];
> > > +
> > > +		/* If the last active port is not available, pick an available port in order */
> > > +		for (i = 0; i < dp->bridge_count; i++) {
> > > +			if (lanes[i])
> > > +				return dp->port[i];
> > > +		}
> > > +	}
> > > +
> > >   	return NULL;
> > >   }
> > > @@ -239,10 +253,11 @@ static enum drm_connector_status
> > >   cdn_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > >   	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> > > +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
> > >   	enum drm_connector_status status = connector_status_disconnected;
> > >   	mutex_lock(&dp->lock);
> > > -	if (dp->connected)
> > > +	if (dp_bridge->connected && dp->connected)
> > >   		status = connector_status_connected;
> > >   	mutex_unlock(&dp->lock);
> > > @@ -253,10 +268,36 @@ static const struct drm_edid *
> > >   cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > >   	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> > > -	const struct drm_edid *drm_edid;
> > > +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
> > > +	struct cdn_dp_port *port = dp->port[dp_bridge->id];
> > > +	struct cdn_dp_port *prev_port;
> > > +	const struct drm_edid *drm_edid = NULL;
> > > +	int i, ret;
> > >   	mutex_lock(&dp->lock);
> > > +
> > > +	/* More than one port is available */
> > > +	if (dp->bridge_count > 1 && !port->phy_enabled) {
> > > +		for (i = 0; i < dp->bridge_count; i++) {
> > > +			/* Another port already enable */
> > > +			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
> > > +				goto unlock;
> > > +			/* Find already enabled port */
> > > +			if (dp->port[i]->phy_enabled)
> > > +				prev_port = dp->port[i];
> > > +		}
> > > +
> > > +		/* Switch to current port */
> > > +		if (prev_port) {
> > > +			ret = cdn_dp_switch_port(dp, prev_port, port);
> > > +			if (ret)
> > > +				goto unlock;
> > > +		}
> > > +	}
> > > +
> > >   	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
> > So... If I try reading EDID for the PHY 2 while PHY 1 is enabled, will
> > it return NULL, even if there is a monitor there? It totally feels like
> > this is one of the rare cases when caching EDIDs might make sense.
> 
> Of course. I did consider using cache, but if the monitor changes, then caching the EDID doesn't seem to be of much use…

Yes... It might still be better to invalidate the cache on the plug
event rather than always reporting empty EDID when another monitor is
enabled.

-- 
With best wishes
Dmitry

