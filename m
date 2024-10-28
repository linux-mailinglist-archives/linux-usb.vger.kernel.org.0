Return-Path: <linux-usb+bounces-16782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC19B3165
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 14:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5058F1C21AD6
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 13:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732161DB929;
	Mon, 28 Oct 2024 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8XOGtz6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DF1E48A
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121107; cv=none; b=L8QHV459qjNK4kYZ4JRYFpysLd2p9Fx43NhoCoZ1S+06ON9kvcNO+NS3tkfxNCC/fPiIi/ntEIaZI5z3GvzP0LfQt5PUkLCEr69qqTauJQIdAtGN78HGxYwWcnYe06qhiR7a56Voj+YeSDgyJAPKRdv6xz8F/6GmZWccGYd1Ls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121107; c=relaxed/simple;
	bh=VMrDKo3PVZsFVo1Cj6tmsmlfoGu0zpmYVej/6kjFUSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rq7b+8sTtYKqRfjpRaua4dF/AgY4IQlU/PL+9vMKpi1byf7mu/n1/zVjiWSmPdV7tMHUJm+9Jz4svwd8+5REDYVpt5dMnL+p+y/dZI+w/aAmRGgpbr7MqhM0UUO0qzkkdSNSgsp/Dcn4DmlcosvGFLucOumZke8QfFYiIpKYLyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8XOGtz6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730121105; x=1761657105;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VMrDKo3PVZsFVo1Cj6tmsmlfoGu0zpmYVej/6kjFUSc=;
  b=f8XOGtz6M+kS21pkA6rB2BNmdEeS0p3h8khz04S1MU4J0tZTIO4DTIeH
   Jyjbv/avqAm6PGHYCKDTkp4uq1LVE4vJG8daMDhYSjIP7cUdyfWX+FTxK
   5U9GedEbqBA+nl+t1HWlFBKOUe40t6/+uViB8EJOt2u/idm07ua713TWs
   91cceG3VqbzyRHWs+OJknGqh8buCS/UnNQgJ940cDpS7owY4fIswkVIsd
   7RQoTv3TnKeBGHyJoxmr4w15xBr2I+62P821/sr4Uld71Rx1lx/O0msts
   T9QA9HZVFO3wcxZlcSNP7qv7CHbLngQR2pl2p3lV3gy9y5WoiMMNyBJ6F
   w==;
X-CSE-ConnectionGUID: NPn55KFUQLGi0RPNAkkR8g==
X-CSE-MsgGUID: eQakj+qRTD2eh1m/c0AbWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52268773"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52268773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:11:32 -0700
X-CSE-ConnectionGUID: +GheWt2bQ4uD+Hui9FeK5A==
X-CSE-MsgGUID: e4w/VxgtRxi+Do9cTp6IyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="112427686"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2024 06:11:31 -0700
Message-ID: <99e5b9e3-a1be-45fe-b9e9-e75a888bef38@linux.intel.com>
Date: Mon, 28 Oct 2024 15:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: xhci: improve HCD page size validation and
 setting
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20241025112701.303035-1-niklas.neronin@linux.intel.com>
 <20241025112701.303035-2-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241025112701.303035-2-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.10.2024 14.27, Niklas Neronin wrote:
> xHC supports a page size of (2^(n+12)), where 'n' is the Page Size Bit.
> The page size of 4096 bytes is common and always supported. Consequently,
> the xHCI driver always sets the 'page_size' to 4096 (i.e., (1 << 12)).
> 
> At present, the xHCI driver reads the Page Size register but does not use
> the value, except for printing a two useless debug traces. This introduces
> unnecessary code into xhci_mem_init(), which is already quite large.
> Although the page size is not currently modified, it may be in the future.
> 
> To balance both current and future needs, the page size setting code is
> moved to a separate function. This rework ensures that the Page Size
> register is not read for the minimum value (4096). However, if a different
> value is provided, it will not be ignored, rather clamped between the
> valid min and max page size.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>   drivers/usb/host/xhci-mem.c | 40 ++++++++++++++++++++++---------------
>   drivers/usb/host/xhci.h     |  9 ++++++---
>   2 files changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index d2900197a49e..8a6b91862cae 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1959,7 +1959,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>   	xhci->interrupters = NULL;
>   
>   	xhci->page_size = 0;
> -	xhci->page_shift = 0;
>   	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>   	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>   }
> @@ -2378,6 +2377,27 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>   }
>   EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
>   
> +static void xhci_hcd_page_size(struct xhci_hcd *xhci)
> +{
> +	u32 page_size;
> +
> +	if (xhci->page_size <= HCD_PAGE_MIN) {
> +		xhci->page_size = HCD_PAGE_MIN;
> +	} else {
> +		/* Max page size is 2^(n+12), where 'n' is the first 15:0 bit set */
> +		page_size = readl(&xhci->op_regs->page_size) & HCD_PAGE_SIZE_MASK;
> +		page_size = 1 << (ffs(page_size) + 12);
> +
> +		if (page_size < xhci->page_size)
> +			xhci->page_size = page_size;
> +		else
> +			xhci->page_size = (1 << ffs(xhci->page_size));
> +	}

probably fls() instead of ffs()

The xhci specification is a bit unclear about pagesize register (xhci 5.4.7)
I assume it shows currently used pagesize, and only has one bit set.
But I guess it's possible that it could list all supported page sizes, or
maybe just maximum page size?

> +
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
> +		       xhci->page_size / 1024);
> +}
> +
>   int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   {
>   	struct xhci_interrupter *ir;
> @@ -2385,7 +2405,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   	dma_addr_t	dma;
>   	unsigned int	val, val2;
>   	u64		val_64;
> -	u32		page_size, temp;
> +	u32		temp;
>   	int		i;
>   
>   	INIT_LIST_HEAD(&xhci->cmd_list);
> @@ -2394,20 +2414,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
>   	init_completion(&xhci->cmd_ring_stop_completion);
>   
> -	page_size = readl(&xhci->op_regs->page_size);
> -	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> -			"Supported page size register = 0x%x", page_size);
> -	i = ffs(page_size);
> -	if (i < 16)
> -		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> -			"Supported page size of %iK", (1 << (i+12)) / 1024);
> -	else
> -		xhci_warn(xhci, "WARN: no supported page size\n");
> -	/* Use 4K pages, since that's common and the minimum the HC supports */
> -	xhci->page_shift = 12;
> -	xhci->page_size = 1 << xhci->page_shift;
> -	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> -			"HCD page size set to %iK", xhci->page_size / 1024);
> +	/* If 'page_size' is not set, use 4K pages, since that's common and always supported */
> +	xhci_hcd_page_size(xhci);
>   
>   	/*
>   	 * Program the Number of Device Slots Enabled field in the CONFIG
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index f0fb696d5619..f998df70f80f 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -211,6 +211,11 @@ struct xhci_op_regs {
>   #define CONFIG_CIE		(1 << 9)
>   /* bits 10:31 - reserved and should be preserved */
>   
> +/* bits 15:0 - HCD page shift bit */
> +#define HCD_PAGE_SIZE_MASK      0xffff
> +/* HCD page size 4KB up to 128MB, Rev 1.2 Section 5.4.3. */
> +#define HCD_PAGE_MIN            (1 << 12)
> +

Probably better to use XHCI_ prefix instead of HCD_ as these are xhci specific.
We don't want to confuse these with usb core hcd defines (include/linux/usb/hcd.h)

Thanks
Mathias


