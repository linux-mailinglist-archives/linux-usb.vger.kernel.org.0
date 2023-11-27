Return-Path: <linux-usb+bounces-3372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E69097FA6E2
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 17:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2396281A29
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A53454F;
	Mon, 27 Nov 2023 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 206E81A7
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 08:51:22 -0800 (PST)
Received: (qmail 131349 invoked by uid 1000); 27 Nov 2023 11:51:21 -0500
Date: Mon, 27 Nov 2023 11:51:21 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Christoph Hellwig <hch@lst.de>
Cc: Hamza Mahfooz <someguy@effective-light.com>,
  Dan Williams <dan.j.williams@intel.com>,
  Marek Szyprowski <m.szyprowski@samsung.com>, Andrew <travneff@gmail.com>,
  Ferry Toth <ferry.toth@elsinga.info>,
  Andy Shevchenko <andy.shevchenko@gmail.com>,
  Thorsten Leemhuis <regressions@leemhuis.info>, iommu@lists.linux.dev,
  Kernel development list <linux-kernel@vger.kernel.org>,
  USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Bug in add_dma_entry()'s debugging code
Message-ID: <637d6dff-de56-4815-a15a-1afccde073f0@rowland.harvard.edu>
References: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu>
 <20231127160759.GA1668@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127160759.GA1668@lst.de>

On Mon, Nov 27, 2023 at 05:07:59PM +0100, Christoph Hellwig wrote:
> On Mon, Nov 27, 2023 at 11:02:20AM -0500, Alan Stern wrote:
> > All it looks for is mappings that start on the same cache line.  However 
> > on architectures that have cache-coherent DMA (such as x86), touching 
> > the same cache line does not mean that two DMA mappings will interfere 
> > with each other.  To truly overlap, they would have to touch the same 
> > _bytes_.
> 
> But that is a special case that does not matter.  Linux drivers need
> to be written in a portable way, and that means we have to care about
> platforms that are not DMA coherent.

The buffers in the bug report were allocated by kmalloc().  Doesn't 
kmalloc() guarantee that on architectures with non-cache-coherent DMA, 
allocations will be aligned on cache-line boundaries (or larger)?  Isn't 
this what ARCH_DMA_MINALIGN and ARCH_KMALLOC_MINALIGN are supposed to 
take care of in include/linux/slab.h?

> > How should this be fixed?  Since the check done in add_dma_entry() is 
> > completely invalid for x86 and similar architectures, should it simply 
> > be removed for them?  Or should the check be enhanced to look for 
> > byte-granularity overlap?
> 
> The patch is every but "completely invalid".  It points out that you
> violate the Linux DMA API requirements.

Since when does the DMA API require that mappings on x86 must be to 
separate cache lines?  Is this documented anywhere?

For that matter, Documentation/core-api/dma-api-howto.rst explicitly 
says:

	If you acquired your memory via the page allocator
	(i.e. __get_free_page*()) or the generic memory allocators
	(i.e. kmalloc() or kmem_cache_alloc()) then you may DMA to/from
	that memory using the addresses returned from those routines.

It also says:

	Architectures must ensure that kmalloc'ed buffer is
	DMA-safe. Drivers and subsystems depend on it. If an architecture
	isn't fully DMA-coherent (i.e. hardware doesn't ensure that data in
	the CPU cache is identical to data in main memory),
	ARCH_DMA_MINALIGN must be set so that the memory allocator
	makes sure that kmalloc'ed buffer doesn't share a cache line with
	the others. See arch/arm/include/asm/cache.h as an example.

It says nothing about avoiding more than one DMA operation at a time to 
prevent overlap.  Is the documentation wrong?

>  This might not have an
> effect on the particular plaform you are currently running on, but it
> is still wrong.

Who decides what is right and what is wrong in this area?  Clearly you 
have a different opinion from David S. Miller, Richard Henderson, and 
Jakub Jelinek (the authors of that documentation file).

>  Note that there have been various mumblings about
> using nosnoop dma on x86, in which case you'll have the issue there
> as well.

Unless the people who implement nosnoop DMA also modify kmalloc() or 
ARCH_DMA_MINALIGN.

I guess the real question boils down to where the responsiblity should 
lie.  Should kmalloc() guarantee that the memory regions it provides 
will always be suitable for DMA, with no overlap issues?  Or should all 
the innumerable users of kmalloc() be responsible for jumping through 
hoops to request arch-specific minimum alignment for their DMA buffers?

Alan Stern

