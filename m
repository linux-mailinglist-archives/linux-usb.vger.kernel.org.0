Return-Path: <linux-usb+bounces-20869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A598A3DA0D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 13:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E01423AF9
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821241F5612;
	Thu, 20 Feb 2025 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHE9+2Zb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE81F1521
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054344; cv=none; b=kwx0iyT4MCdhgoRh78dnY0Ks/DWBVCBQjvYAMsbiwuIesdtbiGwFxA0RoSpSIRnVwaoEQABKzWEVa6CW/MZN4he1bnA/ABUg3xgIs9Bci16jkl4X+H6ll8xBQ4Bl4bV7DuTNPDq9ig5yBY8zfPjC8QPKQ+LFr7eB/BZC7oai+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054344; c=relaxed/simple;
	bh=8h4JRUJVuJgyHDon0eXAp/46hHBNpvfDnj0gd8kLOnc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r5cn+nXKiyIHMnH1bSmdaUaf0pORj8NqIA79KAYpQAPMYJr/GtBQotOl5/ZU/LjEprS1rYlLFgHf8jeI9w4TwbVaE/sDMEYKMCW7yWWbXBd1i3/qBj/0SiPlm2pJcsZ6aP++HFqdXNVnLMg7JuZPAO2HSsOnVv0XoJYo5fcCJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHE9+2Zb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740054343; x=1771590343;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=8h4JRUJVuJgyHDon0eXAp/46hHBNpvfDnj0gd8kLOnc=;
  b=NHE9+2Zbu+7JQ9dL1qXBbVIT/Es4qmQzQAU8tUQ+e5SzvQgGsZ6fioJs
   KqKxJL7fBEiTBPliEos9Jlj8Wj4HpZ2CZjdw0NbMLiwiN58aCmFbT1IFM
   p83IA2TIKagKVR+YpdPSYykdLcjqNdKf6f4tRvgx/26kNMxL/rcr4+8MS
   Ki6D0c5kYPucNP9zbiv71KnT+kbJr8hN0gd9pUXvBNsbddVcfovYSy76H
   Li5/ukP47CzBvWsc2cz/8pYDQjGB6BgJvsJ9N7ox21/ABDCf08YutQAAt
   1OAM04fPZsUR0jCyX9wZvKsKfrjWw4UKZv27ZBaixqCSvV6QyIiCs5RjD
   w==;
X-CSE-ConnectionGUID: WvLdl4poTpWxQgeHY/2iEQ==
X-CSE-MsgGUID: goJl5sPQTcixwqDbalFb2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40062256"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40062256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 04:25:42 -0800
X-CSE-ConnectionGUID: dzl0h9P+QFi5PLOyl2iQSw==
X-CSE-MsgGUID: bS+jPngkT4GSkxwX2faHmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115223489"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 04:25:41 -0800
Message-ID: <662c15fb-ab70-4283-9fb0-b4075fba926e@linux.intel.com>
Date: Thu, 20 Feb 2025 14:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 3/4] usb: xhci: rework and simplify trb_in_td()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
References: <20250219095637.5bd6e9e4@foxbook>
Content-Language: en-US
In-Reply-To: <20250219095637.5bd6e9e4@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19/02/2025 10.56, Michał Pecio wrote:
> Hi,
> 
>> +		/* Edge case, the TD wrapped around to the start segment. */
>> +		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma &&
>> +		    dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
>> +			return NULL;
>> +		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))
> 
> It should be strict inequality for the upper bound here.

Thanks, you are correct. I'll change this to in_range64() and the bellow to !in_range64().

> 
>> +	/* Loop through segment which don't contain the DMA address. */
>> +	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {
> 
> Maybe a comment here? Something like:
> 
> * At this point seg contains the dma and either:
> * a. start_seg != end_seg and seg can be anywhere
> * b. start_seg == end_seg in wraparound case and seg != start_seg

Sure, I'll add some comments.

> 
>> +	if (seg == td->start_seg) {
>> +		if (dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
>> +			return NULL;
>> +	} else if (seg == td->end_seg) {
>> +		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma)
>> +			return NULL;
>> +	}
>> +	return seg;
> 
> This should be corrent, but it's not something immediately obvious.
> 
> Not sure if this new implementation is really simpler than the old one.
> I wonder if it wouldn't make sense to reorder this after the API change
> (patch 4/4) to allow emergency revert if something unexpected shows up.

I'll try this, the only issue is that the new API defines the range from;
 'start_trb' in 'start_seg' to 'end_trb' in 'end_seg'.
But the current version does not use 'end_seg'. So, if check checkpatch.pl
does not complain about unused 'end_seg' variable I will swap patch 4 and 5 places.

> 
> As for efficiency, those virt_to_dma translations aren't exactly free
> and there are two. Maybe it could be faster to translate dma to virt
> once and then compare.

I tried introducing xhci_dma_to_trb_virt() in this patch set, but decided against it.
In my opinion it is very minor optimization and I would rather introduce this function
in a separate patch set. I reworked trb_in_td() with this change in mind.

> Sometimes also sizeof(*) < sizeof(dma_addr_t).

This is an interesting idea. I just created a reverse xhci_virt_trb_to_dma(), i.e. xhci_dma_to_virt_trb().
I'll explore this idea. Thanks.

> 
> Regards,
> Michal


