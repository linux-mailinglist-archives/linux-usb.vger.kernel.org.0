Return-Path: <linux-usb+bounces-25294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2BAEDEC7
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 15:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAAE71898240
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 13:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0499828B50E;
	Mon, 30 Jun 2025 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fV3QAxvq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D2285C81
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289320; cv=none; b=liTKXM//UFlhAKnIkZfkIkI8xuU1fRVptaxH+pQRo9yauyOS4UlPStlOK/nvFw7j9IaKH072aySNbuUcdoqt9PHr7mli3c49z3deJhZgt0ehgE8SpTOJ6zvqoZMUYuzjQUqaDImm1ilsB67MCwbXCoN7rlV4BOrjCLsZVpE0blM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289320; c=relaxed/simple;
	bh=YozDkD2nlg+r/rAPYWxrSHw003Eyva1pGRocpagisGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6ptJC1jdckOMT2mCrOhvKFYw3fcWjpU/ZG3uwJ6+LawzRKB9OfqRKxY4kE+WcrcgP055NJWhcNjJzy4bMjx2lvVo6+u73TfIYwO7mlJAgBGCTU3h+kRLSUpuAjCP4CtQV9uVW2UAhFGqDFMXnYD82cgNfWYLmbFiFz6b04zMns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fV3QAxvq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751289319; x=1782825319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YozDkD2nlg+r/rAPYWxrSHw003Eyva1pGRocpagisGg=;
  b=fV3QAxvqkC31sTJEOkhAxdnoPhboiqDk0Hr6wetuBDBZ/vgZQbVenYXo
   P7bRMSvIAkbDEx4m1FS0jxw+I0cKOVR6DMdrjN+XLRLon2mdywJjvwvtT
   aTeB7IPcnj6NRc+ybD/eYd6To/TSyf+dvlei390Q4e66Om3azjQiHnVqK
   JevCo3H8KJHv4aS1eJa4fvHS3gIideHt+avQ9pPjSzSsIS4KUKM7IvyJN
   OOpLMAtCiKHcJte19M7QlvILRyptMRckaBjMUYHa+g+BWvnR7yNV8f2Bf
   JYuNKnVVWia3P+AB2arAtfNqTRChbcKOdIFrEBZHGZ3pkAb3clO+MwDMt
   w==;
X-CSE-ConnectionGUID: EfeL+OmxQZi3dxydmGkLBA==
X-CSE-MsgGUID: DnlLTfwCSCauV/iZiBZjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64110892"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64110892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:15:18 -0700
X-CSE-ConnectionGUID: f8xlGt0iRauginPFO4xkHQ==
X-CSE-MsgGUID: kLNW2SPbTk228oH5tS8XfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157731481"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2025 06:15:16 -0700
Message-ID: <b5646b40-1e8e-4bec-a11a-b4ba512c89ef@linux.intel.com>
Date: Mon, 30 Jun 2025 16:15:15 +0300
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
 <cea37477-319a-4090-b878-7bcbf348b6d8@linux.intel.com>
 <2025063001-angled-caretaker-4494@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2025063001-angled-caretaker-4494@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.6.2025 14.19, Greg KH wrote:
> On Mon, Jun 30, 2025 at 01:07:29PM +0300, Mathias Nyman wrote:
>> On 28.6.2025 17.46, Greg KH wrote:
>>> On Fri, Jun 27, 2025 at 07:43:48PM +0300, Mathias Nyman wrote:
>>>> Delayed work that prevents USB3 hubs from runtime-suspending too early
>>>> needed to be flushed in hub_quiesce() to resolve issues detected on
>>>> QC SC8280XP CRD board during suspend resume testing.
>>>>
>>>> This flushing did however trigger new issues on Raspberry Pi 3B+, which
>>>> doesn't have USB3 ports, and doesn't queue any post resume delayed work.
>>>>
>>>> The flushed 'hub->init_work' item is used for several purposes, and
>>>> is originally initialized with a 'NULL' work function. The work function
>>>> is also changed on the fly, which may contribute to the issue.
>>>>
>>>> Solve this by creating a dedicated delayed work item for post resume work,
>>>> and flush that delayed work in hub_quiesce()
>>>>
>>>> Cc: stable@kernel.org
>>>> Fixes: a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
>>>> Reported-by: Mark Brown <broonie@kernel.org>
>>>> Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>> ---
>>>> v3:
>>>>    - Rebase on top of a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
>>>>    - Rewrite commit message
>>>>
>>>> v2:
>>>>    - Add and use dedicated delayed work struct for post resume work
>>>>    - Add commit message section about dedicated work
>>>
>>> This seems to work, want me to take this, or are you going to submit
>>> another one?  I'll hold off on sending the pull request to Linus for
>>> -rc4 because of this.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Sorry about the response delay, was offline during weekend
> 
> As one should be!  :)
> 
>> I'll do some quick additional smoketests, suspending and disconnecting runtime suspended
>> chained USB3 hubs. Shouldn't take more than a couple of hours
> 
> Ok, no rush, thanks for letting me know.
> 

My additional smoktests passed as well.

Can you pick this RFT PATCH v3 as it is?
Or want a new one with all those "Tested-by" tags

Thanks
Mathias


