Return-Path: <linux-usb+bounces-16645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D09AEA5D
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 17:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9525E284CCC
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695B31EC00E;
	Thu, 24 Oct 2024 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzvnDCJk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A431EF085
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783642; cv=none; b=lVdWB4r7B9JeddxdSOxvDa/IPSwOo1OXSpHMLzpA51yOGNtEG/4C2/DuHgj9QFEKKKi1DbXNXc/nLJj+jAuR55C4PT3LRh+wIF5KVA3P8uIRVYrMgwNV9daBQWjrsAWkmoqSeFHxZ0lrjNFhPBAmG2ZhWmhE9qTfuM+kEwE/Prk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783642; c=relaxed/simple;
	bh=0tHTRCeDq5lghr4oSIfliKtZu1eeZZFCVK36DSv46v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=girv26535DW/LC6G3mKPkvYK8HX3uPxA55mIU1Me4NeGYk45LjsCvB26A4DwZ4LdH2gvrdMh4tH3ObHH0oygoaFO0D3el4y9lzaGLGCP1dwLfBfcnmLps72EulYA77yxkC91aY5PT0gKIQZ0RcOGlgvd884GBay3XZO5pzPmWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzvnDCJk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729783640; x=1761319640;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0tHTRCeDq5lghr4oSIfliKtZu1eeZZFCVK36DSv46v8=;
  b=KzvnDCJk9+MaW1T9+E/eA2fc72CRwPjTgtj+1ZTeJXvjkPPCMLqbe+D4
   BLhQo4sj4clukkLKS93kgl+LR2zDK8vk0+Vvmlb2bmjW77kNA9xx1Fpz9
   iQcreSRE53mC8d+d0jR/HbZyd2fDzLfMzoPX4R1cevcMO4xuN1P9gP2hd
   rA3CtfT/CV4MRU1ZzWlheWg036nuEqDkhdSwJ7e/tIepoMZpDajgFfm9l
   TKp1Uc/84AGNYGuI2S8s5/UHHIweilYJE9sdl85ILajecmoxATkqk18sO
   xF2IrLmDPcjp/iVKbhdwMvRWjIsZqwks7r35kO6bnXUMKTQ4t34bWucd9
   g==;
X-CSE-ConnectionGUID: rEzKPGHFQBeKJzZPg8Qr6g==
X-CSE-MsgGUID: A/NygMBlTLmnKjnkZmi7+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29526080"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29526080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:27:20 -0700
X-CSE-ConnectionGUID: d5mMQgYHTN2BRl5v7aymXA==
X-CSE-MsgGUID: N0av2Hq/TUCLBsIREf9mQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80544681"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2024 08:27:19 -0700
Message-ID: <1c54f2f7-46bb-4ab3-b447-04a07318d200@linux.intel.com>
Date: Thu, 24 Oct 2024 18:29:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix the NEC stop bug workaround
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
References: <20241014210840.5941d336@foxbook>
 <e3f8e58d-d132-430f-875f-283d8055b6c0@linux.intel.com>
 <20241016074711.247ff14e@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241016074711.247ff14e@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.10.2024 8.47, Michał Pecio wrote:
>>> With some experimentation I found that the bug is a variant of the
>>> old "stop after restart" issue - the doorbell ring is internally
>>> reordered after the subsequent command. By busy-waiting I confirmed
>>> that EP state which is initially seen as Stopped becomes Running
>>> some time later.
>>
>> Seems host controllers aren't designed to stop, move dequeue, and
>> restart an endpoint in quick succession.
> 
> As it was you who added the Running case handling, do you know hardware
> other than NEC which triggers this? Or could it be just a single vendor
> who screwed up once 15 years ago and caused all the chaos?
> 
> NEC sometimes triggers the Running case too and it is obvious why. I'm
> not sure how I missed it back in January and assumed it's some sort of
> random failure for no reason.
> 
> BTW, the NEC problem appears to be limited to periodic endpoints. I am
> unable to reproduce it on bulk. I thought that I reproduced it on bulk
> back then, but on second thought it may have been interrupt, which that
> device also has. Unfortunatel I wasn't printing endpoint numbers then.
> 
> Regards,
> Michal

Sorry about the reply delay.
I don't think this is a NEC only issue.

I was originally fixing halted endpoints at stop endpoint command completion,
did some stress testing, and was able to hit that running case on Intel
xHC controllers

See:
9ebf30007858 xhci: Fix halted endpoint at stop endpoint command completion
1174d44906d5 xhci: handle stop endpoint command completion with endpoint in running state.

I also just got a report off-list about an exactly similar case as yours, endpoint
stopped with ctx error, endpoint state was still stopped even if doorbell was
already rung.

This caused Set TR Deq command to fail with context error as endpoint was running
by the time this command was processed.

This was on a Intel host, se we need a generic solution to this.

Thanks
-Mathias

