Return-Path: <linux-usb+bounces-35048-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEMCLdaqumn9aQIAu9opvQ
	(envelope-from <linux-usb+bounces-35048-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:38:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB82BC305
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 065B6304C7FC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57123D8139;
	Wed, 18 Mar 2026 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivjRHZY5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDF3D8132;
	Wed, 18 Mar 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841098; cv=none; b=p+zwwp1glsUQQHPLt2CGHJHhees9lchXX74ek023mKVxdEEEGgjLl5lfORdYPIkQ3buCMWwI4XRHbBg0wtQGmG+L+l6fUwK/Ebk6TJ384TBj0a8fiKCeWUDnrQ04dg40hWc9xpF3ZPfGzG4Aieja1+22f6UFjkK1+67SwPBaS6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841098; c=relaxed/simple;
	bh=D/xxZG6koYBNq94sSPdwVXiM3nMrthlxI76p7GhAZ7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdXTTZ23t6CN09k3t0M/MF60rnj4ykBKTHb6Ya1uhpMYgnTvO1H6gQY9MdMI0TV+60ZbPoyPpjcIQdNwen7p2jxXKor5jUD2zfjOmfAgWVBTfHmLtc4lTvd8d+Ww2yJF8pbkiMR+PnBaXZ0AJSSFPmEPxq+yOVDUpI8qKEz5lwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivjRHZY5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773841097; x=1805377097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D/xxZG6koYBNq94sSPdwVXiM3nMrthlxI76p7GhAZ7c=;
  b=ivjRHZY5vS8ESTqDtUEFlZNF5ApEaXAa3gxl4uBGW3TWQlGbGYnWgLGH
   ixlTPRBboE3ZliMKk4ITzzjDAcWBeol1uQkRwYhx4iF0qtNE/dVnbfx25
   w5Fwul2AschfoP0FlqjnjWsnAFrg08ilw6l/IDTrR5xYmSvtlJDlGCwQw
   0jsNiAMmkIvKGC0h+GV0XARUKX3ah69abyKlcvLMGpSEvatdv60BWleH/
   0V26hfXIW5NrU0sPLNVrIsapYOtB/xYOR3CQP5VQhisl893J/Lew+WJS4
   2t0CYu8kLapfnrEtP+E4iZxy9SotfnQeWtclYvUQLytJjaIj7eVsZcXQD
   Q==;
X-CSE-ConnectionGUID: eSIflJg+S5m3AtxDJWdEbg==
X-CSE-MsgGUID: 8exSn8bUTs+wIEYAUJXXYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="97501807"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="97501807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:38:17 -0700
X-CSE-ConnectionGUID: Ty7UBnTtTeefykENJE+6yw==
X-CSE-MsgGUID: Guwcg+mbSfCFmx/CiO/oug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253103872"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 18 Mar 2026 06:38:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B2FF098; Wed, 18 Mar 2026 14:38:13 +0100 (CET)
Date: Wed, 18 Mar 2026 14:38:13 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: dma_port: kmalloc_array + kzalloc to flex
Message-ID: <20260318133813.GI2275908@black.igk.intel.com>
References: <20260313214137.4257-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313214137.4257-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-35048-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 02FB82BC305
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:41:37PM -0700, Rosen Penev wrote:
> Use a single allocation with a flexible array member. Simplifies
> allocation and freeing.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to thunderbolt.git/next, thanks!

