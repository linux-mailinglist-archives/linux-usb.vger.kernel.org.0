Return-Path: <linux-usb+bounces-32518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F7D3BAE8
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 23:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343FF302C9FE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 22:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAA52F6168;
	Mon, 19 Jan 2026 22:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="oGfcNWI+"
X-Original-To: linux-usb@vger.kernel.org
Received: from l2mail1.panix.com (l2mail1.panix.com [166.84.1.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FC271456;
	Mon, 19 Jan 2026 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768861897; cv=none; b=lV/Hm42CRm5D4K07ISIn4vgNHZKe+C1H47l5N8ZxZoE1c9kPX1smUiKPyL/IG7gROaqkmNLnUKneZSGDlmmG5gleCU4BPeqoRWv2IIdsXc5YL2/mDFoSZzmW9nCFwky0xoaL0F+Y8K0puo59yXc31gYTMTbeVmAYjm2NOaaRzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768861897; c=relaxed/simple;
	bh=WjOKhWuvw4vGG+LRF6yQr8By3VhxyfCckeWzNgP5pqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBYbXNABscHp6Tyrv6zw8blIq5Gbse05mjG6j9PZEluOBk98dF3RjXQG2dpNo3ciLYKTvjS1Qe0zV1sTme5QkL4zPWiyMJsPRComzO7oca4QB2rIDpBlF1PtBjX/BTsoBL1PthQtB6W4dSjCTr8WkIPRmSrWyfgC5cVTjiYl1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=oGfcNWI+; arc=none smtp.client-ip=166.84.1.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (1024 bits) server-digest SHA256)
	(No client certificate requested)
	by l2mail1.panix.com (Postfix) with ESMTPS id 4dw4Vc149KzDQF;
	Mon, 19 Jan 2026 17:14:00 -0500 (EST)
Received: from [10.50.4.47] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4dw4VR4JwWz41h6;
	Mon, 19 Jan 2026 17:13:51 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1768860832; bh=WjOKhWuvw4vGG+LRF6yQr8By3VhxyfCckeWzNgP5pqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oGfcNWI+7bD/5fUmhx4YFsAREDIaCVSC2I363dsRJPYrpypiYP4620jnWRXxJSBad
	 EnDjdjZgUb1u24Z007LAt+de2lM+09K69CQXkXpHIbpj222/Wsvk/tNRFmH960jH3y
	 3D52TbhlxB+bt80SerJvxeN1jm4UQez5Goy1NhEQ=
Message-ID: <e821e8a1-8256-4f80-ab30-95f066d25946@panix.com>
Date: Mon, 19 Jan 2026 14:13:50 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>, Kenneth C <kenny@panix.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
 <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
 <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
 <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
 <6438b5a3-a0f4-4c7d-9f56-59cdf7f5148f@kernel.org>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <6438b5a3-a0f4-4c7d-9f56-59cdf7f5148f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/19/26 11:59, Mario Limonciello (AMD) (kernel.org) wrote:

> On 1/17/2026 10:57 AM, Katiyar, Pooja wrote:
> 
>>> I have confirmation the hack patch does help the issue for us too.
>>>
>>> If your patch doesn't work another logical solution could be to destroy
>>> all the tunnels as part of the PM freeze callback (not just the DP
>>> resources).  Maybe even unify the suspend and freeze codepaths for more
>>> opportunities for code reuse?
>>>
>>
>> Thanks for confirming the hack patch helps!
>>
>> We are actually working on a solution that releases the DP resources and
>> suspends the switch as part of the freeze sequence. This way the 
>> hibernation
>> image that is stored doesn't contain any active tunnels, and during 
>> resume
>> we get a DP hotplug notification for a new tunnel, similar to S5. So far
>> this patch is working fine but is under review.
>>
> 
> Thanks.  If you want early testing from us too before you're ready to 
> post publicly feel free to ping it offline to me too.

I'd like to get a CC: on that, too.

I've been testing that hack patch and will test further later tonight.

The issue I'm trying to chase down (and not sure if any of this will 
help with this, I wonder if it's really BIOS/EC related) is often times 
that after a suspend (or hibernate, but I use "suspend then hibernate", 
which I think does both and chooses which to use upon resume) and then 
connect to a different dock (or setup) from the one I'd suspended with, 
sometimes I have to unplug/replug my TB cable, otherwise I either get no 
recognition of my new display setup (and sometimes TB devices) or it'll 
try and use the same monitor resolution of the previously-connected 
monitor (as if the TB subsystem doesn't recognize things have changed).

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


