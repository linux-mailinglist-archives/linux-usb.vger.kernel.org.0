Return-Path: <linux-usb+bounces-36965-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF1nN5zc+WkwEwMAu9opvQ
	(envelope-from <linux-usb+bounces-36965-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 14:03:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DD4CD2C8
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 14:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9264F301D81D
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 11:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D27539A075;
	Tue,  5 May 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIcnfoFI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543037CD5E
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982266; cv=none; b=Wu4pUEDbcU+Z+0h9Gf6NVa2u2gW542ZphkyBEF7GRSQH2m8q60QZRqGhiKNgq3tWy3SUqEfG2c8IZeRKmtbLRY5/2rKknaQyO+YRMVhGIbrsbKzzc4BAVWf3vMCmejP5s/sx9KQqV75Q0OgATVKTK/yAPP321lrgIkbCj3dONkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982266; c=relaxed/simple;
	bh=CxgSBt3e8WxNh9JTeL43kbkrlqcRwYvOfiDbAizWyPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4aHApdyo3PkffFk8dOEgNIIjUEPMnfFC4SmxOxWfPGir2mDW0mfiEXS32DVa2bdloK9mG3b6zkGyMFYYpQwgIqIVH8LtrNtq/o7Cd/pPenfTWcg8E32B52rFE2z1MfgXTNMP6V+bH5bjyjnw1U0kgHJFKQjYDCAjOquAXdwR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIcnfoFI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777982265; x=1809518265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CxgSBt3e8WxNh9JTeL43kbkrlqcRwYvOfiDbAizWyPY=;
  b=NIcnfoFIV+LZNfctu4R7EttoJKMD7F814LxH8PN1iJ9RSWxl8fSS26L8
   I+0bk+1Sa/4psQ38QnCQ/q+QTCY4ilWUdXnP5w5pgoqatdut6CGJAvCYQ
   vtD5kSN7l9pt3SarMU94Qez9jgDxUsR+MWuRZu2N8ZEVQeJY5j2PTN9oE
   Enfu1JsDPfJB/0yG8/ftPRozPFwVLG6sAWS/u4nlQa3Lcic8+SgOhazDt
   w4AGsq9BvWSZL6A95Ek2SMceVbmFXXtSvA1SSh4fZpnbt/rniLGVUJX7f
   vEsar9q/MY7lqQ7vOVMdQX0Nx7HYpBQVNIzeUEZNU4m2kqdgLgvSIhbGD
   Q==;
X-CSE-ConnectionGUID: B9ycnJBjQKWxRMs7qplEJw==
X-CSE-MsgGUID: clZck5mbSVWlZ7DqbpUBhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101520330"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="101520330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 04:57:45 -0700
X-CSE-ConnectionGUID: PReugSqhSSSnQ2XQPnEWMw==
X-CSE-MsgGUID: eP23av0nRtieaRsNIwnPwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259146209"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2026 04:57:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0C44C95; Tue, 05 May 2026 13:57:42 +0200 (CEST)
Date: Tue, 5 May 2026 13:57:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 00/12] thunderbolt: Improvements to XDomain handling
Message-ID: <20260505115742.GF6785@black.igk.intel.com>
References: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
X-Rspamd-Queue-Id: A62DD4CD2C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-36965-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim]

On Mon, Apr 27, 2026 at 10:10:57AM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series improves the Thunderbolt peer-to-peer (aka XDomain) handling in
> various places in the driver and tries to make it follow the USB4 spec more
> closely.
> 
> Alan Borzeszkowski (1):
>   thunderbolt: Don't create multiple DMA tunnels on firmware connection manager
> 
> Gil Fine (1):
>   thunderbolt: Avoid reserved fields in path config space for USB4 routers
> 
> Mika Westerberg (10):
>   thunderbolt: Don't disable lane adapter if XDomain lane bonding isn't possible
>   thunderbolt: Make XDomain lane bonding comply with the USB4 v2 spec
>   thunderbolt: Keep the domain reference while processing hotplug
>   thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
>   thunderbolt: Set tb->root_switch to NULL when domain is stopped
>   thunderbolt: Wait for tb_domain_release() to complete when driver is removed
>   thunderbolt: Keep XDomain reference during the lifetime of a service
>   thunderbolt: dma_test: No need to store debugfs directory pointer
>   thunderbolt: Remove service debugfs entries during unregister
>   thunderbolt: Remove XDomain from the bus without holding tb->lock

All applied to thunderbolt.git/next.

