Return-Path: <linux-usb+bounces-33035-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKZfOvnDgWnZJgMAu9opvQ
	(envelope-from <linux-usb+bounces-33035-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 10:46:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53523D70C1
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 10:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA716314300B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 09:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED6639900D;
	Tue,  3 Feb 2026 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXtyOJKl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54097396D09;
	Tue,  3 Feb 2026 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111602; cv=none; b=biaXx/fLRKjuvL6xhu6UQv/CMVD5CkQbYMiY4/O0kQLkX+kWUjtesuuo95ndUhzkk9jiyK3eBotAGcE6qjh26S+kXaLCGuzbmu7Q2BwOHuLQEzhACCj1HLEA9vaVi9+MucgXdtJxx8/rdhKYY8qb9bcZtYO8AA1t+uNDsFmHYgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111602; c=relaxed/simple;
	bh=j4PVeRa+fJfHfjKSgXXVVZ2S/GOd4n0CnA0DfhaVwBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX3ct2tiTjyj03l8vXXBcRAbVBCvWHnRh3ebpzxDGvga2ducFs/GkXPGVQfQe2YDSjdM/C9bVmveR5WBqx39goX/Q1H4b5t40uevpqr+2uWRRWKvZUJOEme2kXx8cM/hgbcuQwY+7CCYFME5N3Ku/8gYcwxDucB8FHE0bBzLNDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXtyOJKl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770111602; x=1801647602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j4PVeRa+fJfHfjKSgXXVVZ2S/GOd4n0CnA0DfhaVwBU=;
  b=BXtyOJKlDSwPaZqMR5xotV1VI9jiAbDIdEgx8p8mz4y01Opwaj56o4MP
   OqN52SuCKKfvI8jApj9sbKfBv4silsKwDblWvvQtBiUSDj6bmwt1uecsc
   0sTLhy3/zMTdMtPvDYDmTqPgjUb/TU0MuvPn8f1wxH585z7ncGhY/o1p9
   et/hebOIXEAXrmsxVcqfYLoXDU0VdsA8Vwl+vNVxyN6VsQG+rg796/xdu
   0DEXogTDA+qCvHVuE+xiBTZXQmodCLaSiQXghSVGrzPDFcudxREhOPAcp
   SDz01jkBzszgXZx5h+K6x4JFXr7CwP1W7B8LM/GZx1yhuNIoG3kXCZGrd
   A==;
X-CSE-ConnectionGUID: y1vDTMkAQ3uYxMuwsyXAxA==
X-CSE-MsgGUID: u+tiX19wT4ycc+5R8owy5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96735864"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="96735864"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:40:01 -0800
X-CSE-ConnectionGUID: FGXX/W9IRuydwDBTgmTwoA==
X-CSE-MsgGUID: iVdDi93cSKWWxYSAE30lmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214758183"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2026 01:39:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3C69795; Tue, 03 Feb 2026 10:39:57 +0100 (CET)
Date: Tue, 3 Feb 2026 10:39:57 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jayi Li <lijiayi@kylinos.cn>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260203093957.GD2275908@black.igk.intel.com>
References: <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-33035-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 53523D70C1
X-Rspamd-Action: no action

Hi,

On Tue, Feb 03, 2026 at 05:04:53PM +0800, Jayi Li wrote:
> > If you do this on Intel host do you see the same?
> 
> I also encountered a similar issue where the PCIe hotplug IRQ is not
> received
> after path setup completion. This was observed specifically during
> Thunderbolt 3
> device hotplug testing.
> 
> To investigate, I applied a debug patch (attached below) to dump
> ADP_PCIE_CS_0.
> I observed that when the issue occurs, the PCIe upstream port's LTSSM is not
> in the DETECT state,
> yet the PE (Port Enable) bit remains set to 1.

The PCIe Upstream Port is TB3 device?

For TB3 there is no LTTSM state in that register so the value you read can
be anything.

We can do it for USB4, like with this patch:

https://lore.kernel.org/linux-usb/20260127094953.GF2275908@black.igk.intel.com/

It should be modified so that it just checks for the USB4 side.

> My workaround is to check the LTSSM state before the path setup.
> If this specific anomaly is detected, I explicitly set PE to 0 to reset the
> link state.
> With this change, the link returns to the correct state. After the path
> setup completes,
> the PCIe hotplug IRQ is received correctly.
> 
> I'm not sure if this is relevant to this issue, but sharing just in case.

Thanks for sharing!

It could be. What device this is? 

