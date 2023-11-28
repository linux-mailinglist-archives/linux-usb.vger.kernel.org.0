Return-Path: <linux-usb+bounces-3408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 332257FBBB5
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 14:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B19A6B21B24
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 13:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC3A58AC5;
	Tue, 28 Nov 2023 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F79183;
	Tue, 28 Nov 2023 05:37:06 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9FA90227A87; Tue, 28 Nov 2023 14:37:02 +0100 (CET)
Date: Tue, 28 Nov 2023 14:37:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Christoph Hellwig <hch@lst.de>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew <travneff@gmail.com>, Ferry Toth <ferry.toth@elsinga.info>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	iommu@lists.linux.dev,
	Kernel development list <linux-kernel@vger.kernel.org>,
	USB mailing list <linux-usb@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: Bug in add_dma_entry()'s debugging code
Message-ID: <20231128133702.GA9917@lst.de>
References: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu> <20231127160759.GA1668@lst.de> <637d6dff-de56-4815-a15a-1afccde073f0@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <637d6dff-de56-4815-a15a-1afccde073f0@rowland.harvard.edu>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 27, 2023 at 11:51:21AM -0500, Alan Stern wrote:
> The buffers in the bug report were allocated by kmalloc().  Doesn't 
> kmalloc() guarantee that on architectures with non-cache-coherent DMA, 
> allocations will be aligned on cache-line boundaries (or larger)?  Isn't 
> this what ARCH_DMA_MINALIGN and ARCH_KMALLOC_MINALIGN are supposed to 
> take care of in include/linux/slab.h?

Oh.  Yes, the variable alignment from kmalloc make things complicated.

> 	Architectures must ensure that kmalloc'ed buffer is
> 	DMA-safe. Drivers and subsystems depend on it. If an architecture
> 	isn't fully DMA-coherent (i.e. hardware doesn't ensure that data in
> 	the CPU cache is identical to data in main memory),
> 	ARCH_DMA_MINALIGN must be set so that the memory allocator
> 	makes sure that kmalloc'ed buffer doesn't share a cache line with
> 	the others. See arch/arm/include/asm/cache.h as an example.
> 
> It says nothing about avoiding more than one DMA operation at a time to 
> prevent overlap.  Is the documentation wrong?

The documentation is a bit lacking unfortunately.  Again, assuming
you actually have non-coherent mappings you'd easily break the fragile
cache line ownership if you did.  That doesn't apply to x86 as-is, but
we really try to keep drivers portable.

> >  This might not have an
> > effect on the particular plaform you are currently running on, but it
> > is still wrong.
> 
> Who decides what is right and what is wrong in this area?  Clearly you 
> have a different opinion from David S. Miller, Richard Henderson, and 
> Jakub Jelinek (the authors of that documentation file).

I don't think this about anyone's opinion. It's a fundamental propery of
how to manage caches in the face of non-coherent DMA.

> 
> >  Note that there have been various mumblings about
> > using nosnoop dma on x86, in which case you'll have the issue there
> > as well.
> 
> Unless the people who implement nosnoop DMA also modify kmalloc() or 
> ARCH_DMA_MINALIGN.

Or don't do it on kmalloc buffers.

> I guess the real question boils down to where the responsiblity should 
> lie.  Should kmalloc() guarantee that the memory regions it provides 
> will always be suitable for DMA, with no overlap issues?  Or should all 
> the innumerable users of kmalloc() be responsible for jumping through 
> hoops to request arch-specific minimum alignment for their DMA buffers?

I'd actually go one step back:

 1) for not cache coherent DMA you can't do overlapping operations inside
    a cache line
 2) dma-debug is intended to find DMA API misuses, even if they don't
    have bad effects on your particular system
 3) the fact that the kmalloc implementation returns differently aligned
    memory depending on the platform breaks how dma-debug works currently

The logical confcusion from that would be that IFF dma-debug is enabled on
any platform we need to set ARCH_DMA_MINALIGN to the cache line size.

BUT:  we're actually reduzing our dependency on ARCH_DMA_MINALIGN by
moving to bounce buffering unaligned memory for non-coherent
architectures, which makes this even more complicated.  Right now I
don't have a good idea how to actually deal with having the cachline
sanity checks with that, but I'm Ccing some of the usual suspects if
they have a better idea.

