Return-Path: <linux-usb+bounces-36253-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFd6NGWI32nSUgAAu9opvQ
	(envelope-from <linux-usb+bounces-36253-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:45:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AD404627
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB8433016D29
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 12:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381A432936C;
	Wed, 15 Apr 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXcyNywJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E331E82A;
	Wed, 15 Apr 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257106; cv=none; b=OKNDLGyZi53DKpZiI+TKX1U5brB5X5EzsryqRxYN56yRF87Ilw8xyI0cYKkGKZ7A4pwRsjxGk0lkUzSeTSFNRb6JCQj+sPOgQhtTnOMKnJPJa25sKd3tZ3QPQ90VMe6QEdmgpkzo0oG9ClfD9MC6XrHE6W2EldvGVe3oOh4P8Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257106; c=relaxed/simple;
	bh=igRH5CCLvFZ4PSdtWdNVeYfjk/03NLFC9XyyMs+1FHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1L4Ey/hlrnqvI0WPjU4l/Q0PGENNMlImKcWv89ICVmMiMKEmeKLqGJryBIjeEiw15/zw2PMM0yA6JSm+6nldjCWp6uS350xeVtOECvKMjl4NnD3I/ByBjMxYblD2JtcyOicv+9RNxpXpIBKXh8S2fHZMzpFWM8c6XRZbsknPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXcyNywJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776257106; x=1807793106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=igRH5CCLvFZ4PSdtWdNVeYfjk/03NLFC9XyyMs+1FHo=;
  b=dXcyNywJwvjUBIl/A7XCsgvHz0YzoLnhxg+d/SRpTy0OjzXqxyEhU3EL
   LmBMSB5yfWQMxZJbhsulxYxzgtmt5H7ONDO/z2uI2fz07lcocsVnsQ992
   iaeHRMQfy1GQwmuUMTvci1tQhe1G4LIvkO/GRjBupmp8DfVVyJBcRz4US
   wfc7LlPrA5T+/bMkOa/6Z+PaYgSKC5/OOTWLTR5dxGUAzOJPilsopCf2M
   izbznmSBmJXLuWdeNHZS4cCnnyugGjois/+aF7lkVr4Y+3g46W/vKlpki
   tlJ8O1GSKVdXOZxeTNHbQB6PmolOOh4/SrLMDz85W9Rz8BhEqKeQkpkIM
   A==;
X-CSE-ConnectionGUID: 9f6168OsT+aH0ZsGSMq+mw==
X-CSE-MsgGUID: H/KawCN1QBaMT5zqVH2Vnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102690878"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102690878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 05:45:05 -0700
X-CSE-ConnectionGUID: NMzCfV27SBC8z8Z0NmBNDw==
X-CSE-MsgGUID: eKd1v70TTjOQ0VoDGnmjgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230655428"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2026 05:45:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E665F95; Wed, 15 Apr 2026 14:45:01 +0200 (CEST)
Date: Wed, 15 Apr 2026 15:44:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ulpi: fix memory leak on ulpi_register() error paths
Message-ID: <ad-IGn4nPnE0SsyB@kuha>
References: <20260407-ulpi-v1-1-f3fafe53f7b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-ulpi-v1-1-f3fafe53f7b2@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36253-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 258AD404627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:21:22PM +0800, Felix Gu wrote:
> Commit 01af542392b5 ("usb: ulpi: fix double free in
> ulpi_register_interface() error path") removed kfree(ulpi) from
> ulpi_register_interface() to fix a double-free when device_register()
> fails.
> 
> But when ulpi_of_register() or ulpi_read_id() fail before
> device_register() is called, the ulpi allocation is leaked.
> 
> Add kfree(ulpi) on both error paths to properly clean up the allocation.
> 
> Fixes: 01af542392b5 ("usb: ulpi: fix double free in ulpi_register_interface() error path")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/common/ulpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
> index b34fb65813c4..9b69148128e5 100644
> --- a/drivers/usb/common/ulpi.c
> +++ b/drivers/usb/common/ulpi.c
> @@ -286,12 +286,15 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
>  	ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));
>  
>  	ret = ulpi_of_register(ulpi);
> -	if (ret)
> +	if (ret) {
> +		kfree(ulpi);
>  		return ret;
> +	}
>  
>  	ret = ulpi_read_id(ulpi);
>  	if (ret) {
>  		of_node_put(ulpi->dev.of_node);
> +		kfree(ulpi);
>  		return ret;
>  	}
>  

-- 
heikki

