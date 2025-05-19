Return-Path: <linux-usb+bounces-24090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3FABC0BD
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 16:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6DE3BAB60
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 14:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F15283158;
	Mon, 19 May 2025 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKC9mkuQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF9280A50
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665226; cv=none; b=EkoK2+Y+u6e4aPT1Ygxyk5N51N1t8Srbcuubr/isicU1mBRGuJYeImdE3WLYyeoh6Oi6KtlZ1koIv+4D0n4+toanl3uos1k/aFu+npPxaqjiGl1hfKdBLFDsn+mrIT8yQrVusdUCOEWZzCRmZpJaByGG50qguzAvKSYF7v6A/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665226; c=relaxed/simple;
	bh=utojSS40EnIt9KxWdyE/MArSaB9lFPoHqG37GcF6ZGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KM4/02EEFy1eN5R23n8lP4NfZkJXY/LHyGqD7OBd6fFbEXmsmsro2Ku+YveQCAuUbT0ZDtwdaGt3VXg+RBk6ZGQorm6s+MjrXppnpv0Ka+zPfnhgy3xYIo5cXRqfJx47JOS02N4280l9bNvf4IYHMzOpvcCg9YeTd4bDdS6+oF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKC9mkuQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747665224; x=1779201224;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=utojSS40EnIt9KxWdyE/MArSaB9lFPoHqG37GcF6ZGo=;
  b=CKC9mkuQiYL+1rITOZcLMgcuUokJ8Z9X0Ao0e5105xzuKrnHOw1EaPy0
   wF47EQpEvLCldgDpI1Ptp4eeMPDei8dvnURTwMKvQK1WozlEjxsGUfBRI
   LJ5h+4Ykvm1IsMcAANb31V6l2aqczhhnb1bked658fJfhhXAUGNQx4gk8
   vZ+1FDOJ8LGv23qdUH61ZeFMeBUkFyXvzLxBkLbTBuajK0f3Kw062doJa
   wSTcQJzUigzeZytX/6g5In8KnBt+ksIHo04v2gr+wpu1MBPVEYYmWbHa2
   5VwfaoH4JXdxa1xe4WuHKLBX3jSJBSPMit659DcozXa/VOxXxIxNRsKFN
   A==;
X-CSE-ConnectionGUID: aEuYvWPOTyiSXwA8OmYhKQ==
X-CSE-MsgGUID: hxM5xdKcRXOTsUYRklDxug==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49721519"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49721519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:33:44 -0700
X-CSE-ConnectionGUID: AYAZHb4OQguuUvZXyZ3slA==
X-CSE-MsgGUID: LdOHiBOmTBi2PWFaOBaW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="140275952"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2025 07:33:42 -0700
Message-ID: <c6c2a7f6-35fb-4f92-9d07-b0a2fa703223@linux.intel.com>
Date: Mon, 19 May 2025 17:33:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] usb: xhci: add warning message specifying which Set
 TR Deq failed
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-24-mathias.nyman@linux.intel.com>
 <20250516144310.12b4f072@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250516144310.12b4f072@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.5.2025 15.43, Michał Pecio wrote:
> On Thu, 15 May 2025 16:56:20 +0300, Mathias Nyman wrote:
>> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>>
>> Currently, errors from the Set TR Deq command are not handled.
>> Add a warning message to specify the slot, endpoint, and TRB address
>> when a Set TR Deq command fails. This additional information will aid
>> in debugging such failures.
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci-ring.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c
>> b/drivers/usb/host/xhci-ring.c index e3c823e1caee..eff6b84dc915 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -1448,6 +1448,11 @@ static void xhci_handle_cmd_set_deq(struct
>> xhci_hcd *xhci, int slot_id, unsigned int ep_state;
>>   		unsigned int slot_state;
>>   
>> +		xhci_warn(xhci, "Set TR Deq error for TRB 0x%llx in slot %d ep %u\n",
>> +			  (unsigned long long)xhci_trb_virt_to_dma(ep->queued_deq_seg,
>> +						ep->queued_deq_ptr),
> 
> Is printing this pointer actually useful? It doesn't tell why
> the error happened. It will not relate to other messages - the
> command failed, so dequeue stays at its old position.
  
Printing the DMA address has turned out to be quite useful, quickly shows corner
cases like end or beginning of ring segment, or address missing upper 32 bits.

Comparable with the "trb not in TD" error messages


> 
>> +			  slot_id, ep_index);
>> +
>>   		switch (cmd_comp_code) {
>>   		case COMP_TRB_ERROR:
>>   			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration\n");
> 
> This will now become a multi-line log message, even though actual
> information it contains could fit in one line.
> 
> How about replacing this new line and the whole switch with:
> 
> +               ep_state = GET_EP_CTX_STATE(ep_ctx);
> +               slot_state = GET_SLOT_STATE(le32_to_cpu(slot_ctx->dev_state));
> +
> +               xhci_warn(xhci, "Set TR Dequeue %s for slot %d ep %d (%s/%s)\n",
> +                               xhci_trb_comp_code_string(cmd_comp_code), slot_id, ep_index,
> +                               xhci_slot_state_string(slot_state), xhci_ep_state_string(ep_state));
> 
> Example output:
> xhci_hcd 0000:02:00.0: Set TR Dequeue TRB Error for slot 1 ep 6 (configured/stopped)
> 
> IMO this has the further benefit that "TRB Error" is something I can
> search in the spec, while "because of stream ID configuration" is not.
> And it isn't even the true treason in every case of TRB Error.

This works as well, but tuning this message is something we can do in a later fixup.
I don't think it's worth resending the series due to this

Thanks
Mathias


