Return-Path: <linux-usb+bounces-38065-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHX/HQinFWqJXAcAu9opvQ
	(envelope-from <linux-usb+bounces-38065-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 15:58:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4A5D6F55
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 15:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6701B3038F56
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 13:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120B53FB06E;
	Tue, 26 May 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPLfGOXK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4503F9F5E;
	Tue, 26 May 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803719; cv=none; b=rdidABhpgedojyp4/aTWcYAGAGnGqr46I45jXEbzEpuAUcFJhbjAHU3tuhElOeuJ4MpXeFFgHu63TS01ANK6QVQG7XL4GOWgMs8rkTDpoY6UNDmi+2KHTfWZmymdS23ovb5DgE/gNXGivJbdeSB0bTUh/XYQPkwupEvgf0G4PwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803719; c=relaxed/simple;
	bh=Ju/9Uk9f16tnxqKTWvMRxO/WOaG6UiqZUR3K6eRZrlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl2lr1aouuWUZpE23OAq75lHU6gNf7IvjfabNM3rIg9lN6EyJmeYJUfCfOtzL1w49w2itJPEWN5BrcqjhPlIHadiui+5soeI8I1ZGSN3hXDOGAY9hSyNamG38piPipDoOKwrhHhHPw5f7FFew9WKdzfAka3YbEVxBE3BitLO/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPLfGOXK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779803718; x=1811339718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ju/9Uk9f16tnxqKTWvMRxO/WOaG6UiqZUR3K6eRZrlI=;
  b=VPLfGOXKR8dBtQr3pqKumTdib8RPGtJRIQ7O+WBHuKrokrnH3aqAsbrj
   73nQnP3vtdyLAOLJNqtGLTXfSTZxLTlVqPoW5WU65rneRPZgMKhjswxuW
   G+ms1e5xNQVKtEXKuEcOTTbCNhi7VB+GPkTiz/QsaaBQg4CfYcaAweXna
   CJW2vF05AwxO27srHFxwlH87wkonZhrf5GPwCReHEPS9K9TyeZuLWmtVt
   ZNKSHmv/JOGO7Wjq3/IgOplFNkhLMcubF92fRqJG8qhjsnE8IpTGoBMnJ
   cZpWELIRAsIgSP26Hy2Z76h+01jDMu9YmwflbfayeLGC32hkv0J0X70fG
   Q==;
X-CSE-ConnectionGUID: QY5t8zwwSIK/wl3KkFaqMw==
X-CSE-MsgGUID: buBlzY4iTMinuyXufI+M6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79762233"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="79762233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 06:55:17 -0700
X-CSE-ConnectionGUID: mDXMZwKYQju7HSV1TJT4kw==
X-CSE-MsgGUID: ACIz3Ij5TqS2Ku9ntmNcPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="239328357"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 06:55:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A49CC98; Tue, 26 May 2026 15:55:14 +0200 (CEST)
Date: Tue, 26 May 2026 15:55:14 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: prevent XDomain delayed work use-after-free
 on disconnect
Message-ID: <20260526135514.GQ8580@black.igk.intel.com>
References: <20260525125736.1268929-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525125736.1268929-1-michael.bommarito@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38065-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: C3E4A5D6F55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, May 25, 2026 at 08:57:36AM -0400, Michael Bommarito wrote:
> tb_xdp_handle_request() runs on system_wq and queues
> xd->state_work via queue_delayed_work() in three request handlers:
> PROPERTIES_CHANGED_REQUEST, UUID_REQUEST (via start_handshake),
> and LINK_STATE_CHANGE_REQUEST.  Similarly, update_xdomain() queues
> xd->properties_changed_work from bus_for_each_dev() when local
> properties change.
> 
> Concurrently, tb_xdomain_remove() calls stop_handshake() which does
> cancel_delayed_work_sync() on both delayed works, then
> device_unregister() which eventually frees the xdomain.  Since
> commit 559c1e1e0134 ("thunderbolt: Run tb_xdp_handle_request() in
> system workqueue") moved the request handler off tb->wq, the
> handler and the remove path are no longer serialized.  If
> queue_delayed_work() executes after cancel_delayed_work_sync() but
> before the xdomain is freed, the delayed work fires on a freed
> object.
> 
> Add xd->removing that tb_xdomain_remove() sets under xd->lock
> before calling stop_handshake().  Each external queue site holds
> the same lock and checks removing before calling
> queue_delayed_work().  This provides the mutual exclusion needed:
> either the queue site acquires the lock first and queues work that
> the subsequent cancel will see, or the remove path acquires the
> lock first and the queue site observes removing == true and skips
> the queue.

There are bunch of changes that touch xdomain.c in my thunderbolt.git/next
branch and some of them change how tb_xdomain_remove() work. I wonder if
you could check against that branch if we still have this issue?

