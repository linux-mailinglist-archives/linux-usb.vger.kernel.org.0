Return-Path: <linux-usb+bounces-28117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB81B57ECB
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 16:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEF10188A7E2
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7226131D739;
	Mon, 15 Sep 2025 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPUT58gg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9F31B804
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946174; cv=none; b=DWtNXoaycOK6kVJQ0el8BLF1lOfVJkycVuNZSSryYGjd+qU3E3icM90geznupF2gQk3fuB3OEbiJVUIdYl1YRLrTeyDjiD6Pn/3Hvxv9l2ghO3wFCG4n19Jlvcwf5wKO2IEhK7aSnha4TXtUhLIdlx5bXN7MTjsVn+tqPFlYSBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946174; c=relaxed/simple;
	bh=M/bpOSMzal/+77Xx3T3jMvtTR9XoCpFmODhbyw0DcAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pS3kpL6oSwKh8TunKttyIPQjJyATzA1O4IRqxl30HHoOEctHRvjNk0ksnqYGi75Mq0F+IqKjdNKRa47u+BARn5+ufv4JKFYPl3tzSMW2XnQx9Lests4/ldHPrUuO517OoB+KApsKeIRQifm52tEuHHvYsi6WknO+U8EOvXWrMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPUT58gg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757946173; x=1789482173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/bpOSMzal/+77Xx3T3jMvtTR9XoCpFmODhbyw0DcAU=;
  b=YPUT58ggpJY4a9eLDT+fLXtrssw6RjBmYdEOqmYj6eprYJivLJnZ07jn
   o1VRD2QFCs/tpm8dtsqcEpSfiGgLcPcARU/A2s4T5HK9zoihYAJZ+WeNb
   S+PNeBDC+moQt9WjjdecY6sncp5Ga7D3BWFSaZQn1QV5wDt2B+o/UmeFl
   T0dwgS6tjao+VnNNCpOEaVRBflN58ht6StCHntrn4np9D7F3+L+aJA4Aj
   S9aIo+BzYJmChR0m88v/3Hvsxf4C8QybeIAGRQircohgU8f/l5LD0Cp+R
   7yW6vYoGmfFH8uFMaAr+LKmKvAD+WKIaOOofxcm66hi4sn81kk5tO8wip
   Q==;
X-CSE-ConnectionGUID: 96K1iRR0S2yPWerI3zdz+w==
X-CSE-MsgGUID: yk84/liPT5SvOEbZkPclXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60268626"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60268626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:22:52 -0700
X-CSE-ConnectionGUID: 1IrdqwLURA+NYBtGwmVVCg==
X-CSE-MsgGUID: qMYNODZvR8GNf7W7NVBViw==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:22:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyA6S-00000003Gna-2aIp;
	Mon, 15 Sep 2025 17:22:48 +0300
Date: Mon, 15 Sep 2025 17:22:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <aMghOLBdxaCWk_pK@smile.fi.intel.com>
References: <20250909224416.691e47c9.michal.pecio@gmail.com>
 <20250910075630.0389536f.michal.pecio@gmail.com>
 <aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
 <20250911113451.1f5e5ca4.michal.pecio@gmail.com>
 <aMMtgsAa-dovMqdG@smile.fi.intel.com>
 <20250912114644.7b9bfe37.michal.pecio@gmail.com>
 <aMRgL4fus--v4QjP@smile.fi.intel.com>
 <20250913101246.515abfc4.michal.pecio@gmail.com>
 <aMe-QcrnE5hMHC5E@smile.fi.intel.com>
 <20250915122251.333b4db4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122251.333b4db4.michal.pecio@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 15, 2025 at 12:22:51PM +0200, Michal Pecio wrote:
> On Mon, 15 Sep 2025 10:20:33 +0300, Andy Shevchenko wrote:
> > > > No, it's other way around, we should not put explicit casts in
> > > > printf() in C as there are plenty of the format specifiers that
> > > > allows us to be sure that the printed value is correct
> > > > independently on architecture, endianess, etc.  
> > > 
> > > At least if you do it, the compiler will also do the right thing:
> > > - if the cast doesn't match the format, warn (xhci needs a patch)
> > 
> > Of course this doesn't work properly on the types that are less than
> > int. So, this is fragile argument to support explicit castings.
> 
> The issue is how to print u64 and dma_addr_t, and the suggestion is
> to stay with ("%08llx", (u64)addr) for both. What should go wrong?

I already pointed out and we are going circles here.
The %08llx is wrong when printing addresses in the range that
starts < 4G and goes > 4G. The printing *will* be incosistent.
This what is wrong.

> 1. 'addr' is transparently widened if necessary
> 2. if 'addr' type changes later, nothing happens
> 3. missing cast is a build error on common platforms (needs patch)
> 4. wrong format (%lx, %d, %pad, %p) is a build error
> 
> With %pad used for dma_addr_t:
> 
> 1. different formats must be written manually
> 2a. u64 to dma_addr_t: manual edit
> 2b. dma_addr_t to u64: manual edit or it's a silent bug, invisible
>     to compilers, invisible on 64 bit platforms used by developers

Again, if you need a u64 address to be passed to the HW, mark it there as u64.
But, if the DMA address is masked to smaller amount of bits, the way it's
printed or used kernel is the same as use unsigned int value for unsigned long
container, i.e. we don't do manual castings to and from as long.

> That's for type safety. And further:
> 
> 5. rvalues work without proliferation of temp variables
> 6. same number looks same, whether stored as u64 or dma_addr_t
> 7. consistency with the rest of the kernel
> 
> Seriously, *lots* of drivers and even the PCI subsystem itself print
> addresses unpadded, using %llx or similar formats. The numbers have
> 8 digits on a PC (even 64 bit) and grow to 12 or more elsewhere.

Why do you think that that subsystem is a good example? Maybe it needs to be
fixed for the sake of consistency?

> It's first time I see somebody who appears really bothered by this.

Really?! I think it's opponents of this patch started to be bothered with
the consistency fix :-)

> > > Reminder: this drivers handles DMAs as u64 too, so it will *never*
> > > print all DMAs as %pad. And if it tries, it will be a silent bug.  
> > 
> > Yes, and the problem here is not in the printf() specifiers, the
> > problem is in the (used) data types.
> 
> And what else can be done? The driver uses dma_addr_t where applicable
> for efficiency on 32 bits, the HW uses 64 bits like 'buffer' below:
> 
> struct xhci_transfer_event {
>         /* 64-bit buffer address, or immediate data */
>         __le64  buffer;
>         __le32  transfer_len;
>         /* This field is interpreted differently based on the type of TRB */
>         __le32  flags;     
> };
> 
> Same address may be logged at various stages of the flow where it
> exists in variabes of different type. The number matters, not type.

So, what's the problem to use dma_addr_t in kernel as an abstraction of DMA
addresses?

I'm sorry, but I feel this discussion goes nowhere. I'm going to stop answering
here as I see no good counterargument against this patch.

-- 
With Best Regards,
Andy Shevchenko



