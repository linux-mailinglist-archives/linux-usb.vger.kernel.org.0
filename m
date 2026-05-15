Return-Path: <linux-usb+bounces-37465-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNnZF9S9BmqMnQIAu9opvQ
	(envelope-from <linux-usb+bounces-37465-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:31:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEC54A029
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 206BF305DEF5
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 06:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E0D37F75B;
	Fri, 15 May 2026 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoCb+Dsf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DCB1EA7DB;
	Fri, 15 May 2026 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826663; cv=none; b=Lwl/9ahJlrPTwm5jMGKRm+2d8YieHJsS+D1KdoEFJEUo9hD5FI2a4sKETlF1FKDRZCNFZIxN1Q/JWrKAxoD/6C4QfX+r5p2gnd/rRPH4D1H8s+i3R6a98T9vz/ESOzv5jq+rJ7ZdMTJCh746T2V2Wcbh2pV849v6QdxtVM1VXTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826663; c=relaxed/simple;
	bh=JhBblCuEyJdOF6xAqYPPCGYcYyT8qulZRGqNZqFUWx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siiWsoPc1twrD3nDGJZEZtTLXy5d2BHpoxzNKuwv4RxW0pv8Te/OouUMYBV8G4PFPtZJISFJbQovJyzsyppEkdbZfSN+dBn2dsaq5PDGvHdUSw2FYCz7+bqs5WV88ZfSwHHwXt3/uR1bz0G50NUwZ7t/BivNuWUypHgC2KnM1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoCb+Dsf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778826662; x=1810362662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JhBblCuEyJdOF6xAqYPPCGYcYyT8qulZRGqNZqFUWx4=;
  b=VoCb+DsfF9xaiV62ycD5sNEr9vRu5Jr11lHphrAXPaWsQulvdjy6zHz/
   IPxPPDINuGhZCV9t2KCUCDie9txUSbaXXu4HGp/4yn7oNgTOpYQHe7oiT
   6PRb8wNrQIGeRh2b6FbmmigU+BFG//vWZAmO/8ef4jnQlV9s271zrqYhO
   Wtpw0e14z9nnabynWVeFqKXXtZ51gk2fffe8lWHYGpkq9EZFHm9lzkSQP
   s4Ods/49VQbXyUUUhF7JpsbzKLXr6c06ojab3kV+AqnwXIkZHP8sX8B3F
   refmTnAnoOJJrxxzib/ZHTrydJb3eYdO8zSH7dT6kCnU260PLNtgF4Qvi
   g==;
X-CSE-ConnectionGUID: SQtUtAKdQ7+GEdOUHNdp+w==
X-CSE-MsgGUID: bUhSVxrDTl+KEYv5zwYyfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78804289"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="78804289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 23:31:02 -0700
X-CSE-ConnectionGUID: n6/yq13oQiyTAFKVeuG5Rg==
X-CSE-MsgGUID: VsyikhzQR4ynKSyvSkF4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="243577583"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2026 23:31:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BED2B95; Fri, 15 May 2026 08:30:58 +0200 (CEST)
Date: Fri, 15 May 2026 08:30:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] thunderbolt: Require nhi->ops be valid
Message-ID: <20260515063058.GH84797@black.igk.intel.com>
References: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
 <20260513-topic-usb4_nonpcie_prepwork-v3-3-b87b5e408ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-topic-usb4_nonpcie_prepwork-v3-3-b87b5e408ac7@oss.qualcomm.com>
X-Rspamd-Queue-Id: BAEEC54A029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37465-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,qualcomm.com:email,black.igk.intel.com:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 06:23:34PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Because of how fundamental ops->init_interrupts() is, it no longer
> makes sense to consider cases where nhi->ops is NULL.
> 
> Drop some boilerplate around it and add a single sanity-check in
> nhi_probe() instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/nhi.c    | 32 ++++++++++++++++++--------------
>  drivers/thunderbolt/switch.c |  6 +++---
>  2 files changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 740c10ee852b..2a8d1b3716c0 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -559,7 +559,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
>  	if (!ring->descriptors)
>  		goto err_free_ring;
>  
> -	if (nhi->ops && nhi->ops->request_ring_irq) {
> +	if (nhi->ops->request_ring_irq) {

I wonder if it makes this more readable if we wrap these like:

	if (nhi_request_ring_irq(nhi)) {


>  		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
>  			goto err_free_descs;
>  	}

