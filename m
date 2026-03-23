Return-Path: <linux-usb+bounces-35335-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPx1FtZLwWlbSAQAu9opvQ
	(envelope-from <linux-usb+bounces-35335-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 15:19:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E045D2F42A0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 15:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1144631B588B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BCB3B5303;
	Mon, 23 Mar 2026 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5zTZuHM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FBB3BADA5
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274463; cv=none; b=fqYZQNpdr7ie8t7Gudy/xz02OPHY6sXTgjDmOLVBSowiBMltyJf23fcqPTI+END0vTDlyiR7IPoeCL04V8nvClb6M2L0KhZjIxF+hvblikeT2zj95nK7T65aXpXndeilDZMvZgjXS7GTGGCCo2GBC9XG+vjH3nbCtS5iuMpshr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274463; c=relaxed/simple;
	bh=iOoxeCml71jS8RpDpVXtmQSHr8afDQmrN78dah/maos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soJTrPVZ6hYLfqRiKgzYKU8Fu0YTa0PBay7vKi1pdC96i7s6HTx/hWEfM16tEm6+yk7KxvklgUYpp0UfY2rQo5OhqY5KHY/Bn69sD4HdGZTShkD7ULHIVq7E1mZummpa/lWsaunoyJXgw66+r5y4lSFNfTOVZQP8J1UO/hAaTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5zTZuHM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774274461; x=1805810461;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iOoxeCml71jS8RpDpVXtmQSHr8afDQmrN78dah/maos=;
  b=F5zTZuHMZaFTuEPCJexFMzpVDL+Hz4Y192ilbzDU+rALyYbDyCdRyyGU
   CYk3MGAbPEoRU/HTVjVekX6N73RYhLNpI2P5h3v4GgGAgBzowWCPyfn5I
   Uc/7kg2cTswxdmqxnWLg2/npsgsl4f7H25JYO9ktXhM8y8DSDnOaWTWHr
   sdsJKo0zRkne/atLuUJ3bxt7u1/hVwyA5zkpYoBuSyIvcY5vw1+KWT9Cz
   VlM9gOrY2vN6gvYeBHacbFMm5b7K3DRoqRR5bpoZo6FdRdVm/u3Jd7GQw
   PkAp4Bsgrb2Vc0tkpDXiP4fvrBGJ6B1kl5YUOllZIkCqEnUmpcdILs+67
   A==;
X-CSE-ConnectionGUID: HXj4/AXcTT2AZj6On6SGig==
X-CSE-MsgGUID: USeG2VC1SVmy5TY7JoMtgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85894586"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85894586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 07:01:00 -0700
X-CSE-ConnectionGUID: 6n8nIOTpR6Odz++adbrl2Q==
X-CSE-MsgGUID: uspfll+ORL6uWBqbfViucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223994066"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.17.204]) ([10.246.17.204])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 07:00:58 -0700
Message-ID: <9c6625f0-64d1-4f90-ba89-72eb9a153ea1@linux.intel.com>
Date: Mon, 23 Mar 2026 16:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: xhci: fix Command Aborting
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
 <20260316142720.1471906-2-niklas.neronin@linux.intel.com>
 <20260321143057.1bf31b1b.michal.pecio@gmail.com>
 <56606a55-b1cb-4669-9025-8a91d8d258bf@linux.intel.com>
 <20260323122458.0af6b4d0.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260323122458.0af6b4d0.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35335-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: E045D2F42A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 23/03/2026 13.24, Michal Pecio wrote:
> On Mon, 23 Mar 2026 12:25:00 +0200, Neronin, Niklas wrote:
>> On 21/03/2026 15.30, Michal Pecio wrote:
>>> On Mon, 16 Mar 2026 15:27:19 +0100, Niklas Neronin wrote:  
>>>> Aborting the command ring requires setting the Command Abort (CA)
>>>> bit in the 64-bit Command Ring Control Register (CRCR).
>>>> Historically, several attempts have been made to implement this
>>>> correctly, but each introduced its own problems. This patch fixes
>>>> the final remaining issue: accidental modification of the Command
>>>> Ring Pointer (i'll abbreviate it to CRP).
>>>>
>>>> Originally [1], the full 64-bit CRCR value was read and written
>>>> back after setting CA. This is a bit unnecessary, only RsvdP bits
>>>> (5:4) should be read and written back (for future-proofing). All
>>>> other writable fields read as zero.
>>>>
>>>> Later patches attempted to solve an issues, caused by 64-bit writes
>>>> being split into two 32-bit writes. Writing the lower 31:0 bits
>>>> first immediately stopped the ring (CRR=0), and the following
>>>> upper-half write then overwrote part of CRP with zeroes, thus
>>>> corrupting the CRP. Patch [2] avoided this by writing only the
>>>> lower 31:0 bits with CA set, but that broke controllers that latch
>>>> 64-bit registers only when the upper bits are written, as reported
>>>> in [3].  
>>>
>>> I too have HW which waits for the high DWORD after low DWORD write.
>>>
>>> And I have HW which doesn't. If I write 0xdeadbeef to the high DWORD
>>> after waiting for CRR=0, some HW will ignore the write and some will
>>> IOMMU fault at 0xdeadbeefsomething.
>>>
>>> The abort itself takes a few microseconds in my tests.  
>>
>> Yes, abort completion itself is usually very fast. The 5 second
>> timeout comes directly from the xHCI 1.9 specification, which
>> explicitly allows for that duration.
>>
>> 4.6.1.2 Aborting a Command:
>> "If software doesn't see CRR negated in a timely manner (e.g. longer
>>  than 5 seconds), then it should assume that there are larger problems
>>  with the xHC and assert HCRST"
>>
>> The timeout could probably be reduced to 1 second, but I did not do
>> that since I do not have evidence that a shorter timeout would be
>> safe across all hardware.
> 
> As noted in my later response to patch 2/2, in rare corner cases
> ASMedia command abort can take a few seconds and still succeed.
> 
>>> Is this race causing problems in the real world?  
>>
>> I believe so, given that a fix was proposed specifically to address it:
>> https://lore.kernel.org/all/20211008092547.3996295-5-mathias.nyman@linux.intel.com/#t
> 
> It does look like a problem which people would be unlikely to discover
> without being affected by it, but the patch says nothing.
>
> Hi Pavankumar,
> 
> Could you elaborate on the above issue, what was the affected host
> controller and what sort of workloads made this race turn bad?
> 
> In theory the two DWORD writes could be separated by some NMI/SMI
> hitting the CPU or by heavy traffic on the I/O bus.
> 
> 
> And if probelms are known to happen here, then what about other users
> of xhci_write_64(), for example updating ERDP aka erst_dequeue?

They are not related.

The ERDP bit field is 63:4 and can therefore hold any TRB address.
It is also not gated or "locked" behind a control bit in the same register.

Other 63:6 bit fields address in xHCI are all base addresses, which are
always programmed with correctly aligned values. The only 63:6‑bit
address field that is not a base address is the Command Ring Pointer.

> 
>> The current implementation does attempt to change the CRP.
>> The sequence is as follows:
>>  1. Fetch the next TRB.
>>  2. If the TRB is a Link TRB, advance to the next TRB.
>>  3. Get the DMA address of that TRB.
>>  4. Write the lower DWORD with the new CRP address and the CA bit set.
>>  5. Write the upper DWORD with the new CRP address.
>>
>> This results in two possible final states, depending on how quickly
>> CRR is cleared:
>>  1. The CRP is not updated at all.
>>  2. Only the upper DWORD of the CRP is updated.
> 
> I stand corrected, I wasn't aware of some details. That said,
> 
> 1. is a valid outcome and not a bug, jumping to the next TRB is not
>    necessary, it was a workaround for previous issues.
> 2. is a bug, but it shouldn't matter because the ring has one segment
> 
> But I did have problems on NEC and AMD, which means that something else
> is also possible. I think I will need to debug it deeper, but I suspect
> that writing high DWORD alone is enough to trigger bit 4:5 truncation
> or overwrite low DWORD with some garbage.
> 
>> So you believe that when waiting for CRR=0 any software writes to
>> CRCR, which are not immediately acted on, i.e. Command Stop/Abort,
>> are instead buffered internally?
> 
> We all believe that some HW does nothing and waits for high DWORD.
> 
> Other HW is seen to begin aborting more or less immediately. However,
> until the abort is complete, any subsequent write to high DWORD may
> be ignored because we can't change CRP while CRR=1.
> 
> Problems begin if CRR=0 before we write high DWORD. CRP bits become
> writeable and any write may trigger truncation of bits 4:5.

Should this be bits 31:6?

> 
> Note that if the HW interprets this as a single write to high DWORD
> separate from the previous abort operation (which it has already
> completed) then this is out of spec, because we should write low-high.

How I see it; hardware which requires an upper DWORD write will "buffer"
the lower DWORD and wait for the corresponding upper DWORD write.

However, because the specification states that the CRP and RCS are ignored
while CRR=1, the lower DWORD write ignores lower CRP bits and RCS bit.

As a result, if the upper DWORD is written after CRR=0, only upper CRP bits
and RsvdP bits are updated.
Conversely, if the upper DWORD is written before CRR=0, only RsvdP bits are
updated.

> 
> It seems that my Etron HC ignores this high DWORD write after CRR=0.
> I can write 0xdeadbeef there and it continues working normally.
> Or maybe it's broken and should get the disable 64 bits quirk.
> 
> But NEC and AMD start getting "mismatched completion" errors, so it
> seems that their CRP is corrupted somehow. And I could probably replace
> waiting for CRR=0 with usleep(20) and get the same corruption.
> 
> I will later look closer what happens here.
> 
> Regards,
> Michal


