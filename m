Return-Path: <linux-usb+bounces-35322-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HRYIPUWwWn5QQQAu9opvQ
	(envelope-from <linux-usb+bounces-35322-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:33:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C432F0251
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C3A4304B827
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2B038B14B;
	Mon, 23 Mar 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrzpInAh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762031509AB
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261510; cv=none; b=q1yM4g6Qk6nAu5bRf2hy4bsnEtgU/C9tk07UDvecRPMcBBxfB0mK4BptCvQMwMaSdbwB3yTkK2X24COh7fWuOKjkvIun2R+i7DgIexDEp8eLEIG3pl3Nps8g4+i03EVJzKwyhc0IOzQwtGimA8mpzdor+WoAH/+fk0fIxDdTVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261510; c=relaxed/simple;
	bh=yHBaHwfsCDZGLEKtHMdTr56EagC4CI0nH3CjZV0yyCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbncRl5zBc3bXV67eB0zh2c5i265ppK+XEnq8D2/HRLyFVVwSsLcLKJZxK/jyWtrwGEnoJP9s/RE9Vc3dGtPy00LR3p0d796Js6yIZdRxhov80k13rJTwtEkDlI3B/ujvX/gycI18trSk/az6xYSzr/7tTT97v3gNmDOq+tJyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrzpInAh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774261509; x=1805797509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yHBaHwfsCDZGLEKtHMdTr56EagC4CI0nH3CjZV0yyCc=;
  b=OrzpInAhvNa/cgZdhPYZ6eRbWAkxaWJ7LelvAM2qKbEKTkzh3hdwkSzZ
   LcOGjvAhNr3PgkrqtUirmOWifQGogJxL98LscdBB3WsvsuQmMZGuEzEIM
   Y5GKGfD+V0lDNn3D1kPFWmf2oA5CmMjcu4Xn//crb9/2KizVUTLFBZukO
   z2R/kPh5W6JHXjBqe1A+xopB5wT4L+ffFv1PhuWZsMN3WosL9VGpI8VIX
   79oa3Mzaj2IOwqdtmlbEfBSfzgd84BZi2DltEEG5n9qoUx0DnBbZqQgHY
   0c/0QBrvEzlo8IhjYTAL33uNaIqq2Ey3W1MXbQqJ2kW0FG6WiShCAKaNb
   A==;
X-CSE-ConnectionGUID: KDeu8y8MQtKUP0L/eLEoDw==
X-CSE-MsgGUID: kqjlAI0SSA284lAbvPb4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74433852"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74433852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:25:09 -0700
X-CSE-ConnectionGUID: cLQbXMV3TJ2BYKe/rKCrAQ==
X-CSE-MsgGUID: pCETsW/AQR+GU89l1SNMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228709728"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.17.204]) ([10.246.17.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:25:07 -0700
Message-ID: <56606a55-b1cb-4669-9025-8a91d8d258bf@linux.intel.com>
Date: Mon, 23 Mar 2026 12:25:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: xhci: fix Command Aborting
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
 <20260316142720.1471906-2-niklas.neronin@linux.intel.com>
 <20260321143057.1bf31b1b.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260321143057.1bf31b1b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35322-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05C432F0251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/03/2026 15.30, Michal Pecio wrote:
> On Mon, 16 Mar 2026 15:27:19 +0100, Niklas Neronin wrote:
>> Aborting the command ring requires setting the Command Abort (CA) bit
>> in the 64-bit Command Ring Control Register (CRCR). Historically,
>> several attempts have been made to implement this correctly, but each
>> introduced its own problems. This patch fixes the final remaining
>> issue: accidental modification of the Command Ring Pointer (i'll
>> abbreviate it to CRP).
>>
>> Originally [1], the full 64-bit CRCR value was read and written back
>> after setting CA. This is a bit unnecessary, only RsvdP bits (5:4)
>> should be read and written back (for future-proofing). All other
>> writable fields read as zero.
>>
>> Later patches attempted to solve an issues, caused by 64-bit writes
>> being split into two 32-bit writes. Writing the lower 31:0 bits first
>> immediately stopped the ring (CRR=0), and the following upper-half
>> write then overwrote part of CRP with zeroes, thus corrupting the CRP.
>> Patch [2] avoided this by writing only the lower 31:0 bits with CA
>> set, but that broke controllers that latch 64-bit registers only when
>> the upper bits are written, as reported in [3].
> 
> I too have HW which waits for the high DWORD after low DWORD write.
> 
> And I have HW which doesn't. If I write 0xdeadbeef to the high DWORD
> after waiting for CRR=0, some HW will ignore the write and some will
> IOMMU fault at 0xdeadbeefsomething.
> 
> The abort itself takes a few microseconds in my tests.

Yes, abort completion itself is usually very fast. The 5 second timeout
comes directly from the xHCI 1.9 specification, which explicitly allows
for that duration.

4.6.1.2 Aborting a Command:
"If software doesn't see CRR negated in a timely manner (e.g. longer
 than 5 seconds), then it should assume that there are larger problems
 with the xHC and assert HCRST"

The timeout could probably be reduced to 1 second, but I did not do that
since I do not have evidence that a shorter timeout would be safe across
all hardware.

> Is this race causing problems in the real world?

I believe so, given that a fix was proposed specifically to address it:
https://lore.kernel.org/all/20211008092547.3996295-5-mathias.nyman@linux.intel.com/#t

> 
>> The current solution [4] attempted to fix this by writing the full
>> 64-bit CRCR with both CA and an updated CRP. This does not work. The
>> patch tries to modify CRP while setting CA, but with CRR=1 all writes
>> to CRP are ignored. Updating CRP requires writing only the CA bit,
>> waiting for the controller to process the abort and clear CRR, and
>> only then writing the full CRP value.
> 
> That's not a problem yet because we *don't* want to change anything.

The current implementation does attempt to change the CRP.
The sequence is as follows:
 1. Fetch the next TRB.
 2. If the TRB is a Link TRB, advance to the next TRB.
 3. Get the DMA address of that TRB.
 4. Write the lower DWORD with the new CRP address and the CA bit set.
 5. Write the upper DWORD with the new CRP address.

This results in two possible final states, depending on how quickly
CRR is cleared:
 1. The CRP is not updated at all.
 2. Only the upper DWORD of the CRP is updated.

In neither case is the CRP updated as intended by the current
implementation.

> 
>> Writing a new CRP after CA clears CRR is also unsafe:
>>  * TRBs are 16-byte aligned (bits 3:0 clear)
>>  * CRP requires 64-byte alignment (bits 5:0 clear)
>> Writing a TRB pointer into CRP truncates bits 5:4
> 
> But this is a problem and I found HW (NEC, AMD) where waiting for
> CRR=0 and writing correct high DWORD causes "mismatched completion"
> errors, which is almost certainly (I haven't debugged) this thing.

So you believe that when waiting for CRR=0 any software writes to CRCR,
which are not immediately acted on, i.e. Command Stop/Abort, are instead
buffered internally?

OR

Do you believe that the HW will update CRP, irrelevant of what CRR is?

If that interpretation is correct, it would mean that Command Stop and
Command Abort cannot be used without also updating the RCS and CRP.

> 
>> For a Command Abort to succeed, the CA bit must be set without
>> modifying the CRP. The following sequence ensures this:
>>
>>   1. Write the lower 31:0 bits with only the CA bit set. Since CRR=1,
>>      CRP write is ignored.
>>
>>   2. Poll CRR. If CRR becomes 0, the abort succeeded with CRP
>>      preserved.
>>
>>   3. If CRR does not clear (timeout), test if controller requires an
>>      upper bits write to latch the register. Write the upper 63:32
>>      bits (which does not update the CRP because CRR=1).
> 
> Unless it just flipped to zero and CRP becomes corrupted as usual.

Yes, that race still exists, but it is significantly less likely.

Thanks,
Niklas

> 
>>      Then poll CRR again. If CRR becomes 0, it was a latching issue
>>      and the abort succeeded with CRP preserved.
> 
> Another problem is that this slows down the double-write chips and
> polls them under spinlock, which is completely crazy because it blocks
> xhci_irq() and other IRQs and generally freezes the whole system.
> 
> Not sure if there is a way out of this madness without writeq(), quirks
> or a completely out-of-the-box solution, like making it possible to
> restore CRP. Truncation can be dealt with by ensuring that a few TRBs
> before Dequeue are unused and can be made No-Ops at any time.
> 
> Regards,
> Michal
> 


