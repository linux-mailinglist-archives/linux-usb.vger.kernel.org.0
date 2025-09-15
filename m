Return-Path: <linux-usb+bounces-28073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3DDB5711F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 09:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C639189D53D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D31B2D47EA;
	Mon, 15 Sep 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsxC32oE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C122D46B2
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920841; cv=none; b=fnupHr2P8/VDm/mFdSM9eykAGwgQBoY03e0G92vuLLHzeHk977kzEmvWaRpPVxxl32X6rTC48yHbkOW94GTvr6aaFVWtFwFFIfpqzpXuFyj9Cf0KGujuuvBuqVlbwTSkhQLIalcXDD/coUiJB3+YyILABpqoqZXdQeeOU1/EK3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920841; c=relaxed/simple;
	bh=vEb4enFEkPbw9ltqXLTHdAVBvTDpxzpvgVh33kZW4c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9Yz9dGjshYvtBe2x3Yt4+/S9Azt2lLdsyjOFyzqEOL6gDoIn6GyTkhMX7UpsOJSMWUc/22jF0grbk1UltJVozsSzMFnCWu8SEncPh+ReYcRmmkfTKnTmXuDiB3aXGmdlsdcztFpJCeVlmMpNZ/7MYXt5fW2GZKuCwTY1SL6iYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsxC32oE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757920839; x=1789456839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vEb4enFEkPbw9ltqXLTHdAVBvTDpxzpvgVh33kZW4c8=;
  b=NsxC32oE1BsP6nWRaeDx8giBI9/pkbagNS/m6Yq9ZOBrzNuZGoT1DISf
   r0fnsGplOCwvF3Cb2J/F8HeG/gmdf3Tw16NZMMkpmMUuFMrXCBB+UyL8i
   Oi6K2A9lF90fs0XSPfA1niXayBH1+h0HACqG8JrKemdxWMwmKXLc8m0PL
   2QmNni0fF1rDO2lzyFBwEMpT2/ZFXEbb0AiZqwQzd5ReqI+RJMLj4J1N5
   4+2LrsmPuiWIlvt06PentNTjOHdUkCGY6rcdtylArzUzA3QvjsN67hC2f
   2IFU2g0vfFJNfHABLjayL2B0vycxz/ht6AdRPR2IRpWB0vJ2XOmCWoX5b
   g==;
X-CSE-ConnectionGUID: /Krtdgg+RtiZJJgR/M1OUA==
X-CSE-MsgGUID: sKZntfU0RSyQb9mAfHXV4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59208391"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="59208391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 00:20:38 -0700
X-CSE-ConnectionGUID: 1qkoP5TuTfKwhaeFzimOuA==
X-CSE-MsgGUID: VyuXwzW/QySUw78Ve83nLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="173835374"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 00:20:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uy3Vp-00000003BVo-3jm6;
	Mon, 15 Sep 2025 10:20:33 +0300
Date: Mon, 15 Sep 2025 10:20:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <aMe-QcrnE5hMHC5E@smile.fi.intel.com>
References: <20250909115949.610922a3.michal.pecio@gmail.com>
 <aMAPkH5-4rLdmx_9@smile.fi.intel.com>
 <20250909224416.691e47c9.michal.pecio@gmail.com>
 <20250910075630.0389536f.michal.pecio@gmail.com>
 <aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
 <20250911113451.1f5e5ca4.michal.pecio@gmail.com>
 <aMMtgsAa-dovMqdG@smile.fi.intel.com>
 <20250912114644.7b9bfe37.michal.pecio@gmail.com>
 <aMRgL4fus--v4QjP@smile.fi.intel.com>
 <20250913101246.515abfc4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913101246.515abfc4.michal.pecio@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Sep 13, 2025 at 10:12:46AM +0200, Michal Pecio wrote:
> On Fri, 12 Sep 2025 21:02:23 +0300, Andy Shevchenko wrote:
> > Again, imagine the loop that goes above 4G on a 64-bit machine. Out
> > of a sudden %08llx will be expanded to cover the 64-bit addresses and
> > becomes one digit at a time creating a ladder (ugly looking) output.
> > This is incorrect.
> 
> If I equated correctness with ugliness I would equally confidently

Ugliness?! No, the full information printed is way too better than
whatever pieces of it are (even if it's correct in some cases).
We are doing 64-bit hardware, we have to deal with 64-bit pointers.
Period. Shortcutting and premature optimizing is always a slippery slope
when we enter to the debugging field.

> state that unnecessary zero-padding is incorrect. But I don't.

Right, because it won't be incorrect, there is no such thing as unnecessary
zero-padding for the pointers.

> This is exactly the absurd argument I previously made for padding all
> %x and %d formats to full width. Pad tables, not lone log messages.

> > No, it's other way around, we should not put explicit casts in printf() in C
> > as there are plenty of the format specifiers that allows us to be sure that
> > the printed value is correct independently on architecture, endianess, etc.
> 
> At least if you do it, the compiler will also do the right thing:
> - if the cast doesn't match the format, warn (xhci needs a patch here)

Of course this doesn't work properly on the types that are less than int. So,
this is fragile argument to support explicit castings.

> - if it matches, widen the provided value as necessary
> 
> And it works consistently regardless of whether the variable is a
> dma_addr_t or u64, on all architectures, with or without PAE.

Yes, with "unnecessary" zero-paddings (that case when they are not needed).

> Reminder: this drivers handles DMAs as u64 too, so it will *never*
> print all DMAs as %pad. And if it tries, it will be a silent bug.

Yes, and the problem here is not in the printf() specifiers, the problem is
in the (used) data types. For the printf() it's crystal clear, if the type of
the variable is dma_addr_t, we have %pad. No need to reinvent the wheel.

> > > This brings up another problem with %pad: it is unknown to compilers
> > > so they don't type check it. 
> > > 
> > > but if I switch to %pad and later change my mind and extend 'addr' to
> > > u64 without updating this format, the compiler will eat it up and once
> > > again garbage will be printed on some systems.  
> > 
> > This topic was risen a few times in the past. Somebody proposed to have a GCC
> > plugin with that, somebody else proposed to completely rewrite the %p
> > extensions to be more like Pyhon or C++ ones (when you just specify argument
> > and handler for it). None so far is implemented AFAIK.
> 
> Indeed, not holding my breath for the %pad situation improving.
> This includes impossibility of passing it by value - it's forced
> by compilers being unaware of %pad and following usual %p rules.
> 
> > But this is not particular problem of %pad, it's for all %p
> > extensions. And the extensions exist for a purpose. What you are
> > proposing here behind the lines is to kill that completely.
> 
> Surely people would laugh me off if I actually suggested that.
> If those formats work for their cases, use them.

Sure, there are thousands of the cases in the kernel when we print our custom
data types in a better format and this works and will continue working
independently on the legacy of the compilers or C standard modifications.

Removing them is like suggesting Americans to drop automatic gear in favour of
the manual to the promoting eco-transportation (horses + carts). I don't believe
this is valuable proposal.

P.S.
I'm sorry, but I lost the objective of this discussion. Can you summarize,
please, what's wrong with the patch?

-- 
With Best Regards,
Andy Shevchenko



