Return-Path: <linux-usb+bounces-11639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1D916A8B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 16:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDFF11F27ADD
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E6C161B43;
	Tue, 25 Jun 2024 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJ+ex5v+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A76C1BC57
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326131; cv=none; b=L7gC2xqHHpyghD5auOJyllfoMUA43Dx569mMTEOIZLNMcBJJYxZZ31IW0iEdMtksPPVOgzZLPEoN2ovOG/asB1ouQH5M+jNsuHOwtiqP+RVCNQu+r1rUoBUVwiKBAMP/RwbzUKBZsY9X/nQd5kgc4hQAQMjsyq8f5fD/FHMS2bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326131; c=relaxed/simple;
	bh=4eRzkShshoUYKZzMDoPwv97S6p7ZTZ/ox2K4N+BRkdg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=FMgRtd5tuZ5QdBy6foF8Q69FB2Uh2WOJ2JuKH5syP+5pC767gxz8xJ5Pv5uthk+p3Tn7BR/HOCrIV7RSabfn5sSOQIyMzACIEfEzPUbuBhA1GobwcroVwvTsIgMx+clq+kXwyGx7uOlx9xXu34XiGx3tmq0PLMQAZ/XeeJ8CfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJ+ex5v+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719326130; x=1750862130;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=4eRzkShshoUYKZzMDoPwv97S6p7ZTZ/ox2K4N+BRkdg=;
  b=fJ+ex5v+4LSS25WmgyutV7u9GTw/m02eTfIzcAWpAvVt+NrH423blfrX
   /TqBxy6yH0iSK4BgbJe2MMeV/+VQFFcjnFbR22j7nzpTWaxK6JmU9bN1m
   M+BVru1nPo7mfbd8Ug+dDtV8cBhctKGDj0YIcPnnNSsTnzwcU/AZATGTy
   9Rgd1zIqlHIulURY+DJLGlsZLwGvwTw+byqV0gl2DZATbFQivfofuce8+
   gI4eGpPoyJw5wwRwhruoDiJBYVEkn0qapBpyc3AaSC9QVX9Y2RWfiobRR
   9heUBvwFFf3MEIfgE8czw01jQam3xfQ+s1DoEeZGuj1SgRtpOXrqJloTP
   Q==;
X-CSE-ConnectionGUID: a3kuHEcCT4iJEMUSESQMjw==
X-CSE-MsgGUID: 6GGpPFEXSF+tWNbA2BO0pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16493192"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16493192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 07:35:29 -0700
X-CSE-ConnectionGUID: rSyABUrfRsK+i67SHXhYtg==
X-CSE-MsgGUID: +P5z6QQGRuWMWTx4n5qIag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="44378981"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2024 07:35:28 -0700
Message-ID: <fea9e9f6-c3b0-6e22-d813-04da3d54a059@linux.intel.com>
Date: Tue, 25 Jun 2024 17:37:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
 <20240621061905.GI1532424@black.fi.intel.com>
 <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
 <20240624045912.GJ1532424@black.fi.intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
In-Reply-To: <20240624045912.GJ1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.6.2024 7.59, Mika Westerberg wrote:
> On Fri, Jun 21, 2024 at 11:30:05AM -0500, Mario Limonciello wrote:
>> On 6/21/2024 01:19, Mika Westerberg wrote:
>>> Hi Mario,
>>>
>>> On Thu, Jun 20, 2024 at 01:36:56PM -0500, Mario Limonciello wrote:
>>>> On 6/20/2024 01:41, Mika Westerberg wrote:
>>>>> +CC Mario from AMD side to check that we are good and don't break
>>>>> anything accidentally.
>>>>>
>>>>> On Wed, Jun 19, 2024 at 04:03:01PM +0300, Mathias Nyman wrote:
>>>>>> The relationship between a USB4 Host Interface providing USB3 tunnels,
>>>>>> and tunneled USB3 devices is not represented in device hierarchy.
>>>>>>
>>>>>> This caused issues with power managment as devices may suspend and
>>>>>> resume in incorrect order.
>>>>>> A device link between the USB4 Host Interface and the USB3 xHCI was
>>>>>> originally added to solve this, preventing the USB4 Host Interface from
>>>>>> suspending if the USB3 xHCI Host was still active.
>>>>>> This unfortunately also prevents USB4 Host Interface from suspending even
>>>>>> if the USB3 xHCI Host is only serving native non-tunneled USB devices.
>>>>>>
>>>>>> Improve the current powermanagement situation by creating device links
>>>>>> directly from tunneled USB3 devices to the USB4 Host Interface they depend
>>>>>> on instead of a device link between the hosts.
>>>>>> This way USB4 host may suspend when the last tunneled device is
>>>>>> disconnected.
>>>>>>
>>>>>> Intel xHCI hosts are capable of reporting if connected USB3 devices are
>>>>>> tunneled via vendor specific capabilities.
>>>>>> Use this until a standard way is available.
>>>>>>
>>>>>> Mathias Nyman (4):
>>>>>>      xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
>>>>>>      usb: Add tunneled parameter to usb device structure
>>>>>>      usb: acpi: add device link between tunneled USB3 device and USB4 Host
>>>>>>        Interface
>>>>>>      thunderbolt: Don't create device link from USB4 Host Interface to USB3
>>>>>>        xHC host
>>>>>>
>>>>>>     drivers/thunderbolt/acpi.c       | 40 ++++++------------------
>>>>>>     drivers/usb/core/usb-acpi.c      | 52 ++++++++++++++++++++++++++++++++
>>>>>>     drivers/usb/host/xhci-ext-caps.h |  5 +++
>>>>>>     drivers/usb/host/xhci-hub.c      | 29 ++++++++++++++++++
>>>>>>     drivers/usb/host/xhci.c          | 12 ++++++++
>>>>>>     drivers/usb/host/xhci.h          |  1 +
>>>>>>     include/linux/usb.h              |  2 ++
>>>>>>     7 files changed, 111 insertions(+), 30 deletions(-)
>>>>>>
>>>>>> -- 
>>>>>> 2.25.1
>>>>
>>>> Hi Mika,
>>>>
>>>> Thanks for looping me in.  Unfortunately with this is appears the XHCI
>>>> controller link never gets created.  I've not checked functional impact from
>>>> this, but I'd guess there "should" be some functional problems too.
>>>
>>> Thanks for checking!
>>>
>>> I think the code that sets up the device link based on ->tunneled should
>>> do that always if the hardware cannot tell if this is native or tunneled
>>> link to keep the existing functionality and only do the "optimization"
>>> if the hardware is capable of identifying that.
>>>
>>> Perhaps it can be a callback provided by the xHCI controller driver
>>> (->is_tunneled()) that then defaults to true if the
>>> "usb4-host-interface" property is there and in case of Intel hardware
>>> also checks the proprietary register?

How about changing the boolean udev->tunneled into a 3 value enum with
"link_unknown", "link_native", and "link_tunneled" options.

"link_unknown" would be default, xhci driver only changes this to "link_tunneled" or
"link_native" if the host can detect tunnels.

device link to USB4 host would be created for USB3 devices that have
"usb4-host-interface" property and udev->tunneled != native.

Thanks
Mathias


