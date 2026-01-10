Return-Path: <linux-usb+bounces-32125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB3D0CA4B
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 01:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 356603010FCC
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 00:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72D41FBC8E;
	Sat, 10 Jan 2026 00:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9xBNPQ1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF41EF36E;
	Sat, 10 Jan 2026 00:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768005738; cv=none; b=ejHRKRrJaEf3IdWqs8Jofs13AM08D2Snnj0bMOkOfobsNYKIwFvCpV+/kFvyTrZUgH8uT0pikuLjxE8Wsmbv/PNdChB5cZLwKIkmFq/ElC1qTdikYBonVytjVkEEX1zlcbctGIQpNfFIMhIgWJnDJLpRGlBoCikfz4wQkCHqyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768005738; c=relaxed/simple;
	bh=+tXVoJqJpEXBvQ0n3RP8hrJXdZg4dpK2OyWkWHsEupQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIPF/N1HZXzEWqh/1xZQph/mnUx8dP179wBgPoVWugdsT/3xo6nbvHleGyrG3Rc7jGfONzJ7LIVLNyn6xGveSPaGjEZq9ij2fyGOOQehbYaOO3219xiJ5qqGyUOHjFKtIhyOpR49f4czOmY/trSC24WBJahmpLjbIiEWsmgOk7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9xBNPQ1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768005734; x=1799541734;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+tXVoJqJpEXBvQ0n3RP8hrJXdZg4dpK2OyWkWHsEupQ=;
  b=h9xBNPQ1DiAADo3C04WJldy5JTFHeFmiGT5UAVgPZw2FGODqCh+1ZCeV
   RuEEVIng5oTOZR/s6jKsuPRPUVD0gqTzGbAmcCq289kAce2vu3kcM7mCj
   hkh0D5LaebCn7TcZVjfchGCsbBK9INJrHr50l/glO+fiSGrb4WcKx8Gtt
   o8zOJVNeKSUY7SZgnHRAOhr236tfcSen+q/dBYA2biS2rxynJrGRC2ux7
   tYI/iwRdT5CGwyFRUj/zSZ8FW5NzhQyBCYizd+QNCQiwIjZp/OL+/3Pw7
   /I7YB7f4eLA1lBctQjfsbVqRk39GluCCZdeGufyuxM3oxpI5RAOFy7aO4
   w==;
X-CSE-ConnectionGUID: AI/hyUipSSmes8nsvP1GVQ==
X-CSE-MsgGUID: xfwYWiSnRBqMEv/KuWPQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68588421"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="68588421"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 16:42:12 -0800
X-CSE-ConnectionGUID: JBMxeFVrTduIQbbZ86RKdA==
X-CSE-MsgGUID: 25rbMIe6TKe3EjZc7UYjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="207738172"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.200.231]) ([10.121.200.231])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 16:42:12 -0800
Message-ID: <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
Date: Fri, 9 Jan 2026 16:42:06 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <superm1@kernel.org>
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
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <20260109072318.GU2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Thu, Jan 8, 2026 at 11:23:18PM -0800, Mika Westerberg wrote:
> On Thu, Jan 08, 2026 at 01:18:58PM -0600, Mario Limonciello wrote:
>> On 1/8/26 5:42 AM, Mika Westerberg wrote:
>>
>> Let me just share the whole log so you can see the full context.
>>
>> https://gist.github.com/superm1/6798fff44d0875b4ed0fe43d0794f81e
> 
> Thanks!
> 
> [Side note, you seem to have the link trained at Gen2 (20G) instead of Gen3
> (40G).]
> 
> Looking at the dmesg I recalled that there is an internal report about
> similar issue by Pooja and Rene (Cc'd) and it all boils down to this log
> entry:
> 
> [  489.339148] thunderbolt 0000:c6:00.6: 2:13: could not allocate DP tunnel
> 
> They made a hack patch that works it around, see below. I wonder if you
> could try that too? If that's the issue (not releasing HopIDs) then we need
> to figure a way to fix it properly. One suggestion is to release DP
> resources earlier, and of course doing full reset as done here. I would
> prefer "smallest" possible change.
> 
> @Pooja, any updates on your side to this?

Looking at the log "could not allocate DP tunnel", this appears to be
similar to kref synchronization issue during S4 resume that we are
facing. The problem we have identified is during S4 entry, hibernation
image is created first, and then the DP tunnels are freed. This means
the hibernation image still contains the tunnels in their active state.
However, when resuming from S4, the tunnels are restored from the
hibernation image (as active) and then the resume flow reactivates
them again, causing kref count mismatch. This leads to HopID allocation
conflicts and the "could not allocate DP tunnel" error on next
connect/tunnel activation.

The hack patch works around this by preventing double activation via
dprx_started flag. You could try this hack to confirm if it's the same
issue we're dealing with.

For a proper fix, we are working on a patch which releases the DP resources
before saving the hibernation image and creates them again during resume,
managing the resources properly. The patch is currently under review and
testing and will send shortly.


> 
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index 28c1e5c062f3..45f7ee940f10 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -1084,6 +1084,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
>  
>  static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
>  {
> +	if (tunnel->dprx_started)
> +		return 0;
> +
>  	/*
>  	 * Bump up the reference to keep the tunnel around. It will be
>  	 * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.

Thanks,
Pooja

