Return-Path: <linux-usb+bounces-14230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B6962596
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 13:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CA701F238EB
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 11:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA8F16D322;
	Wed, 28 Aug 2024 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebLW0gkW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E6A16B74F
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843547; cv=none; b=pptABfyj/GLaF1xb3vyBqZM3keowbDiBc/spmN1ls4R1ryr0xMw0Fvc4aKJdAwHy6CLyFTGlN8tG0B2VIjM81DtJ3hMGv6ndqrJ7yvEIyy/inwXr/AFTG5Nt7T/4xnry3XnHEqed959xzVn3rdzDEgF7F9PKdEklWoIgAwcBYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843547; c=relaxed/simple;
	bh=zX2E1Ekbh98zeEmhvHgx54Zukdpy6BngIKdZdHasLCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieid6EJwog/Edp6fccSXCH0y3SEcx7w9/pcX4sk8u1lM2l8g9eUsVh1MBLWn5p8KI7oAVEVNafkFiybgt3iChcnCkLjpLJL0CXV9tsGfqvfdyf6uogNFKFC1iVFMyAQ7Ve0BDeHFrLNk1BFq3/mzrVD1M2x4OLHe78sYTLcQXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebLW0gkW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724843546; x=1756379546;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zX2E1Ekbh98zeEmhvHgx54Zukdpy6BngIKdZdHasLCM=;
  b=ebLW0gkWBeSRx/lTzT1KDs1rKd7/Cqb8jainhDRStUhp7X19ekvfRmJS
   jJatzH30N1Hw6G0NRVcH3QG0l5rkvQFvnvfT6GdjKtWFMsE6akCUDtjqO
   0lqXklszPS9b3S6L3GTaDifFd8qcmkXv94MdYkwTK30uR/eh+vJeSLzai
   vQtvF3Dou5KJKWoHyWIgqbd5tSSBLoTswItpft6FJsAko1aAp7SVE1VBF
   U8JCr6rD0lQ0R7gwRV2UljMTjItFeZLkJIScSeQ20U/E4XZFwxpx0YzOu
   qinf+j/VhiSI1st+czGWzZtREGZ+ZwaLpcg6+mjnFjguHFm3NMGJsxVeu
   A==;
X-CSE-ConnectionGUID: eLoxlLG2SsSAc+Jv2XCyMQ==
X-CSE-MsgGUID: gwStLehnSrydP0Ech3BWsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33935572"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="33935572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 04:12:14 -0700
X-CSE-ConnectionGUID: 1/1KHceoSSeHmvrLs/KA5w==
X-CSE-MsgGUID: XFSoAYfwQmCSh+SV9fHN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63699416"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 28 Aug 2024 04:12:12 -0700
Message-ID: <39d389c3-1b3f-4a11-a40d-5c2eb46096bc@linux.intel.com>
Date: Wed, 28 Aug 2024 14:14:16 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Various xhci fixes and improvements
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20240827194625.61be5733@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240827194625.61be5733@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.8.2024 20.46, Michal Pecio wrote:
> Hi,
> 
> Here's a handful of bug fixes, cleanups and improvements for the xHCI
> driver.
> 
> The first is a trivial fix, the second also fixes a bug albeit a less
> trivial one. These two maybe deserve to go into usb-linus, the latter
> perhaps to stable as well, but the patch doesn't apply as-is.
> 
> The rest are new functionality or code cleanups with low anticipated
> user impact.
> 
> All patches were applied and tested on v6.11-rc5, all compiled cleanly
> and worked without regressions with some HID, storage, audio, video.
> Functional changes received additional functional testing described in
> their respective changelogs.
> 
> 
> Notably missing is a solution to the "Underrun after Missed Service"
> problem. To recap, Underrun/Overrun typically has a NULL TRB pointer
> and ep_ring->td_list contains some missed TDs and possibly a few that
> have been added after the underrun occured but before we got the IRQ.
> No way to tell them apart, at least by the spec, as far as I see.
> 
> On USB 3.1+ hosts we can get out of it with "expedited skipping" - it
> ensures that the ring is never left with stale TDs in the first place.
> 
> On USB 3.0 hosts the underrun handler *will* sometimes face skipping
> and it needs to make a decision.
> 
> Currently, it skips everything. This may cause DMA-after-free - not
> great on IN endpoints - and "TRB DMA ptr not part of current TD" or
> "WARN Event TRB with no TDs queued" later.
> 
> The obvious alterantive is to never skip on empty ring events, but it
> can deadlock a driver which waits for its URBs to be given back when
> all of them were missed and we can't get a valid dequeue from the HC.
> 
> 
> I wonder if it would make sense to always skip the first queued TD
> when we get an MSE with NULL pointer? I think it's legal, and likely
> sufficient to avoid the stupid deadlock.
> 
> Just a last minute idea. I will think about it, but now I'd like to
> flush this patch queue before it grows to infinity ;)
> 

Thanks Michal for this series.

I need to go through the patches individually and pick fixes.

We are in the middle of reworking transfer event handling with Niklas as well.

I'd be grateful if you could take a quick look at our solution and give
your opinion on it as you have expertise in this area.

Main idea is simple.
If a transfer event points to a TRB between dequeue and enqueue we give
back all queued TDs passed up to this TRB.
And if the event points to a valid TD then handle that. (normal case)

Code is much simpler, we get rid of skip flag, and could probably merge
error_mid_td and urb_length_set flags into one flag.

The code isn't complete or tested yet. It doesn't handle under/overruns,
but that could probably be fixed by just turning "return 0" for those
cases into "break"

Code on top of 6.11-rc4 can be found in my feature_transfer_event_rework branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_transfer_event_rework
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_transfer_event_rework

Thanks
Mathias


