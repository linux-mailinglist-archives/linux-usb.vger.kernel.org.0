Return-Path: <linux-usb+bounces-38064-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEaMEsCjFWprWwcAu9opvQ
	(envelope-from <linux-usb+bounces-38064-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 15:44:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 418505D6C13
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 15:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A14A13154E83
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1397C3FBED1;
	Tue, 26 May 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6u7y/Ed"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EE53FF885;
	Tue, 26 May 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802334; cv=none; b=NVTTltIKVmEulLswMxgHoaqCX+7A/6+ndoBMGYHiWuao3+k9Fo0JCNwJGfwgWp7fT+H2rHLfnnfETZHLBNcun/GgYko/KmKgjtvZh6I1MAfLsrajqMgm4hgUhxnkvR07KN54Mmszw2qzUyJHQsxuXK5hpwQ7F3RP8dLITieVfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802334; c=relaxed/simple;
	bh=naOd3Yz+KrIr7vzeEOffhi4Rqcya381gjmXOnDHsYio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGoLYkiDaH5EsFZynMa7Ep9iG7U9SQs3a9kfDaxlYITq6Gigulvu9B1pD0p9v4Miac7lWR0UEEU1eQLgXG4zrSJ2RRSt5xBBLN4QfBxLoLGzEbrcEej7YxPbZwg5MliX9yOtTP4dI1e4IXjRkBa9JPW6TpA2crxv7g7iihnAK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6u7y/Ed; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779802331; x=1811338331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=naOd3Yz+KrIr7vzeEOffhi4Rqcya381gjmXOnDHsYio=;
  b=Y6u7y/EdIWLD6SLlSMSVSsGhbvjA+s2EnbzQZpWwgbMlXnWow6dZYJ6J
   ugs8dL9WpdONXMC1eihfwNGfatBp6L6iJjrDqwy2Hhrj76aQbosfyaFEP
   EyG1tYcJqqq4RGX2TCzkRxG+2DbN4miY/8bryo5rIOrYmM5LFd7AyV8c+
   PJgovFfoTbOgGvzBNKxfu2NUqkgh1Ty5VfmOQAoo8etq/bWh1ThX5Inyz
   7MEmx76A1yH1bgUWY1JmFHud66aIcjXMxdZ7RiyLn8hUcisLXU1bX8bdj
   TMRRCTWV24bUdH7fyHYGFgK06k3OM/jR71jqThUWRKLCAn2fOhD4xvGl+
   A==;
X-CSE-ConnectionGUID: wG3DRNAMRY6eMTMl6I3kZw==
X-CSE-MsgGUID: Yo//7pCgQ4eWR3S/IoQDbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="68138167"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="68138167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 06:32:09 -0700
X-CSE-ConnectionGUID: qxKMmR6XSyeO7oISCs1FTA==
X-CSE-MsgGUID: 27bIQ3BzTiiCiuY9GTrzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246182881"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2026 06:32:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3EFCC98; Tue, 26 May 2026 15:32:06 +0200 (CEST)
Date: Tue, 26 May 2026 15:32:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] thunderbolt: harden XDomain property exchange
Message-ID: <20260526133206.GP8580@black.igk.intel.com>
References: <20260525092830.735472-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525092830.735472-1-michael.bommarito@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38064-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 418505D6C13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, May 25, 2026 at 05:28:24AM -0400, Michael Bommarito wrote:
> This series fixes 4 memory-safety defects and 1 data-handling
> hardening issue in the Thunderbolt XDomain property exchange path
> (property.c and xdomain.c) and adds KUnit regression tests.
> All are reachable from an adjacent Thunderbolt peer without
> authentication.  The XDomain protocol runs automatically on cable
> insertion regardless of the configured security level, unless
> disabled with thunderbolt.xdomain=0.
> 
> Patches:
> 
>   1/6 - reject zero-length property entries in validator
>   2/6 - bound root directory content to block size
>   3/6 - clamp XDomain response data copy to allocation size
>   4/6 - validate XDomain request packet size before type cast
>   5/6 - limit XDomain response copy to actual frame size
>   6/6 - add KUnit tests for property parser bounds checks
> 
> Tested with KASAN on v7.1-rc3 and over Thunderbolt 4 hardware.
> KUnit regression tests (patch 6) confirm the fixes and existing
> tb_test_property_* tests pass on the patched tree.
> 
> Based-on: thunderbolt/fixes (928abe19fbf01)
> 
> Michael Bommarito (6):
>   thunderbolt: reject zero-length property entries in validator
>   thunderbolt: bound root directory content to block size
>   thunderbolt: clamp XDomain response data copy to allocation size
>   thunderbolt: validate XDomain request packet size before type cast
>   thunderbolt: limit XDomain response copy to actual frame size

All these applied to thunderbolt.git/fixes.

>   thunderbolt: test: add KUnit tests for property parser bounds checks

This one applied to thunderbolt.git/next.

Thanks!

