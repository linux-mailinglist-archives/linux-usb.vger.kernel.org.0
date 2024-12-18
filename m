Return-Path: <linux-usb+bounces-18635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7139F621D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6B316A009
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11215192B95;
	Wed, 18 Dec 2024 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMk1HIwh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFA18B46A;
	Wed, 18 Dec 2024 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515260; cv=none; b=dfSfiRP2Eh+1W4TBjy2tNPe1kW5PRmv2r0LKVRBOYjmE4G1YFcqZpQC2rnmYaY12FY5nF3iR/GmLwGsDUY/fruajLM7u/Rt5y12dfJT7BdliVnBVpEhZbQU5ssKKzJpawU+1msSNcD+6KJ4TkyeUcFqMmytq2ZuZCnAmwQ/NLC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515260; c=relaxed/simple;
	bh=GyTIwOmrMGpYe7/CtVlAK+628ACb60AN2nWgu8VKsEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGWaNA2gjVnBa/Mr1PhlN+tJwnhQqBV4MxGfz+jxMn4W90aPv1Rs8HLXUggNLMsz+QAJHogQ1BwRF5IlId9IohbGpmFFy2ODH2tcD4Od3i0/WE7d5Rd601eIw2xCuTGj2ECTW/uIO9EVkoIQZXl08oMKhuXjLu4hv62Pfby+oaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMk1HIwh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734515259; x=1766051259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GyTIwOmrMGpYe7/CtVlAK+628ACb60AN2nWgu8VKsEI=;
  b=AMk1HIwhIb8vsYT5NRffXND4caNzVFYE9xSf95htOBIIsAG0UeD1hvMy
   6KVU2Xy5rw6xRwEMK+5AvTmvY8OAfoz1C2BrhK8u+Gkab4Gmzw9YzKetb
   hcS5xOvkoUDT9tGPX6zHnBKF0A55EK+W1b0itWVb010lJWWp3Fa/XxX/K
   0mv9SH7W3Y5nd8Zu1jS1g7iv1CMprKRI/KwjmidS0anOZ4f/l2x+l4Yam
   U2bz5TeKdomj89kiZntpApmJ+Cf12fZuGXK/F/xUPztLdkJyS3FrOp3wq
   7yJ2JkKsCtxzpU26rAJYGZaBhLOz7kSLEeVUx6eOFnmqOO3bzVC9d7AuA
   Q==;
X-CSE-ConnectionGUID: qPpBMAJmRwq9Ty0oINFVVA==
X-CSE-MsgGUID: PEcj9Dr0RC21lycpOVAjGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35132066"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35132066"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 01:47:39 -0800
X-CSE-ConnectionGUID: UKbPKYZOT7qBsUfuNb2+cQ==
X-CSE-MsgGUID: uHOMTjbOQOq9StPfzgpc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="98228751"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 18 Dec 2024 01:47:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 18 Dec 2024 11:47:33 +0200
Date: Wed, 18 Dec 2024 11:47:33 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, akuchynski@google.com,
	sboyd@kernel.org, pmalani@chromium.org, badhri@google.com,
	rdbabiera@google.com, dmitry.baryshkov@linaro.org,
	jthies@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/8] usb: typec: Make active on port altmode writable
Message-ID: <Z2KaNX7_9jfWb-Hw@kuha.fi.intel.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>

On Fri, Dec 13, 2024 at 03:35:44PM -0800, Abhishek Pandit-Subedi wrote:
> The active property of port altmode should be writable (to prevent or
> allow partner altmodes from entering) and needs to be part of
> typec_altmode_desc so we can initialize the port to an inactive state if
> desired.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v5:
> - Extract port altmode ".active" changes to its own patch
> 
>  drivers/usb/typec/class.c | 5 +++--
>  include/linux/usb/typec.h | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index febe453b96be..b5e67a57762c 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
>  	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
>  
>  	if (attr == &dev_attr_active.attr)
> -		if (!adev->ops || !adev->ops->activate)
> +		if (!is_typec_port(adev->dev.parent) &&
> +		    (!adev->ops || !adev->ops->activate))
>  			return 0444;
>  
>  	return attr->mode;
> @@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
>  
>  	if (is_port) {
>  		alt->attrs[3] = &dev_attr_supported_roles.attr;
> -		alt->adev.active = true; /* Enabled by default */
> +		alt->adev.active = !desc->inactive; /* Enabled by default */
>  	}
>  
>  	sprintf(alt->group_name, "mode%d", desc->mode);
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d616b8807000..252af3f77039 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *cable);
>   * @mode: Index of the Mode
>   * @vdo: VDO returned by Discover Modes USB PD command
>   * @roles: Only for ports. DRP if the mode is available in both roles
> + * @inactive: Only for ports. Make this port inactive (default is active).
>   *
>   * Description of an Alternate Mode which a connector, cable plug or partner
>   * supports.
> @@ -150,6 +151,7 @@ struct typec_altmode_desc {
>  	u32			vdo;
>  	/* Only used with ports */
>  	enum typec_port_data	roles;
> +	bool			inactive;
>  };
>  
>  void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
> -- 
> 2.47.1.613.gc27f4b7a9f-goog

-- 
heikki

