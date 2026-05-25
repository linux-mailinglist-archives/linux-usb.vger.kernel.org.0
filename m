Return-Path: <linux-usb+bounces-38012-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFQdLvYXFGo4JgcAu9opvQ
	(envelope-from <linux-usb+bounces-38012-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:35:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1305C8B01
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F5530156D9
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457243E639D;
	Mon, 25 May 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC+KPNsj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55C23E325;
	Mon, 25 May 2026 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701735; cv=none; b=agUfCJQSvtit0j9tEOhnXHs0DhUCh8XWU8hBbXM5DeFeIv6XL5/wXbOfUgjMG3ShttPfQEvVJ4MzVXnE2YgHJ+46T72/J/E4wtZSIvvb1HKOTn7dptoQa/uGALTULcrBrGuxfEpLm7z50WUTSmQMIxOzyxPOW4CZcxcpwyJfeoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701735; c=relaxed/simple;
	bh=zH0/zuGOwZ+8OwZXB/rIeRJMnVu14THUdS5gPKWrY+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa9FeC/NoavIlWyDaRbaVuzj5pZY/kN4YxV8iXW38fADWAXT6oymrPEApJXDRJ5dqm71hKM93xftIE0eETt7ZJyV6GHYoZjX7eQKDNtBlmEbp21dOWgpoLMjpC4kePg5FdOI2iicivCzN3GCICm22oMGM0FwywRFhh1px/sLOjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC+KPNsj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779701734; x=1811237734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zH0/zuGOwZ+8OwZXB/rIeRJMnVu14THUdS5gPKWrY+E=;
  b=RC+KPNsjxLAUh0MLSnKYZ4rwaPxKYU83D6yZHan3R7c82+LdRROrM2Oh
   NCDuYxLGyWc49ZvceUcu4m1AWr/piQmGgiOB24477026a5v8pZ1NwAUvi
   /LJ9KuQFPDEuw7fp5r51eumf0MKnus//Q2IVEJaueg2Z5ZXhxMAmWGkkr
   0ERcarPhXBCpP95+tblmaD9Q1wWxF6R8yZv0vAOwHQH2d5ytf+tBeamdy
   AALiidfJN0WZozhVYqLfpVNKZUtMTk6ZA/Kvp+yMekqbNsCKn+wfFlbm+
   p9AHqITtqQ06BoGD6jVLzaomCGMySuYW79F0L3b88nduyPfm9ndb73XI1
   w==;
X-CSE-ConnectionGUID: MavxcR3HRZGbwo0esgleCw==
X-CSE-MsgGUID: 8IgoWQn2Td2rUIxvPIoJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="103203007"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="103203007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:35:33 -0700
X-CSE-ConnectionGUID: lniWute6RHamYU+QDDP98Q==
X-CSE-MsgGUID: HytT79ggQ5Gr5qbsQIL4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="238982497"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 25 May 2026 02:35:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C13FC95; Mon, 25 May 2026 11:35:29 +0200 (CEST)
Date: Mon, 25 May 2026 11:35:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehezkel Bernat <yehezkel.bernat@intel.com>
Subject: Re: [PATCH 0/6] thunderbolt: property: Fix property parsing on
 big-endian
Message-ID: <20260525093529.GK8580@black.igk.intel.com>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-38012-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim]
X-Rspamd-Queue-Id: 2F1305C8B01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Sun, May 24, 2026 at 03:06:42PM +0200, Thomas Weißschuh wrote:
> The parsing logic currently only works on little-endian.
> Also make it work on big-endian.

I'm all in making it more portable. Do you have big-endian hardware with
USB4 support or you are just doing so to cover some future hardware? Also
how did you test this?

> The first four patches are necessary to make the parsing work on
> big-endian machines. The remaining ones are some trivial cleanups.
> 
> Based on thunderbolt/fixes.

I suggest basing on my next branch because these are really not
regressions, rather you are "improving" the code (and I prefer to keep
these longer in linux-next so that we could catch any unintended
side-effects).

> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Thomas Weißschuh (6):
>       thunderbolt: test: Make root_directory independent of host byte order
>       thunderbolt: property: Unify format_dwdata()/parse_dwdata()
>       thunderbolt: property: Make format_dwdata() work on big-endian systems
>       thunderbolt: property: Convert byte order of numeric fields
>       thunderbolt: property: Unify parse_dwdata()/format_dwdata()
>       thunderbolt: property: Make entry key modifications more visible
> 
>  drivers/thunderbolt/property.c |  93 ++++++++++++++++++------------------
>  drivers/thunderbolt/test.c     | 106 ++++++++++++++++++++---------------------
>  2 files changed, 100 insertions(+), 99 deletions(-)
> ---
> base-commit: 6ff00aaa856d16015e5bafbcf89e3998fd4a7c2b
> change-id: 20260524-thunderbolt-big-endian-9f012cfc062b
> 
> Best regards,
> --  
> Thomas Weißschuh <linux@weissschuh.net>

