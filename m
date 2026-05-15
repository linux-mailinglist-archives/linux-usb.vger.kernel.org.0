Return-Path: <linux-usb+bounces-37495-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDy6Mo31BmrkpgIAu9opvQ
	(envelope-from <linux-usb+bounces-37495-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:29:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDBA54D575
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3CB330AFA38
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7151B43C073;
	Fri, 15 May 2026 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpX7zd8d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0153D333E;
	Fri, 15 May 2026 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839513; cv=none; b=Zcu0dSCLqvf5k8TbFSvMSSmAxIffzYat38uNxTCVYfV4H6iJx96wIgC0AwdtXkDa6iEHL0cH23CaSY8zN1saWecJroTNQwJ6kuTQQ7KGcnUFhj2Anry7vh92CRgm9dSmkBhPSe8KYm9wLNljA3vmefsFRTN+Qwgg8SdMXO5WH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839513; c=relaxed/simple;
	bh=ZcdadIzTRh5eJI3afFh7ILdxkM+4TfviRbuCUJWYoz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdkCB36k+ftHoTpslmSIgJT2KTgxH4TWxZE6lqaqhqf0lmw0UyT2XokDG4+S2zECttXqhltdDgwHoSKIQdnwINmeyim9WUoe8KItRSdALG2b2lP9cJ1gl8EDXlxstL6ySnIr5droucj87X4UMkUc5RXG823sn8LqK7ycCB8g2pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpX7zd8d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778839512; x=1810375512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZcdadIzTRh5eJI3afFh7ILdxkM+4TfviRbuCUJWYoz0=;
  b=XpX7zd8dWtZjepE7xd8HuZvqNl5n0NGzj4FJzZ2bPflGIB+mJycA359U
   eFgphyi/UpP8iZSjCINHlQ8dEatxU/Le27a1ffqmfxWRGhoa1TOL/+KTn
   I4OfV8uoy5hke1HHqnneOKDwKFdUPApSnG9gW8fJQaXIFZ9cfsICqiyxT
   h90LEkD11+ip0f89rDDWFL3FyTFxvWk9zOJM2Bmf/P4PmzrAQNnk0Yez2
   4KXnRAUFOWaCd09TJ4vuxPE7vwovvQ4y0ZNTmsXcyVWwC641JpbLeiUf0
   INCpvghcp6KtdsQ/JotXKyZcX++2K4C5QtN33PtBonHPcVqQkK4p+7tsM
   w==;
X-CSE-ConnectionGUID: dPdP+NbgSW+fnFhiH9piIg==
X-CSE-MsgGUID: xO2BqbKgTCyIdq8cRWudPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83664085"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83664085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:05:11 -0700
X-CSE-ConnectionGUID: D+94BKvyTbWKi0Ufi/Yv/w==
X-CSE-MsgGUID: kDgeYFJcQxaHShN6HJr10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="276740826"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2026 03:05:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5DE2495; Fri, 15 May 2026 12:05:06 +0200 (CEST)
Date: Fri, 15 May 2026 12:05:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH v3 3/4] thunderbolt: Require nhi->ops be valid
Message-ID: <20260515100506.GI84797@black.igk.intel.com>
References: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
 <20260513-topic-usb4_nonpcie_prepwork-v3-3-b87b5e408ac7@oss.qualcomm.com>
 <20260515063058.GH84797@black.igk.intel.com>
 <b08939c6-feb3-4876-bf2b-b0f409989038@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b08939c6-feb3-4876-bf2b-b0f409989038@oss.qualcomm.com>
X-Rspamd-Queue-Id: 8CDBA54D575
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37495-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 11:34:41AM +0200, Konrad Dybcio wrote:
> On 5/15/26 8:30 AM, Mika Westerberg wrote:
> > On Wed, May 13, 2026 at 06:23:34PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Because of how fundamental ops->init_interrupts() is, it no longer
> >> makes sense to consider cases where nhi->ops is NULL.
> >>
> >> Drop some boilerplate around it and add a single sanity-check in
> >> nhi_probe() instead.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/thunderbolt/nhi.c    | 32 ++++++++++++++++++--------------
> >>  drivers/thunderbolt/switch.c |  6 +++---
> >>  2 files changed, 21 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> >> index 740c10ee852b..2a8d1b3716c0 100644
> >> --- a/drivers/thunderbolt/nhi.c
> >> +++ b/drivers/thunderbolt/nhi.c
> >> @@ -559,7 +559,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
> >>  	if (!ring->descriptors)
> >>  		goto err_free_ring;
> >>  
> >> -	if (nhi->ops && nhi->ops->request_ring_irq) {
> >> +	if (nhi->ops->request_ring_irq) {
> > 
> > I wonder if it makes this more readable if we wrap these like:
> > 
> > 	if (nhi_request_ring_irq(nhi)) {
> 
> The UFS subsystem does that, and it results in a ton of boilerplate,
> i.e. for each op you need to define something like a:
> 
> static inline T nhi_foo_bar(struct tb_nhi *nhi, ...)
> {
> 	if (nhi->ops->foo_bar)
> 		return nhi->ops->foo_bar(...);
> 
> 	return 0;
> }
> 
> I can do that, but I don't see real value here

Yeah, I was thinking if that would make the calls more readable but I guess
we can do this later if at all.

