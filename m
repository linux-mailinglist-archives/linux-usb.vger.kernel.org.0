Return-Path: <linux-usb+bounces-32298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3ED1ADF6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 19:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 356A1303165A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 18:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D477734FF5B;
	Tue, 13 Jan 2026 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rccaUaPu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8134F241;
	Tue, 13 Jan 2026 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329860; cv=none; b=VDtAvFt/ltWT0OnnWPJxmKAmoTUsnsTVNjf6EDL0e1mmvwAG/xh41OhPTDp0SGmq5ccvVAhNqbmQoXBWEXLJpdM3oD+51HPhnyjjVXzG120HHhsd63bak5dZHDK5ijVa0uBCRn++Zjtva/Wh9ABaJeMDxgDsvAt9z9hMZC7/WMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329860; c=relaxed/simple;
	bh=uzTSZMpqizPB88ACwlfcnMgPpC6EPlBzT/GDPAir0a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQ2SXDZfHp+I92OLckX52GbJZanLUMxGyj1jneWoTmQxY8FD+XAQpr8J/GCSXmCNSrFzoT44kGlcElI4As3rG9YttD7tCej/wEzwJXvyWSTODkOAEf/XL57TBbYvKd7yvuMyh2oV/+tqgcRHb/4X5Lb/q9FeUGzXRLwYXRSNWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rccaUaPu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA75C116C6;
	Tue, 13 Jan 2026 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768329860;
	bh=uzTSZMpqizPB88ACwlfcnMgPpC6EPlBzT/GDPAir0a4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rccaUaPu3QIA+S0MyJhkBwyEu2akuWADp/D6WzygV3pbP0JwfjKSFt3thW29RLBOB
	 q1FBtHWvZPbY3GYylsFH/n+2jdFkaGA89mBUsPQlJFAdscECPCtCPczYwZ+tU4whwK
	 ZCLHyf7Se3pWy2++EwGmtRvZk12pxja1bks94CP7gdkheXSVa0/IJ2DyS4jlntAPwB
	 JfW1lz339lKyGuUPI4lxf3zKXWnYZ8ySFoRqauSr/afA22qBTTWjnFIFFLYmD+J3iQ
	 iv14V4vR1Ru8/E/QnAW5fKnUZvnwY2sNvWRGQPLq+g90OkTZY80frBXAkK6QI/lORf
	 oo0rEf2JmhMsg==
Message-ID: <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
Date: Tue, 13 Jan 2026 12:44:18 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
 <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/2026 6:42 PM, Katiyar, Pooja wrote:
> Hi,
> 
> On Thu, Jan 8, 2026 at 11:23:18PM -0800, Mika Westerberg wrote:
>> On Thu, Jan 08, 2026 at 01:18:58PM -0600, Mario Limonciello wrote:
>>> On 1/8/26 5:42 AM, Mika Westerberg wrote:
>>>
>>> Let me just share the whole log so you can see the full context.
>>>
>>> https://gist.github.com/superm1/6798fff44d0875b4ed0fe43d0794f81e
>>
>> Thanks!
>>
>> [Side note, you seem to have the link trained at Gen2 (20G) instead of Gen3
>> (40G).]
>>
>> Looking at the dmesg I recalled that there is an internal report about
>> similar issue by Pooja and Rene (Cc'd) and it all boils down to this log
>> entry:
>>
>> [  489.339148] thunderbolt 0000:c6:00.6: 2:13: could not allocate DP tunnel
>>
>> They made a hack patch that works it around, see below. I wonder if you
>> could try that too? If that's the issue (not releasing HopIDs) then we need
>> to figure a way to fix it properly. One suggestion is to release DP
>> resources earlier, and of course doing full reset as done here. I would
>> prefer "smallest" possible change.
>>
>> @Pooja, any updates on your side to this?
> 
> Looking at the log "could not allocate DP tunnel", this appears to be
> similar to kref synchronization issue during S4 resume that we are
> facing. The problem we have identified is during S4 entry, hibernation
> image is created first, and then the DP tunnels are freed. This means
> the hibernation image still contains the tunnels in their active state.
> However, when resuming from S4, the tunnels are restored from the
> hibernation image (as active) and then the resume flow reactivates
> them again, causing kref count mismatch. This leads to HopID allocation
> conflicts and the "could not allocate DP tunnel" error on next
> connect/tunnel activation.
> 
> The hack patch works around this by preventing double activation via
> dprx_started flag. You could try this hack to confirm if it's the same
> issue we're dealing with.
> 
> For a proper fix, we are working on a patch which releases the DP resources
> before saving the hibernation image and creates them again during resume,
> managing the resources properly. The patch is currently under review and
> testing and will send shortly.
> 
> 

I have confirmation the hack patch does help the issue for us too.

If your patch doesn't work another logical solution could be to destroy 
all the tunnels as part of the PM freeze callback (not just the DP 
resources).  Maybe even unify the suspend and freeze codepaths for more 
opportunities for code reuse?

>>
>> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
>> index 28c1e5c062f3..45f7ee940f10 100644
>> --- a/drivers/thunderbolt/tunnel.c
>> +++ b/drivers/thunderbolt/tunnel.c
>> @@ -1084,6 +1084,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
>>   
>>   static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
>>   {
>> +	if (tunnel->dprx_started)
>> +		return 0;
>> +
>>   	/*
>>   	 * Bump up the reference to keep the tunnel around. It will be
>>   	 * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.
> 
> Thanks,
> Pooja


