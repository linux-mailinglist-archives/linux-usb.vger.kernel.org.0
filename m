Return-Path: <linux-usb+bounces-34566-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKEEB9h1sWnovQIAu9opvQ
	(envelope-from <linux-usb+bounces-34566-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:02:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86313264FA7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA455304609F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27CA364035;
	Wed, 11 Mar 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K28CEYX+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945E3630BF;
	Wed, 11 Mar 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237631; cv=none; b=ovMfkih8WPdu3njFDXwOs1e9Fz/kKwxKbsuXdbGph2AEfUqSaYsPlLqyfKz6YT/tkS99HXIjR21RhUDSAqvbMrTXUUa3A1vF3FiihNCavHdLaTTyjfUQDadt5zJBWdTuhyJgC2Isx3FgteHPO7RZA6l5UC9XxOOT80+TBjx/8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237631; c=relaxed/simple;
	bh=ZABq3YcoOB/+vPS4cjgG/dTgLwZa0NrYSc3e6rZwVlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QogBF4DBXQvAvTNZyfkwyja1cPOr3OJc65l5+REdLYknaBYUnr/lUlHZHOkxZDcwNpkUQkb7+mGtf4rgmeJRKeG7BVPwImtk/jb6+xpY+ot9lo4MEBU4WgyVTFHonmR79SEyEWZMjDWQQrn9JO3QGx4nK0tpqX7QwUj9l71zofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K28CEYX+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773237629; x=1804773629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZABq3YcoOB/+vPS4cjgG/dTgLwZa0NrYSc3e6rZwVlA=;
  b=K28CEYX+DiAijBfAu5DN/1FlJFILdHhaKOSVggxdI3WCq3h6qSfzbis4
   8tOl5NkU5/yqWj6IxKtBT5Misc4gySgJz3QQcE5RjvXCvchwR5ZnCOPsM
   S0zEiG3PWKeJzgXA/YpcH0s4aCFLb5t5B2WU/WIEx1la+B+B3Iy9kbjQl
   fru55OgfwQc4+6+WfjW605hNwbVinQE65DYfw9WV12Xf2rNd5vSKlTCNa
   TvbOV/q/ToYpzUj4o/beXgQ/VF4NIhGyR3Axyoj+SkH+9dQaezP+RlLUX
   +PCHLSnpM0P0FZCzlMZO/LuYKecuFVig7MtIbjPNPJZS+ys75s1hNHmbn
   Q==;
X-CSE-ConnectionGUID: TfcZYw7SRo2GrOs63XSmSg==
X-CSE-MsgGUID: 5hmbD7jpQ3+eX1WAQjzFLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78197562"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="78197562"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 07:00:28 -0700
X-CSE-ConnectionGUID: 25TGe8YAQLyAR0oA93jB0g==
X-CSE-MsgGUID: 4raiCVH/RumGLymRaPcKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216725496"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:00:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 569C795; Wed, 11 Mar 2026 15:00:25 +0100 (CET)
Date: Wed, 11 Mar 2026 15:59:43 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: gregkh@linuxfoundation.org, utkarsh.h.patel@intel.com,
	andriy.shevchenko@linux.intel.com, badhri@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v1] usb: typec: altmode/displayport: set displayport
 signaling rate in configure message
Message-ID: <abF1Tx7YQ2mdu2SW@kuha>
References: <20260310204106.3939862-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310204106.3939862-2-rdbabiera@google.com>
X-Rspamd-Queue-Id: 86313264FA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34566-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Tue, Mar 10, 2026 at 08:41:05PM +0000, RD Babiera kirjoitti:
> dp_altmode_configure sets the signaling rate to the current
> configuration's rate and then shifts the value to the Select
> Configuration bitfield. On the initial configuration, dp->data.conf
> is 0 to begin with, so the signaling rate field is never set, which
> leads to some DisplayPort Alt Mode partners sending NAK to the
> Configure message.
> 
> Set the signaling rate to the capabilities supported by both the
> port and the port partner. If the cable supports DisplayPort Alt Mode,
> then include its capabilities as well.
> 
> Fixes: a17fae8fc38e ("usb: typec: Add Displayport Alternate Mode 2.1 Support")
> Cc: stable@kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index d185688a16b1..35d9c3086990 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -100,9 +100,14 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>  {
>  	u8 pin_assign = 0;
>  	u32 conf;
> +	u32 signal;
>  
>  	/* DP Signalling */
> -	conf = (dp->data.conf & DP_CONF_SIGNALLING_MASK) >> DP_CONF_SIGNALLING_SHIFT;
> +	signal = DP_CAP_DP_SIGNALLING(dp->port->vdo) & DP_CAP_DP_SIGNALLING(dp->alt->vdo);
> +	if (dp->plug_prime)
> +		signal &= DP_CAP_DP_SIGNALLING(dp->plug_prime->vdo);
> +
> +	conf = signal << DP_CONF_SIGNALLING_SHIFT;
>  
>  	switch (con) {
>  	case DP_STATUS_CON_DISABLED:
> 
> base-commit: bb375c251ab40bdbc5272008fcf2bc6cd5266610
> -- 
> 2.53.0.473.g4a7958ca14-goog

-- 
heikki

