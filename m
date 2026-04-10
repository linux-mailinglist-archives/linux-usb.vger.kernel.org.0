Return-Path: <linux-usb+bounces-36140-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAeGFNEM2Wl+lggAu9opvQ
	(envelope-from <linux-usb+bounces-36140-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:44:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE43D8C53
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2305D300DA7F
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 14:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494FA3D646B;
	Fri, 10 Apr 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEqNLjTe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC43D47A3;
	Fri, 10 Apr 2026 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832260; cv=none; b=BMgyE+p7818Ar+3KfSZrVGa7NnOGFTZXXiJM/Jk2y4vG0uRf5pKAptMf08jlBHPUK3y5KBoNgO5FW/PpuT/E49B1tVBH9Pu0/ddFEZPGftG66saT3+no0sQJVbg6ih8caDVyS9oWz/eLBFHqng5GTUAJ4OhXojlq8zRAp239Nyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832260; c=relaxed/simple;
	bh=w+Fgu0zNFCOPa334F4pZAV+3SUzh15ZcibFkvLNsawk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSrLuLSUwm/6I7yVtR6H//bu3lEN7MB7tEQmuueaC/SqZzQoewcqvrF+/3nUD3x/ZMdv6+G1iklt2MvqJUqZWhjAsAZ62Wux9XuGcnIpFod24i9FnTYffLem7IMS69M0N7bWwAlESDFaAMrEtuPi61q9pMHCshnP6QJOaKdscn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEqNLjTe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775832259; x=1807368259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w+Fgu0zNFCOPa334F4pZAV+3SUzh15ZcibFkvLNsawk=;
  b=jEqNLjTefcpMCPiHTsuuVL/pnAvpzBvtLLGZ/lUc7UXNV7/tTxEUHBla
   a/iIEP7H745rjS2O1hkKHE5if7cBqkVfn0r98HrUB4LKwzB85TcK2WkYK
   rpIA4SUvW729K1tHI4Ad88wyB5euqxEYeBEwex+fJqiejploRm9LFM+rI
   RI+mFKZVs++R5rYvUiRjOWkxMv8UMw541foezNScoF5L1w5T4b/+LW6q3
   +SI2KBZ9PudGvNqF6nUSJ2QEPGDd7MrMm7Cb9FK+u54DHMd4hv8z9YzTV
   U60UR+YPj0cyHi+qQxA2IeLf+BlJJiCEz9jgIG7Hg+RCG/gIzMVaYSOqv
   g==;
X-CSE-ConnectionGUID: DgI5i8QkRF2n2+QeOTtvyQ==
X-CSE-MsgGUID: 49qSy7ZMSV+U/h23Z/4KJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76742187"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76742187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:44:18 -0700
X-CSE-ConnectionGUID: k59TzopmQ4Opturt+vjEMA==
X-CSE-MsgGUID: NrGcP7fLSX+gQlR3QjQThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="222616322"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 07:44:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6EFC898; Fri, 10 Apr 2026 16:44:15 +0200 (CEST)
Date: Fri, 10 Apr 2026 16:44:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
Message-ID: <20260410144415.GL3552@black.igk.intel.com>
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
 <20260409120457.GH3552@black.igk.intel.com>
 <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>
 <20260409143203.GI3552@black.igk.intel.com>
 <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36140-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: B9CE43D8C53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 04:29:43PM +0200, Konrad Dybcio wrote:
> On 4/9/26 4:32 PM, Mika Westerberg wrote:
> > On Thu, Apr 09, 2026 at 02:59:22PM +0200, Konrad Dybcio wrote:
> >> On 4/9/26 2:04 PM, Mika Westerberg wrote:
> 
> [...]
> 
> >>> I assume you have tested this on a hardware that supports this too, right?
> >>
> >> Hardware that exposes that register this does not exercise the altered
> >> code path.
> > 
> > Well it may happen now that previously we got -EIO from some other register
> > and we stopped there, now this changes and we actually continue reading so
> > this definitely should be tested.
> 
> The only register before USB4_SB_GEN4_TXFFE that isn't in-spec for
> both retimers in v1.0 and v2.0 is USB4_SB_LRD_TUNING (0x07). The PS8830
> interestingly reports all zeroes (not a bounce).
> 
> The registers following USB4_SB_GEN4_TXFFE in the array are
> USB4_SB_VERSION and USB4_SB_DATA. The former is not accessed anywhere
> else in the code, at first glance. The latter is, during NVM r/w and
> in margining ops, which have definitely been in use for a long time.
> 
> Plus both of them are the v1.0 spec. The USB4_SB_GEN4_TXFFE specifically
> isn't (the retimer supplement pdf lists it as Rsvd, the main spec pdf
> omits it in the SB register table), as it wasn't previously useful (since
> Gen4 came about in v2.0).
> 
> 
> I don't think there's an easy way to limit the reading of this register
> since the bit indicating Gen4 capability is in USB4_SB_LINK_CONF (0x0c),
> which is Rsvd on retimers regardless of the spec revision. A connected
> port could easily have higher/lower capabilities, too.

Agree.

> So all in all, my understanding is that any bugs caused by this patch
> (which would have to be in the form of "reading a register causes a
> wrongful change in behavior") would really surface spec non-compliance
> from a retimer, which should be quirked out explicitly if that's the
> case.

Right. Also given the fact that this is debugfs access so not anything we
would do during normal operations, likelihood of this causing issues for
regular user should be pretty low.

> I only have hardware with various Parade retimers, none of which claim
> Gen4 support.

Okay I can give the next version a try on my test systems to make sure
there are no surprises. I should have a pretty extensive variation of
retimers (v1, v2 and pre-USB4).

