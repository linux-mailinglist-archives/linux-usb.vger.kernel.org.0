Return-Path: <linux-usb+bounces-37385-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AEeEFyUBGqrLgIAu9opvQ
	(envelope-from <linux-usb+bounces-37385-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:10:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F04D535CEB
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 542FB3319A08
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 14:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB19428821;
	Wed, 13 May 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFfdHOS1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494294266BF
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682619; cv=none; b=tWNECR/cKfRyr2Woh9K4NWa2svmImUY/D7xpWYpllbZ18zCHziG6omeiP5OzlbB7rInTBjagsqyk/pIYLAMfjTrdAe6ssjieeohY6lIHJnH09d3sTFgcohUPOSi/Krk3pgDP8eV2jt5Ld+9oOo3YrONZtSu3H8fWdS0GhF8Sks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682619; c=relaxed/simple;
	bh=iWzffIe6V2emIaCZS06NksYjhzEw8WEeFlExEQJcP5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HU6WlVc+ohhPvzpo6/Y5PMMPNSIYRJzP/1eS9MO6/mCFOfdMJhWFiZoVZSMpege1OwtqNcAGyxZsGq+1PTP6dCU7XkXhiCZzsl1a5y3wGts+3Kqev7D8W7wBnqPDEA3vjsMv9jhLk63TVII3Cu+vDLDIfwg3ca+Mwky1QQMorhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFfdHOS1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778682615; x=1810218615;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iWzffIe6V2emIaCZS06NksYjhzEw8WEeFlExEQJcP5o=;
  b=mFfdHOS10s3kjNPa7JxeZQuhit4CGnLnFq8mjKllb0lZvtCu1lEgh0Ng
   8dhXcKiF0Ny2PyXvMdHwDy2tJpHKBWd+PCM3TMmp5gmZJFCHaMff9WUMA
   96DNdCvnumrNN8fyduHMMSsd5cWc2ebQVgN1NsCFK8j1UUdar/2IkJJkG
   as8xsJ1thSb8qLfj0zgJV/taNCumTy9HLE5ux37+hWckFmNGYCXO1HCq/
   tF2fGKvDkC0DJs8m3KpjqNtTptVKyEnzqwm4APKnCfV1Wk/LTWXK4FnnO
   lbCRYd9ccuMpO7tqjJFD0QCkmFzYpfalHDM4XY/v09yBYXF5gMypYrWwA
   A==;
X-CSE-ConnectionGUID: gBBPPkO/QwyAqa1SRHncog==
X-CSE-MsgGUID: hr536EWJRPOAt1lksP1xZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82178079"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="82178079"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:30:14 -0700
X-CSE-ConnectionGUID: uXdvwtP4Q/GxtSeZ0o8WfQ==
X-CSE-MsgGUID: Z/CUeuwwTiKiJ1M9naT8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="276206323"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.109]) ([10.245.244.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:30:13 -0700
Message-ID: <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
Date: Wed, 13 May 2026 17:30:03 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: Michal Pecio <michal.pecio@gmail.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com>
 <20260512110810.17fbde0a.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260512110810.17fbde0a.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8F04D535CEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37385-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Action: no action

On 5/12/26 12:08, Michal Pecio wrote:
> On Mon, 11 May 2026 22:21:05 +0300, Mathias Nyman wrote:
>> Always calculate estimated start frame, and set urb->start_frame
> 
> This may cause driver developers lots of grey hair when running on old
> (non-CFC, xHCI 1.0, USB 3.0, "gen 1") HCs where nothing is done to
> enforce frame number correctness so far.
> 
> Writing obviously bogus urb->start_frame at least was obvious :)

v2 writes the TRB frame id field of the first TD of the first URB
for older non-CFC hosts as well. So urb->start_frame should be
quite accurate. Its probably more off if URB_ISO_ASAP is set.

> 
>> Fix valid frame window start and end calculation to match xhci
>> spec 4.11.2.5
>>
>> Don't inclease frame id with 1 if a URB mod transfer is queued late.
>> Queue it with next expected frame ID but print a message if URB is
>> next expected frame id does not fir valid frame window range (URB mid
>> transfer is queued late)
> 
> Failing to meet the IST is not the same as violating the 895ms limit.
> The former may (or may not) cause the TD to complete with MSE instead
> of Success in its interval. The latter is apparently supposed to cause
> MSE completion when the HC reads the TD, even though the IST was met.
> 
> A particularly fascinating case is period > 895ms; it seems that xHCI
> only allows submitting shortly before interval boundary, or "SIA".
> 
> Another nice one is ESIT >= 4096ms - exceeding MFINDEX limit.
> 
> That being said, I found that validating end_frame_id before enqueuing
> doesn't take more effort than generating these warnings, and I think it
> would be more productive - drivers know that their submission is lost
> cause, instead of getting bizarre completions later.

Added last frame of urb < +895ms to v2

But only for urbs mid stream, and only print a message if check fails.
queue it anyways

> 
> As for ignoring the IST, my ASMedia chips seem to take it well. And
> they specify absurdly long IST of 2ms, while actually running with
> 3x0.5ms URBs or less. The "less" tends to be glitchy, but I'm not yet
> sure if it's xHCI problem or snd-usb-audio / other software problem.

I think it makes sense to only enforce IST for the very first URB when
starting the endpoint.

Otherwise just print a debug message so that class driver developers
can notice they use more URBs, queue them sooner, or both.

My v2 is a bit cleaner, fixed a missing "% MAX_UFRAME", and is split
into 2 patches.
Can be found in my fix_frame_id branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_frame_id
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_frame_id

-Mathias



