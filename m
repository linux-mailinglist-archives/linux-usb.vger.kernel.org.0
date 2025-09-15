Return-Path: <linux-usb+bounces-28110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F911B57B20
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B15C164241
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF2C305E28;
	Mon, 15 Sep 2025 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL9jJxz2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4497E2FA0F1
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939605; cv=none; b=SnCwQXaCrGot9sluQAJ4qf1F8N0/3lUzbGAIDNkGZPW8AnOKuCkJxxcKh7Tuc753kf211t4gbE8NNPARREyc2mOOWTU3C0EXlxSPqIPhAmY9FVm4A120iWzbQkhu8EOqNSoLAVjk825GfiPr+tOfG9joLBZMKw0buZD1HbPZfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939605; c=relaxed/simple;
	bh=2ZWTxbKXOc1pMJzxPFp76ezTqky5Ax3jnBc7b6ZqeFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDUEFqN9ADAAer/qyTFOTBhHc3Nn/ECPeTyDlhrDaznEgPTNzM8xmAJYQBDySI8OtU0h4aUxLdybJEe+cr5ceyBsBUc6l4YG1zFKmV13GGyqIUI2C4mlLBv7X4k6G9gIL4kk8tIaQp/oyEaoilnMDrSbFCXk7yjpeZ5dfaHPOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL9jJxz2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757939605; x=1789475605;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2ZWTxbKXOc1pMJzxPFp76ezTqky5Ax3jnBc7b6ZqeFA=;
  b=iL9jJxz2k33ro33g2sRR5j+APEbEjyvrldogwjmm/Snj34d9tfeh05TC
   OIeLwOWJvzsxkgQF5U8GGt7jn/BXcptn7WAf5r0h04gjgbQUGQxY6CF7W
   W7fLXpJ1X4zz9BKQvAFjospoAz89yiutYtAKf+CWgfICKTXHxAF0J3wuw
   dM+oy8tUolb5DuQb8bJnqjeQfkskF2KCX2KLOLI+AAPt17CaZJmRtTBfG
   M8qkUut0FDm1/v21YvOzIY0QOsqLQ+0NqDIvkIFOQB0HRmO6JNDuLPk6D
   gII8OWVb6xrCWEW0UrWPmLHwq0WQN4DKlSdPG8vY8uijvBopH6syUJ/uO
   g==;
X-CSE-ConnectionGUID: JBcdJ2tLSMGYT90xaOg8DA==
X-CSE-MsgGUID: n4PV64HMSvixcCBi3b7jYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60136629"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60136629"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:33:24 -0700
X-CSE-ConnectionGUID: qzU4cKJGRjygEp7oXSTFsg==
X-CSE-MsgGUID: FPP5iRKLRXC06cQV74fssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="198325021"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.255.79]) ([10.245.255.79])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:33:22 -0700
Message-ID: <b5631366-e3a3-4bb8-b543-c9c0be12589c@linux.intel.com>
Date: Mon, 15 Sep 2025 15:32:32 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 <aMe-QcrnE5hMHC5E@smile.fi.intel.com>
 <20250915122251.333b4db4.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250915122251.333b4db4.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2025 13.22, Michal Pecio wrote:
> 
> The issue is how to print u64 and dma_addr_t, and the suggestion is
> to stay with ("%08llx", (u64)addr) for both. What should go wrong?

I agree that printing long 64-bit hex values is annoying. However,
"%08llx" is not the common format for printing DMA addresses,
and having inconsistencies is much more annoying.

Additionally, you made a good point in another review:
 "And what if the kernel starts hashing %pad by default?"
Now, all non-pad DMA addresses are not hashed. :/

I would agree on another format if it is consistently used
throughout the xHCI driver. I chose this format because it's the
most common format.
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

Why is this conversion necessary when %pad is used for 'dma_addr_t'?
AFAIK, aside from printing, the xHCI driver does not convert
'dma_addr_t' to 'u64'.
> That's for type safety. And further:
> 5. rvalues work without proliferation of temp variables
> 6. same number looks same, whether stored as u64 or dma_addr_t
> 7. consistency with the rest of the kernel

How did you verify this?

> git grep -e '0x%08llx' -e '%#08llx' -e '%08llx' | wc -l
310

> git grep '%pad' | wc -l
446

> 
> Seriously, *lots* of drivers and even the PCI subsystem itself print
> addresses unpadded, using %llx or similar formats. The numbers have
> 8 digits on a PC (even 64 bit) and grow to 12 or more elsewhere.
> 
> It's first time I see somebody who appears really bothered by this.

Personally, when I see "0x7b271bb9ec," I think "hex value," but when I
see "0x0000007b271bb9ec," I think "address." This is because that is
how I have usually seen addresses represented. Otherwise I do prefer
the shorter format.

> 
>>> Reminder: this drivers handles DMAs as u64 too, so it will *never*
>>> print all DMAs as %pad. And if it tries, it will be a silent bug.  
>>
>> Yes, and the problem here is not in the printf() specifiers, the
>> problem is in the (used) data types.
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

I was working on implementing a helper function that would extract the DMA
address and validate it so that it can be returned as a 'dma_addr_t'.
This was supposed to be step 2, following this patch series.

Best Regard,
Niklas

