Return-Path: <linux-usb+bounces-14180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B99960CEA
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 16:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 477782883F9
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 14:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CA11C4626;
	Tue, 27 Aug 2024 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5EZDi+o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E61A0739
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767444; cv=none; b=D5hVuESWj6Q96GBAXSaQf6dzDYOVB/J5cn2fbwEfl2RLe5ZKLQQeaoAXLWZddaT/mI0P3279OdIjR8bi99ru0uIOfSLGWV4WDJ4CeCdnFCPBd9gG1HkahwOz9OZ2qQsz4jYyikxuRmbPootlCXU4aYsyrSIAgm4Zd66bHIQe0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767444; c=relaxed/simple;
	bh=QYxb6TBK5Iip4NMT98N6ouJtHclWLOQh3YDrMwwL8w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYyuqUQGnyGDlbEZ0M+7otrolY1kT/uMXp2AxKjInidBeb4cqy7DMXxONZYbP7kLOEMmnhgQs0w7aVAz80s0sz85scPY2WL1uarIdpBMhg070Lxp4RzUNpoWqhayiWEHChb+BxoFS8Y0ahrCVKEh/rqM4VtkxRCEQ5VopAEPyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5EZDi+o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724767444; x=1756303444;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QYxb6TBK5Iip4NMT98N6ouJtHclWLOQh3YDrMwwL8w8=;
  b=c5EZDi+o/MW5ShzjUr1Z8hdgZuc3fgxqUNFBC2LoBA30zQf8gz91YtrO
   Ox3eFXPfweFtHj5bCzilCmnH8AHSnJ756vmVIUIq58SgSP9NAjBiBDwQZ
   8n5hMDaSH4r/mrFUCGOUTjFMcT4d7GTdcSRqYIu5ZerOKcK+4eVZdoV+k
   UShSETQJ9Go2hNkL6Sp73EFzCpZhphp4UNMo+IPASph8LGeqXRxigvHkR
   gkD2y/ti5sdk7WRTiQdwsdeMfg3x6nxf2gfBbkY/XUEfznxSVsNofUCrd
   BooKS6Hd6DQQTkPR/dJlx4jkoZjZ3nOSrloox/hTr2+K09NRGPK4bpU1v
   w==;
X-CSE-ConnectionGUID: RdGwpqynSyqcEusr61bMcA==
X-CSE-MsgGUID: hzZak92aTaCMAFb2U5HDNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23422412"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23422412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 07:04:03 -0700
X-CSE-ConnectionGUID: +HVt8sx+SRK/R8rdxm9d+A==
X-CSE-MsgGUID: g/cIk7eMR0O8D6ZC9c9Sbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67733956"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2024 07:04:03 -0700
Message-ID: <c213b356-8080-44c9-9265-fd5ecd2e34df@linux.intel.com>
Date: Tue, 27 Aug 2024 17:06:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] xhci: dbc: Fix STALL transfer event handling
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <CALwA+NbmKj_Wa2up2uDrQ=eoLcA4U3G37AvUguyY2K1JLLPdEw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NbmKj_Wa2up2uDrQ=eoLcA4U3G37AvUguyY2K1JLLPdEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.8.2024 16.29, Łukasz Bartosik wrote:
> On 8/22/24 15:02, Mathias Nyman wrote:
>> Don't flush all pending DbC data requests when an endpoint halts.
>>
>> An endpoint may halt and xHC DbC trigger a STALL error event if there's an
> 
> trigger -> triggers
> 
>> issue with a bulk data transfer. The transfer should restart once xHC DbC
>> receives a ClearFeature(ENDPOINT_HALT) request from the host.
>>
>> Once xHC DbC restarts it will start from the TRB pointed to by dequeue
>> field in the endpoint context, which might be the same TRB we got the
>> STALL event for. Turn the TRB to a no-op in this case to make sure xHC
>> DbC doesn't reuse and tries to retransmit this same TRB after we already
>> handled it, and gave its corresponding data request back.
>>
>> Other STALL events might be completely bogus.
>> Lukasz Bartosik discovered that xHC DbC might issue spurious STALL events
>> if hosts sends a ClearFeature(ENDPOINT_HALT) request to non-halted
>> endpoints even without any active bulk tranfers.
>>
> 
> tranfers - > transfers
> 
>> Assume STALL event is spurious if it reports 0 bytes tranferred, and
> 
> tranferred -> transferred
> 
>> the endpoint stopped on the STALLED TRB.
>> Don't give back the data request corresponding to the TRB in this case.
>>
>> The halted status is per endpoint. Track it with a per endpoint flag
>> instead of the driver invented DbC wide DS_STALLED state.
>> DbC remains in DbC-Configured state even if endpoints halt. There is no
>> Stalled state in the DbC Port state Machine (xhci section 7.6.6)
>>
>> Reported-by: Łukasz Bartosik <ukaszb@chromium.org>
>> Closes: https://lore.kernel.org/linux-usb/20240725074857.623299-1-ukaszb@chromium.org/
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
> 
> Tested-by: Łukasz Bartosik <ukaszb@chromium.org>
> 
> In the trace below stall errors happen and even though the short
> packet is processed
> instead of being dropped as it happened previously without this fix.

Thanks, fixed typos and added patch to queue

-Mathias

