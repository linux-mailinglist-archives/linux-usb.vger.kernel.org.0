Return-Path: <linux-usb+bounces-25186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD0AEBCA7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE9A03B6F99
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2632E9EBC;
	Fri, 27 Jun 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkkLWG+s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E97619E990
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039844; cv=none; b=gDC6LeJNCY8gYV+korcqhdsskpc0Y6BIGvKpkhQMU/sjaSIx/tIQ/vLm3rkRT6OwQeUqmO3ClD1yv4dKCCMi7vZcYjzHgN/Y2wpUFkZxpiadQCnFwTRAHKxxgFcVJOAttmffM2DKTvIXfNwaaK+9XJIDhw1q9xWbxU2oemolGHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039844; c=relaxed/simple;
	bh=RSvf9wk6LFQ52EedaTRuLvENkS6msEa/kHtpC/e+qtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESfBk4DDk+QPqvVsJ7BVSxmZY7nGVFkqVzqr9TQOY/BJjgVHL0DU0jjXum61IvnV2/h/QX36l6jGG15T9lD8f2c5BPbEF9PD0j7EUoD9AWKSU+zC95I9ITBFPZjbkvnTO7OeUZHwX9r5HKyxIGy3Z1chy/2d9peEEwyYoFc21zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkkLWG+s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751039843; x=1782575843;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RSvf9wk6LFQ52EedaTRuLvENkS6msEa/kHtpC/e+qtM=;
  b=JkkLWG+s6D7J/tGPNMdJSBqMyGglLLlQ8KDHFXPR8z6MqXOVHcXp5Hm3
   e0T0uTC/fWJiITgL/zTMqsej7XAJtE9ZUotClON/aqAUKXqNTnTnx/PAx
   sG1v/w458E5km6YajRipSJuWAB5TD3cEhnq5EKZ5VkW8q8gQJzSP3pViL
   Arfx3LIQK3DWxDzGqk6btkX8tJ4iUBYxF4HU+M2zL5Yh53ZeiH+8Hia9W
   jdjXuPt7VFTlyd82hjXhtTY+rGjUUs/7QntjPENb8TpCRjW7Qr4zTxtOz
   1YqvgdUsMBQiEQAOfGDkUp3rPnuCbyYJgXLulElCZECqH7Ux2H1vyXfNS
   w==;
X-CSE-ConnectionGUID: 2dmEDZDRTpGaYUzrsOgyiA==
X-CSE-MsgGUID: 3CQvaeriQeSgQnGq0bNxZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53298122"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53298122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:57:22 -0700
X-CSE-ConnectionGUID: hC8RKLRWTaK0npOk8RBxuA==
X-CSE-MsgGUID: 7ac+e7R5SeGvYNumNjG6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183873654"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 08:57:20 -0700
Message-ID: <e85e2b80-ff3b-43eb-8ec4-cdd0a42339e3@linux.intel.com>
Date: Fri, 27 Jun 2025 18:57:19 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, oneukum@suse.com, stable@kernel.org
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
 <e42dad63-cb3c-4bc8-9b1e-d43c8e976313@sirena.org.uk>
 <6f251f36-cdfb-4cf3-9066-e84d5842c875@linux.intel.com>
 <344dd9c9-07af-4e22-8cf2-1fbd0b4e5869@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <344dd9c9-07af-4e22-8cf2-1fbd0b4e5869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.6.2025 18.23, Konrad Dybcio wrote:
> On 6/27/25 4:52 PM, Mathias Nyman wrote:
>> On 27.6.2025 17.34, Mark Brown wrote:
>>> On Fri, Jun 27, 2025 at 05:20:44PM +0300, Mathias Nyman wrote:
>>>> Delayed work to prevent USB3 hubs from runtime-suspending immediately
>>>> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
>>>> of high tier USB3 devices behind suspended hubs").
>>>
>>> This doesn't apply for me against any of mainline, pending-fixes or
>>> -next.
>>
>> Ah, right, -next of course already has version 1 of  "usb: hub: Fix
>> flushing and scheduling of delayed work that tunes runtime pm"
>>
>> I'll rebase this patch on top of that
> 
> FWIW I applied this one on next-20250624 (not containing the v1 fix)
> and ran some testing, with no issues seen
> 
> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD
> 

That is good news. Thanks Konrad for testing

-Mathias

