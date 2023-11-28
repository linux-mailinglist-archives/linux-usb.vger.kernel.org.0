Return-Path: <linux-usb+bounces-3424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F92C7FBFC1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 17:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6E53B213D8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 16:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B1B5C064;
	Tue, 28 Nov 2023 16:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C3EE10E2;
	Tue, 28 Nov 2023 08:54:27 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BC9AC15;
	Tue, 28 Nov 2023 08:55:14 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F22403F6C4;
	Tue, 28 Nov 2023 08:54:24 -0800 (PST)
Message-ID: <fe743e4f-67b7-4b34-884b-141abee6c63c@arm.com>
Date: Tue, 28 Nov 2023 16:54:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in add_dma_entry()'s debugging code
Content-Language: en-GB
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Christoph Hellwig <hch@lst.de>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrew <travneff@gmail.com>,
 Ferry Toth <ferry.toth@elsinga.info>,
 Thorsten Leemhuis <regressions@leemhuis.info>, iommu@lists.linux.dev,
 Kernel development list <linux-kernel@vger.kernel.org>,
 USB mailing list <linux-usb@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu>
 <20231127160759.GA1668@lst.de>
 <637d6dff-de56-4815-a15a-1afccde073f0@rowland.harvard.edu>
 <20231128133702.GA9917@lst.de>
 <cb7dc5da-37cb-45ba-9846-5a085f55692e@rowland.harvard.edu>
 <a91938e3-a7cb-4f74-aeaa-7cb56c0b43a4@arm.com>
 <CAHp75VeQoOFQ7V7gbVfR3-ANNMRT=-UniOCbnUtszo-1F3NMDA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAHp75VeQoOFQ7V7gbVfR3-ANNMRT=-UniOCbnUtszo-1F3NMDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2023 4:34 pm, Andy Shevchenko wrote:
> On Tue, Nov 28, 2023 at 6:31 PM Robin Murphy <robin.murphy@arm.com> wrote:
>> On 28/11/2023 3:18 pm, Alan Stern wrote:
>>> On Tue, Nov 28, 2023 at 02:37:02PM +0100, Christoph Hellwig wrote:
> 
> ...
> 
>>>> The logical confcusion from that would be that IFF dma-debug is enabled on
>>>> any platform we need to set ARCH_DMA_MINALIGN to the cache line size.
>>>
>>> (IF, not IFF.)  And tell distributions that CONFIG_DMA_API_DEBUG is not
>>> meant for production systems but rather for kernel testing, right?
>>
>> Yikes, I'd hope that distros are heeding the warning that the Kconfig
>> calls out already. It's perhaps somewhat understated, as I'd describe
>> the performance impact to large modern systems with high-bandwidth I/O
>> as somewhere between "severe" and "crippling".
> 
> Independently on the distros configurations the (false positive)
> message(s) will make difficult to debug the actual things, shouldn't
> we have our code robust in any case?

Sure, I have no objection to making dma-debug more robust and useful for 
its intended purpose, I was just commenting on the fact that any 
potential change in behaviour from this should be of less concern to 
distros than the significant change in behaviour that enabling it 
*already* poses (i.e. globally serialising DMA operations and doing 
inherently slow stuff in what are normally expected to be fast paths).

Thanks,
Robin.

