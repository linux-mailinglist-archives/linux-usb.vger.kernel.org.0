Return-Path: <linux-usb+bounces-21384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A6A4F9BE
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 10:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B0316EE10
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 09:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D765C204866;
	Wed,  5 Mar 2025 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLGS2Qq8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0452045A8
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166302; cv=none; b=LzOiPA0V7HQXytAf10xqV7NB6xb8fvFhvVSXSZqVT5ik+XKUDw0Lhu72e6aqXyh9qaoW526tnn6+s3V5YLvE021nCUS6dmi6wFsDey5ImkX9Q9/LjYDZpQpCtV72KqBdi2isBGAQAPDKs3XsuoEayzOVEwIfDLb97X9qlxfJs4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166302; c=relaxed/simple;
	bh=41rHq4LcT+kEj1Ao5fN++nyt2AhhfVPMRimX9o7AK+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwryHSCq3hsgSdzSzxYqa571jVsWX01D58caoZPm/sxN9ySMb7NuyywJJ4Zb6IwuOpJsqkwYHTPvyK31qZ14FGnr99NYu5yYEKhyAWFbyWAlGP6kIlwbSX2ttBq1pph2+Jwc5R3RMNfi63jPzTpf00NVoaqWuedQOCyp2QVgVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLGS2Qq8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741166301; x=1772702301;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=41rHq4LcT+kEj1Ao5fN++nyt2AhhfVPMRimX9o7AK+I=;
  b=CLGS2Qq8Rfw4XxcQyhfJR8EnVkoYr2D4WcLJhwQhKxYw41NSkN8yKVi3
   NN8J+YQHuZKMnIGJRAOZGuzIjg2Rqk0sr7X1ZDNmucKfYq6n3qrRhiyBd
   g8/ADFMcMpseOtpDhl+CDfUsVC0synF0yo5FaSYqDQhZCXxRY+6ZmvKmp
   valKjiYzNiNQUx6OWJMdzC7Jg4s1KhIw0coqOCHjug/AHr+gGTmqLlIV8
   IHZ/6vakZQF2MeIY++xTRUkgxzZDk8WKYVBtk9898/mw+p7bdRjLelFIV
   ISgmePDQROXkP5dQihgBozGlWLmwi0VfzS/GJuzqUD1OMm43BxQdoy0q2
   A==;
X-CSE-ConnectionGUID: xjbLBDf4QlCl5GuTaNGMjw==
X-CSE-MsgGUID: TPc1EML9TDGnrT3qZCGNfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41979354"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="41979354"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 01:18:20 -0800
X-CSE-ConnectionGUID: ycFz6sZ7RACjWZcNzZOwMQ==
X-CSE-MsgGUID: NPYpjyVPSqqlMzh7j0VILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="141881963"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 01:18:18 -0800
Message-ID: <5144b2b1-997a-4c4e-befe-43a21d357c1b@linux.intel.com>
Date: Wed, 5 Mar 2025 11:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] usb: xhci: move debug capabilities from trb_in_td()
 to handle_tx_event()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
References: <20250305094600.1630ef54@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250305094600.1630ef54@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/03/2025 10.46, Michał Pecio wrote:
>> +debug_finding_td:
>> +	xhci_err(xhci, "Transfer event %u ep %d dma %016llx not part of current TD start %016llx end %016llx\n",
>> +		 trb_comp_code, ep_index, (unsigned long long)ep_trb_dma,
>> +		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
>> +		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb)); +
>> +	xhci_for_each_ring_seg(ep_ring->first_seg, ep_seg) {
>> +		xhci_warn(xhci, "Ring seg %u trb start %016llx end %016llx\n", ep_seg->num,
>> +			  (unsigned long long)ep_seg->dma,
>> +			  (unsigned long long)(ep_seg->dma + TRB_SEGMENT_SIZE));
>> +	}
>> +	return -ESHUTDOWN;
> 
> Cleaning up trb_in_td() is obviously the right thing to do, but one
> thing I always disliked about this message is how long and verbose it
> is. Not sure if dumping all ring segments is useful here, seg->dma can
> generally be deduced by looking at the DMA pointers involved.
> 
> As far as improvements go, IMO it would be much more useful to decode
> those pointers into seg-number/trb-index pairs. I wrote a PoC and the
> result is quite encouraging, I may submit it if there is interest.
> 

Agreed, printing the segment number and TRB index is a better approach.
This is my plan for the future, but in my opinion, the format for common
values should be consistent. Therefore, the change to segment number and
index should be implemented simultaneously across all xHCI driver prints,
except for some specific places. Thus, it's not changed in this patch set.

I plan to make this change after the rework of trb_in_td(). Currently,
I am testing a new trb_in_td() version suggested by Mathias, which would
make the number/index change even more logical.

Regards,
Niklas


