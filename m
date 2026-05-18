Return-Path: <linux-usb+bounces-37565-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFLmCL2bCmqs4AQAu9opvQ
	(envelope-from <linux-usb+bounces-37565-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 06:55:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080F565CB5
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 06:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BC35301907C
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 04:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F79C3859EF;
	Mon, 18 May 2026 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr810YvK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E363806B5;
	Mon, 18 May 2026 04:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080116; cv=none; b=bzx8wcOt7fZguBLeE6W9eAiIVrlGA7fVRJUQhekJXSHxN5cfn/o/s7yP83Naho2yTPhtshMJi7Q05RUfFx5BoomK2CUre3GcWO+aiGn7MINflWSq0m676fr0To2lCI9+QkCcBUNwyF8J7GZ8vz7Vx6n/Zz2akkztNOdvb/t8Nzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080116; c=relaxed/simple;
	bh=FfTsMzkPrRziSfAOE3hKwzzlnmjTu6CKAuO3LpyMiuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxCV5kMOCL/5gmJ4yt95Hn1O8Y5rhsX3FM/XEL9bvhBqh6Db05NpM+F6yz/NXIy1bVU7jafM0FezumagHmzDW5rgxMyvo+T6/FZtLyOHdZfQbaOQDP+vthWhOHWaMhN9tPfhyj3NHDuRt075PlhZxgzpMFtyhjmwV5HGgFJRaWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr810YvK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779080115; x=1810616115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FfTsMzkPrRziSfAOE3hKwzzlnmjTu6CKAuO3LpyMiuw=;
  b=lr810YvKx2KBoXnBZv0/Q4r+wS/D6PTRUhXn+AQ6jk64cfJEPL0bq0/1
   A8MY03ZT5tez42lTTONAXENbq/oQdFZu0Bmvt1LyR0r6uNhpas6WWMjIC
   otB/bFLq+88Em+2Nrz1aPyxY4vR1XBBb10mpp3vcIgYSnp0gUUI05/Nqo
   60jaPJnuRZGAtCxzS45GOmxL9xdUADDU+F6ut51/vYergK8RycOcKPerP
   jCZ3B95WgwrkEhsZDvuedzVA4i95d93HKqvdAjS969xlk1A+h6QHHiJSy
   vnsvG6UiJ1Yo1xD+8s728/vu5yFc6ktm3BU8Dzk5dbF+KcKtrPXmlOUO9
   Q==;
X-CSE-ConnectionGUID: XwCUqlazRNyQRfRn3nvRFQ==
X-CSE-MsgGUID: J5OD6EWrQGeLChdk02c2zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79906327"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79906327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 21:55:15 -0700
X-CSE-ConnectionGUID: n1p5FKCCQnqgA7OLgnhejQ==
X-CSE-MsgGUID: a1Z8JiTaQyKc1djvS699tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239554020"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2026 21:55:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F1F0895; Mon, 18 May 2026 06:55:11 +0200 (CEST)
Date: Mon, 18 May 2026 06:55:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: shayderrr <darknessshayder@gmail.com>
Cc: andreas.noever@gmail.com, yehezkel.bernat@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: usb4-port: fix error path and sysfs
 alignment
Message-ID: <20260518045511.GN84797@black.igk.intel.com>
References: <20260517142923.80585-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260517142923.80585-1-darknessshayder@gmail.com>
X-Rspamd-Queue-Id: 8080F565CB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37565-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 09:29:23AM -0500, shayderrr wrote:
> From: Pranav Bajjuri <darknessshayder@gmail.com>
> 
> Add missing return ERR_PTR(ret) after component_add() failure so PM
> setup is not reached on error, and fix argument alignment on
> offline_show(), offline_store(), and rescan_store().

That's two things that this patch does. Also the alignment is intentional,
don't touch it.

> 
> Signed-off-by: Pranav Bajjuri <darknessshayder@gmail.com>
> ---
>  drivers/thunderbolt/usb4_port.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
> index c32d3516e780..2282e1ad0c45 100644
> --- a/drivers/thunderbolt/usb4_port.c
> +++ b/drivers/thunderbolt/usb4_port.c
> @@ -34,8 +34,8 @@ static void connector_unbind(struct device *dev, struct device *connector, void
>  }
>  
>  static const struct component_ops connector_ops = {
> -	.bind = connector_bind,
> -	.unbind = connector_unbind,
> +	.bind	= connector_bind,
> +	.unbind	= connector_unbind,
>  };
>  
>  static ssize_t link_show(struct device *dev, struct device_attribute *attr,
> @@ -137,7 +137,6 @@ bool usb4_usb3_port_match(struct device *usb4_port_dev,
>  	if (IS_ERR(nhi_fwnode))
>  		return false;
>  
> -	/* Check if USB3 fwnode references same NHI where USB4 port resides */

Why you are removing all these comments?

>  	if (!device_match_fwnode(&nhi->pdev->dev, nhi_fwnode))
>  		return false;
>  
> @@ -179,7 +178,6 @@ static ssize_t offline_store(struct device *dev,
>  	if (val == usb4->offline)
>  		goto out_unlock;
>  
> -	/* Offline mode works only for ports that are not connected */
>  	if (tb_port_has_remote(port)) {
>  		ret = -EBUSY;
>  		goto out_unlock;
> @@ -230,7 +228,6 @@ static ssize_t rescan_store(struct device *dev,
>  		goto out_rpm;
>  	}
>  
> -	/* Must be in offline mode already */
>  	if (!usb4->offline) {
>  		ret = -EINVAL;
>  		goto out_unlock;
> @@ -261,16 +258,12 @@ static umode_t service_attr_is_visible(struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct usb4_port *usb4 = tb_to_usb4_port_device(dev);
>  
> -	/*
> -	 * Always need some platform help to cycle the modes so that
> -	 * retimers can be accessed through the sideband.
> -	 */
>  	return usb4->can_offline ? attr->mode : 0;
>  }
>  
>  static const struct attribute_group service_group = {
> -	.attrs = service_attrs,
> -	.is_visible = service_attr_is_visible,
> +	.attrs		= service_attrs,
> +	.is_visible	= service_attr_is_visible,
>  };
>  
>  static const struct attribute_group *usb4_port_device_groups[] = {
> @@ -282,14 +275,13 @@ static const struct attribute_group *usb4_port_device_groups[] = {
>  static void usb4_port_device_release(struct device *dev)
>  {
>  	struct usb4_port *usb4 = container_of(dev, struct usb4_port, dev);
> -
>  	kfree(usb4);
>  }
>  
>  const struct device_type usb4_port_device_type = {
> -	.name = "usb4_port",
> -	.groups = usb4_port_device_groups,
> -	.release = usb4_port_device_release,
> +	.name		= "usb4_port",
> +	.groups		= usb4_port_device_groups,
> +	.release	= usb4_port_device_release,
>  };
>  
>  /**
> @@ -324,6 +316,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
>  	if (ret) {
>  		dev_err(&usb4->dev, "failed to add component\n");
>  		device_unregister(&usb4->dev);
> +		return ERR_PTR(ret);

I think this should actually just log an error but do not fail here or
unregister the port device because we can continue just fine without the
component.

>  	}
>  
>  	if (!tb_is_upstream_port(port))
> -- 
> 2.50.1 (Apple Git-155)

