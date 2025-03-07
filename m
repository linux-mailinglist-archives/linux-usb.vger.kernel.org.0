Return-Path: <linux-usb+bounces-21506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B19EA56D63
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 17:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2555C1646ED
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 16:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F220723A986;
	Fri,  7 Mar 2025 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INwqtojw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0623817D
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364278; cv=none; b=IzzPA0EM3wOJN5gw4SiGFcM9cdK7qQRny/Ki18EOb4RjdBKrZn0KHCLxzsAUPB1sAwCJTOLgkG+CXHlevXdMIqsBbe3VM64WkBOmIbfix+xxlRHStuf/eEYc5b7LfloEo/DXgXGFG2/WdyS73D4Qj6sY1hKA4CeMNdbAGVtedg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364278; c=relaxed/simple;
	bh=UmaCbsVIr/PLohZeqxyvZ5fYO+gTTDmhLkxS/dfaRqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irAoTjgOo2L43TSHYXJI3iEX2qlYBTDw8zR8TvY0M03u0waOhl6AraSfBFYFxEJ6JQcRWG22i4u2+PzpOwFyY4AvKo24pcXTqvQi3HXCKY+T7BqwRAzE1LrFt+gXyjAkV6Gg5LX8WCcCNNmeMcY+pkNtH8uvV9brdCbGUSFeAJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INwqtojw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364277; x=1772900277;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UmaCbsVIr/PLohZeqxyvZ5fYO+gTTDmhLkxS/dfaRqM=;
  b=INwqtojwSIrLmyo0S+VMFdMOMAEQEee29Bmd0zQUl0QC30uNZoySkx0c
   WV8o/EbcLGvmmpSjidMTBJwJD1g1D8u/ijVxX4xdhObz7Z6XeOadCmWsJ
   kv1pk2C3zA2jLjGlxyheQYOU3kzQ0Yu9CNE/BectvSCAlanfURJ6nTr1a
   f+3mxfyQTA7EG1arv58iaWdlSPeeQsAvq593ySaUyVC7E587iThhYEOra
   DTVYsSqQYuFoq0jaqVqeSa9iCkqnzl1w69IB337pAt//5BXfpes/0XXZN
   bJcSktzKFAK39Uq+RLRjQb9TIwxj5pUj67Da+X3C+/6m58RrpNxMKbTCi
   g==;
X-CSE-ConnectionGUID: QO/lCxG7SluLMgZcJZ4+hA==
X-CSE-MsgGUID: dstUTrIFTm6dZK/rrLDjCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53807356"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53807356"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:17:56 -0800
X-CSE-ConnectionGUID: AC3TtO7DR6K5HznnSLTh+g==
X-CSE-MsgGUID: bltCVfFoRKmI/NDQp0jMjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119114974"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2025 08:17:55 -0800
Message-ID: <47aa1978-dd66-420d-82d3-0b93404ce8f3@linux.intel.com>
Date: Fri, 7 Mar 2025 18:18:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] xhci: Prevent early endpoint restart when handling
 STALL errors.
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20250307075429.5f9d1d4e@foxbook>
 <1c369ecc-a935-4c3e-ba8a-80e7d8894a92@linux.intel.com>
 <20250307164426.08720aca@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250307164426.08720aca@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7.3.2025 17.44, Michał Pecio wrote:
> On Fri, 7 Mar 2025 16:23:17 +0200, Mathias Nyman wrote:
>>> Any flag added to this list needs to be added to xhci_urb_dequeue()
>>> too so it knowns that the endpoint is held in Stopped state and
>>> URBs can be unlinked without trying to stop it again.
>>
>> In this case it's intentional.
>>
>> If we prevent xhci_urb_dequeue() from queuing a stop endpoint command
>> due to a flag, then we must make sure the cancelled URB is given back
>> in the same place we clear the flag, like we do in the command
>> completion handlers that clear EP_HALTED and SET_DEQ_PENDING.
> 
> I'm not sure why this would be, what's the problem with the approach
> used for EP_CLEARING_TT currently? And if there is a problem, doesn't
> EP_CLEARING_TT also have this problem?
> 
> In this case, xhci_urb_dequeue() simply takes xhci->lock and calls:
> 
> void xhci_process_cancelled_tds(struct xhci_virt_ep *ep)
> {
>          xhci_invalidate_cancelled_tds(ep);
>          xhci_giveback_invalidated_tds(ep);
> }
> 
> Unlinked URBs are either given back instantly, or Set TR Dequeue is
> queued (and flagged on ep->ep_state) and the rest of the process goes
> same way as usual when called from xhci_handle_cmd_stop_ep().
> 
> The EP will be restarted when the last flag is cleared, which may be
> either SET_DEQ_PENDING or EP_CLEARING_TT/EP_STALLED.
> 
> It's practically an optimization which eliminates the dummy Stop EP
> command from the process. I thought EP_STALLED could use it.
> 

This should work, and avoid that unnecessary stop endpoint command.

Just need to make sure we check for EP_STALLED flag after the other
(EP_STOP_CMD_PENDING | EP_HALTED | SET_DEQ_PENDING) flags in
xhci_urb_dequeue(), just like EP_CLEARING_TT case.

Also need to protect clearing the EP_STALLED flag with the lock

I'll either send an update patch next week, or during rc cycle if
that's too late.

Thanks
Mathias


