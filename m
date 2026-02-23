Return-Path: <linux-usb+bounces-33572-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDMMNWBunGmcGAQAu9opvQ
	(envelope-from <linux-usb+bounces-33572-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:12:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DC1788C0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E65307B7DB
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61CA364055;
	Mon, 23 Feb 2026 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5c5wV8V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF834F275;
	Mon, 23 Feb 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859275; cv=none; b=IOhzDxsyG3d44HT/clMqEDJlqhkqVrzJd2JJPtz8eyTmgGp+vSyGedwEyPgVSGmxYsaSUTyGR96d1kC/PO0w1oC2bKWjp4MusPDx8Bob5ctZoqy4Z9dYOKS1S08p3U6lj1wKZswL8wY9zXLvfcdOo/BRQXRUJz+qLW3LXycr7dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859275; c=relaxed/simple;
	bh=VBkj7o4+t63VRys8I8refJHOwr/tRRzpf5srgI8UQr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knn0JG/5JtGwW2S861FmYKDaZYpBIPUfIbbTVLr93D0AHw+oZBIUdQpSqif2b5tjBHLwQQWRi5lfSz4eMt6LvyFl8IoWUCDThtZT5rSQvsw7X31No2vCiMTeuiP17JHA1KQnclVlaAgY9w2LpbFUryCNqzeFQ6kWgQEYmc4XP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5c5wV8V; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771859274; x=1803395274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VBkj7o4+t63VRys8I8refJHOwr/tRRzpf5srgI8UQr4=;
  b=I5c5wV8V+fTWnmwebBoGeH3zayFF24I76na1d2rdpj6+93CDJr4SrPVe
   UiA9f1xo338TLrahOeBZHjDXduORl00BottSF/iaH/Kb1YeljNIgx7h8Y
   6NLhsH9IAGoJKbsaw68fPI1Gnhly+wnSuKLZVcUJjdm9T4Pev/DpEudtv
   SOQDeruzX4O7gu5ogtC6QkCLDB++e5QGuP/zzhgZarweeMNyUStYJT6N7
   UDp+YRL8ufDcJQtloi++UVsf8UOTIqITCpbDtR3fbFJUFgSa/+d8bkfeb
   lWUAEwdLnLOb6yv08XmSLpo762c1yXsiVFMKRhUE6M8NqdN2RGjTu4hKR
   w==;
X-CSE-ConnectionGUID: jSghkbk9Tl+wOPrnvXZwoA==
X-CSE-MsgGUID: 0Q8LeEMdQwqVae0Js5m4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72733352"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72733352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:07:54 -0800
X-CSE-ConnectionGUID: ozgvFE1GQg+A8kOBK+gsLQ==
X-CSE-MsgGUID: cJ/lDaTETVSnbt+63Fc2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214668715"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.123])
  by orviesa006.jf.intel.com with SMTP; 23 Feb 2026 07:07:50 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 23 Feb 2026 17:07:15 +0200
Date: Mon, 23 Feb 2026 17:07:15 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, sven@kernel.org, neal@gompa.dev,
	marcan@marcan.st, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Fix error pointer dereference
Message-ID: <aZxtIw6tJl-g397V@kuha>
References: <20260218214621.38154-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218214621.38154-1-ethantidmore06@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33572-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 646DC1788C0
X-Rspamd-Action: no action

Wed, Feb 18, 2026 at 03:46:21PM -0600, Ethan Tidmore wrote:
> The variable tps->partner is checked for an error pointer and then if it
> is, it sends an error message but does not return and then immediately
> dereferenced a few lines below:
> 
> tps->partner = typec_register_partner(tps->port, &desc);
> if (IS_ERR(tps->partner))
> 	dev_warn(tps->dev, "%s: failed to register partnet\n", __func__);
> 
> if (desc.identity) {
> 	typec_partner_set_identity(tps->partner);
> 	cd321x->cur_partner_identity = st.partner_identity;
> }
> 
> Add early return and fix spelling mistake in error message.
> 
> Detected by Smatch:
> drivers/usb/typec/tipd/core.c:827 cd321x_update_work() error:
> 'tps->partner' dereferencing possible ERR_PTR()
> 
> Fixes: 82432bbfb9e83 ("usb: typec: tipd: Handle mode transitions for CD321x")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index e2b26af2b84a..43faec794b95 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -820,8 +820,10 @@ static void cd321x_update_work(struct work_struct *work)
>  			desc.identity = &st.partner_identity;
>  
>  		tps->partner = typec_register_partner(tps->port, &desc);
> -		if (IS_ERR(tps->partner))
> -			dev_warn(tps->dev, "%s: failed to register partnet\n", __func__);
> +		if (IS_ERR(tps->partner)) {
> +			dev_warn(tps->dev, "%s: failed to register partner\n", __func__);
> +			return;
> +		}
>  
>  		if (desc.identity) {
>  			typec_partner_set_identity(tps->partner);
> -- 
> 2.53.0

-- 
heikki

