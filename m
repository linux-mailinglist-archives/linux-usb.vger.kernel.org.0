Return-Path: <linux-usb+bounces-38223-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHBFASYvHWo4WAkAu9opvQ
	(envelope-from <linux-usb+bounces-38223-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 09:05:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C361AA3A
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 09:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 546203005A88
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5334E383325;
	Mon,  1 Jun 2026 07:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtQp70BT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA6382F28;
	Mon,  1 Jun 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297483; cv=none; b=q15Mf1DxLJtgGCbz7WCVNL3f1VElsyuq3edb+CsA7yWWg5CvcgKdgo1qXlRFwyMZ9FWxyil2S/hzqsGsEtD/FZ9jxAc9dDEgli6CSgkL5mphqv06QWjP+LVWd9GHKWFMvVB17AZLIlPGID0gW1E1UBrFqxEF+He2iBfnAe5sp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297483; c=relaxed/simple;
	bh=9FPWriJ7gIuuaSYwq2oY2VhNH0ZZDsl7M8+mFjBm+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYiCnf3pLG8qaIwyXigHpD60JFpG7X1NZwPBp8B44aZqMek/s2fAYYT/psArUvVRkzArwyWSbKmAst5R0d6fWfr5JuUGFDc1TRZwVDjaIS/8uoX06cBAbPpUAULHRyuHowuc1nD3ATDcXdpzGhFGi3xksblNNf7RynMTZMF8bMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtQp70BT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780297482; x=1811833482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FPWriJ7gIuuaSYwq2oY2VhNH0ZZDsl7M8+mFjBm+fE=;
  b=PtQp70BT3szN0xgRePJ5vbE10nYwNTY3zuLZ8Y7VIfYpxTq/E7/KlWFP
   t+N3OEn3M9bcQff9+knaeZdRAw9heKacCSUTWDUhASbHgIBK0zUObTbsJ
   9WYIzpk2WwzAb/5D8OBS46+AENPAggo7l97iGSDdYvr+38avMG8hy+q2Q
   ckRmcGE4FbA8K8ITXkdyI5NWLlLbUPMbzW2Hd2wOCLZDsI2qH0a4+pVed
   YXZL8wHwcsfT2oJ+saLzVMJCnIbwlXGKB3w/jjr959LMkqoFw1X/OJQSG
   Fv4JRcY533Uxw1Yc6g3JmHjDE6JUNArIHDmBvBDZER03OZSdaEL+YEKLr
   A==;
X-CSE-ConnectionGUID: D3RO5TjoTPS1WTlj8W3LVg==
X-CSE-MsgGUID: 7dvWJn/ERAyg5A6cbp0sSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84907596"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="84907596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 00:04:42 -0700
X-CSE-ConnectionGUID: 7DmnkAV5QUiCfoqZLDXdgg==
X-CSE-MsgGUID: IoXXsq1RQxek0wi8kHFRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="267368344"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2026 00:04:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 795A295; Mon, 01 Jun 2026 09:04:39 +0200 (CEST)
Date: Mon, 1 Jun 2026 09:04:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: An Wu <an.wu@canonical.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
Message-ID: <20260601070439.GO3102@black.igk.intel.com>
References: <20260527064121.173952-1-an.wu@canonical.com>
 <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com>
 <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com>
 <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
 <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38223-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 141C361AA3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, Jun 01, 2026 at 02:50:21PM +0800, An Wu wrote:
> Hi Mika
> 
> Another approach I considered is using register_module_notifier() to
> detect when a display driver module is loaded, then retrigger the DP
> tunnel setup. However, since struct module does not carry any device
> class or subsystem metadata, there is no generic way to identify
> whether a loaded module is a display driver. We would need to maintain
> a hardcoded list of known GPU module names (i915, xe, amdgpu, etc.),
> which is fragile and not scalable.

Indeed. Perhaps not to try to solve this in the kernel and instead do this
in userspace?

Have you actually measured how much initramfs size "increases" if you do
include the relevant graphics drivers and their dependencies?

