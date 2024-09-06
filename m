Return-Path: <linux-usb+bounces-14771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E964D96EBA0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 09:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21CE51C21F6C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 07:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E64114C592;
	Fri,  6 Sep 2024 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqzFV16W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228EC14BFA3
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 07:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606570; cv=none; b=uLGF4ImcvIEU57AnQrV9IigI9shZLVoncsjAx2k/eIFPbAFoIxvw8mKaTCzvjImdofJTG/QI1FtbES4w+bt1Shq6k8A+QYg03/KyqP5ycObTzhdVPHHU1eVwKc2AfIDulXiQX21/XKSzJqOG4Vnxt9IylbxmqrZdSkHhVGg+v6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606570; c=relaxed/simple;
	bh=M1nTB0kr4SU4VopcGie1kS1y4jmH1EIe+SbpPWRbxp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9wBhVHlMqWLX95kW5/PNPB/9BamhJQG8qT4m9HpRdbDXeoSS9QCa+LDC2uLNXfdcTY34kIV85QyogIOpMeCx5P6IuhvZAC9OGufuTDtlrdqVTKn3+PfNg58THivFWEkUD8jt1oJHGoPMNilMw+4RMZcVeHBbwrw0igIvEhlQlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqzFV16W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725606569; x=1757142569;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M1nTB0kr4SU4VopcGie1kS1y4jmH1EIe+SbpPWRbxp8=;
  b=jqzFV16WgdT3oAoM6QLUp4cyBvhXetktsuHXUcBn2CLdqS5EkH/+q5L8
   vcFlxddFoRFT/OBU2RMfXp4L1TWAuje1cwv3y6dPuRjSdViYiMGAL5DG+
   d/4jqT3whjuP19gFlzXFzyR+rKQ2Uedv2QvmJX+5PuZYfzLM9GqteTS3O
   IxnZDPqfz3WBntzD+IAlTMfpYoRt4Kg6xyt4Q+xX7nlVBR8Uzp24kLWhv
   y1J8/k1SxqbdR/ZepgSDYTYtNdptKHRG3RSeHMKQm3cYkWSTSM9KMaXaV
   P9bJQP8KhSapjciCLCznhgjmNyLosQ5v+zAziwcLbvI6VbKfcsBmcIn1+
   Q==;
X-CSE-ConnectionGUID: hjTZNxIEQEmcxA91ydG47g==
X-CSE-MsgGUID: tciEMSXYSMmBIwnmq8b55Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28238819"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="28238819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 00:09:28 -0700
X-CSE-ConnectionGUID: FXCUxlspTMKkaHtioM19qA==
X-CSE-MsgGUID: qyDYt7lBSdWomhANFLaJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="89128559"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.98.118]) ([10.245.98.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 00:09:27 -0700
Message-ID: <9a270951-4ffc-4d7b-a116-74a75c82a4c9@linux.intel.com>
Date: Fri, 6 Sep 2024 10:09:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] usb: xhci: adjust empty TD list handling in
 handle_tx_event()
To: fps <mista.tapas@gmx.net>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
 <20240905143300.1959279-11-mathias.nyman@linux.intel.com>
 <54D5652C-956D-46DE-B58A-1718BC7C9A56@gmx.net>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <54D5652C-956D-46DE-B58A-1718BC7C9A56@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/09/2024 7.44, fps wrote:
> On September 5, 2024 4:32:58 PM GMT+02:00, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>>
>> Introduce an initial check for an empty list prior to entering the while
>> loop. Which enables, the implementation of distinct warnings to
>> differentiate between scenarios where the list is initially empty and
>> when it has been emptied during processing skipped isoc TDs.
>>
>> These adjustments not only simplifies the large while loop, but also
>> facilitates future enhancements to the handle_tx_event() function.
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>> drivers/usb/host/xhci-ring.c | 51 +++++++++++++++++-------------------
>> 1 file changed, 24 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index d37eeee74960..a4383735b16c 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
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
> 
> "wanings" should be "warnings", no?

Thanks, yes it should be the latter.
It will fix it in a handle_tx_event() cleanup patch.

Thanks,
Niklas
> 
> 
>> +		 * extra completion event if the device was suspended. Or, a event for the last TRB
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
>> 		}
>>
>> +		ep->skip = false;
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
>> +				ep->skip = false;
>> +				td = NULL;
>> +				goto check_endpoint_halted;
>> 			}
>>
>> 			/*
> 
> Kind regards,
> FPS

