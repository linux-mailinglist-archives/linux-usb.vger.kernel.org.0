Return-Path: <linux-usb+bounces-31204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F1CA7B2F
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 14:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CBA03128451
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 10:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD782329C6A;
	Fri,  5 Dec 2025 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUrL02bM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92D311C37;
	Fri,  5 Dec 2025 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931832; cv=none; b=KJxoCxHaHBaUGCj5/Xz3H9nhav7s9gOWAv1EjoSVCu0Mu8dx7jgf89tQr1SO2Rc0PEoxp6o2rtW1O5uUxAA2OvvJzzXmxtL4Wb4DpfTjReqWQPJ74SqwaksnQV7ot9VCLaRbY/5gT7U/A/TvOYTmTDuB3o1oDv2XCh0HzueLXpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931832; c=relaxed/simple;
	bh=MQ7Fqj4UUvktQ5BTeTaY30CoU5H4xWYgdxzNUoMv4yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtO6mHcgjD5rLWr9vZBmurSpxifcF4CVB64xMSg7jXkY4UQXF3/toFv/4rYdPVkYVxD3G9Jm0Esvw62GJY30z1gKJAHHyCpNV+ZbNKbMNVxAcw6sHqpknXHP3GDGedCaWUbYNODvlP3pt51RakWfXXwOun4LVoTtwC4T+zWfuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUrL02bM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764931828; x=1796467828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQ7Fqj4UUvktQ5BTeTaY30CoU5H4xWYgdxzNUoMv4yI=;
  b=iUrL02bMHe7q6CjFSNGHxfCKzDTMR7a/5svIyKhel0+3BX5g7eWGsZkG
   /mgun+SZ94O9NhR6X8wiRG5QMWCKug8foEgKiPuSKTQAfpZcZyB+UykxD
   1gPzRRjvnbKONsj0y/LMUhbays9EHBw5NT9ihv9jydR8e2zKtgP72eSrC
   Tf1Snqq8hYndEx/wvZCTbLExIQmNSu5+208ngJNA3R/KGkkdAzjhTgGMw
   /SXSoMsF0tw2Vkk0EEZMDfuax5+F0z6GXkqJzj8CeUagCELcGxw8Mtzie
   XWWsAIUol/i2kPpBWECM/jvV0se3f8/9jimeHUGWja2VC6kZmpFuGlR1S
   A==;
X-CSE-ConnectionGUID: XjXmj5J6SmKAwVS0o44fQA==
X-CSE-MsgGUID: 7L/v+segQ7OvEUpQjD9EWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66155518"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66155518"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:50:24 -0800
X-CSE-ConnectionGUID: BZQBeMhuT9mzC1dYoeMo6g==
X-CSE-MsgGUID: HOtjpdEDROWYFpjmc15VMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="218626523"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.220.222])
  by fmviesa002.fm.intel.com with SMTP; 05 Dec 2025 02:50:13 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 05 Dec 2025 12:50:04 +0200
Date: Fri, 5 Dec 2025 12:50:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB
 Type-C DP HPD bridge
Message-ID: <aTK4n8WnQm_FvpW3@kuha>
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-4-kernel@airkyi.com>
 <aTGPaJmwd7uHfrnV@kuha>
 <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>

Fri, Dec 05, 2025 at 10:26:20AM +0800, Chaoyi Chen kirjoitti:
> Hi Heikki,
> 
> On 12/4/2025 9:40 PM, Heikki Krogerus wrote:
> > Hi,
> > 
> > I don't know what's going on here - this series is the 12th?
> > In any case, you need to fix this..
> > 
> 
> It is 11th. Patch 1 was missing the Signed-off-by line, so I've resent
> it. Sorry for the confusion.

That's a change too, i.e. this is v12.

> >> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> >> new file mode 100644
> >> index 000000000000..94be3d5f69e9
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> >> @@ -0,0 +1,51 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +#include <linux/of.h>
> >> +#include <linux/usb/typec_altmode.h>
> >> +#include <linux/usb/typec_dp.h>
> >> +
> >> +#include <drm/bridge/aux-bridge.h>
> >> +
> >> +static int drm_typec_bus_event(struct notifier_block *nb,
> >> +			       unsigned long action, void *data)
> >> +{
> >> +	struct device *dev = (struct device *)data;
> >> +	struct typec_altmode *alt = to_typec_altmode(dev);
> >> +
> >> +	if (action != BUS_NOTIFY_ADD_DEVICE)
> >> +		goto done;
> >> +
> >> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> >> +		goto done;
> > 
> > That's still not enough because of the plug altmodes. You need to
> > check that it's a port altmode:
> > 
> >         if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
> >         	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> >         				   to_of_node(alt->dev.parent->fwnode));
> >
> 
> Oh, it is. Will fix in v12. Thank you.

v13. Don't forget to update changelog.

thanks,

-- 
heikki

