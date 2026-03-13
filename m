Return-Path: <linux-usb+bounces-34741-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AOCIrb3s2nYdgAAu9opvQ
	(envelope-from <linux-usb+bounces-34741-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:40:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAB28257E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02A3430498C9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4A337F8CF;
	Fri, 13 Mar 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DavXPohB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423CC2690F9;
	Fri, 13 Mar 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773402035; cv=none; b=r9UzRZ1b/lBr8QMk2aNHnMYFq/2Tv23lyr0f74G7cFqYFOLLDFA9oT1HARssm4P9oWS/6XduN07z512xiW+YWVcbkqeHGJnOQpdmrXpAx0hqWNy8tPNGEQfq/p3NOnG0LYdH4BuXv+YsilYuR3+jrON5DHEAKupbyznzQjIbxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773402035; c=relaxed/simple;
	bh=eUdyEt1K9ktTe15IY+RAwo7+xmEZBt2VpLieo0Mn23k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA2cojxMTDTriAinWjuDpmqz8QM4wTlJ4N5gPYLmGWBEND7FG3CO5cygQOw/4fJk6wwlM9XFKVidsnQFtffuhL8XusraTh4uURe2Rd1f83sHgT5WAZZ8fnQTPvGztwPgyCmghpMw1dZtY/o6nVl5nHMwGQuoVhBdS+K/ZMDD7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DavXPohB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773402034; x=1804938034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUdyEt1K9ktTe15IY+RAwo7+xmEZBt2VpLieo0Mn23k=;
  b=DavXPohBiyMkSAg/fdI/APCYvLX//bpCAAs5TDau1LR5ZRkjvJ6r2CNH
   XuTKcLy8ykNPPsPoAx5T/ms+oF78tfy4mVHIo+gsslPC/+W484Vs1hV/D
   6VPw74WdJ0hPevIrkStk7O90YuBKA9YYujaz+91GaNjQqgmDotG8mO5QN
   qB7qDX9xOkBopAEnEcpEST0N0RDB+VExKk8xDQUdzzN46lIIxdJ21i2TY
   sCxQcjCgmygMladZvWLfgw0Z56xLuUeQbAEdgN+pAvTdoM6fQiw3I3Zqu
   7RtGaZIrY6Mmhtsmgh/EjXgTpjGAvp0ufaoWXOjmCAbEx6iusB2snGSh+
   A==;
X-CSE-ConnectionGUID: n4yddnsATI+lCHmnD9BIVQ==
X-CSE-MsgGUID: p13HI7JWQCegYH2BP5zxGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="73523637"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="73523637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:40:34 -0700
X-CSE-ConnectionGUID: AiKMpy6gQMmcdWwyYb2cmg==
X-CSE-MsgGUID: JWhztHe/RRiAJEUpdgjAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="218483914"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2026 04:40:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1277F95; Fri, 13 Mar 2026 12:40:32 +0100 (CET)
Date: Fri, 13 Mar 2026 13:39:47 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Kit Dallege <xaum.io@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: add kernel-doc for priority and
 mode_selection members
Message-ID: <abP3g8bHPDNYqWHw@kuha>
References: <CAAZVx99U8a4w7cZihEyysaKD4R=pgXs4fKEegmvHv0Q3avJg7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZVx99U8a4w7cZihEyysaKD4R=pgXs4fKEegmvHv0Q3avJg7w@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34741-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 08AAB28257E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fri, Mar 13, 2026 at 12:29:56PM +0100, Kit Dallege kirjoitti:
> Document the priority and mode_selection members of struct
> typec_altmode that were added without kernel-doc descriptions.
> 
> This fixes the following warnings when building with W=1:
> 
>   include/linux/usb/typec_altmode.h: struct member 'priority' not
> described in 'typec_altmode'
>   include/linux/usb/typec_altmode.h: struct member 'mode_selection'
> not described in 'typec_altmode'
> 
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: resend so From matches Signed-off-by (Greg KH)
> 
>  include/linux/usb/typec_altmode.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/usb/typec_altmode.h
> b/include/linux/usb/typec_altmode.h
> index 0513d333b797..c7cfc4629484 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -26,6 +26,8 @@ struct typec_altmode_ops;
>   * @mode: Index of the Mode
>   * @vdo: VDO returned by Discover Modes USB PD command
>   * @active: Tells has the mode been entered or not
> + * @priority: Numeric priority for alternate mode selection ordering
> + * @mode_selection: Indicates support for the mode selection feature
>   * @desc: Optional human readable description of the mode
>   * @ops: Operations vector from the driver
>   * @cable_ops: Cable operations vector from the driver.
> --
> 2.53.0

-- 
heikki

