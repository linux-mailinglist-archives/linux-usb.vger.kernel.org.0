Return-Path: <linux-usb+bounces-34295-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM3JMbS0rmkSHwIAu9opvQ
	(envelope-from <linux-usb+bounces-34295-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:53:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 715022383D2
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0F13301AE5E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B2B3A4F36;
	Mon,  9 Mar 2026 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3fshELE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0051D5147;
	Mon,  9 Mar 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057202; cv=none; b=N46CwLwF5S6G7A3bPTrAq8GYzDLYSdF3E7Jaw6TnwY9NkmQJgtzpQLYXs56+qazFhRCU/pg2Juqj7GJVTxe4h1h58PHhyt1kX7zKe26w+u/WhDtj0NujD6+hYKM+yGKtdg8+IPNZisNV9vESHNuw7EysxU6zv7/30MR7URK+uKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057202; c=relaxed/simple;
	bh=A+PnkCBEqOdI+iARu/tEarC3FCMvw7p0HawK5PTMxME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSKKENrRWjN7XbsP86Fhtrf91yRv0TziAmd53qIO7cmEN6dN6H1inMSaH/AfX6YKAyneSGaf+tqkRBBpxSLexMdZi4IAHK2oWETBgIGVIkxIUM05jiudpoRLZkeaST45KiGWHxLWYGzo9z2ukQj83L2zzXv5ec8ajmrVqFOC2ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3fshELE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773057201; x=1804593201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+PnkCBEqOdI+iARu/tEarC3FCMvw7p0HawK5PTMxME=;
  b=N3fshELEeHimdr1SG8+JivkkAdJ4l2kLR6hv0OJPys6458OnQC6LyCrR
   W+uv+ntQ0snmecob/RAe7NUA63svLTpLS23jswNKrLbesvfZ1q62limgP
   j0aOg4t5OPvCJh/7EExcsTJeSm903hXIAHhV0vl/TP0rswfc97AjGiQ56
   p7BSJKdcZ2E/qlnj726N6+2UZ+dZxaGqoNUlH7aK5+BJjDnJC8MCl1EwD
   Y75ruDV6MEcbFKLTyL+vf7PsNEhR5La5cc2BIjlUx2hkoX/TDHiRzpPo6
   xpbvV9tdcoFggs3cA9iYkC0YDmv3hZaBLh/76jZ3g7MPGptyLTDFGkeWX
   A==;
X-CSE-ConnectionGUID: /80HPIV1R++u3XZ1dAtgAw==
X-CSE-MsgGUID: 0X1CLsWYTHmSzVEdfB3D8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73097826"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73097826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:53:19 -0700
X-CSE-ConnectionGUID: rftzsapaTGK5p+fRZOoctg==
X-CSE-MsgGUID: ipLkijVjRsKl7q9TaTAqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219709822"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2026 04:53:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 00E4698; Mon, 09 Mar 2026 12:53:15 +0100 (CET)
Date: Mon, 9 Mar 2026 12:53:15 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC/RFT 3/3] thunderbolt: Add some more descriptive probe
 error messages
Message-ID: <20260309115315.GO2275908@black.igk.intel.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
 <20260309-topic-usb4_nonpcie_prepwork-v1-3-d901d85fc794@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-3-d901d85fc794@oss.qualcomm.com>
X-Rspamd-Queue-Id: 715022383D2
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34295-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,black.igk.intel.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:33:01AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently there's a lot of silent error-return paths in various places
> where nhi_probe() can fail. Sprinkle some prints to make it clearer
> where the problem is.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/nhi.c | 4 ++--
>  drivers/thunderbolt/tb.c  | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index ca832f802ee7..9f39a837c731 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1184,7 +1184,7 @@ int nhi_probe_common(struct tb_nhi *nhi)
>  	if (nhi->ops && nhi->ops->init) {
>  		res = nhi->ops->init(nhi);
>  		if (res)
> -			return res;
> +			return dev_err_probe(dev, res, "NHI specific init failed\n");
>  	}
>  
>  	tb = nhi_select_cm(nhi);
> @@ -1202,7 +1202,7 @@ int nhi_probe_common(struct tb_nhi *nhi)
>  		 */
>  		tb_domain_put(tb);
>  		nhi_shutdown(nhi);
> -		return res;
> +		return dev_err_probe(dev, res, "tb_domain_add() failed\n");

That's "failed to add domain".

>  	}
>  	dev_set_drvdata(dev, tb);
>  
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 0126e38d9396..e743fb698b30 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2990,7 +2990,8 @@ static int tb_start(struct tb *tb, bool reset)
>  
>  	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
>  	if (IS_ERR(tb->root_switch))
> -		return PTR_ERR(tb->root_switch);
> +		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
> +				     "tb_switch_alloc() failed\n");

That's "failed to allocate host router".

>  
>  	/*
>  	 * ICM firmware upgrade needs running firmware and in native
> @@ -3007,14 +3008,14 @@ static int tb_start(struct tb *tb, bool reset)
>  	ret = tb_switch_configure(tb->root_switch);
>  	if (ret) {
>  		tb_switch_put(tb->root_switch);
> -		return ret;
> +		return dev_err_probe(tb->nhi->dev, ret, "Couldn't configure switch\n");

That's "failed to configure host router".

>  	}
>  
>  	/* Announce the switch to the world */
>  	ret = tb_switch_add(tb->root_switch);
>  	if (ret) {
>  		tb_switch_put(tb->root_switch);
> -		return ret;
> +		return dev_err_probe(tb->nhi->dev, ret, "Couldn't add switch\n");

That's "failed to add host router".

>  	}
>  
>  	/*
> 
> -- 
> 2.53.0

