Return-Path: <linux-usb+bounces-27792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BEB4AC01
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 13:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9F74E2C35
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 11:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A38332144A;
	Tue,  9 Sep 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QieKG1Ie"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675D23FC4C
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417365; cv=none; b=O0532AMcPO6LeZK3pWsMVFmDXGEFYaIG0f9B6Qp5bPxyr1dZQMYC+XS55sqK0ElZVMTfg+3bgo36CYAyTXqQ4FDyCHCVeiLdQWdhDz0OxQqXZUAbpHmRleJFAYrswa0ktLxpsKbV5zMIAdybgLZjKnn0eZ17yEJP/SoB/Rsxf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417365; c=relaxed/simple;
	bh=LfNv6ktuXXnfE5yFcEwdfRCNoS2Qp7x0HLuHe+5Fels=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfrc83o+Emihhcf7XekegqcvbTpAFyA+sPMQQxglLfE08e7P0W6DB+uWHNn59BXj0e/V3EF6/LcJcyZMn1HcH4Zo0KEe8zRBFeR1PjQSq9FQXTPoUuIP6xVUzlxYmm3sSKcC4Wib2b3DBVFPnBrB/OoRD4dd9Sg1uRb3Iu+WhNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QieKG1Ie; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757417364; x=1788953364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LfNv6ktuXXnfE5yFcEwdfRCNoS2Qp7x0HLuHe+5Fels=;
  b=QieKG1IeYLHpAcninZlTVYdBMN84KzUD5s/gw/9fBidtdLanSIxksJ3v
   wfq6pUWZ/QNzr/jfunctoVQoChupsTJ5HSR/ns+zYfbmFbfO3rySiNzGv
   KhxjvLT0zP7w2mnEOyklhtgXFQWtFq/+jymm5dBnayUnWpw4ez2kAeucb
   2DsIdhpqFXiyCT5AKFv1o1X8v0hMialGDwwLMyAW7+bD0ct//hkG29P9G
   G84BniGvAJFwjixGeldBFfYW6umFMHg3ImWif81jelUL1QmjaRdN/ESx5
   zimBeXGe4UL5CeIn0Qexjt5mw0O3mbPXcbDk6arD6KJV1+/8hdo/kUoN2
   w==;
X-CSE-ConnectionGUID: HD3AxZQsQ2GnhKW8IJ+icA==
X-CSE-MsgGUID: iJiwdD5tTzu4r8L4xBjcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59624168"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59624168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:29:24 -0700
X-CSE-ConnectionGUID: WHadDWhLQNGlA++q6C/2KQ==
X-CSE-MsgGUID: pu5Lju6mSAakShhfT3uenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173180019"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:29:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uvwXI-00000001QKb-16Rl;
	Tue, 09 Sep 2025 14:29:20 +0300
Date: Tue, 9 Sep 2025 14:29:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <aMAPkH5-4rLdmx_9@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
 <20250909115949.610922a3.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909115949.610922a3.michal.pecio@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 09, 2025 at 11:59:49AM +0200, Michal Pecio wrote:
> On Wed,  3 Sep 2025 19:01:22 +0200, Niklas Neronin wrote:
> > Switch all printing of DMA addresses to '%pad' specifier. This specifier
> > ensures that the address is printed correctly, regardless of whether the
> > kernel is running in a 32-bit or 64-bit environment.
> 
> Old %llx with (long long) cast also prints it corretly.

Not really. It prints unnecessary long values on 32-bit machines making an
impression that something works somewhere in 64-bit address space.

> I had the same idea and even implemented it in some private debugging
> patches, but I found %pad just annoying in practice.
> 
> %pad isn't guaranteed to be at least 64 bit long, so some DMAs from
> 64 bit hardware will always need to be printed with %llx or similar.

When DMA address is fixed in the HW, it should refer to it as uXX.

> Secondly, padding is not optional with %pad. Maybe not a big deal, but
> on 64 bit systems with comparatively little RAM it adds clutter.

I don't get this, can you elaborate what's the problem in using _standard_
way of printing pointers / addresses?

> Thirdly, %pad can't be passed by value. Hence pollution like:

Yes, because of the C standard: we can't extend it with our wishes in
one-click. Hence, anything else can be a compile-time warning. The point
here is not about the form, but about the content. The content here is
when a Linux DMA address needs to be printed, we gotta use %pad to make
it standard on each of the platforms, including 32- and 64-bits.

> > @@ -2654,7 +2654,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
> >  	unsigned int slot_id;
> >  	int ep_index;
> >  	struct xhci_td *td = NULL;
> > -	dma_addr_t ep_trb_dma;
> > +	dma_addr_t ep_trb_dma, deq, td_start, td_end;
> >  	struct xhci_segment *ep_seg;
> >  	union xhci_trb *ep_trb;
> >  	int status = -EINPROGRESS;
> 
> This function has plenty of variables already, not sure if it needs
> three more. We could work around it by introducing {} scopes around
> printing, or functions like print_scary_error_message(), but it ends
> up being more hassle than type casting at some point.
> 
> Maybe a small helper if the verbose casts really bother people?
> static inline unsigned long long dma2llx(dma_addr_t dma) {return dma;}
> 
> BTW, isn't unsigned unnecessary?

Sign might be unnecessary in _this_ case, but it's very important to avoid
subtle mistakes with it (we have so many bugs for both cases, when unsigned
used as should signed be and vice versa). In this case we are talking about
something that can't be negative.

-- 
With Best Regards,
Andy Shevchenko



