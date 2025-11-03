Return-Path: <linux-usb+bounces-29987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B0C2A024
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 05:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 886C2188FC37
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 04:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362F72877F2;
	Mon,  3 Nov 2025 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtM8VIIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ayl8dtNe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278E72614
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 04:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762142465; cv=none; b=sigXH+L5G4YJ6Nd1OVeACJM0YSY2wO1UqSGThUe2TATXtkfCmi1SKpKKIhiVl06twwgOwuvek+O29YczxeXR/eUw2B7TzSZyRV2sZ1Xl8JlxGdwv8NmHvdznln4C95YWK1GZlKYyWiJSektn0zK+p3JM7vhkFbcy+KbtJUo6qHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762142465; c=relaxed/simple;
	bh=KTCHBedtUTHPyNKGUiRPC+ZB2Ima8y1JyHWnOajzTUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edS2UlQfT35a0cOvBsqp9r6GDI2W5osI/6yC+STmYpeBn6Je8hYupotMtXFTMY9phtpWOi2iMci++EILn2qILznmPvWeJ36yNeSSJp7EPAho7FEcrLiO3o85tNYr3az2mhZ+ZZiG9f/LFAp/18Tw/GMYoXXMpPFgEm549V9q8lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtM8VIIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ayl8dtNe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2Lj97X1225794
	for <linux-usb@vger.kernel.org>; Mon, 3 Nov 2025 04:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BqZVWtvZB01lHMDhWvhuziwX
	8RpB8DpNtZTndZIHXgg=; b=OtM8VIIu6EV3q/gqLC//i4PeKqEI+2AfaAF8ucL3
	S66Amy+FETzxX+5JJll3ntgww8612f4zgviKNMywRr7jJU+4qRSIcI6N4OIU2m1b
	zrxujBLtb8L5V7+I3Es8WP/bLNViZsE9LvMnO0E8RtkH4DuzwekgqUJ4BdVohf45
	qYy54hUio7x+YtsvAMk5G6hLved7G9UORlagsuhq4X77FZ5VfMh0IIFQaNfMAY3R
	eEFVJLAVkOXsCXIRXOB1TzZCT2Yu95JMOiAa1Pxwr/XS6/cIFz4RZJM6xvn8n9zt
	+YWXUTeGOynuPD8POgLOThRtnoUrESjo9Jf4i6oHsWRd7A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57webe99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 04:01:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87a0e9be970so124724746d6.3
        for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 20:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762142461; x=1762747261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqZVWtvZB01lHMDhWvhuziwX8RpB8DpNtZTndZIHXgg=;
        b=Ayl8dtNevrPJ84j984oSFdmPuuqLOElWMxEPBVX47vDAW26Zbk5O2pM0MRsmcAo6HN
         CKWXqshz05X0DGHjxAOVFzobBiV+iRxaDwR5AcdB+R+RKEels/KFUFn2c7WcHVA45tzz
         10QetpimPTWvd/hxPur0+pbfHser2IxRxpgxa6A8RtsXl8mKbArsvA2bjOXeVHXZxxrH
         +7FEkb44VIP1IXjnrR+KhMS9NvOgYj29oFao/bdprsgaUNpRIRv7DeEEt3oCmxbuXZdn
         prh5+JZ+7zLXmaQkhN5vQugnfbrgKgw5OPtVs3XkKiTPgsBUrOvxdZnxNuplokbyVTRb
         FEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762142461; x=1762747261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqZVWtvZB01lHMDhWvhuziwX8RpB8DpNtZTndZIHXgg=;
        b=NMIiPxUn1E2X2PQCxIpg2p/5D+obRM+4O1uLg6VSDFsMIakT5HNkKGaP3JGSiQEIZT
         0vapSck9MoiIFGsM3pgzHFwt0sSaEvcBRBExI6NeFk9HlRU6SMW/+FhjiL7Lnr4p0tzg
         nDtJyDodsjBlcnOk0wgrLIZKJy7uKsxh4YVvn44uMzoZl0FzGilNHVwZsjfCwFH+wI4k
         jRJjjCAM7TSsHsGI+Q9TpNDp8oLZZ8gt6bTj18636UG/E9MKwibKd8VvtcrGeeLXD7TI
         X/YfmYY/6DCGl5TfPrtJjsKSYRqBKta8PjO49DIl5lF1YBGVHfZQMQvurw7zdSImHOFy
         v1IA==
X-Forwarded-Encrypted: i=1; AJvYcCULrFYhtBMYRremLjB9iyTWNuIKCFqiyflTClIfjhGO9lDXPHftLjjhaLngnjWSkHrHybBu/tT0dHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvV1FVWLd2cH6ZnduR1AKY/f3XvrizIgBKxUL6jzOJf2Uc+MyH
	tmeNd/LCadUgBK+uSob1eGTCxtYQ2K3h/FpLmQGdDvA9lzTNFUjo5gYwtLjpYWzIx31PvbBSKwH
	GumXOrGvwGdf1nRZ/gpzVEEmuhx7lCTxRZXGPgjwcOYubX8TuZ87y3Nu1N/dIEvA=
X-Gm-Gg: ASbGncuVAUqb6t8v9CtY4NWMnJYT220worh5XyeZY8j7G606fFmpETjStUx1Y4B8Bxe
	2/qT81S/vyo8Sh1dkUs3TTrEKw2GDWnd/68pWt83VKXQlgqmJC3i5BdB1UyFgtkc4VBLTPAiakg
	KfsU6bR1Tg9WhlEa8n/RtQU+7OHVnzPW+8cbOtAxn1bCQ4mE4NJ6a7vIFM6gFvrhnJoOOzlsU/G
	Fe8JlsqmzRA8oUqcetPkDdbEskUMUqNgEgvfe7jG9kIBmHjGWXWnHG0QtzPse4cH8pL0m6j2M90
	XPEloStyTv0i3q+ouOnnZy3LEnLdGHEjVCW4Y73WSVW98PpKFVXM6LqdHs1O9UdUdgq0OraUcJR
	J4tR+ZATWZRwwDiiyoQ2JHtzM8cpioN0+0Xle9+2wKDzlZj2x4ArUJ46ranqhMPcsVVIC5j7TD0
	fE7t2K45wAxgh7
X-Received: by 2002:a05:622a:986:b0:4e7:2844:b5ba with SMTP id d75a77b69052e-4ed30df358amr162631931cf.27.1762142461143;
        Sun, 02 Nov 2025 20:01:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgslzu3J94CkQXnMCfCenunuSO8sFC/hoLWJyhjIPrs3wspZRnHXndVjUUPy44N7dZHlcIHA==
X-Received: by 2002:a05:622a:986:b0:4e7:2844:b5ba with SMTP id d75a77b69052e-4ed30df358amr162631081cf.27.1762142460117;
        Sun, 02 Nov 2025 20:01:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1c0baabcsm20998571fa.43.2025.11.02.20.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 20:00:59 -0800 (PST)
Date: Mon, 3 Nov 2025 06:00:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <rzozpbqmymdczerh3iijxxtz3xnsznoku7w2mquikwv6u5osvo@7h43hwc2fpzm>
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-4-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029071435.88-4-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=690828fe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=GMWCpaOuOXG1PATvt-oA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wNYID1RepvDxLPs3O-NBVn-sIRw9qcYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDAzNCBTYWx0ZWRfX6/pPhhpx6zwz
 1znaq182P/1fE95f5iZFLsnSOR4JgyRkTEjFLq0uVcndU7xnH/Eki/GVA75SmvoU6TAfF4vkQqs
 YlCuVa42LyCJN03ggEYq69pQUpZdkrDKqcu4GY+ab93Fj411GmXiZoJHZa7Mh8Gc/MsTPoxFBSb
 FK3oMqHJK8cAmkIs+SXGcEHTw593O9nKnRzlf6N+1weceyVTBRjwCkJfeDUmqLaFsEAjuA5yrSv
 H7/YlWdIOE1OMq5DnhNH3Le/qO0VduOBRno/jBHWDqaxWK/O16qNC0RN1W5fHOHYzYbwCdBuMNG
 NG5Rv14QvobkyWHj8/RqezjE7smxU+piZ1xMFmONd38RRSW/XgzaF1ce1OJxu5yI+y3Xtua4UOe
 hPSminTMi/FdjlFscvmIKT1ZGKyjpw==
X-Proofpoint-GUID: wNYID1RepvDxLPs3O-NBVn-sIRw9qcYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030034

On Wed, Oct 29, 2025 at 03:14:28PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Several USB-C controller drivers have already implemented the DP HPD
> bridge function provided by aux-hpd-bridge.c, but there are still
> some USB-C controller driver that have not yet implemented it.
> 
> This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
> so that other USB-C controller drivers don't need to implement it again.

This doesn't describe the problem that you are trying to solve.

> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v8:
> - Merge generic DP HPD bridge into one module.
> 
>  drivers/gpu/drm/bridge/Kconfig                |  5 +-
>  drivers/gpu/drm/bridge/Makefile               |  8 +++-
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 23 ++++++++-
>  drivers/gpu/drm/bridge/aux-hpd-bridge.h       | 13 +++++
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 47 +++++++++++++++++++
>  5 files changed, 93 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.h
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index a250afd8d662..17257b223a28 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -23,13 +23,16 @@ config DRM_AUX_BRIDGE
>  	  build bridges chain.
>  
>  config DRM_AUX_HPD_BRIDGE
> -	tristate
> +	tristate "AUX HPD bridge support"

Why? No, this is supposed to be selected by other drivers. Users don't
know an wouldn't know what is this.

>  	depends on DRM_BRIDGE && OF
>  	select AUXILIARY_BUS
>  	help
>  	  Simple bridge that terminates the bridge chain and provides HPD
>  	  support.
>  
> +	  Specifically, if you want a default Type-C DisplayPort HPD bridge for
> +	  each port of the Type-C controller, say Y here.
> +
>  menu "Display Interface Bridges"
>  	depends on DRM && DRM_BRIDGE
>  
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c7dc03182e59..2998937444bc 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,6 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
> -obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
> +
> +hpd-bridge-y := aux-hpd-bridge.o
> +ifneq ($(CONFIG_TYPEC),)
> +hpd-bridge-y += aux-hpd-typec-dp-bridge.o
> +endif
> +obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += hpd-bridge.o
> +
>  obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 2e9c702c7087..11ad6dc776c7 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -12,6 +12,8 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/bridge/aux-bridge.h>
>  
> +#include "aux-hpd-bridge.h"
> +
>  static DEFINE_IDA(drm_aux_hpd_bridge_ida);
>  
>  struct drm_aux_hpd_bridge_data {
> @@ -204,7 +206,26 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
>  	.id_table = drm_aux_hpd_bridge_table,
>  	.probe = drm_aux_hpd_bridge_probe,
>  };
> -module_auxiliary_driver(drm_aux_hpd_bridge_drv);
> +
> +static int drm_aux_hpd_bridge_mod_init(void)
> +{
> +	int ret;
> +
> +	ret = auxiliary_driver_register(&drm_aux_hpd_bridge_drv);
> +	if (ret)
> +		return ret;
> +
> +	return drm_aux_hpd_typec_dp_bridge_init();
> +}
> +
> +static void drm_aux_hpd_bridge_mod_exit(void)
> +{
> +	drm_aux_hpd_typec_dp_bridge_exit();
> +	auxiliary_driver_unregister(&drm_aux_hpd_bridge_drv);
> +}
> +
> +module_init(drm_aux_hpd_bridge_mod_init);
> +module_exit(drm_aux_hpd_bridge_mod_exit);
>  
>  MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
>  MODULE_DESCRIPTION("DRM HPD bridge");
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.h b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
> new file mode 100644
> index 000000000000..69364731c2f1
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef AUX_HPD_BRIDGE_H
> +#define AUX_HPD_BRIDGE_H
> +
> +#if IS_REACHABLE(CONFIG_TYPEC)
> +int drm_aux_hpd_typec_dp_bridge_init(void);
> +void drm_aux_hpd_typec_dp_bridge_exit(void);
> +#else
> +static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
> +static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
> +#endif /* IS_REACHABLE(CONFIG_TYPEC) */
> +
> +#endif /* AUX_HPD_BRIDGE_H */
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> new file mode 100644
> index 000000000000..6f2a1fca0fc5
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/of.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_notify.h>
> +
> +#include <drm/bridge/aux-bridge.h>
> +
> +#include "aux-hpd-bridge.h"
> +
> +#if IS_REACHABLE(CONFIG_TYPEC)
> +static int drm_typec_bus_event(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{

This feels like this should be a part of the Type-C subsystem rather
than DRM.

> +	struct typec_altmode *alt = (struct typec_altmode *)data;
> +
> +	if (action != TYPEC_ALTMODE_REGISTERED)
> +		goto done;
> +
> +	if (is_typec_partner(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> +		goto done;
> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +				   to_of_node(alt->dev.parent->fwnode));
> +
> +done:
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block drm_typec_event_nb = {
> +	.notifier_call = drm_typec_bus_event,
> +};
> +
> +int drm_aux_hpd_typec_dp_bridge_init(void)
> +{
> +	return typec_altmode_register_notify(&drm_typec_event_nb);
> +}
> +
> +void drm_aux_hpd_typec_dp_bridge_exit(void)
> +{
> +	typec_altmode_unregister_notify(&drm_typec_event_nb);
> +}
> +#endif
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

