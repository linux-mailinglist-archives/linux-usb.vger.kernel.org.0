Return-Path: <linux-usb+bounces-37598-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH6tCQ/zCmpZ+QQAu9opvQ
	(envelope-from <linux-usb+bounces-37598-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:07:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0356B3EF
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B6343006818
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898223F2102;
	Mon, 18 May 2026 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0hs1+pF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE43F44DE;
	Mon, 18 May 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102467; cv=none; b=JUt+UiRM7IZEFjLPqsUtUe8piSycgOiaBFjjeW/UEYSBWS2qwGISLQ9Ut9N6UxczJtHfAiKf7qFbSgQ2MNOEZN1bgew0RavfEiP2wjPTLQH+gfbS4DvgJGzLSOkGINRuT4YpoZP/D6slXjk9Y02RE2cBDok5COHYtsXAL9LYXrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102467; c=relaxed/simple;
	bh=H/yBgRXxrJ9y3iNvaEzTneMnDDizqklmxFFPXsQ9nSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQ7R1N9It3wy1UriGYFlm6SrGUGRIPmxYF1duRT9gTk9TjduLxNjLUINYd41slEOzMLBlxUHcugVSwKuzW0QvNQiE5pe60fWhuwBMWAsugssz7RssZCOzUixb1wSGRKYu1CGIeVkoSmhIXJkrtgNlMElX9tNyqbaJuBUC5eDNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0hs1+pF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779102456; x=1810638456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H/yBgRXxrJ9y3iNvaEzTneMnDDizqklmxFFPXsQ9nSY=;
  b=J0hs1+pFk4HAd97nnmJbqFQzxm1iUnd0DAfdUiUDyufoOW/dXgvf8baH
   QwyaGkoyv9Hr8b0+AibfS+s5ff2beVZtZhvEgX0t88Ot8aRae6nPf5tEr
   ve7j7WDHJd2LDFTqICqf65ESFHzwnWDsaJ5+02on7Z42wbvIOXy6DQlbs
   LYvpDyenYn1f+OSrif/jZuqOM6jPtt8YMG/IdpG2B3n2PCZnKOmr1orY2
   GBfBj9N2JWmwKQD9aj/VY/ko6rVID81YCcw8LS4XQBSfiPoJTqXCdaG0y
   AYpSRn3fXgwgdSMWcaylFGTKwRfiTM/UvE6VJ/BfHAuAKsbgMKFJs/DI2
   g==;
X-CSE-ConnectionGUID: UQBfCVLASsWh6C3U+vBpdQ==
X-CSE-MsgGUID: reRM5MNJRtmxNsbgxuoewA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83823503"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="83823503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:07:26 -0700
X-CSE-ConnectionGUID: /WqaaajNQ5ixjKCxqMQX+A==
X-CSE-MsgGUID: WbUERcf9QXuty1D3qiMQGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="241209230"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2026 04:07:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D0C0095; Mon, 18 May 2026 13:07:23 +0200 (CEST)
Date: Mon, 18 May 2026 14:07:22 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH 2/8] usb: typec: altmodes/displayport: validate count
 before reading Status Update VDO
Message-ID: <agry6iOJesGW3w9O@kuha>
References: <2026051347-clustered-deflected-9543@gregkh>
 <2026051350-reacquire-sculpture-4244@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051350-reacquire-sculpture-4244@gregkh>
X-Rspamd-Queue-Id: C1D0356B3EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37598-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:52:49PM +0200, Greg Kroah-Hartman wrote:
> A broken/malicious device can send the incorrect count for a status
> update VDO, which will cause the kernel to read uninitialized stack data
> and send it off elsewhere.
> 
> Fix this up by correctly verifying the count for the update object.
> 
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 35d9c3086990..263a89c5f324 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -405,6 +405,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  				dp->state = DP_STATE_EXIT_PRIME;
>  			break;
>  		case DP_CMD_STATUS_UPDATE:
> +			if (count < 2)
> +				break;
>  			dp->data.status = *vdo;
>  			ret = dp_altmode_status_update(dp);
>  			break;
> -- 
> 2.54.0

-- 
heikki

