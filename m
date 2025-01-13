Return-Path: <linux-usb+bounces-19256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EDAA0B93B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 15:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF523A1931
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 14:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2D554279;
	Mon, 13 Jan 2025 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FICuoIxI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBED22CF12
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777845; cv=none; b=qNDlmntSzuk/HiMybFRS2zvciAHm15rg/TMaYhVG+XlQqEYsd3g9GYcTj7FZAus7dsxYzfCRSxVbh2tp1TQ5cyT53q0/DjjeVsttl9gTxXy55DSbHFU3k+OpUQjyGaNB0c6nHWky/MSRT3S2UZkxbLLGBWWO4ZXXybF3nlXDuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777845; c=relaxed/simple;
	bh=G5Pt0Sn0y+fwk/C27M3CSjvZ0EDb6hxD1srwH94jkJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKKhTEun8c4uBUIckgo0kjT6EE4FQipwdCadvpl9Om+2FRo0hbgYYABLto05y0rDQpgdHL+PwcihDMvWd/17D206cVs3GbTEhVMw8ji5P75llaLXW6Pfn6qfk/fHrp6rkkeGv8TaMlTqNa7elLHZFFkxa6uexNwzdQWvQQZhO1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FICuoIxI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736777844; x=1768313844;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G5Pt0Sn0y+fwk/C27M3CSjvZ0EDb6hxD1srwH94jkJQ=;
  b=FICuoIxIXLX/NFQW+gKUzQnZIL5LdRGMXkp+oeFNNO7U4+2Vbgjukv/O
   uj4ItqpgJMCp6ggClstVrMmY7PXG+dUmWeU82GKrZuTbddep834sghscd
   X+sbXcN41gJhwjt5Gb8SoDehd7gZA0ndGhd56Pf3ZxVb0/JO13urkhw+4
   FkofFA6kIZAirhejUqqF++TQIX1AwnpCCxwMaGGMZK8GMG3jREai7qO/4
   5CuCVWS9YVMV9SjJ+z+mh+2JGrtycG/5YhDxfo8Gm3y/ACqG31druR2v5
   uRHIwQhXT70ypVRH2Po1jO4F2mHm3TYwgWkswMgcfyPaRbQRx9t3bnRes
   A==;
X-CSE-ConnectionGUID: BcvgjSgLRWGvwh9GdFRcew==
X-CSE-MsgGUID: tCJM+E3OQMWN/L4L3CKY/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47618398"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="47618398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 06:17:23 -0800
X-CSE-ConnectionGUID: sVfbRnLlSweUqRZP6yGZ8w==
X-CSE-MsgGUID: 9kH8JENDQtWQGOYwWy+R9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109520269"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2025 06:17:23 -0800
Message-ID: <dfa2a5d1-9d23-425d-aef4-98e7c01622e2@linux.intel.com>
Date: Mon, 13 Jan 2025 16:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: xhci: set page size to the xHCI-supported size
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org
References: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
 <20250108142822.649862-3-niklas.neronin@linux.intel.com>
 <0825d8a0-d2f7-49a1-b6a9-a65fc865e923@linux.intel.com>
 <20250113111612.5726c3f6@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250113111612.5726c3f6@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.1.2025 12.16, Michał Pecio wrote:
> Hi,
> 
> On Fri, 10 Jan 2025 14:35:50 +0200, Mathias Nyman wrote:
>> On 8.1.2025 16.28, Niklas Neronin wrote:
>>> +	page_shift = readl(&xhci->op_regs->page_size) &
>>> XHCI_PAGE_SIZE_MASK;
>>
>> Should we check that page_shift value makes sense here?
> 
> Maybe it would make sense to validate it. Interpreting PAGESIZE wrong
> is potentially dangerous, because the xHC will assume that scratchpad
> buffers are of this size and it can write to them whatever it wants.
> 
> Before the buggy ffs() patch 81720ec5320c, the driver used to pick the
> lowest set bit or warn if all are zero, but then it still ignored the
> calculated size and used 4K.
> 
> I would probably be safer to use the highest bit, or just reject the
> xHC if it sets multiple bits (5.4.3 says: "the supported page size",
> not "a bitmask of supported sizes").

Checking that one, and only one bit is set sounds good. If so then use
that. Otherwise print a warning and use 4k page size.

This to avoid regression. I don't know why the page size was hardcoded
to 4k originally even if we first do all the gymnastics to read it from
hardware. But it was done for some reason.

> 
> 0xffffffff looks like a brain dead chip and not going to work anyway.

Reading 0xffffffff from a PCI device mmio registers is possible
if host is suddenly PCI hotplug removed (some Intel Alpine Ridge xHC), or
if I remember correctly also in PCI D3Cold power state.

> 
>> We used to hardcode page_size to 4k, and don't really know if all xHC
>> vendors have a sane op_regs->page_size value.
> 
> FWIW, all of mine report 4K as per debugfs:
> 
> /sys/kernel/debug/usb/xhci/0000:00:10.0/reg-op:PAGESIZE = 0x00000001
> /sys/kernel/debug/usb/xhci/0000:02:00.0/reg-op:PAGESIZE = 0x00000001
> ...
> 
> 00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI Controller (rev 20)
> 02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 300 Series Chipset USB 3.1 xHCI Controller (rev 02)
> 06:00.0 USB controller: ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller
> 09:00.0 USB controller: Renesas Electronics Corp. uPD720202 USB 3.0 Host Controller (rev 02)
> 0a:00.0 USB controller: Etron Technology, Inc. EJ168 USB 3.0 Host Controller (rev 01)
> 0b:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev 03)
> 0c:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller (rev 01)
> 
> Also ASM1042 and ASM3142.
> 
> And I have an NVIDIA Tegra board which runs some antique kernel and
> doesn't warn, so PAGESIZE must at least be non-zero there.

Thanks, good to know these hosts work fine.

Thanks
Mathias

