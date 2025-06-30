Return-Path: <linux-usb+bounces-25279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7A9AED95D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 12:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 880163B9DD0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFAA24E010;
	Mon, 30 Jun 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6kyvPNp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46524DCF5
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278054; cv=none; b=t0YQiyNrCN96YPwUlNivNL0+Rf5QjJ65FZZ3YeB8NsHTidRXc0nLWWXWw22HTO8Ubr7LMXq+4UIGhfecDQyTD76Q9cfAbO9atfdWQSSt/e4GySCN/Wn9WMSqP9aVXrcOqHfFP/drbKm5XvLOlVeHEG6slWteN8DugGnMUbv9yK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278054; c=relaxed/simple;
	bh=aj+rVpfXUXA9eCUKlc1aOfOFUblSFGriJwah678It8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUIhbotawLJy/FgTHaNKW7cmuarL+NBLtWRkdpHHiMHqGRWiDo07pOMQEzma2HoISartvr3ljYJEAMoFW7czqOnEPliCW5T2HU1cjMEpbcGw+bDjXoWRIXGpUadqptUBrq7aTBK+rQxO38oiQHIo4PGn7FOJT5R4GnDaTIVQdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6kyvPNp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751278053; x=1782814053;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aj+rVpfXUXA9eCUKlc1aOfOFUblSFGriJwah678It8o=;
  b=P6kyvPNp0MFT8iavbOPlrzEfxPJOy2jyp8MDLcOC6mNowdKSDbXMUWui
   PFCaZufb3CSYNJWmS5Qaz0V8nAyCTznxq3CO0RtD0uzyfpXxhP+nNng3r
   XHF2syrQBd0cd35Zrv+nuggAzb7sWG0Q0CbtB88MsYtpprKQjRhZe/P6h
   WvEvuZyH9mNkHF9ikuTPQHLL3+kjFdk/SffiwBEvRkyaIXgSHBHsoVyyU
   EgYS0STix18VyaIvBnJN+kKB1hIuetY4sR5ihVomBJ+RmI9slGXmuQh4q
   uISmqBY0+NGU3OvDa7f57wk6o7Hf78qL3H5cx841vnRh3a+WVTNmmt/mU
   A==;
X-CSE-ConnectionGUID: pV5BbuwmTci1Wol0tcvZkQ==
X-CSE-MsgGUID: lu8Un/SNQYeZEuych5kMCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64851843"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64851843"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:07:32 -0700
X-CSE-ConnectionGUID: hvfMY26nQF214kwCZzo74Q==
X-CSE-MsgGUID: pFwdDjv/SD2jkg6Mn5w+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153722496"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2025 03:07:30 -0700
Message-ID: <cea37477-319a-4090-b878-7bcbf348b6d8@linux.intel.com>
Date: Mon, 30 Jun 2025 13:07:29 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v3 1/1] usb: hub: Fix flushing of delayed work used
 for post resume purposes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
 konrad.dybcio@oss.qualcomm.com, broonie@kernel.org, stable@kernel.org
References: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
 <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
 <2025062810-slush-trillion-b199@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2025062810-slush-trillion-b199@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.6.2025 17.46, Greg KH wrote:
> On Fri, Jun 27, 2025 at 07:43:48PM +0300, Mathias Nyman wrote:
>> Delayed work that prevents USB3 hubs from runtime-suspending too early
>> needed to be flushed in hub_quiesce() to resolve issues detected on
>> QC SC8280XP CRD board during suspend resume testing.
>>
>> This flushing did however trigger new issues on Raspberry Pi 3B+, which
>> doesn't have USB3 ports, and doesn't queue any post resume delayed work.
>>
>> The flushed 'hub->init_work' item is used for several purposes, and
>> is originally initialized with a 'NULL' work function. The work function
>> is also changed on the fly, which may contribute to the issue.
>>
>> Solve this by creating a dedicated delayed work item for post resume work,
>> and flush that delayed work in hub_quiesce()
>>
>> Cc: stable@kernel.org
>> Fixes: a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
>> Reported-by: Mark Brown <broonie@kernel.org>
>> Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>> v3:
>>   - Rebase on top of a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
>>   - Rewrite commit message
>>
>> v2:
>>   - Add and use dedicated delayed work struct for post resume work
>>   - Add commit message section about dedicated work
> 
> This seems to work, want me to take this, or are you going to submit
> another one?  I'll hold off on sending the pull request to Linus for
> -rc4 because of this.
> 
> thanks,
> 
> greg k-h

Sorry about the response delay, was offline during weekend

I'll do some quick additional smoketests, suspending and disconnecting runtime suspended
chained USB3 hubs. Shouldn't take more than a couple of hours

Thanks
Mathias

