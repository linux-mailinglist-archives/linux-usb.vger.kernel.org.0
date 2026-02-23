Return-Path: <linux-usb+bounces-33568-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCbfDH1snGmcGAQAu9opvQ
	(envelope-from <linux-usb+bounces-33568-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:04:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B321786CD
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31493073A5A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2257528C037;
	Mon, 23 Feb 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDoZyiMi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E136274652;
	Mon, 23 Feb 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858706; cv=none; b=oV9kWLiUZQMxY9G+GFL1cdx5LXTtje5NDxnpqk2JpgTKAJgRbhmBsVtTRLsBYaBpExHNkc+pqRs4/JgbyxJX3Z5cETG1Ge16cuQ249rNe/BaZJaHf7RWvhVASg9SihXyWo0PuHiug8nfegXiKItW9XdnLi6YL4GAT1QcC8xA3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858706; c=relaxed/simple;
	bh=iHecwv9TSXTcntmliMB88/2uug5fgnB3b4oP0BZSY3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB23rsThJ0rHP4TddEBAXSq56ZVlZ1yy0BTY13PQqRn5GPggRU5KydEJnypDBYEn4BngUUbWJf7Vo0t9I/q9pR/VSKmquMq9X01tmGjk67e36E5/ZNgJJiRQC+PyJVwCDYVQMcswXZf8Hz+s4Hfg0k+kgWJoA94Pbesp8cnfyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDoZyiMi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858705; x=1803394705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iHecwv9TSXTcntmliMB88/2uug5fgnB3b4oP0BZSY3I=;
  b=UDoZyiMimphN8P6BXHTnT2YeTmRYVZvWc7j5H7YsBsgcbVABHjKWDbEx
   C/m5hdLms6dWQTV7br2X45RhRmz0N+Q+LWDW9vZaJcEky/bHoZXQ3+J6I
   AAwgA+Lvb8BeOiOVV04e3ARDQmAfhzSNficvV5lJEGhkdGAoKbeGGJwj3
   kn7CdE/fgcxoHEZHIvA1pxTwpsscIDvrFAJlO30AmsV2rRqq5DNobUEab
   /6BcbwnrfRAOAlpwEO/gzWOHF9Dq/uX/f8/3y0Qn2De7/YayPFlhzIA3E
   RN2nR8G1wnCYV8vvnA+ApXl8QXd2GWBR3AxQgdpS4zwKWFLKy/4ydOq7P
   Q==;
X-CSE-ConnectionGUID: 2745Ne/4QFuQ6QsEoCqd5w==
X-CSE-MsgGUID: kCoAJSiuSIKNwu0imzOGWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72954451"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72954451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:58:24 -0800
X-CSE-ConnectionGUID: M9N4vSrgT0uy85DvVnYqLA==
X-CSE-MsgGUID: 0oVW7mSlSu2vPAC/hi3vIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="220132876"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.123])
  by fmviesa005.fm.intel.com with SMTP; 23 Feb 2026 06:58:20 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:57:45 +0200
Date: Mon, 23 Feb 2026 16:57:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan@kernel.org,
	venkat.jayaraman@intel.com, pooja.katiyar@intel.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH] usb: typec: ucsi: Invoke ucsi_run_command tracepoint
Message-ID: <aZxq6MO5YxkWyWNI@kuha>
References: <20260217103403.1956-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217103403.1956-1-loic.poulain@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33568-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 87B321786CD
X-Rspamd-Action: no action

Tue, Feb 17, 2026 at 11:34:03AM +0100, Loic Poulain kirjoitti:
> The ucsi_run_command trace event is exposed in tracefs, but it never
> produces any output because the UCSI core never invokes the associated
> tracepoint. As a result, enabling the event under events/ucsi/ yields
> no traces, preventing users from inspecting UCSI command sequencing.
> 
> Wire the tracepoint into the UCSI command path so that commands are
> properly reported.
> 
> Example:
> 50.692342: ucsi_run_command: GET_CONNECTOR_STATUS -> OK (err=0)
> 50.692345: ucsi_connector_change: port0 status: change=4800, ...
> 51.750298: ucsi_run_command: GET_CABLE_PROPERTY -> FAIL (err=-5)
> 51.773360: ucsi_run_command: GET_CONNECTOR_STATUS -> OK (err=0)
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index a7b388dc7fa0..965bb7f4e24e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -234,6 +234,8 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
>  	if (cci & UCSI_CCI_ERROR)
>  		ret = ucsi_read_error(ucsi, connector_num);
>  
> +	trace_ucsi_run_command(cmd, ret);
> +
>  	mutex_unlock(&ucsi->ppm_lock);
>  	return ret;
>  }
> -- 
> 2.34.1

-- 
heikki

