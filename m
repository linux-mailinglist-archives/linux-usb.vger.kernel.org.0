Return-Path: <linux-usb+bounces-36496-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJpoEZ/w7mmm1QAAu9opvQ
	(envelope-from <linux-usb+bounces-36496-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:14:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05346D208
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B5A63004D33
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 05:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8E9358372;
	Mon, 27 Apr 2026 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpBAvprD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE508287E;
	Mon, 27 Apr 2026 05:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777266840; cv=none; b=rJMg0Frbg7sO7/jDSwPf5FLl7QYYuCmqEzGe/DorgO99uMU20jxSLAXqyXNRw1fDtma4zQK14DImUABLNYp3rSK1yjXe7ZZlptU+b3+A+cMivDFOnrtM+6RvKEqVgzsI9Bu0Rz9B3QKEuvNnfCOXTEP7j70ak+LLgUw8d/hlQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777266840; c=relaxed/simple;
	bh=jRVANuSdYsgL+ISJyCcZ5z6lO1JXyPOdRhnN3tC2UGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpSH/lq8pA0FslcLCseC+qH59PfJaVjNdfjt+26y8nWGMtCZjHImkkUCaKYyg+Pk/WdddVl5nmHiFnzaj3IuZwiyDynYMH8gmBgo5BZlw13xSIF6PXx5odcWf8ULlinoYfn/gRWHuFdiZvzcUdnbNn+6/RLGdzsx6F9jaNJu6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpBAvprD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777266838; x=1808802838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jRVANuSdYsgL+ISJyCcZ5z6lO1JXyPOdRhnN3tC2UGc=;
  b=ZpBAvprDSgbgChusyEDMZj/xoGWGrdR5pCxh3RDhlsYTMlSH8Ru8kUy7
   b2LewB1INTlh1Z9Wkcj91aFKWj+bsjnjh56S4GMaqdXSp91y0k7VOWsWW
   qgwGviAqCgx4cXg3o6mm60pI3Ocm62064XY76nPm2Lyh2rOooTN4uZCoY
   vbRtCsAAQ9hS6zoAZ3HhcCnk/XT51rXCmLeeXtJgvYGgMh2W+PfuSC51R
   gYU41sXwPSUDoVFpyC+7GhZ6xrVHYiTokcA8Jf3A9pwmnOdGRfYQ0x0HM
   rI5ccRRYG7FU6AoSXLR+4gJ55urG0gEdlMH+Gu+g870aw38pvu09CSe1N
   w==;
X-CSE-ConnectionGUID: lgsepch+Rzufmq5NN6nxQA==
X-CSE-MsgGUID: n7zCATLXQXyWdKDvY0QBAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88460492"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="88460492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 22:13:58 -0700
X-CSE-ConnectionGUID: 63G6Xh74TaiXaHR5p8IfXg==
X-CSE-MsgGUID: OgRtFD1MRJC+N+PN+q2NpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="228964801"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 26 Apr 2026 22:13:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 138C295; Mon, 27 Apr 2026 07:13:55 +0200 (CEST)
Date: Mon, 27 Apr 2026 07:13:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] thunderbolt: debugfs: Don't stop reading SB registers
 if just one fails
Message-ID: <20260427051355.GJ557136@black.igk.intel.com>
References: <20260413-topic-tbt_sb_debugfs-v2-1-97a23d4d0568@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413-topic-tbt_sb_debugfs-v2-1-97a23d4d0568@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7B05346D208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36496-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,qualcomm.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, Apr 13, 2026 at 11:02:43AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The GEN4 TxFFE register is not part of the USB4 v1.0 specification, so
> understandably some pre-USB4v2 retimers (like the Parade PS8830) don't
> seem to implement it.
> 
> The immediate idea to counter this would be to introduce a version
> check for that specific register, but on a second thought, the current
> flow only returns a quiet -EIO if there's any failures, without hinting
> at what the actual problem is.
> 
> To take care of both of these issues, simply print an error line for
> each SB register read that fails and go on with attempting to read the
> others.
> 
> Note that this is not quite in-spec behavior ("The SB Register Space
> registers shall have the structure and fields described in Table 4-17.
> Registers not listed in Table 4-20 are undefined and shall not be
> used."), but it's the easiest fix that shouldn't have real-world bad
> side effects.
> 
> Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Applied to thunderbolt.git/next, thanks!

