Return-Path: <linux-usb+bounces-38047-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BSbDLW4FGq8PgcAu9opvQ
	(envelope-from <linux-usb+bounces-38047-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 23:01:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D35CECA4
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 23:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB6853016C83
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 21:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6775E332621;
	Mon, 25 May 2026 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUrCvr8C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F942048;
	Mon, 25 May 2026 21:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779742886; cv=none; b=CrJmHB3ZJQPSu/YYQ4pbHr6FRuChviFA9uSpKBDpt7CnR0Uv5wiKCw1DJQFQqtnko3pWzKpzJmANVGuCNQ7OAeejyboRiUWKk+u4K+Z/vnLS5YXMsf36zL/DOtqpOA7LAEMhU98Y/MUPzMJcG/qH5MaEUHxgEnplmUFJVRFOmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779742886; c=relaxed/simple;
	bh=7qy09IWmgNTOBZ8rkymVx48Q8QIdf13I02oAOzia0Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7KB0X/APbrVVga8GF7TFnd/fmHotPSBMOxENq/QGiyclSIgVvo+PS26s605CO6pnJG/xsXBt9oF+aFJDUXR+iauGgHAMDtDracV/XDN05lZyl3SQ2uQPx0EZqvQaqU0C9HOWoyUOCBS2qNCYUSyWhKNRpFCAvl5dmqlMII5u5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUrCvr8C; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779742883; x=1811278883;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7qy09IWmgNTOBZ8rkymVx48Q8QIdf13I02oAOzia0Nc=;
  b=IUrCvr8Cu7v1TkGJLk5d14qC/JR464fmDIs2wQBWtFXcEbUkfyVZD05+
   YP1N2Z7q6icgTSOfYffKMN1yqCoJU3qWkJtBdZWr46EudWlFVCUD+DsBI
   2pQhTMX1Obsa2JIcuu87L3r4wz34CWSwkZv3dd7W5q1YE9oWs9Fg5oWQi
   LUuF2DWSwqX/ds+W+IfOlHU0N1ZxMPOUUquDFWaW4ADWvAdiZTsoauMrD
   qvlFPpnnBiC8hdb1ZpwEfU5+Ne/PlRIq6vVAh8zzC1KeyqFee5owAmo4m
   NpqcOeo7Ne4ALNvDd3uhX/tXcrrPbKqS68RxjBog4GgfSyV8zJ3jjD6G2
   Q==;
X-CSE-ConnectionGUID: pFoDb9AqSWGfs5HSyUY9kQ==
X-CSE-MsgGUID: CPib2t9WSA2SVDa5BlIYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80593218"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80593218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 14:01:22 -0700
X-CSE-ConnectionGUID: DkIozhYBSGqcpin6HKg5sg==
X-CSE-MsgGUID: UJbXjpENSBaqVO+MuE0SuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="241567388"
Received: from omoaca-mobl1.ger.corp.intel.com (HELO [10.246.16.4]) ([10.246.16.4])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 14:01:20 -0700
Message-ID: <2cbaa1b8-6ae3-4aa6-adeb-4b7e73be1400@linux.intel.com>
Date: Tue, 26 May 2026 00:01:11 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: early: xhci-dbc: Ensure correct memory size for
 early_ioremap()
To: Umang Jain <uajain@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lucas De Marchi <demarchi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20260520094804.2981960-1-uajain@igalia.com>
 <2026052001-ruined-pesticide-9de7@gregkh>
 <81d706a4d1977ed39529336b2a8bc15f@igalia.com>
 <2026052001-regally-dizziness-2271@gregkh>
 <329c3970d932c21ca0ead6a84e573bd2@igalia.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <329c3970d932c21ca0ead6a84e573bd2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38047-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,steamdeck:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 1A3D35CECA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/05/2026 15.54, Umang Jain wrote:
> On 2026-05-20 12:42, Greg Kroah-Hartman wrote:
>> On Wed, May 20, 2026 at 12:27:39PM +0000, Umang Jain wrote:
>>> Hi Greg,
>>>
>>> On 2026-05-20 11:22, Greg Kroah-Hartman wrote:
>>>> On Wed, May 20, 2026 at 03:18:04PM +0530, Umang Jain wrote:
>>>>> early_ioremap() checks and fail, if the memory size exceeds the fixed
>>>>> boot-time mappings (dictated by NR_FIX_BTMAPS macro). We should ensure
>>>>> the correct maximum memory size is passed to early_ioremap() in the
>>>>> driver.
>>>>>
>>>>> Without this check and page size being 4K(4096), enabling xhci-dbc
>>>>> on steamdeck seems to issue the warning:
>>>>>
>>>>> steamdeck kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
>>>>> steamdeck kernel: ------------[ cut here ]------------
>>>>> ay 19 13:42:57 steamdeck kernel: WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139 __early_ioremap+0xae/0x180
>>>>> steamdeck kernel: Modules linked in:
>>>>> steamdeck kernel: CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.25-valve1-gcab630e7af50 #13 PREEMPT(undef)  4b70872d9de6788b7f2d10dce46ada89e6cd177b
>>>>> steamdeck kernel: RIP: 0010:__early_ioremap+0xae/0x180
>>>>> steamdeck kernel: Code: 60 ba 3f a0 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40 76 04 <0f> 0b eb a2 6b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
>>>>> steamdeck kernel: RSP: 0000:ffffffff9fa03cb8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
>>>>> steamdeck kernel: RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
>>>>> steamdeck kernel: RDX: 0000000000000100 RSI: 0000000000100000 RDI: 0000000080200000
>>>>> steamdeck kernel: RBP: 0000000000000100 R08: 0000000000000000 R09: 0000000080200000
>>>>> steamdeck kernel: R10: 0000000000000004 R11: ffffffff9fa03ad0 R12: 8000000000000163
>>>>> steamdeck kernel: R13: 0000000000000000 R14: 0000000080200000 R15: 0000000000000000
>>>>> steamdeck kernel: FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>>>> steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> steamdeck kernel: CR2: ffff888000000413 CR3: 000000020ed02000 CR4: 00000000000000b0
>>>>> steamdeck kernel: Call Trace:
>>>>> steamdeck kernel:  <TASK>
>>>>> steamdeck kernel:  ? early_xdbc_parse_parameter+0x32c/0x360
>>>>> steamdeck kernel:  ? setup_early_printk+0x4f5/0x520
>>>>> steamdeck kernel:  ? do_early_param+0x44/0x70
>>>>> steamdeck kernel:  ? parse_args+0x233/0x420
>>>>> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>>>>> steamdeck kernel:  ? parse_early_options+0x29/0x30
>>>>> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>>>>> steamdeck kernel:  ? parse_early_param+0x64/0xc0
>>>>> steamdeck kernel:  ? setup_arch+0x542/0xbc0
>>>>> steamdeck kernel:  ? _printk+0x6b/0x90
>>>>> steamdeck kernel:  ? start_kernel+0x66/0x9a0
>>>>> steamdeck kernel:  ? x86_64_start_reservations+0x24/0x30
>>>>> steamdeck kernel:  ? x86_64_start_kernel+0xcc/0xd0
>>>>> steamdeck kernel:  ? common_startup_64+0x13e/0x141
>>>>> steamdeck kernel:  </TASK>
>>>>> steamdeck kernel: ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> Signed-off-by: Umang Jain <uajain@igalia.com>
>>>>> ---
>>>>>   drivers/usb/early/xhci-dbc.c | 8 ++++++++
>>>>>   1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>>>>> index 41118bba9197..699a9ac6d6c3 100644
>>>>> --- a/drivers/usb/early/xhci-dbc.c
>>>>> +++ b/drivers/usb/early/xhci-dbc.c
>>>>> @@ -76,6 +76,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>>>>>   
>>>>>   	sz64 = 1ULL << __ffs64(sz64);
>>>>>   
>>>>> +	/*
>>>>> +	 * Check that size does not exceed fixed boot-time mappings
>>>>> +	 * dictated by NR_FIX_BTMAPS. early_ioremap() will WARN_ON()
>>>>> +	 * and not map memory in those cases.
>>>>> +	 */
>>>>> +	if (sz64 > (NR_FIX_BTMAPS << PAGE_SHIFT))
>>>>> +		sz64 = NR_FIX_BTMAPS << PAGE_SHIFT;
>>>>
>>>> You are bounding the size here, but does this mean that the hardware
>>>> itself is just broken and should be fixed up to properly report the
>>>> correct size?  Does this hardware actually have a debug controller?
>>>
>>> Hmm, to answer your first question as far as I have read, the size is
>>> inferred from PCI config with base address. My understanding here is
>>> that
>>> for early xhci debugging - the page mappings are fixed, so we need to
>>> bound the size for early_ioremap().
>>
>> So the device is providing the wrong size here?  Why is this an issue
>> only for this hardware and not other hardware?
>>
>>> The second answer is, yes the hardware has debug controller. We can
>>> configure it after boot
>>> and it works with USB3.1 Superspeed cable with host:
>>>
>>> (on target)
>>> (A+)(root@steamdeck ~)# echo enable  >
>>> /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.3/dbc
>>> (A+)(root@steamdeck ~)# dmesg | grep DbC
>>> [  366.276124] xhci_hcd 0000:04:00.3: DbC connected
>>> [  366.637223] xhci_hcd 0000:04:00.3: DbC configured
>>>
>>> (on host)
>>> [114288.650481] usb 4-2: new SuperSpeed USB device number 55 using
>>> xhci_hcd
>>> [114288.662907] usb 4-2: New USB device found, idVendor=1d6b,
>>> idProduct=0010, bcdDevice= 0.10
>>> [114288.662935] usb 4-2: New USB device strings: Mfr=1, Product=2,
>>> SerialNumber=3
>>> [114288.662945] usb 4-2: Product: Linux USB Debug Target
>>> [114288.662953] usb 4-2: Manufacturer: Linux Foundation
>>> [114288.662960] usb 4-2: SerialNumber: 0001
>>> [114288.666320] usb_debug 4-2:1.0: xhci_dbc converter detected
>>> [114288.666474] usb 4-2: xhci_dbc converter now attached to ttyUSB0
>>>   
>>>
>>>>
>>>> And what changed to cause this to start complaining?  Does it fix a
>>>> specific commit?  This hardware has been around for a long time, did we
>>>> mess something up in the kernel for it recently?
>>>
>>> This fix/patch is only for early xdbc. As mentioned above, it can be
>>> used/configured after boot.
>>> So yes, the hardware has been around but I don't think that early xdbc
>>> capability was investigated at any point in time. I don't see recents
>>> commits early xhci as well so maybe it was hidden all this time.
>>
>> Ok, but it is good to figure out what is "wrong" here that this hardware
>> is causing this warning to happen, yet other hardware does not.  Either
>> the kernel has always been wrong (totally a possibility), or this
>> hardware is reporting invalid ranges.  Figuring out which is true would
>> be good to figure out here.
> 
> Oh yes definitely.
> 
> I, although don't have any order hardware so I will look around. I
> haven't investigated the ranges yet, so I will investigate that too. My
> logic initially was that it's the "early boot" that is forcing a
> pages/size capping so we need to fit there.
>  From __early_ioremap() in mm/early_ioremap.c
> 
> ...
> 	/*
> 	 * Mappings have to fit in the FIX_BTMAP area.
> 	 */
> 	nrpages = size >> PAGE_SHIFT;
> 	if (WARN_ON(nrpages > NR_FIX_BTMAPS))
> 		return NULL;
> 
> ...
> 

Sometimes a xHC controller report a larger size than early ioremap supports.
This is because xHC from different vendors supports different extended
capabilities, both standard ones like DbC and vendor specific ones, all at 
vendor chosen offsets.

To find offset of a extended capability we need to walk the extended 
capability list. If we limit the size here in software then we need to very 
carefully walk the capability list, making sure we don't go over that limit.

There was some debugging done here in this thread

https://lore.kernel.org/linux-usb/4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com/

Thanks
Mathias



