Return-Path: <linux-usb+bounces-31169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C0CA3DCE
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 14:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A7FD304AEC9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E8533C1A8;
	Thu,  4 Dec 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7OdXf88"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8E615C158;
	Thu,  4 Dec 2025 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855740; cv=none; b=EGuDiRr6GZqTdKz6ktRJDbJdfYOPr35BfO5hhr5ls15ZUfNQBzKPZ9OL3lUN/5UrBo8VgMPAIBwGmUcIhnc+JvIvBZ/RLrqp3Iw+fKoSAbroNiC9/nDb1U9zv4aI2RZJ9HCt6Sw1OzX+fLqzhtkMCuGhrIIYF1shUpj4NfOy6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855740; c=relaxed/simple;
	bh=30wP0TX1VK3UbNCz19GHE9bCOLKLD8pr5Gzk2VuxvGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rf+uEKB4whLHLzXbXCgIYVkayKZvwTSV9oLiAp2OHz++WY5FNp91BDK5iA9TXQep3szmysUxe7VWtMVErqE8aIuttPSrmYHv0nPUqs4oNmEHOOlvsImhu1bd4eQ2kN6gh8oTC61ndvECmr5g9NgNsZgmqhS3YZB9x4u+sEONy5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7OdXf88; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764855739; x=1796391739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=30wP0TX1VK3UbNCz19GHE9bCOLKLD8pr5Gzk2VuxvGw=;
  b=J7OdXf88VyB6clJ4hxA884AlVbem4J/36zELpUTUsx2ijzaaLFdQ76Aq
   Y79iBGYKWX7fMJkm9Mke+XENN8f1GzDZrqXeJoYI4I0jnK49FhvwW5iQp
   3aJfqeOhaNFbbSWHViBXRxP3Nl9umH6EApoKeuICF1r/RKU5tfCwz0azw
   C6XrxAxqrlUOfT4pXb62Ls1SND/XqGHcnbDfaBDUQ7qhq+nU0zyHi5gtV
   Sdxzu215tt3yUwzC/h+hp9yHPDpjz2YFKpASLBUxgbNATh7b/a6HGCgKZ
   jhPcbt59Zd1N7eNRiNPFovFZneaWsFJJIkw71M8Rq1nbJK/SDr0fdv3vY
   g==;
X-CSE-ConnectionGUID: O3g83J5mTO6mohvgPe0ozQ==
X-CSE-MsgGUID: Lj+vzSjLQP2tpxZwiDl5uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66911010"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66911010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 05:42:18 -0800
X-CSE-ConnectionGUID: DxyftxzaSmuGPOccXE4iKQ==
X-CSE-MsgGUID: kBWCfuAfTk6HBNfipdewYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199164378"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
  by orviesa003.jf.intel.com with SMTP; 04 Dec 2025 05:42:05 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:41:56 +0200
Date: Thu, 4 Dec 2025 15:41:56 +0200
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
Subject: Re: [RESEND PATCH v11 02/11] usb: typec: Export typec bus and typec
 altmode device type
Message-ID: <aTGPpInIEzFhftf4@kuha>
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204063109.104-3-kernel@airkyi.com>

Thu, Dec 04, 2025 at 02:31:00PM +0800, Chaoyi Chen kirjoitti:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The DRM may want to register a notifier on the typec bus to know when
> a typec altmode device is added, and distinguish between different
> types of typec altmode device.
> 
> Export these things.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v11:
> - Also export typec bus.
> - Add more detailed comments.
> 
> (no changes since v9)
> 
>  drivers/usb/typec/bus.c           |  1 +
>  drivers/usb/typec/bus.h           | 10 ----------
>  drivers/usb/typec/class.c         |  3 +++
>  include/linux/usb/typec.h         |  3 +++
>  include/linux/usb/typec_altmode.h |  8 ++++++++
>  5 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index a33da7f458a5..e84b134a3381 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -569,3 +569,4 @@ const struct bus_type typec_bus = {
>  	.probe = typec_probe,
>  	.remove = typec_remove,
>  };
> +EXPORT_SYMBOL_GPL(typec_bus);
> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
> index b58e131450d1..7df5deb1dd3a 100644
> --- a/drivers/usb/typec/bus.h
> +++ b/drivers/usb/typec/bus.h
> @@ -5,7 +5,6 @@
>  
>  #include <linux/usb/typec_altmode.h>
>  
> -struct bus_type;
>  struct typec_mux;
>  struct typec_retimer;
>  
> @@ -28,13 +27,4 @@ struct altmode {
>  
>  #define to_altmode(d) container_of(d, struct altmode, adev)
>  
> -extern const struct bus_type typec_bus;
> -extern const struct device_type typec_port_altmode_dev_type;
> -extern const struct device_type typec_plug_altmode_dev_type;
> -extern const struct device_type typec_partner_altmode_dev_type;
> -
> -#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
> -#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
> -#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
> -
>  #endif /* __USB_TYPEC_ALTMODE_H__ */
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index d6b88317f8a4..c4ff4310ff58 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -537,18 +537,21 @@ const struct device_type typec_port_altmode_dev_type = {
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_port_altmode_dev_type);
>  
>  const struct device_type typec_plug_altmode_dev_type = {
>  	.name = "typec_plug_alternate_mode",
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_plug_altmode_dev_type);
>  
>  const struct device_type typec_partner_altmode_dev_type = {
>  	.name = "typec_partner_alternate_mode",
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_partner_altmode_dev_type);
>  
>  static struct typec_altmode *
>  typec_register_altmode(struct device *parent,
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..c6fd46902fce 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -20,12 +20,15 @@ struct typec_port;
>  struct typec_altmode_ops;
>  struct typec_cable_ops;
>  
> +struct bus_type;
>  struct fwnode_handle;
>  struct device;
>  
>  struct usb_power_delivery;
>  struct usb_power_delivery_desc;
>  
> +extern const struct bus_type typec_bus;
> +
>  enum typec_port_type {
>  	TYPEC_PORT_SRC,
>  	TYPEC_PORT_SNK,
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index f7db3bd4c90e..9197a4637a93 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -9,6 +9,14 @@
>  
>  #define MODE_DISCOVERY_MAX	6
>  
> +extern const struct device_type typec_port_altmode_dev_type;
> +extern const struct device_type typec_plug_altmode_dev_type;
> +extern const struct device_type typec_partner_altmode_dev_type;
> +
> +#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
> +#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
> +#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
> +
>  struct typec_altmode_ops;
>  
>  /**
> -- 
> 2.51.1

-- 
heikki

