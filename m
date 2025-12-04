Return-Path: <linux-usb+bounces-31165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F6CA3C41
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 14:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA16830092A2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 13:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512D0340260;
	Thu,  4 Dec 2025 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPMP9FQv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254892D46B4;
	Thu,  4 Dec 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854350; cv=none; b=WKU2t+347LBSQjNnneO86674CidlN+9UEHhx74mNyvcH6h7qdq32OTY9A9Zys12Oxbqg//g6Ph5Z5gAWPvgryE/g6Vhd69hT5gkIL+hcRim/RgLXj7AYbS2eEtZWX6xJeBPwkAjuLg7H+Kt89tlquFn5/osXThmbyiwGSqsoxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854350; c=relaxed/simple;
	bh=xqFQrU44fEiJ1KuRpa3rRjXuBbQsUbuhOFIk0S/39e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2m0pibSKJBx6l3YQEanx/aOJZ10mGnO/rw6a81QKZWrBD38VrTzuCdoCH4An5ExRfFf3mz3stXQn6V8hSZQAgpCGXeLISZ595owGmPnms5Ej5rsUjaSqfHSj451DeGBRojmtSS6PaB57T8+xPuFtUyyD5SQkOJaAsgDNwTnm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPMP9FQv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764854349; x=1796390349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xqFQrU44fEiJ1KuRpa3rRjXuBbQsUbuhOFIk0S/39e0=;
  b=kPMP9FQvJg5NMbZ2n6JBYrcBxyAvluk9M4zaxITtrjo9c9KMuQieUNVo
   aE80kAxyL3Tc/AvLV1+keeyJLQIO9ilto2tMuN4NJhl02Wa41N0t+osVr
   l/7IwAdvq/rZtOb6Ho9TJAXjE/SU9bu6pdVclZQyWpJEAvlNXeNEQ43Xa
   cOL81pYbfXEcppGq1Z+iwUE2fB/XDVaA46fuwHp9MhEEWbdF5CBTRFWgr
   YA6kxWTtH4rv3kyxVcZT46WMnt84+slNKFCXJ5SC3lCUfoXkxubhAwkVh
   oQWl6MEPgzpDR5fy/OM9FrYQrU8Pu4efelxZ53qD5P+hskGBwH4cO/27q
   g==;
X-CSE-ConnectionGUID: 1SPnBYklRcGX1xyphMCcDA==
X-CSE-MsgGUID: 5Rdq92FWTbiHlSkB/bZVCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77553069"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77553069"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 05:19:08 -0800
X-CSE-ConnectionGUID: 6hnV95oCRRiK6KPTByZfvQ==
X-CSE-MsgGUID: HfWUZWD7SnmB6CaIbu9f3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199943225"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
  by fmviesa004.fm.intel.com with SMTP; 04 Dec 2025 05:18:57 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:18:48 +0200
Date: Thu, 4 Dec 2025 15:18:48 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Subject: Re: [PATCH v11 03/11] drm/bridge: Implement generic USB Type-C DP
 HPD bridge
Message-ID: <aTGKODdf7vsHFY72@kuha>
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-4-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128020405.90-4-kernel@airkyi.com>

Hi,

Fri, Nov 28, 2025 at 10:03:57AM +0800, Chaoyi Chen kirjoitti:
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> new file mode 100644
> index 000000000000..94be3d5f69e9
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/of.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +
> +#include <drm/bridge/aux-bridge.h>
> +
> +static int drm_typec_bus_event(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct device *dev = (struct device *)data;
> +	struct typec_altmode *alt = to_typec_altmode(dev);
> +
> +	if (action != BUS_NOTIFY_ADD_DEVICE)
> +		goto done;
> +
> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> +		goto done;

There are also plug altmodes. Just make sure it's a plug altmode.

	if (!is_typec_plug_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
                goto done;

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
> +static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
> +{
> +	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
> +}
> +
> +static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
> +{
> +	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
> +
> +	return 0;
> +}
> +
> +module_init(drm_aux_hpd_typec_dp_bridge_module_init);
> +module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
> +
> +MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
> +MODULE_LICENSE("GPL");

thanks,

-- 
heikki

