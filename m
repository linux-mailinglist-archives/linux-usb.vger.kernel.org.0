Return-Path: <linux-usb+bounces-33636-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDmsOPJ0nWmAQAQAu9opvQ
	(envelope-from <linux-usb+bounces-33636-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:52:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66D184F65
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5865A30580A0
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF6D37104E;
	Tue, 24 Feb 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXVg48IG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6336AB45;
	Tue, 24 Feb 2026 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926657; cv=none; b=Y3BIHrjOr8+PCwnwsCzW0rr6HVPj8nwdxsVGXIyvX6ZpCj1hi35YVJVIxO3CjPjrmAanM1oe+iHgXEyBYwhRPxllQ1VH8BATKLTk9fzwiujqkFzXo7124W3UgHexKx9UY/eE7SSUQgw/SSWdlm2KOwW30yg3wjo4lu0cJHGIemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926657; c=relaxed/simple;
	bh=IM0e0fy50KkE7mIOOuYjlTi1dOxwNjogYv5ELqFwu9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNfl5cO8ta+uNlm/mJ+hoPRyntG01J8Np8U5bPCsvOGJT6w/rIBpLUUJyyJUYtYtww56dZoHb0r135/jqG30mLveANHTezAfmQifxJ0g6yIzI1tBqAJdup7ZNn/YmCZvUIlJLblSR9DIZ0nQqMGxsoIz2m899Z7JIZm8rJE9rwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXVg48IG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771926656; x=1803462656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IM0e0fy50KkE7mIOOuYjlTi1dOxwNjogYv5ELqFwu9Q=;
  b=bXVg48IGdoCagaMlmNnkZu0Bcc20QIlsOFAzp3mnj36n/G5F4U06aR8F
   IIqsEWqeplL1iMqReUBiB4EiQUrkmYhONLHyI/N83ZTC22umqWiBE60MC
   FiPn2q1pm+BbLXq71vmv4uZ287Q8c34l1xBRaMRXv46NNjoYIGs8LCfD3
   1yJOYIWgGSVyOiicez+RyrrynADJ7Kt7YSgX3VKvxTz/h9h6TW2r9qVZj
   7HuEmAjnh3y548idb7PkpkK933/0zREL5jA5YxOvCdPTu0NGuxXZ4jQ+H
   hUU8L+zikuzFf6dCtPjlA5Mq9uyRxsvZOGd5Im51x5rzJ/7VbaTtwl3SI
   Q==;
X-CSE-ConnectionGUID: PB6JwpD7R4aBfYIjHSO45A==
X-CSE-MsgGUID: 0fMH6y31TR6P+Wf7PtQjPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76768241"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76768241"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:50:56 -0800
X-CSE-ConnectionGUID: Fa/sx7/DRM6aL0jVymc2gA==
X-CSE-MsgGUID: 01eSOxuVQ+6yZvzsq4DjXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220850020"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.187])
  by orviesa005.jf.intel.com with SMTP; 24 Feb 2026 01:50:53 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 24 Feb 2026 11:50:17 +0200
Date: Tue, 24 Feb 2026 11:50:17 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] usb: typec: mux: avoid duplicated orientation
 switches
Message-ID: <aZ10NJshUtgtQqEw@kuha>
References: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
 <20260223-typec-mux-duplication-fix-v2-1-0402fefc222e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-typec-mux-duplication-fix-v2-1-0402fefc222e@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33636-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 3E66D184F65
X-Rspamd-Action: no action

Mon, Feb 23, 2026 at 07:27:38PM +0100, Sebastian Reichel kirjoitti:
> Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
> handle the orientation mux. These PHYs are referenced twice from
> the USB-C connector (USB super-speed lines and SBU/AUX lines)
> resulting in the switch being configured twice. Avoid this by
> dropping duplicates.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 58fb97ea6877..9b908c46bd7d 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -35,7 +35,9 @@ static int switch_fwnode_match(struct device *dev, const void *fwnode)
>  static void *typec_switch_match(const struct fwnode_handle *fwnode,
>  				const char *id, void *data)
>  {
> +	struct typec_switch_dev **sw_devs = data;
>  	struct device *dev;
> +	int i;
>  
>  	/*
>  	 * Device graph (OF graph) does not give any means to identify the
> @@ -56,6 +58,13 @@ static void *typec_switch_match(const struct fwnode_handle *fwnode,
>  	dev = class_find_device(&typec_mux_class, NULL, fwnode,
>  				switch_fwnode_match);
>  
> +	/* Skip duplicates */
> +	for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
> +		if (to_typec_switch_dev(dev) == sw_devs[i]) {
> +			put_device(dev);
> +			return NULL;
> +		}
> +
>  	return dev ? to_typec_switch_dev(dev) : ERR_PTR(-EPROBE_DEFER);
>  }
>  
> @@ -80,7 +89,8 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  	if (!sw)
>  		return ERR_PTR(-ENOMEM);
>  
> -	count = fwnode_connection_find_matches(fwnode, "orientation-switch", NULL,
> +	count = fwnode_connection_find_matches(fwnode, "orientation-switch",
> +					       (void **)sw_devs,
>  					       typec_switch_match,
>  					       (void **)sw_devs,
>  					       ARRAY_SIZE(sw_devs));
> 
> -- 
> 2.51.0

-- 
heikki

