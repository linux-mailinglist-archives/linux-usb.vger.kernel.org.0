Return-Path: <linux-usb+bounces-38132-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JXQITwZGGoBdQgAu9opvQ
	(envelope-from <linux-usb+bounces-38132-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 12:30:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 043AF5F0967
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 12:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3892D30711A4
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F97E3B95EB;
	Thu, 28 May 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIetF4BW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271133B7B68;
	Thu, 28 May 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964179; cv=none; b=ectCzKx568zoCyBQoFjbLz+kuXzEkn74CDsrmwAOM8RQQcpLcboxOm4bCzGJNPSLhNb6M5L1obbZKYuv+3u8A+9Mz+xa6voc5iKBcL2zcLvNrF2hHOrCSG4kLV58wqVMdEbCXswr+uie9iZBE+bMTlSshTKJKTWFODsRWwyzxWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964179; c=relaxed/simple;
	bh=42NSg1bAKksVAnZwYpIwHH5q3A5tw3nLgDuLSxxoQJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPJyr2KLDPWM3jQwpBKV7YCCngVzlSXoWGjSgJ52M6BYxyUmA9myK2iMLj9rtcN3iB5x6BaxO+bOhyYtOWEjQhm3A1BpE2GNZ+mQClaK+FAWJrl9VNIj1y8STbQNfZ/aBfZ3LXRjeIe6DZA65galk1cITuz5IZIwXAFMXMBp9KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIetF4BW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779964178; x=1811500178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=42NSg1bAKksVAnZwYpIwHH5q3A5tw3nLgDuLSxxoQJs=;
  b=BIetF4BWhcFkwzs3/tOzdEJiLfRbKOCBYukjMYjK9GoVT1xhxlQgmTmz
   AB7i7iglPMCPo/GPkxbqCa7Cv9QiX2ZKMCYGO/6z3mWW+0KEP7QBClav3
   /42VZ2rB8mIJyWSmEkubeEoXFG6IF1Aae9TO9UTecEeVZYPAugke9xRHI
   A6L1+fLrWavD1u62qbBtT3M3J9F7m19Js6vIqCnOSNxuYTZqLDDgqhjcw
   FJpbPC0i8fSFFH3hM1VuDtXKJLUU6B0+JR2i8ppMiT1eQ5AGw0ACkDqdU
   HxYC3P/N6Ojjle2c1RlBR/9WEsGkxLdbNci+bziS7ebh76RrDvaYLjKp2
   A==;
X-CSE-ConnectionGUID: 22Bbp4N9RQyOJc8ov+8C+w==
X-CSE-MsgGUID: IYygGdq+Swmx7UtCcJsznA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79837232"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79837232"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:29:37 -0700
X-CSE-ConnectionGUID: 6/Lq0tonTmSx+IXGtD/IXQ==
X-CSE-MsgGUID: Dl/EFMhKT4qUH6qAKaZuNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="247457951"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 03:29:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 64DF498; Thu, 28 May 2026 12:29:34 +0200 (CEST)
Date: Thu, 28 May 2026 12:29:34 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: An Wu <an.wu@canonical.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
Message-ID: <20260528102934.GH3102@black.igk.intel.com>
References: <20260527064121.173952-1-an.wu@canonical.com>
 <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com>
 <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38132-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 043AF5F0967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, May 28, 2026 at 09:03:30AM +0800, An Wu wrote:
> Hi Mika,
> 
> Thank you for the feedback.
> 
> Sorry for the mess, and I understand the concern that the Thunderbolt
> CM core should not call PCI-specific functions, especially since the
> direction is to support non-PCIe hosts as well.
> 
> Putting graphics drivers into the initramfs does not look practical
> for us, because we may need to include many possible graphics drivers
> and dependencies, which would increase the initramfs size and
> complexity. Moving Thunderbolt out of the initramfs may also cause
> regressions for users relying on Thunderbolt docks early in boot, such
> as keyboards in the recovery/LUKS shell or network devices for
> early/rootfs use cases.
> 
> The problem I am trying to solve is that graphics driver readiness can
> affect Thunderbolt DP tunneling, but the graphics and Thunderbolt
> drivers currently run independently without any coordination. As a
> result, Thunderbolt may treat a temporary graphics-side readiness
> issue as a permanent DP tunnel failure.
> 
> So the goal is not to make Thunderbolt depend on PCI, but to find an
> acceptable way for these components to coordinate, or for Thunderbolt
> to retry/check readiness in a more generic way without adding
> PCI-specific logic into the CM core.
> 
> Could you please give us guidance on what direction would be
> acceptable upstream?

The DPRX timeout is there for a reason, although the reason is not really
that common. Basically if there is nothing connected to the DP IN we can
detect that and be able to use another DP IN to provide user a working DP
tunnel.

The timeout itself is currently 10 + 2 = 12s to allow i915 enter runtime
suspend and still be able to detect (via polling) a connected monitor.
However, it is not really "written in stone". VESA spec wants it to be 5s
but for our usage it is way too short. I have no problem increasing it
either but then some users may suffer due to the above reasons (if a DP IN
is not connected). Maybe increasing it is a reasonable compromise?

The other option is to put the DP IN to a "penalty box" for a while but I
don't think this helps because you need the hotplug event for the DP OUT
part and that's not happening after we have acked it.

