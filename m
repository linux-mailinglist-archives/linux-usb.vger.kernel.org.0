Return-Path: <linux-usb+bounces-5161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F3A8303CC
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 11:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17BC1F26A24
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E419BA2;
	Wed, 17 Jan 2024 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIiCOj/Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14614296
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705488274; cv=none; b=iU3b6/GNF8W/L6oQLmY1UCWFE6RloiMKwll7sI689MwadMaGYdUyt0BFsZA6QPZqRaxqFq2AQAZ2/YVcPGhPUP16bH7ZNiS5L3UDjOrzrmIEjK+Ek1zXjaFVseOuzRDiMOZiJyWptVlDYCzOEAMTpK8NMoHiMcCMOoUnn/pgm1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705488274; c=relaxed/simple;
	bh=f7bvVGg4ClA0lc3B0+sXSbtzPtfsowE1WV0rFndqT6s=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=t02cXRgatj2OPIV9bU74X7CWfoN/rNyfR8Ns1l8GmNJnPWmR5XwZ+o0QCljQTDkfpWGgWQZvZnZ8tLpJt6sinOVZ1Lyg4+WsokMsu/N50HKcX/1oDXBVewcPJbmuO/suw3vTCGPXqM7KuH/qovWiuuBUO49Bb+8isKy4EQmQfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIiCOj/Z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705488272; x=1737024272;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=f7bvVGg4ClA0lc3B0+sXSbtzPtfsowE1WV0rFndqT6s=;
  b=DIiCOj/ZjZib1gen3v9lx0GBv50eTzTxhP8Knjd7VzKA2YLvS5vi/SfB
   WSSTAxj7Tzt3Cl09e/OMGn8PzBl2L+wsmUYrLTo0u3NJFzow8w9X3qXnz
   oqO0pc6xKFA9k+EiswLkb6OCQw2OoDH3NWGWUOKnuQtMSOuniFdlf1GSS
   XJCwrhHSX9YGnqBDxWb9FmwjDTRW/auLtoenDimqf2ioGT0dMEnnrc+LR
   wEHHd4QW8JKraSWyPqqPLllsReeJfxqTCob6BEu4oyw4K8Kiy3GmCJEzM
   Md+XPw9MZfhltnwIK1dQX2HwDYIP77t1l5GyS53wunQ2bxAb+nkk2VQxg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7513281"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7513281"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 02:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874786839"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="874786839"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2024 02:44:29 -0800
Message-ID: <f6542354-d6d1-be22-82ed-5dfa57aa8337@linux.intel.com>
Date: Wed, 17 Jan 2024 12:46:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240115172709.0b6f2bba@foxbook>
 <20240116153618.2527463-1-mathias.nyman@linux.intel.com>
 <20240116232045.76da750b@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFT PATCH] xhci: process isoc TD properly when there was an
 error mid TD.
In-Reply-To: <20240116232045.76da750b@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.1.2024 0.20, Michał Pecio wrote:
> I applied your patch on v6.7 and it appears to be working. It removes
> the disconnection spam and also handles intermittent transmission errors
> on UVC without obvious glitches or errors messages, except one xhci_dbg
> added to confirm that I'm really hitting this edge case.
> 
> Anything else that might be worth testing?
> 
> 
> I have a question, though. What happens if there is no next TD because
> a mid TD error has occured on the last packet queued by the client? Is
> there any mechanism to retire that stuck TD on a NEC host which submits
> one mid TD error event and then goes silent?

In disconnect cases usb core should flush the remaining URBs once
roothub code notices the disconnect.

But yes, if the last TD in a URB is a multi TRB isoc TD, and it has an error
MID TD then its stuck until timeout.

> 
> Would it be possible to retire the TD right after the first failed TRB?
> (I imagine difficulties in determining when exactly the host has moved
> its internal pointer past the remaining TRBs so they can be reused).

Probably not as a normal error handling routine.
We have the same "Transfer event TRB DMA ptr not part of current TD" issue
for hosts that do issue an event for the last TRB.

If the TD is given back immediately we also have a memory issue as the
DMA address pointed to by that last TRB might be accessed by the controller
_after_ driver gave back the TD, and possibly freed/unmapped it.

But for that special case where there are no more TDs queued it might
make sense

> 
> 
>> -			if (!ep->skip ||
>> -			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
>> +			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
> I like this. I would suggest another cleanup: the if(!ep_seg && stuf)
> right above your change could be pulled inside if(!ep_seg).

Noticed the same, but for stable kernel reasons it's probably better to limit
this patch to mostly fixing this bug.

> 
> 
>> +			 * if there was an error event mid TD then host may not
>> +			 * give an event for the last TRB on an isoc TD.
>> +			 * This event can be for the next TD, See xHCI 4.9.1.
> This seems to suggest that 4.9.1 encourages such behavior, but the
> opposite is the case as far as I understand.

I'll rephrase this.

> 
> 
>> +			if (td->error_mid_td) {
>> +				struct xhci_td *td_next = list_next_entry(td, td_list);
> This if needs && !list_is_last(&td->td_list, &ep_ring->td_list).

Thanks, nice catch, good point.

> 
> Otherwise a serious bug in the host (maybe in the driver too) tricks
> us into grabbing a pointer to ep_ring instead, filling the subsequent
> "TRB not part of current TD" message with mystifying garbage numbers.
> 
> 
>> +				if (ep_seg) {
>> +					/* give back previous TD, start handling new */
> Suggested:
>> +					xhci_dbg(xhci, "Missing completion event after mid TD error\n");

Makes sense.

Thanks
Mathias


