Return-Path: <linux-usb+bounces-35666-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKBbJttyymnG8gUAu9opvQ
	(envelope-from <linux-usb+bounces-35666-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:55:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C2935B5C5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF5D7304B37D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 12:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5A33D170C;
	Mon, 30 Mar 2026 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZuuIMMu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7C3D1706
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875113; cv=none; b=IKc0Xp7NUpvS9sfla8mW8zIQm81+AmNmTKUaWCIjg/EZZ3WXVUw/+/3iS3/nk7P7iRrvgi092bb/MQo8sGvvnmYjcH9dfCr9p+yAADqEgnWHJ49EoSobBL7BwFju3x6U1X3+LjqFHVLVaVY+uEaeBXKuFANRxQpfz+sramzODqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875113; c=relaxed/simple;
	bh=CdeL292jiV/FoGgU9GEIpr8DRn/jH5r6rGbulcYwymI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCjtuomGm8aglp8Fe4v4aDDqNoDnJ9md4/DAnpN+Lc/ks85SN7IR7iyss8OYnwZKzlq/Jv3sU0QB9g4qCo4zOfNHA5Pt4EHnYDyLfrOWUHvp0ei4ig8lKEerL6+TpN0WAiuVAK/ZawyP9iC3r93b7rg4Tid/yNS1oVdArYAXlcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZuuIMMu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774875111; x=1806411111;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CdeL292jiV/FoGgU9GEIpr8DRn/jH5r6rGbulcYwymI=;
  b=MZuuIMMujmdGcOu/zxQhEJL4QfJnjZTme/bxynjpaiPH3cEOit33NV4z
   VhxMR60V3DFUaV4VJONnS9lduQ3/AYfdyOT6AKm3n0W1fdrThj4sA26k9
   uJbBbN/TPfCo1FFoZffrHfIyCx4sYblcOO/FDmU6mWblbLcuaeiVuzXaD
   F9mBMZkdaWd/ggjjdXCvD6sASE2MvlrTDfn31sM9w/T+cw8Ld4iD+cWgL
   +DS/5DmxWPWladN/zaOKSyaOCHTBhYZbNXApdyVZM2O+iFZxDgieznI/M
   Sl1Coazt/izz1cHl2YepQvPU2wtDTzbr+bso7u7zc419BEsZ7LXJuX7av
   Q==;
X-CSE-ConnectionGUID: Cb7kX3RlTR+I0qDNrUqlhw==
X-CSE-MsgGUID: SuGT7tgdSYS7OnpWKQZVqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86168845"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86168845"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:51:50 -0700
X-CSE-ConnectionGUID: Z3fB7gadSZuocz1Ddl7OEg==
X-CSE-MsgGUID: OtQOmXrZTP2UokDNaSJRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="219406089"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.115]) ([10.245.245.115])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:51:49 -0700
Message-ID: <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
Date: Mon, 30 Mar 2026 15:51:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260326232400.zkplsxflhykhayyb@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35666-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04C2935B5C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 01:24, Thinh Nguyen wrote:
> On Thu, Mar 26, 2026, Mathias Nyman wrote:
>> On 3/26/26 03:19, Thinh Nguyen wrote:
>>> On Wed, Mar 25, 2026, Mathias Nyman wrote:
>>>> On 3/25/26 03:52, Thinh Nguyen wrote:
>>>>> On Mon, Mar 23, 2026, Mathias Nyman wrote:
>>>>>> Avoid automatically restarting bulk or interrupt transfers after a
>>>>>> URB is given back due to stall or error.
>>>>>>
>>>>>> Introduce a 'TD_TAINTED' state for pending TDs queued on a endpoint when
>>>>>> it halted. The actual TD the endpoint halted on is marked TD_HALTED,
>>>>>> and its URB is given back with proper EPROTO or EPIPE error code.
>>>>>>
>>>>>> Don't automatically restart an endpoint if the next queued TD after
>>>>>> the TD_HALTED one is marked tainted.
>>>>>
>>>>> Sounds good for -EPROTO, but will a clear-halt ring the corresponding
>>>>> the endpoint's doorbell for STALL endpoint?
>>>>>
>>>>
>>>> With this change xhci would not restart the stalled endpoint after a clear-halt
>>>> request. The first usb_enqueue() call after clear-halt would start it.
>>>>
>>>> Could make sense to restart the endpoint after a clear-halt, and just add a small
>>>> debug message if the next queued URB is marked 'tainted'.
>>>>
>>>
>>> The -EPROTO should be handled differently than -EPIPE. A STALL endpoint
>>> is part of a normal usb flow. Should the class driver submit a new URB
>>> while the endpoint is STALL, we would always expect a STALL error
>>> response after the endpoint is restarted. That's not the case with
>>> -EPROTO where the data may be corrupted and/or the host and device are
>>> out of sync. We should not continue until the class driver do some
>>> recovery. IMHO, we can keep the handling of -EPIPE how it was before.
>>> Let the xHC tell whether the STALL error still persists instead of
>>> managing it by the xhci driver.
>>>
>> I agree that that we should restart the endpoint if class/core enqueues a new
>> URB _after_ xhci gave back an URB with EPIPE after endpoint STALL.
>>
>> But I don't think we should restart the ring to continue processing URBs that
>> were queued before the endpoint stalled. This would prevent the class/core
>> from even attempting to retire the pending URBs, something USB2.0 spec,
>> '5.8.5 Bulk Transfer Data Sequences' requires:
>>
>> "If a halt condition is detected on a bulk pipe due to transmission errors or
>>   a STALL handshake being returned from the endpoint, all pending IRPs are
>>   retired.  Removal of the halt condition is achieved via software intervention
>>   through a separate control pipe."
>>
> 
> Fair point. Then the core will need to track the endpoint's STALL state
> and parse the clear-halt request to know which endpoint and when to
> clear the STALL before it can accept new URB. So the first usb_enqueue()
> call after clear-halt can start the endpoint again. The xhci will also
> need to have access to this state.

Ideally xhci driver would return the URB with EPIPE after STALL, and not continue
processing URBs before a clear halt is sent, or a new URB is enqueued.
USB core would hold off submitting URBs to xhci, buffering URBs enqueued for this
STALLED endpoint until class driver urb->complete() finishes for that EPIPE URB.

Usb core could flag this endpoint as "halt_pending" before adding the EPIPE URB to
the bh workqueue. Then after urb->complete() work is called and core is sure class
driver  is aware of the EPIPE, then core would clear the flag and flush the buffered
URBs to the host controller drivers, restarting the ring

Class driver urb->complete() would most likely retire/cancel the pending URBs, both the
earlier queued 'tainted' URBs, and the most recent 'buffered' URBs in usb core.
Class driver should clear the halt, but is free to do whatever it wants.
It could choose to send a new URB without clearing the halt,
have it processed, trigger STALL again, and get URB returned with EPIPE status.

I don't think most class/usb device drivers really handle stall that well.
Above might be wishful thinking.

> 
> Currently you have the xhci driver to "retire" the halted URBs. However,
> you also noted that class/core may attempt to retire the pending URBs.
> Who's expected to handle the retirement here?

Maybe we should let core retire the pending URBS, and only fix the xhci driver
'automatic endpoint restart after stall' part after that core change is done.

Should cause less regression.

> 
> On a separate note, will you plan to implement the clear-halt for EPROTO
> in xhci?

I don't think this should be part of xhci driver. Decision to send control requests
to the device should be done by core or class drivers.

Thanks
Mathias



