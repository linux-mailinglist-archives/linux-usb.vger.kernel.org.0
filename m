Return-Path: <linux-usb+bounces-35373-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGUcCeJhwmmecAQAu9opvQ
	(envelope-from <linux-usb+bounces-35373-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:05:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE33062B3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 789C9305EF68
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742BC3DE449;
	Tue, 24 Mar 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpiIiaQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B833DE421;
	Tue, 24 Mar 2026 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346118; cv=none; b=t5ekw/RTYQm1qN8UjJY5tfXRizy+sMrh1pebkynJhxijkHVI2XW31nbj9cg1BrtO/3sMgmFkbO17q8bty9dSmPJyRnN1vdnomsSmpF0Um5GAZOikoDl+Vg+37C/lJVSBqr+ZupulJJ1t30HLBcf76KzxSlWeSd3NyfoqhrCtiMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346118; c=relaxed/simple;
	bh=YwgSy4xtNl1ZP02/vExJo+Y36gPFhXcBI7MstOfXII0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPb6LweqPerGrcvv3wCTk9H3+mbl1qUiffoI7ODDpReIcs6S3AkWjahkyyUyUaeihyHhRkFlkcMm8Z3xz5OBQTLBQ3k6jPhIw4Bl/6o+oQaVspcvc323qKn5GqF9XCof1COJQHWhews07B2J0U+ubvpMVUCbUP6lo/82cqQiYlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpiIiaQw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774346115; x=1805882115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwgSy4xtNl1ZP02/vExJo+Y36gPFhXcBI7MstOfXII0=;
  b=cpiIiaQwvSkQCMJVLutSdJO8DUyDzXyVAsUfDbN1eYmD0w3K0ca7BdZk
   FnMG0CfVzn5FoJywCG4vbTpLErCwJZi7G+3gMKC8ARJ/0rYZXgimjjBFt
   5K2WVHt7ZepiPc/JYvwO41UzAEW0BI2Ra9jWjDPY40jpBOgF7rZa2YwP8
   659Ltn296itCaPg49VUr/z9QnJSQQyAYcbc3vxZu369BaSN5IoInW2Ijd
   yOiJnwI2JWh1X9g9SxuyS5RBPz4t8sqNesckoXwAZUQQ86jW5mdDAoC+/
   0KDA5rpUO0lKjpdLTt2VmShBbQY8oNrpPfaGYW4aeDCQwxaU3wjreG2Ww
   w==;
X-CSE-ConnectionGUID: aue7I7uEQ3Ca0owgmDVAJA==
X-CSE-MsgGUID: 4Ch0Z0R1TWKXua4V9lo/CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86054509"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86054509"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:55:15 -0700
X-CSE-ConnectionGUID: fLwbJYk0SNim5gDuLGgpiA==
X-CSE-MsgGUID: 4nXPdn31SIKMy085ZmRNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228366864"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2026 02:55:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2F31395; Tue, 24 Mar 2026 10:55:12 +0100 (CET)
Date: Tue, 24 Mar 2026 11:54:27 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: Re: [PATCH] usb: typec: thunderbolt: Set enter_vdo during
 initialization
Message-ID: <acJfU2qlyj0QLUQU@kuha>
References: <20260324090223.919832-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324090223.919832-1-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35373-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21DE33062B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 09:02:23AM +0000, Andrei Kuchynski wrote:
> In the current implementation, if a cable's alternate mode enter operation
> is not supported, the tbt->plug[TYPEC_PLUG_SOP_P] pointer is cleared by the
> time tbt_enter_mode() is called. This prevents the driver from identifying
> the cable's VDO.
> 
> As a result, the Thunderbolt connection falls back to the default
> TBT_CABLE_USB3_PASSIVE speed, even if the cable supports higher speeds.
> To ensure the correct VDO value is used during mode entry, calculate and
> store the enter_vdo earlier during the initialization phase in tbt_ready().
> 
> Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Also a fix? In any case:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 44 ++++++++++++------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> index c4c5da6154da9..32250b94262a9 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -39,28 +39,7 @@ static bool tbt_ready(struct typec_altmode *alt);
>  
>  static int tbt_enter_mode(struct tbt_altmode *tbt)
>  {
> -	struct typec_altmode *plug = tbt->plug[TYPEC_PLUG_SOP_P];
> -	u32 vdo;
> -
> -	vdo = tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B1);
> -	vdo |= tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
> -	vdo |= TBT_MODE;
> -
> -	if (plug) {
> -		if (typec_cable_is_active(tbt->cable))
> -			vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
> -
> -		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
> -		vdo |= plug->vdo & TBT_CABLE_ROUNDED;
> -		vdo |= plug->vdo & TBT_CABLE_OPTICAL;
> -		vdo |= plug->vdo & TBT_CABLE_RETIMER;
> -		vdo |= plug->vdo & TBT_CABLE_LINK_TRAINING;
> -	} else {
> -		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
> -	}
> -
> -	tbt->enter_vdo = vdo;
> -	return typec_altmode_enter(tbt->alt, &vdo);
> +	return typec_altmode_enter(tbt->alt, &tbt->enter_vdo);
>  }
>  
>  static void tbt_altmode_work(struct work_struct *work)
> @@ -337,6 +316,7 @@ static bool tbt_ready(struct typec_altmode *alt)
>  {
>  	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
>  	struct typec_altmode *plug;
> +	u32 vdo;
>  
>  	if (tbt->cable)
>  		return true;
> @@ -364,6 +344,26 @@ static bool tbt_ready(struct typec_altmode *alt)
>  		tbt->plug[i] = plug;
>  	}
>  
> +	vdo = tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B1);
> +	vdo |= tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
> +	vdo |= TBT_MODE;
> +	plug = tbt->plug[TYPEC_PLUG_SOP_P];
> +
> +	if (plug) {
> +		if (typec_cable_is_active(tbt->cable))
> +			vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
> +
> +		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
> +		vdo |= plug->vdo & TBT_CABLE_ROUNDED;
> +		vdo |= plug->vdo & TBT_CABLE_OPTICAL;
> +		vdo |= plug->vdo & TBT_CABLE_RETIMER;
> +		vdo |= plug->vdo & TBT_CABLE_LINK_TRAINING;
> +	} else {
> +		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
> +	}
> +
> +	tbt->enter_vdo = vdo;
> +
>  	return true;
>  }
>  

-- 
heikki

