Return-Path: <linux-usb+bounces-19190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8126A09093
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 13:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200A73A3179
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8020D4ED;
	Fri, 10 Jan 2025 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dicf8sqo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706320D4E0
	for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512496; cv=none; b=hJ6VyzATqMUuXN9dRH/OfcfPKYYAtMnvxUwytxxGTmrP2AAGOouutwPyen3iNX0JWPj8endD8/FRstmToM2I7lP8i2Tbl9rYZL5CRCI+/CoddTHiaaACC1yslTf3VSFlub/3HJWZTESOMhBl6eoasg5UmNXxUltwmg6Edvd/u5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512496; c=relaxed/simple;
	bh=MBpwyNnd3KXcTMW1kPdbyBVqhZS51LNsIynfmjPEVnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9IaTzqcvKAvhjESd7rUDGwIziLAwSUp/vU0+01wD8h87OCUC1Jjare3VPOR2linYjSwzKDwSVUPrL7QeLoQ3vXimsZmwnflR083kznrFCdOu5IGoEKG7iZiBsI+ZwZAJ5LXpgQISGSwvhqbkFfVNCkqA2QSfhNiKB7yYWpJATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dicf8sqo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736512495; x=1768048495;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MBpwyNnd3KXcTMW1kPdbyBVqhZS51LNsIynfmjPEVnI=;
  b=Dicf8sqoXhXSE6+66MylIcYhhFtKUu7a7gQD+VnE2u3TckJ8809dNOCz
   INX6SiI6KM9BfW4n8RStFdzu+AR1Erg+Li5m3onmnVYdzAZHmBSDw11eS
   1aXTKqgqvUy0Q9if1i7F+GPHuJmQ+GB9HnJQcf6vKXTYlVWO2Ih/cjTs5
   amTki2CSDvEPB5LRbJNBSYIR0x2QEUXZ9solSwP6MOO0Hb2E+o70zcsLl
   MtAsyglsocJEdA/m6gV8u4UOoqC+C+UzG7ynrGV9VNFpQXrtaKDVoBH4R
   azlBuIstrce9odZRZBowTzmVNYwCTqRgxzcQHWR8Ht+HsHq358/dt2KtF
   A==;
X-CSE-ConnectionGUID: uuzsl2FxQKmEjqYGAKCsQg==
X-CSE-MsgGUID: +1NUAftzQii+GQoHjB8Agw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24409742"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="24409742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:34:54 -0800
X-CSE-ConnectionGUID: qGsCCAnZSzeDqmLyGg8HUA==
X-CSE-MsgGUID: qZaKhqjtTJGDqLYG9gwKvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103606448"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 10 Jan 2025 04:34:54 -0800
Message-ID: <0825d8a0-d2f7-49a1-b6a9-a65fc865e923@linux.intel.com>
Date: Fri, 10 Jan 2025 14:35:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: xhci: set page size to the xHCI-supported size
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com
References: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
 <20250108142822.649862-3-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250108142822.649862-3-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8.1.2025 16.28, Niklas Neronin wrote:
> The current xHCI driver does not validate whether a page size of 4096
> bytes is supported. Address the issue by setting the page size to the
> value supported by the xHCI controller, as read from the Page Size
> register.
> 
> Additionally, this commit removes unnecessary debug messages and instead
> prints the supported and used page size once.
> 
> The xHCI controller supports page sizes of (2^{(n+12)}) bytes, where 'n'
> is the Page Size Bit. Only one page size is supported, with a maximum
> page size of 128 KB.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>   drivers/usb/host/xhci-mem.c | 28 ++++++++++++----------------
>   drivers/usb/host/xhci.h     |  8 ++++----
>   2 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 66584aafc513..6828b75ad77b 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1953,7 +1953,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>   	xhci->interrupters = NULL;
>   
>   	xhci->page_size = 0;
> -	xhci->page_shift = 0;
>   	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>   	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>   }
> @@ -2372,6 +2371,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>   }
>   EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
>   
> +static void xhci_hcd_page_size(struct xhci_hcd *xhci)
> +{
> +	u32 page_shift;
> +
> +	page_shift = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;

Should we check that page_shift value makes sense here?

We used to hardcode page_size to 4k, and don't really know if all xHC vendors
have a sane op_regs->page_size value.
Register read might return 0 or 0xffffffff in some power states.

To avoid regression we could add:
if (!in_range(page_shift, 0x1, 0x8000))
	page_shift = 0x1;

Otherwise it looks good

-Mathias


