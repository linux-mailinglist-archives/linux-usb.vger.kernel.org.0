Return-Path: <linux-usb+bounces-38148-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BDKGbgzGWpTswgAu9opvQ
	(envelope-from <linux-usb+bounces-38148-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 08:35:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDD5FE015
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 08:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B825300D7A5
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 06:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B3F3A9DAB;
	Fri, 29 May 2026 06:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lddg7AqD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68A39D6DD
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036529; cv=none; b=oqmJY7EcGLh09ack1CmTdpd9IMHmx8Dy0hQUeMQJCcK9aeKiurryqjLTaQ58eb1zeIfwzC3/y0Gp3MSUfJ7NKG8Umrnxtr5Pr7TY1KFVz16xeEsXvOYhVDpGhg+UtR9w/ivgccUTqdGW9lQdwohfWvApCCMi1Oa2X6fg1ux0xVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036529; c=relaxed/simple;
	bh=KulmRfsCRdxX3WAcV3aOlBDhzSthGWcalI4NLuV5l9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etJgfgYUoWRAe+XVVVEsKIQL/TL7/PKRAu5N48siJKVm9CnOiVy1RGtcqrKKeXi7Y2OgtaXeamRtgMbtzCk/cFgbDuqxxi7YxPW57+Dx/r4NoDwk7O3Wiip4ivpxrxv1yi7LC7XoYtqsPrk2q2cH1X1ZpgpFeN5n/wyWdomu+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lddg7AqD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780036527; x=1811572527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KulmRfsCRdxX3WAcV3aOlBDhzSthGWcalI4NLuV5l9g=;
  b=lddg7AqDAh+YVMKnKiYpFZWvDI8qIHgEJY3vNlwcYhO32b25PchKAJj7
   WV3JWOwIXlqOswZwJpxsmQt33L0kRqxmiYlm8jiRaojSIC04UkHlb6qNK
   wFcgcOGAuyeVY8UtBOOgVtvSgz71MchL66Hs7yBrPt/en9FL+Z6NlN+OR
   jbhTQc+xqfbkzKhXaJFaAXuGOBgsII1iYuCGOIwbhcskNaMeqxapJmnm6
   +2ULX3e/kNU4DcKosRepDRPYsnsG0yMsaEfkanMgbS4kLNjnqYZ2mQkk2
   oFrCcrqgVo0E8Y1+OrhrZFfvzH/azRaJ3TTGYzS6gb5quU+59CX/EIgT2
   Q==;
X-CSE-ConnectionGUID: Oe7N3KQsQ6+0jvcEn8Icvw==
X-CSE-MsgGUID: 6EdoRn6OT8SJJWhbBIghfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80031391"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80031391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:35:27 -0700
X-CSE-ConnectionGUID: n8ja/wmrQnWkSQ0qkG/xxw==
X-CSE-MsgGUID: KTQjbsHMQvWk9obldib5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242871011"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2026 23:35:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E5D6995; Fri, 29 May 2026 08:35:25 +0200 (CEST)
Date: Fri, 29 May 2026 08:35:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Sebastian Loscher <krang@krang.de>, linux-usb@vger.kernel.org,
	andreas.noever@gmail.com
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Message-ID: <20260529063525.GK3102@black.igk.intel.com>
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
 <20260526040732.GO8580@black.igk.intel.com>
 <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
 <20260527122624.GC3102@black.igk.intel.com>
 <09372c24-0812-4f14-8d23-7d44028fb499@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09372c24-0812-4f14-8d23-7d44028fb499@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[krang.de,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38148-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6DDDD5FE015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 10:13:28PM +0100, Mario Limonciello wrote:
> 
> > The other thing I noticed is that the host is USB4v2 as well (well
> > according to the TMU configuration). @Mario is that right? I was not sure
> > if AMD is v2.
> 
> AMD's integrated one is not USB4v2, but I believe this specific design
> actually has both AMD integrated USB4 as well as a discrete Intel USB4v2
> soldered down on the MB.

Ah okay.

> That's why I was suggesting to try some of the ports to rule out if it's a
> USB4v2 unique issue. I think he said the front ports are USB4 and rear ports
> are USB4v2.

Agree, doing this makes sense.

