Return-Path: <linux-usb+bounces-14784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0696F502
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3272861D6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 13:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DCF1CDA31;
	Fri,  6 Sep 2024 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMyPKwRW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839441C8FC0
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627921; cv=none; b=pZiGNW/CutasLK+2wLSEUP9zmA4q5QetcqA0CuruOYEpOv3ejnZELLg0anoLpE2rZItBgjohehZJ3n+NJZvW/eE45I6i6sMWvgI/6U9blaqWgHEWdhchX6yhbIt+8Sz71aMWMtCAjZ5fexOK7tsQb99iaXCUXU6l3qRrBVneQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627921; c=relaxed/simple;
	bh=AI5Ufot6Vgxp4eRC2AbRoLa9XbwEToNxvP1o+Q9CsCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjjV8HpleYfYfzVSBQzyKGTCW4hqHPmmCdlfojhq7JDsotDSYy5LMMKko8MJCFi+uQIFBSBuABd6dY5pruS3Z2xz+7R9194l5zCkifGu/K9LVhXAA93NdUlO3vQqoUBeQzJtipMhfkIT5NEhoLyE6u9LdVvHvt6o8Ozy/+lsSjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMyPKwRW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725627920; x=1757163920;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AI5Ufot6Vgxp4eRC2AbRoLa9XbwEToNxvP1o+Q9CsCM=;
  b=BMyPKwRWgS7yrL/ox/4Af2ANzzdylrfvTiapWCrpu+KlahEUsLGCIXdn
   KuPiwR3auEv6FLDR4tkby3z1MnZgEQ8oszmgztMMZXT6FInXUG6kQBCFG
   NNRrJBo9m3urXsgpXOugZsI/3DIkZDKWExZ+GcNmuAnjO3JJGp7LzT+oK
   0Zc9ujt41XkdCgEJK1WpWMCEKlnbjee4ZZWT7t6mv2+9bhfeXJyEkbSTg
   dyifopNqb+iEvJl86rkv95RfKZeYsYjcZbi0TaRiZaQ5WwQZOGFqU0HWw
   2ASFnOET1ZZHnZiq8lk27qAAKU0e2FIhQ8Bo5Npb1I04VT/BHaJuiLJob
   g==;
X-CSE-ConnectionGUID: Q40tPsxdTmigw4NSRsU4/g==
X-CSE-MsgGUID: 9WmfPq3DQGWu04EPaLiSPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34960519"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="34960519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 06:05:19 -0700
X-CSE-ConnectionGUID: e9+GkDhzThm3BRpFdOoJ7A==
X-CSE-MsgGUID: eQUl6gIPQQadbpPJP/Y4vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65930376"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.98.118]) ([10.245.98.118])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 06:05:17 -0700
Message-ID: <1ae67893-fc97-4210-9e5d-74af158d5422@linux.intel.com>
Date: Fri, 6 Sep 2024 16:05:14 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] usb: xhci: adjust empty TD list handling in
 handle_tx_event()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20240906142316.3b00e4f1@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20240906142316.3b00e4f1@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/09/2024 15.23, Michał Pecio wrote:
>> @@ -2761,35 +2761,25 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>> 		return 0;
>> 	}
>>
>> -	do {
>> -		/* This TRB should be in the TD at the head of this ring's
>> -		 * TD list.
>> +	if (list_empty(&ep_ring->td_list)) {
>> +		/*
>> +		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
>> +		 * extra completion event if the device was suspended. Or, a event for the last TRB
> Is changing this code perhaps an opportunity to clarify its comments?
> 
> This is just confusing. A stopped endpoint doesn't generate any "extra"
> events since it can't be stopped again. Commit message of a83d6755814e4
> suggests that this was about stopping running but idle EPs (as is the
> case of EP0 before suspend). So briefly and to the point:
> 
> /* Ignore Force Stopped Event on an empty ring,
>    or one containing only NOPs and Links */

Thanks, for the suggestion. Indeed the comment should be updated.

> 
>> +		 * of a short TD we already got a short event for. The short TD is already removed
>> +		 * from the TD list.
>> 		 */
>> -		if (list_empty(&ep_ring->td_list)) {
>> -			/*
>> -			 * Don't print wanings if it's due to a stopped endpoint
>> -			 * generating an extra completion event if the device
>> -			 * was suspended. Or, a event for the last TRB of a
>> -			 * short TD we already got a short event for.
>> -			 * The short TD is already removed from the TD list.
>> -			 */
>> -
>> -			if (!(trb_comp_code == COMP_STOPPED ||
>> -			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
>> -			      ep_ring->last_td_was_short)) {
>> -				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
>> -					  slot_id, ep_index);
>> -			}
>> -			if (ep->skip) {
>> -				ep->skip = false;
>> -				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
>> -					 slot_id, ep_index);
>> -			}
>> -
>> -			td = NULL;
>> -			goto check_endpoint_halted;
>> +		if (trb_comp_code != COMP_STOPPED &&
>> +		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
>> +		    !ep_ring->last_td_was_short) {
>> +			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
>> +				  slot_id, ep_index);
> I would add trb_comp_code here if touching this line.
> 
>> 		}
>>
>> +		ep->skip = false;
> I don't like that the xhci_dbg() has been removed. If skip debugging is
> to be reliable, it should report all state transitions. And this is an
> unusual one, so maybe very interesting. Skip debugging is valuable, as
> the logic is tricky and has known problem cases. More below.

Sure, I'll add a debug message when the skip flag is toggled.

> 
>> +		goto check_endpoint_halted;
>> +	}
>> +
>> +	do {
>> 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
>> 				      td_list);
>>
>> @@ -2800,7 +2790,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>
>> 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
>> 				skip_isoc_td(xhci, td, ep, status);
>> -				continue;
>> +				if (!list_empty(&ep_ring->td_list))
>> +					continue;
>> +
>> +				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
>> +					 slot_id, ep_index);
> This used to get the empty list warning, but now it's mere xhci_dbg().
> Throwing out all queued TDs is not the common case and it may easily
> be a bug. Indeed, I can readily name two cases when it is a bug today:
> 
> 1. Force Stopped Event on a NOP or Link following the missed TD. Then
> trb_in_td() doesn't match subsequent TD and the rest is trashed.
> 
> Actually, this is a v6.11 regression since d56b0b2ab1429. Although past
> behavior was bad and broken too, it was broken differently.
> 
> 2. Ring Underrun/Overrun if new TDs were queued before we handled it.
> If ep_trb_dma is NULL, nothing ever matches and everything goes out.
> 
> Arguably, these are rare events and I haven't observed them yet.
> And one more problem that I don't think currently exists, but:
> 
> 3. If you ever find yourself doing it on an ordinary event (Success,
> Transaction Error, Babble, etc.) then, seriously, WTF?
> 
> Bottom line, empty list is a very suspicious thing to see here. I can
> only think of two legitimate cases:
> 
> 1. Ring X-run, only if nothing new was queued since it occurred.
> 2. FSE outside transfer TDs, if no transfer TDs existed after it.

I can change it from a debug to a warning. Then the edge case should be more visible.

> 
>> +				ep->skip = false;
>> +				td = NULL;
>> +				goto check_endpoint_halted;
> Isoch EPs can't stall and aren't supposed to halt on errors, 4.10.2.

Good point, thanks.

> 
>> 			}
>>
>> 			/*

