Return-Path: <linux-usb+bounces-3368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AF7FA5B0
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 17:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9873E1C20AC3
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43DE34CE0;
	Mon, 27 Nov 2023 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6639E19A;
	Mon, 27 Nov 2023 08:08:05 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 797F568B05; Mon, 27 Nov 2023 17:08:00 +0100 (CET)
Date: Mon, 27 Nov 2023 17:07:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hamza Mahfooz <someguy@effective-light.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew <travneff@gmail.com>, Ferry Toth <ferry.toth@elsinga.info>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	iommu@lists.linux.dev,
	Kernel development list <linux-kernel@vger.kernel.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Bug in add_dma_entry()'s debugging code
Message-ID: <20231127160759.GA1668@lst.de>
References: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 27, 2023 at 11:02:20AM -0500, Alan Stern wrote:
> All it looks for is mappings that start on the same cache line.  However 
> on architectures that have cache-coherent DMA (such as x86), touching 
> the same cache line does not mean that two DMA mappings will interfere 
> with each other.  To truly overlap, they would have to touch the same 
> _bytes_.

But that is a special case that does not matter.  Linux drivers need
to be written in a portable way, and that means we have to care about
platforms that are not DMA coherent.

> How should this be fixed?  Since the check done in add_dma_entry() is 
> completely invalid for x86 and similar architectures, should it simply 
> be removed for them?  Or should the check be enhanced to look for 
> byte-granularity overlap?

The patch is every but "completely invalid".  It points out that you
violate the Linux DMA API requirements.  This might not have an
effect on the particular plaform you are currently running on, but it
is still wrong.  Note that there have been various mumblings about
using nosnoop dma on x86, in which case you'll have the issue there
as well.

> PS: As a separate issue, active_cacheline_insert() fails to detect 
> overlap in situations where a mapping occupies more than one cache line.  
> For example, if mapping A uses lines N and N+1 and mapping B uses line 
> N+1, no overlap will be detected because the radix-tree keys for A and B 
> will be different (N vs. N+1).

Fixes welcome.

