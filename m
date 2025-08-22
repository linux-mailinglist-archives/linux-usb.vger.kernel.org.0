Return-Path: <linux-usb+bounces-27183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A3EB315FF
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 13:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56812622564
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 11:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81E0260582;
	Fri, 22 Aug 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+nxzg2c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612919007D
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860421; cv=none; b=u6O88LCyDO5h3r3kd0FJntCs/ti9l+k7El7nmGX5M7/Gd3jUSVYtlPLuQIfs1+8DGgMNNyUi1FgrvVzzqkAtGm7ixXg+PIEkQ8PMIPBJMkWm//Z18qQnlmXSrPO0KuimeFXq7Wuh6OjpQCwKXFvoSGW9NJAfqecDZrp99+pcEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860421; c=relaxed/simple;
	bh=jhU07vNwV58UCBNCUNBHGm+TUZjGV6u/GluCCN5WP7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ec7yHQFmzOEnepjLFSztkkyQD0RHoKLM282Wonfy9m9qYqK3cYCrhHy2quzHgDXTMFSBKquUDIAVYxW0SVbv+yJflxZql94kychD3h1EzuywwELgKcAwjEwMlDKmG+RCTnqRXgV4iVTYa+w4ko1fa0kWB/uzCc5FPcfjLY4zHVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+nxzg2c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755860419; x=1787396419;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jhU07vNwV58UCBNCUNBHGm+TUZjGV6u/GluCCN5WP7I=;
  b=k+nxzg2cktpLVSMjTWu4SpGq6ahDNoQ9cKd6mWSycA3L36QywVloBd4Y
   8TQ2+x1QzMdo5mv6kzW927baPZj7ievgJRHk28OT8Xb5wPemkTwsJjPIA
   Q2Wojw383qckBjIEKLjakMWURGqz3BIuF2jjDMmrxXca0BvGilVj73Kmu
   c8wPPONCjvgk0BT/vtlOJlQrlsNVh2iyVSRULxSDXuADMGSpQv/9ZYHBV
   KM///QGbUw/H16BUei2dZc9Y3J4Ae7LhGmhd9REN+Upw1OsRrPFQP385r
   9stVo0X/tmWWLTR/FdCkI1FmXagPWXhE4JWg8PQEC+gA0/nrm5OzjQKeA
   A==;
X-CSE-ConnectionGUID: nEfM+hQvSMm7co56x6kRzQ==
X-CSE-MsgGUID: q/kQhP3gQJS7n9yETdGG5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83581349"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83581349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 04:00:19 -0700
X-CSE-ConnectionGUID: 4zh/Aq6pTfaX+3M++4E27A==
X-CSE-MsgGUID: N3+NUp6JSBOSCXJybCq5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169080939"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 04:00:17 -0700
Message-ID: <359bc120-13d7-4f4b-8f25-945bf1638d69@linux.intel.com>
Date: Fri, 22 Aug 2025 14:00:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] usb: xhci: handle Set TR Deq TRB Error
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
 <20250818125742.3572487-2-niklas.neronin@linux.intel.com>
 <20250821113244.14168b1a.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250821113244.14168b1a.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 21/08/2025 12.32, Michał Pecio wrote:
> On Mon, 18 Aug 2025 14:57:39 +0200, Niklas Neronin wrote:
>> Set TR Deq TRB Error can occur for two reasons:
> 
> Surely for other reasons too, like the infamous ASMedia case
> I mentioned last time when this patch showed up here.

I poorly worded it, the reasons are according to Set TR Deq TRB
Error reasons outlined in xHCI specification Section 4.6.10, page 142.
The entire series adds only error handling according to the reasons
in the xHCI specification.

> 
> In general, any illegal value in any TRB field is a TRB Error.
> 
> And in general, I think it would be better if those log messages simply
> named the error received from HW, without trying to speculate about
> possible causes (and getting it wrong). It would be less misleading and
> it would instantly give the keywoard to search for in the spec, without
> grepping for the error message to find which event code triggers it.

Good point, there can still be "out-of-spec" reasons for a TRB Error.
A generic TRB error warning is better.

> 
>> 1. Stream ID is zero or more than the Max Primary Streams.
>>    This is currently caught by xhci_virt_ep_to_ring(), at the start of the
>>    function. Thus, this commit does not add handling for this error.
> 
> Nit: this is only true if ep->stream_info->num_streams at the time of
> handling this event <= MaxPStreams at the time of command execution ;)
> 
> So there are two theoretical bugs which could make this check fail.
> 
>> 2. Stream ID is non-zero and Stream ID boundary check failed.
> 
> Not sure what's the difference? Per spec, boundary check *is* checking
> if Stream ID is in range, to prevent the xHC from writing to a Stream
> Context outside actual SC Array and corrupting some random memory.
> 
>>    Add a warning detailing the exact reason for this failure and print
>>    the deq ptr from the Set TR Deq command.
>>    Macro 'SCTX_DEQ_MASK' is a mask for the TR Dequeue ptr bit field 63:4.
>>
>> Reuse local variable 'deq'; just change it to 'dma_addr_t', which is what
>> it should have originally been.
> 
> Not sure, this is an always-64bit value read from xHCI data structures.
> 
> On a 32bit DMA system it probably won't have the high bits set if you
> are reading it from the command (unless there was a bug), but later
> other code will read it from HW and then all bets are off. Note that
> a 64bit xHC may be installed in a 32bit system. And it may be buggy,
> or it may have escaped the transfer ring due to broken Link TRB.

As I understand it, the actual address values stored in the bitfields
may vary depending on the system architecture, but the bitfield size itself
remains consistent. On a 32-bit system, 'dma_addr_t' is 32 bits, and placing
a 64-bit value into it will result in the upper 32 bits being dropped.

Thank you for the review.


