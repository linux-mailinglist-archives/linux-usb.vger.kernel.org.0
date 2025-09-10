Return-Path: <linux-usb+bounces-27851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3CB51066
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 10:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D2A461BE2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 08:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209E62550CA;
	Wed, 10 Sep 2025 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBdWZnc9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498A30F55E
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491212; cv=none; b=Bc/1aX5m5KZHdpgYwmielvT+V2NqrZCatiT9Jc+Iqd/KoBT27gpAbskrOxvx9gTi3rWpzJ4MN7YxPMepHIt0RAkO7PclDFxxjWUBqPAyVx5JLAubljuHiMsu0udhpQq6AJr3YEGL88m1C0IaZHNJTIZhnpqL+WDJ3lpQEvzW7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491212; c=relaxed/simple;
	bh=syz18HGbU7d2oaoxRaJ6GTxk0Kdt3BeISaUJob4NCkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZDCZLLD/iAEbHkwhIOtSjrOCBWXKev408u9qru+/67sERgOZ/9571UwvXkLLj7F9JnZYwYffQBrkBpbogbWmiDOqKqu9+gBY88p8/p8Mi9SfIUcsa7rC/crGOkHEmTpSS26Ngj8UAz/YCLWcYu7qJRGWzSq6s7AKxdNJsdEL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBdWZnc9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757491212; x=1789027212;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=syz18HGbU7d2oaoxRaJ6GTxk0Kdt3BeISaUJob4NCkc=;
  b=KBdWZnc9txBsxlaPKEe7k5/m+Juh+/b6LyVG9KD803u8QrUZwGE7T0BG
   1imBGzv2tA2geOwAAUt6pNX17QgyDUXITyX6zeg7n8XqgKF4S/3rGqf9t
   iD5fMP6QRo1dEsrMNmducFfUaYuE48GX9hAD7B6JOnH0s1pvRXI9FZOJl
   vWZAsbqbqMZOA5Cpdz2z14qmXmHPOcSLg0bWiZ8QWIgqmvhVoaU44mYLQ
   uIcvDuJdaeO0HTBzSrjR5SzdZ5Og+To9H1V5oMKhfQFBKx4LUbLFRDdEC
   vLY7HR/mBJctwYpEAjE+qrkerOvS7/V2RiGdbjRhk/NSUTHE+wiEFKywB
   w==;
X-CSE-ConnectionGUID: qSxEvMt4TLaanIej1MaCZw==
X-CSE-MsgGUID: xX9buhVaRvGeIBy8lmH2hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59715001"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59715001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:00:11 -0700
X-CSE-ConnectionGUID: F0MHCpxqSzqL2ms6zWTdjg==
X-CSE-MsgGUID: XJicUdv8STeE7Kfokx0JtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="177653668"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.255.79]) ([10.245.255.79])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:00:09 -0700
Message-ID: <a905c139-c793-4715-8f48-38df4afde1ab@linux.intel.com>
Date: Wed, 10 Sep 2025 11:00:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] usb: xhci-dbgcap: correct DMA address handling
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-2-niklas.neronin@linux.intel.com>
 <20250909121313.13286b34.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250909121313.13286b34.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/09/2025 13.13, Michal Pecio wrote:
> On Wed,  3 Sep 2025 19:01:21 +0200, Niklas Neronin wrote:
>> Address the handling of addresses within the dbc_handle_xfer_event(),
>> ensuring accurate extraction and comparison.
>>
>> Variable details:
>> 'r->trb_dma'		    : A DMA address.
>> 'ep_ctx->deq'		    : A le64, bits 63:4 contain the DMA address.
>> 'event->trans_event.buffer' : A le64, bits 63:0 contain the DMA address.
>>
>> 1. Convert 'ep_ctx->deq' and 'event->trans_event.buffer' addresses to
>>    the CPU's native byte order.
>>
>> 2. Use mask; TR_DEQ_PTR_MASK (bits 63:4) to extract the address from
>>    'ep_ctx->deq', replacing the previous use of ~TRB_CYCLE (bits 63:1).
>>
>> Why not use 'dma_addr_t' for the address?
>> The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
>> system architecture or xHCI driver flags, whereas the 64-bit address field
>> size remains constant. Since hardware cannot be fully trusted, it's better
>> to print the entire 64-bit address to detect any non-zero values in the
>> upper 32 bits. This approach ensures that potential issues are easily
>> detected.
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> ---
>>  drivers/usb/host/xhci-dbgcap.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
>> index 06a2edb9e86e..2f24a3a54439 100644
>> --- a/drivers/usb/host/xhci-dbgcap.c
>> +++ b/drivers/usb/host/xhci-dbgcap.c
>> @@ -724,6 +724,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
>>  	u32			comp_code;
>>  	size_t			remain_length;
>>  	struct dbc_request	*req = NULL, *r;
>> +	u64			ep_trb, deq;
>>  
>>  	comp_code	= GET_COMP_CODE(le32_to_cpu(event->generic.field[2]));
>>  	remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
>> @@ -733,10 +734,11 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
>>  	ep_ctx		= (ep_id == EPID_OUT) ?
>>  				dbc_bulkout_ctx(dbc) : dbc_bulkin_ctx(dbc);
>>  	ring		= dep->ring;
>> +	ep_trb		= le64_to_cpu(event->trans_event.buffer);
> 
> In other places this variable would be called ep_trb_dma
> and ep_trb would be xhci_trb*.

The variable is named 'ep_trb' because it represents a u64 value, not a DMA address.

The choice to avoid using a 'dma_addr_t' variable for the 64-bit value is intentional,
as it can prevent the loss of the upper 32 bits.

> 
>>  
>>  	/* Match the pending request: */
>>  	list_for_each_entry(r, &dep->list_pending, list_pending) {
>> -		if (r->trb_dma == event->trans_event.buffer) {
>> +		if (r->trb_dma == ep_trb) {
> 
> And here it is being compared with a something_dma variable.

dma_addr_t trb_dma	- is a DMA address
u64        ep_trb	- is a 64-bit value, which, if correct, represents a DMA address.

Best Regards,
Niklas


