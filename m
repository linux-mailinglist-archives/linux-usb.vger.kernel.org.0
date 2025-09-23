Return-Path: <linux-usb+bounces-28495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E68B93CAB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E48A16D5E9
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 01:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B4117A2EB;
	Tue, 23 Sep 2025 01:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQP4aTFz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CEA932
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589824; cv=none; b=SL8oSp+agw7PfklPS+1CHu1Dkjd6nxdU3zFK/goigaeRUseTznFP7rw2vElgcoawJzXf1nxJzDfTY+L9UzrailTMrCJQYMZD/eNaPFOL76HVgByP5sN81gNLVL85mTVnyYFQ2Qz+HJU3M+hKzHGH2eYlgIEapKCtruGfPtM9v7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589824; c=relaxed/simple;
	bh=501NnXw/vrwTNNKzpgjKhyMk9+1FZM3Scq0hSgAKlMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2P+OCqNZ8YS0H26jc7lG9E+RNMYLP3aLDrGPJoMY1+o+hGSXTP5otjjIxzGYwQY9WDky5E3J7giHWgJjdfTHze4qu/BXHet0LQQTGuFhdx5l4ed4uYhRjV+wdCae3eBuPdhh1ElBjoV08X2y9KVUfd46O8XaqP83oJ6v3JAMMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQP4aTFz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MH66XG027910
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aC6xtZ2Xq3V/aoM/1E2yl/Rv
	YTGjb8DsxBZkEhoHUs0=; b=kQP4aTFzNQ2UuzbT4ikHpSFm3WaFRyXiNs2GrX1D
	NOWQh3swouH9vJ1fAxVXC6PCPqnticuckinCgv8kquP2cFLdmTNHqGDbpgIh3ic5
	HhdSV0BKnlWkJLFZeGrTyNU2cQym6INqa8JoGWm3XQiSkQd1Fv+CWSb1KePAMs2k
	wGIvF9VgWOBP9v+kIAh4IRCzFD1nQtI8BHSCyjVKIOz8cr1W+zSd/EEDTKsqq248
	YjLoM6Pq0PFnCL7+VWkYLy7Cy/zDlG7J3Z2vOWAuA+pfn3YrzhzFUnQ9mU9MG101
	Hb90tz017gvT47+qynKe99HkOwpeaZHUOOOyb39SLXiPMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajes4aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:10:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-79e48b76f68so88759686d6.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 18:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589821; x=1759194621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC6xtZ2Xq3V/aoM/1E2yl/RvYTGjb8DsxBZkEhoHUs0=;
        b=EOPiN9aliByuU0e71mlv6wmjcXgu5XBq7ZxF1zCsYZUTZPlGJ45VJXUGGNDvfdmKqW
         jGTnARkaHnIEHDy770+P6yQYFtf6YASgX1WzceX6kJ+dI4B46yjbMA3YjFoUxMGktrig
         /ujEcdmn0K1yS5eAg12LnGfo/ZtDolAYx1Nu8gw2Asv+vowssgvsoIeJKdizsOLFTI6d
         g+ZQxkhbGhnuLXR1tWcNBgbmLOElrCG3C9Jv2uqsXPkegPkjhNxF/VdsCtalMIKwDeq1
         13OjqoTieoorSOdDv6mEqwoElM9CrI2lWcakfVweGx0rJJymjWVjJ4p0PSvcdUbyIL+V
         yCdg==
X-Forwarded-Encrypted: i=1; AJvYcCWt+jVskogF0eoGqvb0Vjof5X+KWca2OJW9z6eqXylnsj36CU/kpSwUTi8iLkyw2tOzWokKAkmce4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3L0mtwGda9R4yUDH+UNO/9+1/PVynBV36LEAao8DgQnELu4Hn
	cn0DXtq4Rty8LcwMRk7a9m4mHf0nqGOzstXyzmgLIrSlyISVqd6Aq6iifn4ra4nyY0hltWSWZ2a
	6kqKftsd4inpF+cgYwM8/V2bsjG15/mZC1WCAppV3JRpAoOj7CyoaWXG1XUcJzN4=
X-Gm-Gg: ASbGncvg9jmlMtecwf0Q84nPRT0q65vOHp60FC9dJNfJdw6/a1/CqDB7+rK0MWoXGwK
	5c2QPQHIaN50221ugbQzLoRKQpAUjCFyVM/rc+JGQUA+YWruOsdPSPkTAXKf8DPXhc45R3a1bpA
	KZ43ljwIY8Fj113+VSdxK1g/3efaSJj27OG7b4jTB90gcNlhfAyrsjSDv9NsPRdwh3d58Ao69QW
	kpe4uH2zxXnHJbZmZm7h6EX8aPbEIM4eYAjSJbdNfixHn0DG6PxU3HWeiXyUvQyWEBlXysVnl6R
	C7IZI1dlcD75LufD/c8TJr3PiYshEiktoumff8pXomYv0H+wH5Tbh3x1VUSAWXv77s2TLILQ95N
	xlArpdciuDeGMJfoszAauI9Ho0lZAmtd8e90VWVepYK96GlIDbrJ7
X-Received: by 2002:a05:6214:21cd:b0:75f:6116:83e with SMTP id 6a1803df08f44-7e712ef9c76mr10312056d6.37.1758589820547;
        Mon, 22 Sep 2025 18:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/AqhiaebrPXH+fi3RCpVWDIqMTUfClYaLPwNMtBGbndVg1ntx4aReI8HayNz/8sSGkQvDNw==
X-Received: by 2002:a05:6214:21cd:b0:75f:6116:83e with SMTP id 6a1803df08f44-7e712ef9c76mr10311466d6.37.1758589819848;
        Mon, 22 Sep 2025 18:10:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579e716407dsm3036752e87.97.2025.09.22.18.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 18:10:18 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:10:17 +0300
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
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-2-kernel@airkyi.com>
X-Proofpoint-GUID: 9oWBlT7Yj71GT4itx5w6q93bWsBQUX13
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d1f37e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=BpK9xR3a_xoX_XwHwW8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXw9lqhMBuIsEq
 hM8utTmBrZly40w4EerKnD4kLK9eKUGD7KBVTindITh4fvTeJax1b3q1fLRokl4wmuS+1nFWWiX
 HhffW6/8MgeF23Ilm3YUl6/U4rC7YfnmFuFLUn/p8XlZn4rhdQ7M5OQCgx+ZAi16zUFz5/C5MI9
 K2AF7i8vlT85OQ5PUnaaPE8KUAeY0qIGMqc+V0RF4DUaTXFHIl8+g6lsL58/FNsSsmKsIt6QTE2
 y4ti80/hijKbWGqXnn5/vjxu3ACv2moeOtzwYHV3b9fheWW6JpDIh/G4v+FBv+1KMiRdR+bm3jp
 q+SnSJ7usjYjeKnaykAjAQAt0n9tWsl7Zi6w+xkPFwGF0fAM71V5LPaCwwOTM15hGDofTxZ+zEi
 t/Braagv
X-Proofpoint-ORIG-GUID: 9oWBlT7Yj71GT4itx5w6q93bWsBQUX13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
>  drivers/usb/typec/altmodes/displayport.h |  2 ++
>  drivers/usb/typec/class.c                |  8 +++++++
>  include/linux/usb/typec_altmode.h        |  2 ++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 1dcb77faf85d..e026dc6e5430 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -14,6 +14,7 @@
>  #include <linux/property.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
> +#include <drm/bridge/aux-bridge.h>
>  #include <drm/drm_connector.h>
>  #include "displayport.h"
>  
> @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  				dp->pending_irq_hpd = true;
>  		}
>  	} else {
> +		if (dp->port->hpd_dev)
> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +						  hpd ? connector_status_connected :
> +							connector_status_disconnected);

There should be no need for these calls. Once the HPD bridge is added to
a correct fwnode, the drm_connector_oob_hotplug_event() calls should
deliver the signal as expected.

>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
>  						      connector_status_disconnected);
> @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 * configuration is complete to signal HPD.
>  	 */
>  	if (dp->pending_hpd) {
> +		if (dp->port->hpd_dev)
> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +						  connector_status_connected);
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						connector_status_connected);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.status = 0;
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
> +				if (dp->port->hpd_dev)
> +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +								  connector_status_disconnected);
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  								connector_status_disconnected);
>  				dp->hpd = false;
> @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
>  	NULL,
>  };
>  
> +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  dev_of_node(alt->dev.parent->parent));

This needs at least a comment, what is dev.parent->parent. Also, the
of_node is not correct here. It should be a node of the connector,
rather than the device itself. Consider USB-C controllers which handle
several USB-C connectors (e.g. UCSI). The DRM core won't be able to
identify the correct bridge.

> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);

Having the function here will bring a typec -> displayport dependency
between drivers (which you didn't document). It means it won't be
possible to build typec core into the kernel, having the DP AltMode
driver in the module (which also doesn't sound like a good idea).

> +
>  int dp_altmode_probe(struct typec_altmode *alt)
>  {
>  	const struct typec_altmode *port = typec_altmode_get_partner(alt);

-- 
With best wishes
Dmitry

