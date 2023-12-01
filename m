Return-Path: <linux-usb+bounces-3571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE2800FF6
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 17:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCE5281080
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A29D4C617;
	Fri,  1 Dec 2023 16:21:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id DA4E1FF
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 08:21:41 -0800 (PST)
Received: (qmail 291592 invoked by uid 1000); 1 Dec 2023 11:21:40 -0500
Date: Fri, 1 Dec 2023 11:21:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ferry Toth <ferry.toth@elsinga.info>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Ferry Toth <fntoth@gmail.com>,
  Christoph Hellwig <hch@lst.de>, Hamza Mahfooz <someguy@effective-light.com>,
  Dan Williams <dan.j.williams@intel.com>,
  Marek Szyprowski <m.szyprowski@samsung.com>, Andrew <travneff@gmail.com>,
  Andy Shevchenko <andy.shevchenko@gmail.com>,
  Thorsten Leemhuis <regressions@leemhuis.info>, iommu@lists.linux.dev,
  Kernel development list <linux-kernel@vger.kernel.org>,
  USB mailing list <linux-usb@vger.kernel.org>,
  Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: Bug in add_dma_entry()'s debugging code
Message-ID: <5093ce37-047e-4aa8-a9e8-2978da9d734a@rowland.harvard.edu>
References: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu>
 <20231127160759.GA1668@lst.de>
 <637d6dff-de56-4815-a15a-1afccde073f0@rowland.harvard.edu>
 <20231128133702.GA9917@lst.de>
 <cb7dc5da-37cb-45ba-9846-5a085f55692e@rowland.harvard.edu>
 <ZWYnECPRKca5Dpqc@arm.com>
 <76e8def2-ff45-47d3-91ab-96876ea84079@gmail.com>
 <ZWm-u2kV1UP09M84@arm.com>
 <5425cf42-0f49-41b5-b26d-1e099d5bdcc2@elsinga.info>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5425cf42-0f49-41b5-b26d-1e099d5bdcc2@elsinga.info>

On Fri, Dec 01, 2023 at 01:17:43PM +0100, Ferry Toth wrote:
> > A non-cache coherent platform would either have the kmalloc()
> > allocations aligned or it would bounce those small, unaligned buffers.
> It would? Or it always has?
> > So it doesn't seem right to issue a warning on x86 where kmalloc()
> > minimum alignment is 8 and not getting the warning on a non-coherent
> > platform which forces the kmalloc() alignment.
> 
> If *all*non-coherent platforms implement either correct alignment or bounce
> buffer, and on (coherent) x86 we get an WARN, then it is a false alarm
> right?
> 
> That is exactly my question (because I have no idea which platforms have
> non-coherent caches).

Don't forget, not all DMA buffers are allocated by kmalloc().  A buffer 
allocated by some other means might not be aligned properly and might 
share a cache line with another buffer.

Or you might have a single data structure that was allocated by 
kmalloc() and then create separate DMA mappings for two members of that 
structure.  If the two members are in the same cache line, that would be 
an error.

Alan Stern

> > If we consider the kmalloc() aspect already covered by bouncing or force
> > alignment, the DMA API debug code can still detect other cache line
> > sharing situations.
> 
> Consider? Or know?
> 
> If we know, and we can not easily prevent false WARN's on x86 it could be
> sufficient to change the message to "possible cacheline sharing detected"
> and add a line that "DMA_API_DEBUG" should be disabled on production
> systems.
> 
> And while at it, we might be able to fix the missed real cacheline sharing
> mentioned by Alan:
> 
>  "As a separate issue, active_cacheline_insert() fails to detect
> overlap in situations where a mapping occupies more than one cache line.
> For example, if mapping A uses lines N and N+1 and mapping B uses line
> N+1, no overlap will be detected because the radix-tree keys for A and B
> will be different (N vs. N+1)."
> 

