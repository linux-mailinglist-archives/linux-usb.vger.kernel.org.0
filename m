Return-Path: <linux-usb+bounces-38247-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E7HCrKKHWr5bgkAu9opvQ
	(envelope-from <linux-usb+bounces-38247-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:35:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839D6201F7
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57AFE300FCA6
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEA63A782B;
	Mon,  1 Jun 2026 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbT89Agh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9453A6B7F;
	Mon,  1 Jun 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320930; cv=none; b=kXW6HnPsm64rqJhT2shxxxR13EjczJYS8DhBjfb3HYFZZwdgfvLsEAKt6EZ0SeVgehcedHzrHrDeX3ccHgLPdaAsITRykk2NMAD1Q3uLakii2ahh0JdOk/TrXA4d9fPPJwOGL1bhxHr//uAqii6hqSB9j/sg8JCte7WLu7jEF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320930; c=relaxed/simple;
	bh=sPkP/kYoyeVyBvVfLeWdMd3ktnETlsu/jOlhODdyeKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNsOSwok2MRn60dlwiio1Gm3tT1aK/jFHteQes7bG6yromJ3gGxtyS+dj1kh9wwM2VvoDsfvzWi+BA7TLF06/SJMYLW8igqVXUlDTFS4Sae15cTt5fq9o/8jmlBMhdcB6+3AymBXGbXEcdNTQSoiWwUw5rXG0dCLn25MTBswzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbT89Agh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780320927; x=1811856927;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sPkP/kYoyeVyBvVfLeWdMd3ktnETlsu/jOlhODdyeKw=;
  b=CbT89Aghp4BGJvzvaIncRDKUBK84ValIzrthdCa10yycQEMhHl+52Cud
   KjnAfskd4DH8PRFnyJic3+xeM5Ghw5Tf95GFvFkXUVEWnYuVVxQmCURXN
   0sPhz33F0g0Kjg7hdT29Jxi/w+h0to+rmOijd/+nn/+sizzAPsFrXVYl2
   wiPvN5x0Gqa7IcnuXqU1ngNB2VtyQOl4DwzbnHFN3YCwlOQgZutGPuVy9
   mWGGwsZdM3Dq3GzSpZ8UV9UY2FOOtagj79GclNAdu8MZu5nZBrK9O5Gsy
   2R9ug111Eg6EAd4aKmyev1sCTc5JTb+Ywi9ct1UTrUSq8LXJk0Q+y/SNM
   A==;
X-CSE-ConnectionGUID: oL957Z1TQZCaHH5tyhtIgw==
X-CSE-MsgGUID: ZtGa8Ie0Spyz/xsAiAJC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81190009"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81190009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:35:27 -0700
X-CSE-ConnectionGUID: yphG1t7lQMu+ZJE1CqIfVw==
X-CSE-MsgGUID: dkEd60FITcav3PQwDCLgwg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.110]) ([10.245.245.110])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:35:25 -0700
Message-ID: <ab199e7a-c0d4-4150-bbcc-9ab8b18f0725@linux.intel.com>
Date: Mon, 1 Jun 2026 16:35:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: early: xhci-dbc: Ensure correct memory size for
 early_ioremap()
To: Umang Jain <uajain@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <demarchi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20260520094804.2981960-1-uajain@igalia.com>
 <2026052001-ruined-pesticide-9de7@gregkh>
 <81d706a4d1977ed39529336b2a8bc15f@igalia.com>
 <2026052001-regally-dizziness-2271@gregkh>
 <329c3970d932c21ca0ead6a84e573bd2@igalia.com>
 <2cbaa1b8-6ae3-4aa6-adeb-4b7e73be1400@linux.intel.com>
 <e61515d413677c16a1fcfe6be7933ed1@igalia.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <e61515d413677c16a1fcfe6be7933ed1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38247-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,igalia.com:email,steamdeck:email]
X-Rspamd-Queue-Id: 8839D6201F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/27/26 16:22, Umang Jain wrote:
> Hi Mathias,
> 
> Thanks for the reply.
> 
> On 2026-05-25 21:01, Mathias Nyman wrote:
>> On 20/05/2026 15.54, Umang Jain wrote:
>>> On 2026-05-20 12:42, Greg Kroah-Hartman wrote:
>>>> On Wed, May 20, 2026 at 12:27:39PM +0000, Umang Jain wrote:
>>>>> Hi Greg,
>>>>>
>>>>> On 2026-05-20 11:22, Greg Kroah-Hartman wrote:
>>>>>> On Wed, May 20, 2026 at 03:18:04PM +0530, Umang Jain wrote:
>>>>>>> early_ioremap() checks and fail, if the memory size exceeds the fixed
>>>>>>> boot-time mappings (dictated by NR_FIX_BTMAPS macro). We should ensure
>>>>>>> the correct maximum memory size is passed to early_ioremap() in the
>>>>>>> driver.
>>>>>>>
>>>>>>> Without this check and page size being 4K(4096), enabling xhci-dbc
>>>>>>> on steamdeck seems to issue the warning:
>>>>>>>
>>>>>>> steamdeck kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
>>>>>>> steamdeck kernel: ------------[ cut here ]------------
>>>>>>> ay 19 13:42:57 steamdeck kernel: WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139 __early_ioremap+0xae/0x180
>>>>>>> steamdeck kernel: Modules linked in:
>>>>>>> steamdeck kernel: CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.25-valve1-gcab630e7af50 #13 PREEMPT(undef)  4b70872d9de6788b7f2d10dce46ada89e6cd177b
>>>>>>> steamdeck kernel: RIP: 0010:__early_ioremap+0xae/0x180
>>>>>>> steamdeck kernel: Code: 60 ba 3f a0 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40 76 04 <0f> 0b eb a2 6b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
>>>>>>> steamdeck kernel: RSP: 0000:ffffffff9fa03cb8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
>>>>>>> steamdeck kernel: RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
>>>>>>> steamdeck kernel: RDX: 0000000000000100 RSI: 0000000000100000 RDI: 0000000080200000
>>>>>>> steamdeck kernel: RBP: 0000000000000100 R08: 0000000000000000 R09: 0000000080200000
>>>>>>> steamdeck kernel: R10: 0000000000000004 R11: ffffffff9fa03ad0 R12: 8000000000000163
>>>>>>> steamdeck kernel: R13: 0000000000000000 R14: 0000000080200000 R15: 0000000000000000
>>>>>>> steamdeck kernel: FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>>>>>> steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>> steamdeck kernel: CR2: ffff888000000413 CR3: 000000020ed02000 CR4: 00000000000000b0
>>>>>>> steamdeck kernel: Call Trace:
>>>>>>> steamdeck kernel:  <TASK>
>>>>>>> steamdeck kernel:  ? early_xdbc_parse_parameter+0x32c/0x360
>>>>>>> steamdeck kernel:  ? setup_early_printk+0x4f5/0x520
>>>>>>> steamdeck kernel:  ? do_early_param+0x44/0x70
>>>>>>> steamdeck kernel:  ? parse_args+0x233/0x420
>>>>>>> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>>>>>>> steamdeck kernel:  ? parse_early_options+0x29/0x30
>>>>>>> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>>>>>>> steamdeck kernel:  ? parse_early_param+0x64/0xc0
>>>>>>> steamdeck kernel:  ? setup_arch+0x542/0xbc0
>>>>>>> steamdeck kernel:  ? _printk+0x6b/0x90
>>>>>>> steamdeck kernel:  ? start_kernel+0x66/0x9a0
>>>>>>> steamdeck kernel:  ? x86_64_start_reservations+0x24/0x30
>>>>>>> steamdeck kernel:  ? x86_64_start_kernel+0xcc/0xd0
>>>>>>> steamdeck kernel:  ? common_startup_64+0x13e/0x141
>>>>>>> steamdeck kernel:  </TASK>
>>>>>>> steamdeck kernel: ---[ end trace 0000000000000000 ]---
>>>>>>>
>>>>>>> Signed-off-by: Umang Jain <uajain@igalia.com>
>>>>>>> ---
>>>>>>>    drivers/usb/early/xhci-dbc.c | 8 ++++++++
>>>>>>>    1 file changed, 8 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>>>>>>> index 41118bba9197..699a9ac6d6c3 100644
>>>>>>> --- a/drivers/usb/early/xhci-dbc.c
>>>>>>> +++ b/drivers/usb/early/xhci-dbc.c
>>>>>>> @@ -76,6 +76,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>>>>>>>      	sz64 = 1ULL << __ffs64(sz64);
>>>>>>>    +	/*
>>>>>>> +	 * Check that size does not exceed fixed boot-time mappings
>>>>>>> +	 * dictated by NR_FIX_BTMAPS. early_ioremap() will WARN_ON()
>>>>>>> +	 * and not map memory in those cases.
>>>>>>> +	 */
>>>>>>> +	if (sz64 > (NR_FIX_BTMAPS << PAGE_SHIFT))
>>>>>>> +		sz64 = NR_FIX_BTMAPS << PAGE_SHIFT;
>>>>>>
>>>>>> You are bounding the size here, but does this mean that the hardware
>>>>>> itself is just broken and should be fixed up to properly report the
>>>>>> correct size?  Does this hardware actually have a debug controller?
>>>>>
>>>>> Hmm, to answer your first question as far as I have read, the size is
>>>>> inferred from PCI config with base address. My understanding here is
>>>>> that
>>>>> for early xhci debugging - the page mappings are fixed, so we need to
>>>>> bound the size for early_ioremap().
>>>>
>>>> So the device is providing the wrong size here?  Why is this an issue
>>>> only for this hardware and not other hardware?
>>>>
>>>>> The second answer is, yes the hardware has debug controller. We can
>>>>> configure it after boot
>>>>> and it works with USB3.1 Superspeed cable with host:
>>>>>
>>>>> (on target)
>>>>> (A+)(root@steamdeck ~)# echo enable  >
>>>>> /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.3/dbc
>>>>> (A+)(root@steamdeck ~)# dmesg | grep DbC
>>>>> [  366.276124] xhci_hcd 0000:04:00.3: DbC connected
>>>>> [  366.637223] xhci_hcd 0000:04:00.3: DbC configured
>>>>>
>>>>> (on host)
>>>>> [114288.650481] usb 4-2: new SuperSpeed USB device number 55 using
>>>>> xhci_hcd
>>>>> [114288.662907] usb 4-2: New USB device found, idVendor=1d6b,
>>>>> idProduct=0010, bcdDevice= 0.10
>>>>> [114288.662935] usb 4-2: New USB device strings: Mfr=1, Product=2,
>>>>> SerialNumber=3
>>>>> [114288.662945] usb 4-2: Product: Linux USB Debug Target
>>>>> [114288.662953] usb 4-2: Manufacturer: Linux Foundation
>>>>> [114288.662960] usb 4-2: SerialNumber: 0001
>>>>> [114288.666320] usb_debug 4-2:1.0: xhci_dbc converter detected
>>>>> [114288.666474] usb 4-2: xhci_dbc converter now attached to ttyUSB0
>>>>>    
>>>>>>
>>>>>> And what changed to cause this to start complaining?  Does it fix a
>>>>>> specific commit?  This hardware has been around for a long time, did we
>>>>>> mess something up in the kernel for it recently?
>>>>>
>>>>> This fix/patch is only for early xdbc. As mentioned above, it can be
>>>>> used/configured after boot.
>>>>> So yes, the hardware has been around but I don't think that early xdbc
>>>>> capability was investigated at any point in time. I don't see recents
>>>>> commits early xhci as well so maybe it was hidden all this time.
>>>>
>>>> Ok, but it is good to figure out what is "wrong" here that this hardware
>>>> is causing this warning to happen, yet other hardware does not.  Either
>>>> the kernel has always been wrong (totally a possibility), or this
>>>> hardware is reporting invalid ranges.  Figuring out which is true would
>>>> be good to figure out here.
>>>
>>> Oh yes definitely.
>>>
>>> I, although don't have any order hardware so I will look around. I
>>> haven't investigated the ranges yet, so I will investigate that too. My
>>> logic initially was that it's the "early boot" that is forcing a
>>> pages/size capping so we need to fit there.
>>>   From __early_ioremap() in mm/early_ioremap.c
>>>
>>> ...
>>> 	/*
>>> 	 * Mappings have to fit in the FIX_BTMAP area.
>>> 	 */
>>> 	nrpages = size >> PAGE_SHIFT;
>>> 	if (WARN_ON(nrpages > NR_FIX_BTMAPS))
>>> 		return NULL;
>>>
>>> ...
>>>
>>
>> Sometimes a xHC controller report a larger size than early ioremap supports.
>> This is because xHC from different vendors supports different extended
>> capabilities, both standard ones like DbC and vendor specific ones, all at vendor chosen offsets.
>>
> 
> That's a very useful information and I didn't really realise that there
> are vendor specific DbC information that could be read out for
> early-xhci dbg capability.
> 
> The size reported for 2 controllers are : 1MB (See output of in the end)
> 
>> To find offset of a extended capability we need to walk the extended capability list. If we limit the size here in software then we need to very carefully walk the capability list, making sure we don't go over that limit.
> 
> True. However, I am wondering how would be go about mapping all the
> extended capability list for early dbc? Or should we do it even (stick
> to the standard dbc and skip the vendor specific ones) because
> early_ioremap() is already fixed to 512 boot-time mappings. Do you have
> any opinion on this problem?
> 

An extended capability list entry first byte will be the ID of the capability.
DbC is standardized and has an ID "10".

Vendor capabilities start at ID 192.
The vendor specific capabilities are not related to DbC.

Following 16 bytes of extended capability entry contains offset to the next
extended capability. This offset value is offset from this current extended
capability to the next.

If xHCI reports larger size than ioremap supports I would:
map the max ioremap size,

1.  Read offset of first extended capability from a xHCI register
2.  Make sure offset < max ioremap size
3.  Read capability ID,
4.  If (capability id == "10") (DbC),
         ensure offset + 56 < max ioremap size, then use DbC
    else
         read offset value of next capability.
         Add new offset to existing offset.
         Check summed offset is < max ioremap size
         goto step 3.

Check out xhci_find_next_ext_cap() in xhci-ext-caps.h
It can be used for most steps above.

Thanks
Mathias


