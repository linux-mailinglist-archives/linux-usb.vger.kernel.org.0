Return-Path: <linux-usb+bounces-16631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB8B9AE323
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 12:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3221C222B9
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 10:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902741C2DA2;
	Thu, 24 Oct 2024 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amiXParX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679014831C
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729767294; cv=none; b=t3Sa82t2MK9nrlVyHn/+69X51iVp1+n4wEW04shVbCb2hbu7ZAeujeuyKmx1gZgZJK98PbtT9vL8Q0GAMigN19kfIcLm8P25poMrJujSXH3U3S6XwuVVR1Av6WflRykvU5C9nDVYoh6ehsvL81n6BWUCAdwch/7lzMeWPY4BVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729767294; c=relaxed/simple;
	bh=2nH4MxGrrZz43q1yccnlhT1n0I/jg0YWnn4+2OXOn6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONxDI9ZQLIqvY/JJmYwQQoEzYKJc8PCaMNUfxSfYU7SvUfqmB7TehtcKHSXnSGQ7x70XYvoqqfHjwlqy1gW8R9mbf5bkpz/4c9NvyVZltyypmcT+BzMLv80bXoYyFw1nouOI5rtYne/a/pqfgshHtuUPik2T6Bwb/Iw/EzuHrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amiXParX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729767292; x=1761303292;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2nH4MxGrrZz43q1yccnlhT1n0I/jg0YWnn4+2OXOn6M=;
  b=amiXParXG9CtKeNIseIUs6I5+ZgfD1Zc022s/AbYPccVYQmobUqnHdvz
   XzHbIFD+vUEiDH+DQEzVKvVe/EiAeWMzx6df7jfg5MjkOXo9CXp8yZ1JK
   4fk/aYsjF6LxZLZ1JCQnd6jOTiUrUvqYyz2Z34w4vxgtn+vlTPLuwYZWe
   tjMiBu2UEgjds74d8suw7lXQ6WzQX7o5xKVZV2ybV8b+O34lKydk1/rcV
   XSl4hxafZ+0S677ng3FOVrJzc9MhWErmDb5UC5dr8RnnA2XWZ2O+ExxH5
   X9xIKQkP/mChyWRxf8DzrEyrDmD4RHBHJhjFsXI8sg8gO15qSEFkhKisF
   A==;
X-CSE-ConnectionGUID: rEAhY+vPQROukuWv9Vl3fw==
X-CSE-MsgGUID: peD2M9lMTfiRxDpDgDBMfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33296662"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33296662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:54:51 -0700
X-CSE-ConnectionGUID: ffpk2TV+TAGNT1NO6b2TTQ==
X-CSE-MsgGUID: JrnTM38nRvudGhaH5Vf4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85116221"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 03:54:49 -0700
Message-ID: <8c72a211-06aa-40f5-a478-aa2d2604143c@linux.intel.com>
Date: Thu, 24 Oct 2024 13:57:02 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
To: Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
 <20241022132232.GD275077@black.fi.intel.com>
 <2b4708a0-d8b0-4e8b-9cf8-11552527eb14@linux.intel.com>
 <f40888a4-e9ef-423e-8ac3-e6bf4ecc242c@amd.com>
 <126c429f-7c55-4d7e-9d3a-1fa5c5ab1369@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <126c429f-7c55-4d7e-9d3a-1fa5c5ab1369@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.10.2024 21.07, Harry Wentland wrote:
> 
> 
> On 2024-10-23 12:50, Mario Limonciello wrote:
>> On 10/23/2024 07:12, Mathias Nyman wrote:
>>> On 22.10.2024 16.22, Mika Westerberg wrote:
>>>> The test case would be something like this:
>>>>
>>>> 1. Add "thunderbolt.host_reset=0" in the kernel command line.
>>>> 2. Boot with USB4 device connected (and so that it has USB 3.x device
>>>>      connected such as USB 3 memory stick).
>>>> 3. Since there is no device link Thunderbolt/USB4 can runtime suspend
>>>> freely.
>>>> 4. Once that happens the tunnels are gone, including the USB 3.x tunnel
>>>>      so the xHCI might see disconnect here.
>>>>
>>>> Also on resume path it will not be recreating the tunnel before xHCI
>>>> because there is no device link. I can try this on my side too if you
>>>> like.
>>>>
>>>
>>> You are right, I was able to reproduce it.
>>>
>>> Device link won't be created if BIOS created the tunnel, thunderbolt driver
>>> probes after this usb device is created, and "thunderbolt.host_reset=0" is set.
>>>
>>> Turning the device link "stateless" could possible help.
>>> It removes driver presence dependency but keeps correct suspend/resume and
>>> shutdown ordering.
>>> It should also help with boot hang/probe issues seen on the AMD platforms.
>>>
>>> Mario, Harry, does the following work for you?
>>
>> I didn't repro Harry's problem, but I did try on two OEM systems (Rembrandt and Phoenix based) with this change in place on a 6.12-rc4 base and didn't notice anything worse happening.
> 
> Yeah, the following diff works for me.
> 
> If you create a patch feel free to add my
> Tested-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry

Thanks for testing, I'll turn this into a proper v2 patch

-Mathias

