Return-Path: <linux-usb+bounces-27974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C1B53CFB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 22:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2229CAA2200
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 20:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84039257829;
	Thu, 11 Sep 2025 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR2WKcPj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5026E6ED
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757621640; cv=none; b=PIXOuf5dbh7/cdbPcB8QkwvVnQFTARyx5JHfwbogSWi97Z3OLA2FzbtbLDprSjRC1g7y9NdpD09eLWrBrxXO55S5105rm6EFhUHtEOP6Med5HDZACWRHgzxYO+N+sXNSdoxbji+4BeL9Ak6uo1rrVNvD7F7/oIfVm/jbzK8tBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757621640; c=relaxed/simple;
	bh=zcP2MeRtIXuons+BnPG2KUZvFnpjvRk8RooiM4qBofs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0CV3eAVt0pxFCDie3IF/9x+CPw7GEXdtPRHTzZToD6gTug/m4Ms219pzmDOzt0Gj2YoVaRamTsNku/B6MrjjFbl0eyMD5JRdQg7AbD2uA6w3oLk9BmK/f/dQMeMC1vbLjIEulC+7Y2c2bCkCypOL25lTCQ5YPdAFC7KwzxnjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR2WKcPj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757621638; x=1789157638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcP2MeRtIXuons+BnPG2KUZvFnpjvRk8RooiM4qBofs=;
  b=KR2WKcPjX6kd4Um0WE1BE9TZ2qEL5apwVmMvdTSA48x1zWgqmpVpfOfg
   utz3DSmWcXAn7CBne9Lks4MfL8c2yvG3vdT9KO/46AQ2/h+Kt+RtH42kc
   imp6JqBlBb2lwi648CDgzCflyxHYpzPgk688pSeoRO1dFcA0WrHJ3TeDQ
   wA52WgJMatbmFoaZxbzTkDyUw+GikISRblkkSys2rzIVCRiLYgY7xxf35
   CMm9nHMiQmGWWONjF8mPnFvaLscvV42SgwlLayZvgNddlU4Khvivzh76P
   BHP18YLpnF428JFaYcz69cYi06mJwvu97CuAvBfrh5sxeu4j2gJlD6J4T
   g==;
X-CSE-ConnectionGUID: drqikaydQlarDOfBycn9hQ==
X-CSE-MsgGUID: skXZrQFRT/moyyevG72cdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59889435"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59889435"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 13:13:58 -0700
X-CSE-ConnectionGUID: Kccq/dV7Sd+UvY9W3AEjjw==
X-CSE-MsgGUID: e87P8ettTW+Y1rkmjHZI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="197464993"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 13:13:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uwng2-00000002DgB-2Fb3;
	Thu, 11 Sep 2025 23:13:54 +0300
Date: Thu, 11 Sep 2025 23:13:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <aMMtgsAa-dovMqdG@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
 <20250909115949.610922a3.michal.pecio@gmail.com>
 <aMAPkH5-4rLdmx_9@smile.fi.intel.com>
 <20250909224416.691e47c9.michal.pecio@gmail.com>
 <20250910075630.0389536f.michal.pecio@gmail.com>
 <aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
 <20250911113451.1f5e5ca4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911113451.1f5e5ca4.michal.pecio@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 11, 2025 at 11:34:51AM +0200, Michal Pecio wrote:
> On Thu, 11 Sep 2025 10:41:49 +0300, Andy Shevchenko wrote:

...

> > > -       xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
> > > -                &ep_trb_dma, ep_index, trb_comp_code,
> > > +       xhci_err(xhci, "Event dma %#08llx for ep %d status %d not part of TD at %#08llx - %#08llx\n",  
> > 
> > How is 0 will be printed with %#08x?
> 
> Oops, thanks, this won't work indeed.
> 
> > > +                (u64) ep_trb_dma, ep_index, trb_comp_code,
> > > 
> > > These zeros only add noise, and in many cases make difference between
> > > line wrapping or not because this is longer than 99% of kernel messages
> > > and some people want their terminal window not to take the whole screen.  
> > 
> > I disagree on this. The 64-bit platforms are 64-bit. If the address in use is
> > _capable_ of 64-bit, it should be printed as 64-bit. Otherwise make it u32 in
> > the code and then I will agree with you.
> 
> Maybe some people unfamiliar with this driver would want to know the
> width of those fields for some reason without needing to grep the code
> (thuogh off the top of my head I don't know who and why).
> 
> But when I see this line, I mainly want to know if the 1st pointer is
> less than the 2nd or more than the 3rd. Padding only spreads them apart.
> 
> I can see how padding beyond actual variable size (as in example above)
> can be dangereous, because people might see it and not even think about
> verifying if the code isn't truncating something. The opposite should
> be less problematic.
> 
> As for the %08llx format widespread in dynamic debug, I think it was
> used in the past because it does approximately the right thing on both
> types of systems and it's the only format capable of giving consistent
> result on both dma_addr_t and u64, used for some DMA pointers too.

The problem with it is that it can't give the proper result for the ranges that
span over the 4G. Which I consider a bad thing. So, the correct use is to stick
with HW register size and do appropriate specifier as it was a pointer.

> If dma_addr_t really *must* be padded, then I guess it would only make
> sense to also convert those u64 %08llx to %016llx.

Yes. And this is the case on 64-bit platforms with device and/or
main memory being resided above 4G independently if we use bounce buffers
(DMA mask < address space where device or memory to transfer data is)
or not.

> But I see later in this series some reductions to %llx, which decision I find
> puzzling.

-- 
With Best Regards,
Andy Shevchenko



