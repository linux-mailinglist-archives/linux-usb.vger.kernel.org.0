Return-Path: <linux-usb+bounces-28034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B5B555CA
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 20:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025351CC786F
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 18:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E3731A06F;
	Fri, 12 Sep 2025 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXNTr3K7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C965819994F
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757700151; cv=none; b=W1061C9EGeQe/JmRSCXPf2WogUZGcQKCyxWjD1xKNztFQDs3lxhEP0klfG24T9plgdXnjQI1iv/sks7VlnJF0R8eamfQYNPcaN8aE/PPYd4p27CU67LizNjCOmdjJ7tqBo+wTnpuUMj3l8ppdZFMVT+7EOow9n39c3FthfrOk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757700151; c=relaxed/simple;
	bh=uwOTsiVxhfUbqNKwHJGl2sJvxOMymjxnpanJT07CD2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9sfo1b3qJK+zucbDBc8Z2mVbX5knlFcvjM3O3o7LlTpbWyn5cohvrP6XgY84taNGGzWGoX8WgH1/fWyc3x7HF4Pi6fYlTpThzCuFL7M4Jlqmlzy5XCKAUCiFBJfCRgL4ofHoofONJm6BiV7CQVIGNBr4PIM7KUvw1wkP3nQ6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXNTr3K7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757700150; x=1789236150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uwOTsiVxhfUbqNKwHJGl2sJvxOMymjxnpanJT07CD2M=;
  b=GXNTr3K7vLWPj9XHGG37NBHASVA//CEuvpLynaWWg9Nyt5koi2/WDNhC
   0E2iVQ52IYHyLaaG/kuephtznQB1HDnbedZrFmUC40aEk9ia7eTVHdchH
   AyHYRiDipRtgdl/oPEy8fgtObjyUAXnudvs/6lOt3XMoTUyW4VzRmjhhV
   XA/BPol4IPZG5jBiEkGCw9A6eX7AiOOaqehybCRLaA4ZaiC1Trrth61ZB
   us5VsV7AgOyw9jv5+DkzAqU3a/RwI60KrT4eoJOIU6OtmLWQPKmfDpf/K
   j7OP14X/DIW4kmv5KSfEDU/o4ui6s0Sr7HRRIgTaMlMtEEFIPqYXYwqIO
   Q==;
X-CSE-ConnectionGUID: qxH32O3WToeKC8GyNhsMqA==
X-CSE-MsgGUID: xRxgY0OpSQGYsphqcQIQfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77506965"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="77506965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 11:02:29 -0700
X-CSE-ConnectionGUID: Bw+5bMaGS0Cjmxf27QMAPg==
X-CSE-MsgGUID: DqdMH6oUT3ewGzFAD5w8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="211168154"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 11:02:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ux86K-00000002Svj-1QD5;
	Fri, 12 Sep 2025 21:02:24 +0300
Date: Fri, 12 Sep 2025 21:02:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <aMRgL4fus--v4QjP@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
 <20250909115949.610922a3.michal.pecio@gmail.com>
 <aMAPkH5-4rLdmx_9@smile.fi.intel.com>
 <20250909224416.691e47c9.michal.pecio@gmail.com>
 <20250910075630.0389536f.michal.pecio@gmail.com>
 <aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
 <20250911113451.1f5e5ca4.michal.pecio@gmail.com>
 <aMMtgsAa-dovMqdG@smile.fi.intel.com>
 <20250912114644.7b9bfe37.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912114644.7b9bfe37.michal.pecio@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 12, 2025 at 11:46:44AM +0200, Michal Pecio wrote:
> On Thu, 11 Sep 2025 23:13:54 +0300, Andy Shevchenko wrote:
> > On Thu, Sep 11, 2025 at 11:34:51AM +0200, Michal Pecio wrote:
> > > As for the %08llx format widespread in dynamic debug, I think it was
> > > used in the past because it does approximately the right thing on both
> > > types of systems and it's the only format capable of giving consistent
> > > result on both dma_addr_t and u64, used for some DMA pointers too.  
> > 
> > The problem with it is that it can't give the proper result for the ranges that
> > span over the 4G. Which I consider a bad thing. So, the correct use is to stick
> > with HW register size and do appropriate specifier as it was a pointer.
> 
> I see no reason to bother padding pointers to full variable width and
> when I run 'dmesg' on my 64 bit machine I see that most of the kernel
> doesn't really bother either, so xhci isn't any outlier.

Can you point out to some examples? I see that pointers printed in many cases
normally as 64-bit values.

> (Plus: why should we stop at pointers? Integers too have a width.)

This is not an argument at all. Pointers are special, they are not _just_
integers. Coincidentally I read an article about pointer in C
https://stefansf.de/post/pointers-are-more-abstract-than-you-might-expect/

> It amounts to embedding static type information in logs. Maybe there
> are cases where it could be helpful for people reading the log, maybe
> there aren't, but this patch doesn't even attempt to make such case,
> it just talks vaguely about "correctness".

The correctness here is in information that is printed. Again, imagine
the loop that goes above 4G on a 64-bit machine. Out of a sudden %08llx will be
expanded to cover the 64-bit addresses and becomes one digit at a time creating
a ladder (ugly looking) output. This is incorrect.

> I only see one truly incorrect case fixed here, a missing (u64) cast
> for %llx format, which I presume will print garbage on 32 bits.

No, it's other way around, we should not put explicit casts in printf() in C
as there are plenty of the format specifiers that allows us to be sure that
the printed value is correct independently on architecture, endianess, etc.

> This brings up another problem with %pad: it is unknown to compilers
> so they don't type check it. 
> 
> but if I switch to %pad and later change my mind and extend 'addr' to
> u64 without updating this format, the compiler will eat it up and once
> again garbage will be printed on some systems.

This topic was risen a few times in the past. Somebody proposed to have a GCC
plugin with that, somebody else proposed to completely rewrite the %p
extensions to be more like Pyhon or C++ ones (when you just specify argument
and handler for it). None so far is implemented AFAIK. But this is not
particular problem of %pad, it's for all %p extensions. And the extensions
exist for a purpose. What you are proposing here behind the lines is to kill
that completely. I believe this is not the right direction to go. So, TL;DR:
one should be careful about %p extensions, but at the same time open coding
them is not a good idea either.

-- 
With Best Regards,
Andy Shevchenko



