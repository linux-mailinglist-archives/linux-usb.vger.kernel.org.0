Return-Path: <linux-usb+bounces-38251-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OgsJFaOHWrFbwkAu9opvQ
	(envelope-from <linux-usb+bounces-38251-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:51:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2296204C4
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B53E730782FC
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4763ACA5F;
	Mon,  1 Jun 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVlbPIsS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336323009E2;
	Mon,  1 Jun 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321462; cv=none; b=C+QRQyYAyoH2m3+KlvA4Izz9bOagoAzc1kkUzS7LlvLkPikJEfZOq5qDVE5mnPiZY9dQeHbJUXhyZRz3vB2Bqarvp2gnECSkunO1meGCUv5npcePQMEfxCrkQqgepqpclc9MA19igxiTnEH/I3rMVfERPo8+trRgQrJwKd7RG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321462; c=relaxed/simple;
	bh=QaaoqTgY7mbCD7j81m65kbLiupzRLlixZZXI+Iby1cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8OIaZLa5BZA7WwJDK95Pk2UdCFiPEGMRWWBPlTs0RZLVGzmJ188iUo7KE1pdp9dtN0QJPkhEQiX3ap+CFYmyoI/9O0vXQo8cBpUse2LUfa+6bOvHqcX/V8J8YRu8WWd2EVy8ZHB6IZGYWx2BiTGnvyVeV/i922xnJ3BjHutdGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVlbPIsS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780321460; x=1811857460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QaaoqTgY7mbCD7j81m65kbLiupzRLlixZZXI+Iby1cE=;
  b=iVlbPIsSr1L3myFw8gPHgjLpgQR+lFYTIn1KeuLlSEdOpIfuxmaxGiTF
   ekb8F8a1Cnx5Gq292vXFsl4FUwXtG+q1PCc5vtQyM3fRxvL3OUzVl7RRw
   CJzk4f0ZJn4p+1oqcl7ewnijj4O9+TTfX+Ngjh1nWR/SaJIQqh1pSAGn7
   dc0pQLo1CpFK3DRu9zqP7FO3mSXuoPQR4EVsukiwLbzv8p1/PeGYT7VBp
   UqzaT27yHo9hQKaPsHZLAVItt0wu0KaqQhm3WctojUgkkI1OKu85TBgRE
   4guNt00RYF/vp3bnY4dz4T/QDut0OFpaUQ6NADbV7IaYON4GiEsemmz8W
   g==;
X-CSE-ConnectionGUID: LG2WSyIOTx+4sxJP+zCKCQ==
X-CSE-MsgGUID: WYrLDmWGTyWApY4FfH1yVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80217485"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80217485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:44:19 -0700
X-CSE-ConnectionGUID: zYPYdV1HQx2YDvxOmPJuRQ==
X-CSE-MsgGUID: 69zQOU6eQfS47GVe1aC5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247541277"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 01 Jun 2026 06:44:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8584C95; Mon, 01 Jun 2026 15:44:16 +0200 (CEST)
Date: Mon, 1 Jun 2026 16:44:14 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "usb: typec: mux: avoid duplicated mux switches"
Message-ID: <ah2Mrs6S2cwwcgza@kuha>
References: <20260530-typc-mux-modeset-v1-1-64b0281e2cd6@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530-typc-mux-modeset-v1-1-64b0281e2cd6@oldschoolsolutions.biz>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38251-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oldschoolsolutions.biz:email]
X-Rspamd-Queue-Id: 8B2296204C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 10:20:22AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> This reverts commit b145c3f29d62f71cc9d2d714e2d4ae4c8d3f863d.
> 
> The deduplication logic appears to cause issues with separate
> SBU muxes. The mode-switch call on these (like gpio-sbu-mux)
> never appeared, so no successful mode-switch happened. The more
> high-end Parade PS883X redrivers are not affected due to being
> retimer-switch. The revert fixes dp altmode mode-switch for both.
> 
> Tested on:
>   Lenovo Thinkbook 16 G7 QOY
>   Lenovo Ideapad 5 2in1 14Q8X9
>   Microsoft Windows Dev Kit 2023 (Blackrock)
>   Lenovo Thinkpad T14s G6
> 
> Fixes: b145c3f29d62 ("usb: typec: mux: avoid duplicated mux switches")
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index db5e4a4c0a996..9b908c46bd7df 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -275,9 +275,7 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
>  static void *typec_mux_match(const struct fwnode_handle *fwnode,
>  			     const char *id, void *data)
>  {
> -	struct typec_mux_dev **mux_devs = data;
>  	struct device *dev;
> -	int i;
>  
>  	/*
>  	 * Device graph (OF graph) does not give any means to identify the
> @@ -293,14 +291,6 @@ static void *typec_mux_match(const struct fwnode_handle *fwnode,
>  	dev = class_find_device(&typec_mux_class, NULL, fwnode,
>  				mux_fwnode_match);
>  
> -	/* Skip duplicates */
> -	for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
> -		if (to_typec_mux_dev(dev) == mux_devs[i]) {
> -			put_device(dev);
> -			return NULL;
> -		}
> -
> -
>  	return dev ? to_typec_mux_dev(dev) : ERR_PTR(-EPROBE_DEFER);
>  }
>  
> @@ -326,8 +316,7 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
>  		return ERR_PTR(-ENOMEM);
>  
>  	count = fwnode_connection_find_matches(fwnode, "mode-switch",
> -					       (void **)mux_devs,
> -					       typec_mux_match,
> +					       NULL, typec_mux_match,
>  					       (void **)mux_devs,
>  					       ARRAY_SIZE(mux_devs));
>  	if (count <= 0) {
> 
> ---
> base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
> change-id: 20260530-typc-mux-modeset-e5f8a38a100c
> 
> Best regards,
> -- 
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 

-- 
heikki

