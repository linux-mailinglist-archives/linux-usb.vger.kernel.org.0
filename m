Return-Path: <linux-usb+bounces-37590-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NY1I4rpCmpt9QQAu9opvQ
	(envelope-from <linux-usb+bounces-37590-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:27:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1456AAD5
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43A7930237CB
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AEA3E559B;
	Mon, 18 May 2026 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrRzwDb5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7A3815F3;
	Mon, 18 May 2026 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099997; cv=none; b=nNq33VAwRi2cLhBCtet+SbQoPU0g90HeCdJoXlPv0gM9mi78YH4dL9r2ytBHAfOYPmkjSGH8lDmrTBnhpvfZ6f/wZ50jz7J7417GTEpqU89ffhUuQLGA0axLk6fVR681FXFsniG4g6Vtyga4atHlKS84EtpwlyKuZqvnvfVCPs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099997; c=relaxed/simple;
	bh=xrBOeiNiMAT4xdKE6uSkZVxSAKaAXPttBvyZQQc/Ne4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbmoIEitu+WZ6nMaj3KQdHoJEq9vjQbrSMmVuUvq0dpY1K62jO2VAM1NS0A82j14IpF+cIUl1ImTXYCK+1FsIty99lbp47lbQ9e1zqxlpGQC8Xl8ViT1UkcurwzlKL4DUq7BzeCM1DR9iMt1uUmumOlTnpmtuE8OLhPCt5KFNZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrRzwDb5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779099995; x=1810635995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xrBOeiNiMAT4xdKE6uSkZVxSAKaAXPttBvyZQQc/Ne4=;
  b=WrRzwDb5PqNmIPe9to7RhWurU9fMh/P6Qy6mr9SMzCFuLbF5IdbUhiWI
   xVTwlBj8Q4ng9syyaAmAqriaRjDsWtmDlYFGdQT+8lIjgdpi6IwGFq0Aq
   4+jZdjdd6Bo5Yn9k7lE7Hian/WhhDPMcbRQsY3+YGBDDkUxCDWC1I6rnl
   f3MoZP6hd/cWGHYNI2N0rPDmHnbN7pLM+tLBqq4NnLM1joKoSxAcX+wUo
   y1MY/bo+z9iVmIrpHLy0kJhBlEekjMywpuDGx/fOa2vXmpuhwE5pCK8PQ
   QoolYW3k+z+icqyxHppEw96KpQamwJGt4nPe9jLDNjZ5GsReSXPMZcpTV
   Q==;
X-CSE-ConnectionGUID: JH+PbxdCTJCPZkJKleY7Zw==
X-CSE-MsgGUID: KfWi+nALRLqCECDr5TTm5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91408446"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91408446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:26:34 -0700
X-CSE-ConnectionGUID: 115D0uZHR5KkBRFODx11Vg==
X-CSE-MsgGUID: g4vDM3sQRj+xa2G3PtjNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239259821"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2026 03:26:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0870395; Mon, 18 May 2026 12:26:32 +0200 (CEST)
Date: Mon, 18 May 2026 13:26:30 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 2/3] usb: typec: tipd: demote missing IRQ log to info for
 polling mode
Message-ID: <agrpVghBsrkcVKT3@kuha>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-3-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513182850.165349-3-radhey.shyam.pandey@amd.com>
X-Rspamd-Queue-Id: 26B1456AAD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37590-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:58:49PM +0530, Radhey Shyam Pandey wrote:
> Operating without an interrupt line and using the driver's polling path
> is valid. Log at info level instead of warning.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  drivers/usb/typec/tipd/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index b282366b5326..fcd56bcffab8 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1853,7 +1853,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  						IRQF_SHARED | IRQF_ONESHOT,
>  						dev_name(&client->dev), tps);
>  	} else {
> -		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
> +		dev_info(tps->dev, "no IRQ specified, using polling mode\n");

If this is a valid case, then the driver should not make any noise.
Let's use deb_dbg() instead.

>  		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
>  		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
>  				   msecs_to_jiffies(POLL_INTERVAL));

thanks,

-- 
heikki

