Return-Path: <linux-usb+bounces-32455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D2D38FE4
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 17:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98EE33026B21
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FF524E4B4;
	Sat, 17 Jan 2026 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qt4PrSBy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250A51CBEB9;
	Sat, 17 Jan 2026 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768669088; cv=none; b=XHZIhoQTPng8iWK3jNHM9uy/gDuwuOwqjXnSrevoZqcqLCrEWsKgwEg5AtHqRKf7Q3m3gnf2nhyxkCA6+Esa/9UgGAjEhiXxl3uwCEAwEIDbDPSMhljPbSEnFkHxqIyDL0gg4atyxZtuVYezejOFdE/88L7cbFVR8VAbdTVYDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768669088; c=relaxed/simple;
	bh=ebREcqdm7/iBe8f4KOC3oPELJz8DhDO4yoQV6phlJ2I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kUB5g1F74DX0JZiY0XqtuBwMcmqCRWSZYw27xVavnVEFlfUKHbj/6zKixG3gB/JW2xSj8NwwVay4GX3KDGZlkAJZ59oxoJLVALj19yfCxDrgkcAEKcxuhBxMGH/rFjsIZ4HT6Dj+756k2eF5rz059bZMPWXEdvp1jgqJcR2Nv2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qt4PrSBy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768669087; x=1800205087;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=ebREcqdm7/iBe8f4KOC3oPELJz8DhDO4yoQV6phlJ2I=;
  b=Qt4PrSByweK1S2RRL01HHWXXWJ2i862hYYZAc14IIlS8OdcoKXBatgj3
   hGisz/G+GERzI+hwbUvWVarY/OO+C/Ps2gz2qCaD8VQSnJbhKWamsLe+P
   fIZ6uzyX/NjripKmgS5C67S8bWEYC1Kvd6dptP9vYhRLMUakhAoC2Aa0S
   3hiAhiyET7D2yBi5FPd8lDDFUYm+fxiyEQO4co6ubj3W/42OOmfD1QdF7
   xSGs2fFo0XsvJqFVUDVfyTDrEhm944DloziZlnd4yPcj661L/1UWGDC3H
   iWHfwW+1YOq9HBOwkoG+RHavKaNjXndIPoAVR+GT79KtZJFoCEmlW5iPi
   g==;
X-CSE-ConnectionGUID: AW+jnI1tSFWxGUU3fJw35Q==
X-CSE-MsgGUID: Rzv5McnlS6i0G5p8bb/YKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69865111"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69865111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:58:06 -0800
X-CSE-ConnectionGUID: fQzv9++RTUenaA6i50A9Ug==
X-CSE-MsgGUID: +1tGf5bDR1+4W14KQ0UWGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205105902"
Received: from srikarla-mobl.amr.corp.intel.com (HELO [10.246.160.26]) ([10.246.160.26])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:58:05 -0800
Message-ID: <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
Date: Sat, 17 Jan 2026 08:57:49 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
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
 <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
Content-Language: en-US
In-Reply-To: <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Tue, Jan 13, 2026 at 10:44:18AM -0800, Mario Limonciello (AMD) (kernel.org) wrote:
> 
> 
> On 1/9/2026 6:42 PM, Katiyar, Pooja wrote:
>> Hi,
>>
>> On Thu, Jan 8, 2026 at 11:23:18PM -0800, Mika Westerberg wrote:
>>> On Thu, Jan 08, 2026 at 01:18:58PM -0600, Mario Limonciello wrote:
>>>> On 1/8/26 5:42 AM, Mika Westerberg wrote:
>>>>
>>>> Let me just share the whole log so you can see the full context.
>>>>
>>>> https://gist.github.com/superm1/6798fff44d0875b4ed0fe43d0794f81e
>>>
>>> Thanks!
>>>
>>> [Side note, you seem to have the link trained at Gen2 (20G) instead of Gen3
>>> (40G).]
>>>
>>> Looking at the dmesg I recalled that there is an internal report about
>>> similar issue by Pooja and Rene (Cc'd) and it all boils down to this log
>>> entry:
>>>
>>> [  489.339148] thunderbolt 0000:c6:00.6: 2:13: could not allocate DP tunnel
>>>
>>> They made a hack patch that works it around, see below. I wonder if you
>>> could try that too? If that's the issue (not releasing HopIDs) then we need
>>> to figure a way to fix it properly. One suggestion is to release DP
>>> resources earlier, and of course doing full reset as done here. I would
>>> prefer "smallest" possible change.
>>>
>>> @Pooja, any updates on your side to this?
>>
>> Looking at the log "could not allocate DP tunnel", this appears to be
>> similar to kref synchronization issue during S4 resume that we are
>> facing. The problem we have identified is during S4 entry, hibernation
>> image is created first, and then the DP tunnels are freed. This means
>> the hibernation image still contains the tunnels in their active state.
>> However, when resuming from S4, the tunnels are restored from the
>> hibernation image (as active) and then the resume flow reactivates
>> them again, causing kref count mismatch. This leads to HopID allocation
>> conflicts and the "could not allocate DP tunnel" error on next
>> connect/tunnel activation.
>>
>> The hack patch works around this by preventing double activation via
>> dprx_started flag. You could try this hack to confirm if it's the same
>> issue we're dealing with.
>>
>> For a proper fix, we are working on a patch which releases the DP resources
>> before saving the hibernation image and creates them again during resume,
>> managing the resources properly. The patch is currently under review and
>> testing and will send shortly.
>>
>>
> 
> I have confirmation the hack patch does help the issue for us too.
> 
> If your patch doesn't work another logical solution could be to destroy
> all the tunnels as part of the PM freeze callback (not just the DP
> resources).  Maybe even unify the suspend and freeze codepaths for more
> opportunities for code reuse?
> 

Thanks for confirming the hack patch helps! 

We are actually working on a solution that releases the DP resources and
suspends the switch as part of the freeze sequence. This way the hibernation
image that is stored doesn't contain any active tunnels, and during resume
we get a DP hotplug notification for a new tunnel, similar to S5. So far
this patch is working fine but is under review.

>>>
>>> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
>>> index 28c1e5c062f3..45f7ee940f10 100644
>>> --- a/drivers/thunderbolt/tunnel.c
>>> +++ b/drivers/thunderbolt/tunnel.c
>>> @@ -1084,6 +1084,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
>>>     static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
>>>   {
>>> +    if (tunnel->dprx_started)
>>> +        return 0;
>>> +
>>>       /*
>>>        * Bump up the reference to keep the tunnel around. It will be
>>>        * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.


Thanks,
Pooja

