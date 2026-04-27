Return-Path: <linux-usb+bounces-36526-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFJLLZcr72mb8wAAu9opvQ
	(envelope-from <linux-usb+bounces-36526-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:25:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2F46FE26
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29FDD300621F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E1D3B19BA;
	Mon, 27 Apr 2026 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzrzOKu2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F16E37B018;
	Mon, 27 Apr 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281614; cv=none; b=VnRtX52/ADWIvWLfXbWk4+z6WdNk7vtdUDyp2ql7z0Krs92/fDmOfvB4F6dRYI7aKmPSaeADbmlPdW1Z8riNWvBS8cd5K7ruo9B59gME1fuv4XbtWIqYMAZhYG6EJQIWkqHZtLo2i3twIKVeJl5UP9l1JypOJXmmZHK9bI3s36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281614; c=relaxed/simple;
	bh=a/WowGXDHR+ZzG9MuKbDx1rfENhIYhkSzOdt9BUYpHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN3+zboowYPp5SbOuAFEJgNgvydSN9E8SAAgWl71yGyVfQ/09d6Xt0jxMcgYDvSTNx4PBExUt6BDihFBFeY6ZMQF/+FTKV7rsxSZPCVBzeowXVGmvLZXj1CQ1XiLTjgO8eclRSOS+/WBTPofkOG/TN5wLBWN1yX6o408rCARQKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzrzOKu2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777281612; x=1808817612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/WowGXDHR+ZzG9MuKbDx1rfENhIYhkSzOdt9BUYpHk=;
  b=OzrzOKu2A7Qs48IA9Y/9BiA3PiPAAE1+Bx70AzvlKRBhepB68bzAC2BJ
   Y8LciHL2OcdUW4kItB9ZQr6v9WVdrPZC0XKSqp2zzmrQ+1eX8osnzwF45
   vQXi/5fVKnvoYf3nhMmHCpVtxmgjS6YmfTo06Rov7DA+CdkRJMroy2r8m
   JL/EC4inXO1ik7QDuerfbujtwX4vZM7PXVbPnJevSyRALszA8c9regFUO
   +jw6xvSW5AiAEvpGxe/tPKA/fw8fxsdDdEopRv+aI46zpWXwRSHLuzRdD
   qEwgAWkgVVthP2r+/SyuqQfCLMQq4BiOD6ckdnX5aEN0RiJi/B/DmUBQV
   Q==;
X-CSE-ConnectionGUID: QlSEDxdQQDavwuQfMpqrLQ==
X-CSE-MsgGUID: xjC1C4uaTq+LCcWigAqdSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89543703"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="89543703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:20:11 -0700
X-CSE-ConnectionGUID: gzr05M5HRwaCLVTA5b86Hg==
X-CSE-MsgGUID: k5UD+iFeTE2ybENdUoDP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="263995379"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 27 Apr 2026 02:20:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E36FF95; Mon, 27 Apr 2026 11:20:08 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:20:07 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Fix resource leak when
 devm_drm_dp_hpd_bridge_add() fails
Message-ID: <ae8qRz2wDBcHkSKm@kuha>
References: <20260421-fusb-v1-1-0a9dd64e785b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-fusb-v1-1-0a9dd64e785b@gmail.com>
X-Rspamd-Queue-Id: E7F2F46FE26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36526-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, Apr 21, 2026 at 07:24:56PM +0800, Felix Gu wrote:
> If devm_drm_dp_hpd_bridge_add() fails during fusb302_probe(), the original
> code returned directly without cleaning up the resources.
> 
> Route the failure through the existing unwind path so probe cleans up the
> same resources that are released in remove().
> 
> Fixes: 5d79c525405d ("usb: typec: fusb302: add DRM DP HPD bridge support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 889c4c29c1b8..5b631422c128 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1776,10 +1776,15 @@ static int fusb302_probe(struct i2c_client *client)
>  
>  	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
>  	if (ret)
> -		return ret;
> +		goto free_irq;

Couldn't you just call that before requesting the irq?

thanks,

> -	return ret;
> +	return 0;
>  
> +free_irq:
> +	disable_irq_wake(chip->gpio_int_n_irq);
> +	free_irq(chip->gpio_int_n_irq, chip);
> +	cancel_work_sync(&chip->irq_work);
> +	cancel_delayed_work_sync(&chip->bc_lvl_handler);
>  tcpm_unregister_port:
>  	tcpm_unregister_port(chip->tcpm_port);
>  	fwnode_handle_put(chip->tcpc_dev.fwnode);
> 
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260421-fusb-0e7085ce431a
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>

-- 
heikki

