Return-Path: <linux-usb+bounces-37589-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KN/Je7nCmoE9QQAu9opvQ
	(envelope-from <linux-usb+bounces-37589-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:20:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940656A90E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0489B30297B4
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBB230568E;
	Mon, 18 May 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AurOLIPW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79C318B9C;
	Mon, 18 May 2026 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099550; cv=none; b=lVnhBclNbKvUXo5CY35FhUbCAZagv9jBpeLgtwhi7NOMWWLG1whrL7Vgd2kAUMffLgAXl+Ou9cRWS+msmrP4GJE58a8e7FHeu0AgneBXQk9vO3ysWH9TUroZoN+OM6DwFVyPBNdPOqFSynxJ7XvbJk8S+9TvdwgVK5X6fpPwEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099550; c=relaxed/simple;
	bh=1L1UKtbo9vWc/AC3JGvRF2l+/l9q4ke7yjXSF7WHK9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv5rdnDpgHkdcdSxgQZ1m5w7yepMrFD4YLkvou21hHEre4wnKdXjruz7DayBzr+5eJauz3FeRMeHXcNgDzzgn0qQQYFGgHb25pICkwDel7dKkC88hl4kT2FPFkvqZYR0ko5acre380oTBTZbr2zOOhhKCyoWsERWlH6/BXCC51E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AurOLIPW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779099546; x=1810635546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1L1UKtbo9vWc/AC3JGvRF2l+/l9q4ke7yjXSF7WHK9k=;
  b=AurOLIPWgzKFgL4joXIBwCSIJSqgoHe4GSgZDWTTApxQY5F28C3RT3gy
   v7T6SUSWLt+ujlUw69VxRQB9uwnyUwqVmQzRZm3b8si1K0jd/fqWEJCAB
   Vt54oL9dPJmtLKoVhyGTa5T4Ta0DEZQuNSbs7qBIYShM3V1TJ7MZxKKS8
   HgeVrOC0NanbNmT4D3QaBU4qutQjGP7e5CmnyMiBCSXtzKeRfx7SiPGas
   WR/FrT3qyve6hq/gr1Ae+Cv7zX//STVWVgARo9afNa+6pDiU1wHkhFDBD
   577gFR20bzEgHD+3Zmgte3xrSQCLk5nmdlBBphgj9Jv5xygNLneE5M2NB
   A==;
X-CSE-ConnectionGUID: kM70WPvDQ32hzxhr2p+70g==
X-CSE-MsgGUID: KMTfnvj6SemnzyGeup8zhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67476980"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="67476980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:19:06 -0700
X-CSE-ConnectionGUID: cAnizM2+TLuf+psE3BiKUg==
X-CSE-MsgGUID: N6oEV/vzQzWRDlRpV1RVCQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 18 May 2026 03:19:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8FBF795; Mon, 18 May 2026 12:19:03 +0200 (CEST)
Date: Mon, 18 May 2026 13:19:01 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 1/3] usb: typec: tipd: add error message for vendor ID
 read failure
Message-ID: <agrnlRSyW7_A0AiS@kuha>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-2-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513182850.165349-2-radhey.shyam.pandey@amd.com>
X-Rspamd-Queue-Id: 1940656A90E
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
	TAGGED_FROM(0.00)[bounces-37589-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:58:48PM +0530, Radhey Shyam Pandey wrote:
> Log when the vendor ID read fails or returns zero, including the I2C error
> code and register value, to ease probe diagnostics.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  drivers/usb/typec/tipd/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 43faec794b95..b282366b5326 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  	struct tps6598x *tps;
>  	struct fwnode_handle *fwnode;
>  	u32 status;
> -	u32 vid;
> +	u32 vid = 0;

Why is this necessary?

>  	int ret;
>  
>  	data = i2c_get_match_data(client);
> @@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
>  
>  	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
>  		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> -		if (ret < 0 || !vid)
> +		if (ret < 0 || !vid) {
> +			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
> +				ret, vid);
>  			return -ENODEV;
> +		}
>  	}
>  
>  	/*
> -- 
> 2.44.4

-- 
heikki

