Return-Path: <linux-usb+bounces-32541-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKymErK1b2nHMAAAu9opvQ
	(envelope-from <linux-usb+bounces-32541-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:04:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC645483E3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AF3270D4E1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 15:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6A14611E3;
	Tue, 20 Jan 2026 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrnRr864"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592CF45BD6E;
	Tue, 20 Jan 2026 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922755; cv=none; b=lnrl02D4QRTc6wxvXtP1nKWe68RI1qJMn5EFlm0suzzt9i3wkxFlbcsa5SQyFCbBCsKM5UD5gzvoEGn5/EFqhcOXOwu2lF8IXasxw24trfleNguJ30uTKt7gay42WiveIlk6uLtJiCEzITf25j0YVd08yMNtrEI7yKdjahP1VYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922755; c=relaxed/simple;
	bh=ht8Q/ZuAtLLqjH85Z00gW0O4dnPuuWxyCz0o/51R494=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vwg38jde5bEow/o2Y42kjS61haObwfpBZE80+Gmx58uacMGLsnV78mNbMR3I55qY3zOiWoOiJw5H0bRH35K70cJSt3rt54wHssbtKzEgAzb46xa+dgQAQ9a5K6wbufYbvEaAaNMfcz1gLub569FrWIxps/tny6TjfzY2uC0r8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrnRr864; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922754; x=1800458754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ht8Q/ZuAtLLqjH85Z00gW0O4dnPuuWxyCz0o/51R494=;
  b=JrnRr8644RDm9Nx/flOIlT084eU0NL1mrHAplRqHXuIC+6dNSTJ2432n
   YP8htiw1CLq3Y+H6wpqEzgt/ObkN8HNZjVK2HeFASaA6F4u74M5VpkxF5
   F4BJihu+D54RMXFeHkns9u41YKyR/5w7zSDtC7G+A7SGKyHsoiUCWVspd
   ZA9VC59eRDdwpfVCNnAKfXvppB2vmEs2P6v0iYzL8JeECIfau2OUnZBPv
   VoPufGW8j/+nVtwJBeg4e0wRF3Xja+AVbsh1HjwconfpJwLb0qgn8dVF3
   RsG0h5LZHdMzkYiBaNy5HJ38SOPTIgTFAwhYRlbFp82yo9ivyKruoZOr4
   Q==;
X-CSE-ConnectionGUID: SY2kR1PoS8qZrnsE6dPteQ==
X-CSE-MsgGUID: WP+rXYxmS/GAIjM/bsFL9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70298146"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70298146"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:25:53 -0800
X-CSE-ConnectionGUID: X+7scJXGRyGBccFrGeB/ug==
X-CSE-MsgGUID: KL3OFwn6TSON9eWOyAx+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206405648"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.217])
  by fmviesa008.fm.intel.com with SMTP; 20 Jan 2026 07:25:47 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 20 Jan 2026 17:25:23 +0200
Date: Tue, 20 Jan 2026 17:25:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v5 5/7] usb: typec: Introduce mode_selection bit
Message-ID: <aW-eY8JCKNpgwa2I@kuha>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
 <20260119131824.2529334-6-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119131824.2529334-6-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32541-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: AC645483E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Jan 19, 2026 at 01:18:22PM +0000, Andrei Kuchynski kirjoitti:
> The port driver sets this bit for an alternate mode description to indicate
> support for the mode selection feature. Once set, individual Alt Mode
> drivers will no longer attempt to activate their respective modes within
> their probe functions. This prevents race conditions and non-prioritized
> activation.
> The bit is not set by default. If left unset, the system retains the
> current behavior where Alt Mode drivers manage their own activation logic.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 6 ++++--
>  drivers/usb/typec/altmodes/thunderbolt.c | 2 +-
>  drivers/usb/typec/class.c                | 1 +
>  include/linux/usb/typec.h                | 1 +
>  include/linux/usb/typec_altmode.h        | 1 +
>  5 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index d96ab106a980b..d185688a16b13 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -804,8 +804,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	if (plug)
>  		typec_altmode_set_drvdata(plug, dp);
>  
> -	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
> -	schedule_work(&dp->work);
> +	if (!alt->mode_selection) {
> +		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
> +		schedule_work(&dp->work);
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> index 6eadf7835f8f6..c4c5da6154da9 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -307,7 +307,7 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
>  	typec_altmode_set_drvdata(alt, tbt);
>  	typec_altmode_set_ops(alt, &tbt_altmode_ops);
>  
> -	if (tbt_ready(alt)) {
> +	if (!alt->mode_selection && tbt_ready(alt)) {
>  		if (tbt->plug[TYPEC_PLUG_SOP_P])
>  			tbt->state = TBT_STATE_SOP_P_ENTER;
>  		else if (tbt->plug[TYPEC_PLUG_SOP_PP])
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index a48c447125184..dbba53f024977 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -655,6 +655,7 @@ typec_register_altmode(struct device *parent,
>  	alt->adev.svid = desc->svid;
>  	alt->adev.mode = desc->mode;
>  	alt->adev.vdo = desc->vdo;
> +	alt->adev.mode_selection = desc->mode_selection;
>  	alt->roles = desc->roles;
>  	alt->id = id;
>  
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index dbb259d885266..d61ec38216fa9 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -155,6 +155,7 @@ struct typec_altmode_desc {
>  	/* Only used with ports */
>  	enum typec_port_data	roles;
>  	bool			inactive;
> +	bool			mode_selection;
>  };
>  
>  void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index 70026f5f8f997..0513d333b7977 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -37,6 +37,7 @@ struct typec_altmode {
>  	u32				vdo;
>  	unsigned int			active:1;
>  	u8				priority;
> +	bool			mode_selection;
>  
>  	char				*desc;
>  	const struct typec_altmode_ops	*ops;
> -- 
> 2.52.0.457.g6b5491de43-goog

-- 
heikki

