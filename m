Return-Path: <linux-usb+bounces-28113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E2EB57CCB
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 15:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A782D1883F2F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 13:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69BC30F929;
	Mon, 15 Sep 2025 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYeCrBeu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BFB1E7C2E
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942688; cv=none; b=M5dqUjBWbyqHRZRZ1Ki48sXjYScW4cmSPm/NQhiETYuPw1Inf6Ir3ZNe90oPn4pRmeQRWAFP3MeT5G85qzbbPBOx7BpV3ClFmBfapWZ+MEBdXz4nnI8nAXBB2Go9gKJuGN7dm4ymU6KPQplsQs15cPanEXFJ89/YfToJBd8YN8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942688; c=relaxed/simple;
	bh=PEwpJ4ejyhyZaxDRkOFfGAESxgF2WF43wMDTYXOU1XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtrXtfwYCo/rViXnThZNbCChbeSzcGvAPknf32zOBXbJmj3/fbNT5guFzYKiaxKQu/cGNIls1jTPuiTW5NE+hd0Fbzdo2kKWKIog3wm486a/SDN7ctKDphsWZ8P6/a6LrMpHZNyUmFmI6xCOo6eDNmNipP/sJTcK0Q4pEXxsicc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYeCrBeu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757942687; x=1789478687;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PEwpJ4ejyhyZaxDRkOFfGAESxgF2WF43wMDTYXOU1XY=;
  b=AYeCrBeuEvaatFOFOyH3i6y9uu6+dNOWrHOuRE93msa5fmwdCBJU7suj
   KDHUXBfejL/ArFWGKZKy0j7s89FCeVM3ML5b8nVt9DPx2d1bne72f52N/
   b7hHFGERmkG4G89AdMQFYsOYxs4cmc0zRTRVHdIRDtzNajMJszqkC5odp
   oDwL4FutEkTHk6cVoew80ykxn4Z0vCQGbRn6JLOXWe8PkP4ERaKW9nS7X
   NwfkZsm9jmIqwwp5wSqsEo/vYvzbMeCGjoQgs4wXQZWA6AnTbKl7ojsAi
   eC2SsdLzdxmr9DJtb6bbgMHZjvnhQuJC47LUIAOkNQL0wpa15RY/5CONh
   g==;
X-CSE-ConnectionGUID: gQe6aM/+TT+XlKVLcGAPrA==
X-CSE-MsgGUID: s/0LFZG8SiSnUWHE8HVnvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59422041"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="59422041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 06:24:46 -0700
X-CSE-ConnectionGUID: qdBAJsxyTAOY70MxNHxftw==
X-CSE-MsgGUID: H/CTc49+T6u/v4qyROvz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174247028"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.255.79]) ([10.245.255.79])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 06:24:45 -0700
Message-ID: <bac8551a-f216-4118-bf97-137cb9c837a2@linux.intel.com>
Date: Mon, 15 Sep 2025 16:24:42 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] usb: xhci: standardize address format
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-8-niklas.neronin@linux.intel.com>
 <20250909110654.4d064391.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250909110654.4d064391.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/09/2025 12.06, Michal Pecio wrote:
> On Wed,  3 Sep 2025 19:01:27 +0200, Niklas Neronin wrote:
>> In the xHCI driver, printed hexadecimal values can be ambiguous, making it
>> difficult to distinguish between values and addresses. To enhance clarity,
>> all DMA addresses are now prefixed with the '@' symbol, ensuring immediate
>> recognition as addresses.
> 
> Is it really a problem? Which values look like addresses?

Examples from before my patch series:
"Setting command ring address to 0x%llx" - Not an address.
"Already resolving halted ep for 0x%llx" - DMA address
"stream %u ctx @%pad: SCT %llu deq %llx" - deq is not and address
"Slot ID %d dcbaa entry @%p = %#016llx - Both addresses

I'll drop the "@" prefix from DMA and virtual addresses, as it's no longer
necessary now that addresses read from hardware are printed separately.
Originally, the prefix was used to distinguish between register hex dumps
and pure addresses.

> And what if the kernel starts hashing %pad by default? ;)

Good point. But this also means that 'dma_addr_t' should be printed using %pad :)
>> Exceptions to the '@' prefix rule are functions xhci_ring_enqueue_show()
>> and xhci_ring_dequeue_show(), which exclusively print to the enqueue and
>> dequeue debugfs files, containing only addresses.
> 
> So debugfs will also get @ now, except for two files apparently?
> 
> Why are those files left out and inconsistent with the rest? If the
> answer is "because the @ prefix is annoying and breaks tools" then the
> same answer applies to every other debugfs file ;)

The prefix was originally intended to indicate that a hex value represents an
address. However, if a user opens a file containing only a address, the prefix
becomes redundant, as you said "anyone going there already knows what those
fields are".
>> Adding padding is unnecessary and provides no useful information.
> 
> Sounds like an argument against converting to %pad in other places?

The value is not an actual address but a 'u64' that represents an address,
so it doesn't require padding. All 'dma_addr_t' values, which are actual
addresses, include padding.

>> $ git grep -n '0x%' | wc -l
>> 39796
>> $ git grep -n '%#' | wc -l
>> 5204
> 
> Not sure what is this doing in a commit message?

Justifying "0x" prefix instead of '#' flag. The "0x" prefix is more commonly
used in the Linux kernel compared to the '#' flag.

Even with "git grep -e '%#' -e '%08#' -e '%016#'" it is only 5207.

Best Regards,
Niklas

