Return-Path: <linux-usb+bounces-20870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B601FA3DB17
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 14:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB64189B94B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 13:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74D21F428F;
	Thu, 20 Feb 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fw3FrgyX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7D1BD9D3
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057495; cv=none; b=od0iLELV84M2KvmFBnIfOYVMPRjpt/2GGpHlxBX8GwnuZXYULa9yYj32S7UATOkxkoKkzHMR0mrKd31XJ3o6gNySF8mKJWYrEK/qRarp21z80ZUGZ7vSDdVORHLH/a0Kodb2YB8JR6E8avZUWbnqTvZSJXNIhlri1TST5OjKAJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057495; c=relaxed/simple;
	bh=aYZp/pKrgMtVLLGqplvIN5HaC4fbbgmg5icYacZndDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvBFcc7rO2gFxNocxf7uNMZKvjL1qysoKvd/60qmDWLb7hxC0wyS9Jauv0NMFfsopvjDoV9BulXHJvzpAu2zBEd6iS+oGhBVxh8alnWM4RLiMylXKNSXPxtlDx+BFZOQxzZ5JIVpA1Go5rjihvjeyhatSaZyKt0O2tyAbzgFKm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fw3FrgyX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740057493; x=1771593493;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aYZp/pKrgMtVLLGqplvIN5HaC4fbbgmg5icYacZndDA=;
  b=fw3FrgyXrd0fzalU3ZkzFu4YA3AlC2V3A9zHHv7p02l0FXwfQOp76Gn1
   If/6Vg2wWUMUp+CWm8LiUS6qEHjVEtuxpLRAg4CtKNvVXFtyVJedCxPVR
   MqJJo8rI5fJiSZtALSVtphbxzUjw7xavoalmikc2NtPVQvBY1LAcEd5Xk
   jMZicy2otisgp6/wedXjjVjSRTwqYDciE/hbI/OmIJDId574HmV64FFUl
   50ZGRJEFubPBPOySas+B1TZJvTHPhUIONtdC/6ayG2vemoPKWzkwgaR2H
   zoR9LpSj6P5nKjABRQquHgb71b990PgfxV/PX1rUqNUgQhQJUWASi6qf5
   Q==;
X-CSE-ConnectionGUID: BdZBPcTWQTW6sp6Pez+hHQ==
X-CSE-MsgGUID: +V83iXe3QuWXzC9sH4lMVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40954501"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40954501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:18:13 -0800
X-CSE-ConnectionGUID: yX01pfR4Ri+65gbuXvkoIw==
X-CSE-MsgGUID: C61FJmwvTZGeC9JNxnz9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="120143330"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:18:12 -0800
Message-ID: <bba69805-b28d-42f2-aa44-107a5700a8d3@linux.intel.com>
Date: Thu, 20 Feb 2025 15:18:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/4 RFC] An alternative dma_in_range() implementation
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
References: <20250206103428.1034784-4-niklas.neronin@linux.intel.com>
 <20250219095637.5bd6e9e4@foxbook> <20250220131451.6f356f31@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250220131451.6f356f31@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/02/2025 14.14, Michał Pecio wrote:
> Here's my attempt at it, the patch goes on top of the whole series. It
> compiles and passes basic testing (some URBs completed, some unlinked,
> no errors or other malfunction apparent).
> 
> The idea is to translate dma to trb* ASAP and work with that, because
> all data structures use trb* so the code gets shorter and less verbose.
> This approach is also easy to adapt to changes in handle_tx_event(),
> for example it could trivially return trb* instead of seg* or take trb*
> (with or without accompanying seg*) and return bool or even seg*.
> 
> I tried to make the common case (start_seg == end_seg) fast, both for
> hit and miss. 5 comparisons if the range wraps around, 4 if it doesn't.
> 

Thanks, I have a similar version. If it's alright with you, I'll try to
combine your version and mine into one and add it to trb_in_td-v2.

Thanks,
Niklas

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 600842425f6d..b18e7fd7d01e 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -300,42 +300,36 @@ static struct xhci_segment *dma_in_range(struct xhci_segment *start_seg, union x
>  					 dma_addr_t dma)
>  {
>  	struct xhci_segment *seg = start_seg;
> +	union xhci_trb *trb;
>  
> -	if (start_seg == end_seg) {
> -		if (start_trb <= end_trb) {
> -			if (xhci_trb_virt_to_dma(start_seg, start_trb) <= dma &&
> -			    dma <= xhci_trb_virt_to_dma(end_seg, end_trb))
> -				return seg;
> -			return NULL;
> +	/* check if dma is a TRB in start_seg */
> +	if (in_range(dma, seg->dma, TRB_SEGMENT_SIZE)) {
> +		trb = seg->trbs + (dma - seg->dma) / sizeof(*trb);
> +
> +		if (trb >= start_trb)
> +			/* check if the range covers it and we are done */
> +			return (end_seg != seg || trb <= end_trb) ? seg : NULL;
> +
> +		/* check if the range circles back to the beginning of start_seg */
> +		return (end_seg == seg && end_trb < start_trb && trb <= end_trb) ? seg : NULL;
> +	}
> +
> +	/* stop if the range doesn't pass through any other segment */
> +	if (end_seg == seg && (end_trb >= start_trb || seg->next == seg))
> +		return NULL;
> +
> +	/* search remaining segments knowing that start_trb isn't there */
> +	do {
> +		seg = seg->next;
> +
> +		if (in_range(dma, seg->dma, TRB_SEGMENT_SIZE)) {
> +			trb = seg->trbs + (dma - seg->dma) / sizeof(*trb);
> +
> +			return (seg != end_seg || trb <= end_trb) ? seg : NULL;
>  		}
> +	} while (seg != end_seg && seg != start_seg);
>  
> -		/* Edge case, the TD wrapped around to the start segment. */
> -		if (xhci_trb_virt_to_dma(end_seg, end_trb) < dma &&
> -		    dma < xhci_trb_virt_to_dma(start_seg, start_trb))
> -			return NULL;
> -		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))
> -			return seg;
> -		seg = seg->next;
> -	}
> -
> -	/* Loop through segment which don't contain the DMA address. */
> -	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {
> -		if (seg == end_seg)
> -			return NULL;
> -
> -		seg = seg->next;
> -		if (seg == start_seg)
> -			return NULL;
> -	}
> -
> -	if (seg == start_seg) {
> -		if (dma < xhci_trb_virt_to_dma(start_seg, start_trb))
> -			return NULL;
> -	} else if (seg == end_seg) {
> -		if (xhci_trb_virt_to_dma(end_seg, end_trb) < dma)
> -			return NULL;
> -	}
> -	return seg;
> +	return NULL;
>  }
>  
>  static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t dma)


