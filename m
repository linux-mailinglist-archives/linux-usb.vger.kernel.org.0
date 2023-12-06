Return-Path: <linux-usb+bounces-3785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B08074D6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 17:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBB61C2083F
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 16:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F6D47761;
	Wed,  6 Dec 2023 16:21:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 4B25ED4B
	for <linux-usb@vger.kernel.org>; Wed,  6 Dec 2023 08:21:50 -0800 (PST)
Received: (qmail 460384 invoked by uid 1000); 6 Dec 2023 11:21:50 -0500
Date: Wed, 6 Dec 2023 11:21:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ferry Toth <fntoth@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>,
  Hamza Mahfooz <someguy@effective-light.com>,
  Dan Williams <dan.j.williams@intel.com>,
  Marek Szyprowski <m.szyprowski@samsung.com>, Andrew <travneff@gmail.com>,
  Andy Shevchenko <andy.shevchenko@gmail.com>,
  Thorsten Leemhuis <regressions@leemhuis.info>, iommu@lists.linux.dev,
  Kernel development list <linux-kernel@vger.kernel.org>,
  USB mailing list <linux-usb@vger.kernel.org>,
  Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: Bug in add_dma_entry()'s debugging code
Message-ID: <c952ef3f-2890-4f1e-bb5d-057b0db36b46@rowland.harvard.edu>
References: <20231128133702.GA9917@lst.de>
 <cb7dc5da-37cb-45ba-9846-5a085f55692e@rowland.harvard.edu>
 <ZWYnECPRKca5Dpqc@arm.com>
 <76e8def2-ff45-47d3-91ab-96876ea84079@gmail.com>
 <ZWm-u2kV1UP09M84@arm.com>
 <5425cf42-0f49-41b5-b26d-1e099d5bdcc2@elsinga.info>
 <5093ce37-047e-4aa8-a9e8-2978da9d734a@rowland.harvard.edu>
 <ZWobHJqBji80CTm-@arm.com>
 <e22ae13a-aafc-49da-8092-1a17f60ae420@rowland.harvard.edu>
 <1e4df825-08fa-40cf-a565-9c0d285c9b73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e4df825-08fa-40cf-a565-9c0d285c9b73@gmail.com>

On Wed, Dec 06, 2023 at 05:12:40PM +0100, Ferry Toth wrote:
> Hi
> 
> On 05-12-2023 19:28, Alan Stern wrote:
> > In the long run, it may turn out that trying to detect memory usage
> > patterns that could cause problems for architectures other than the one
> > currently running is not workable.  Certainly it is a bad idea to have a
> 
> Maybe. But while debugging code on your platform it is a good thing to get
> warnings for potential issues on other platforms.

Oh, absolutely!  It's definitely a good thing.  I'm just saying that 
doing it may not be practical -- there may be too many false positives 
(as in this bug report) and false negatives.

> In this case we (I) got misled by the warning message itself. That should be
> easy enough to improve.

I don't think so.  Issuing incorrect warnings that should be ignored is 
a very bad idea, no matter what the wording is.  After seeing a few 
messages like that, people learn to expect them -- and then they ignore 
the valid warnings along with the incorrect ones.

Alan Stern

