Return-Path: <linux-usb+bounces-19148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46CA064C9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 19:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B65067A21FB
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 18:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93C9201258;
	Wed,  8 Jan 2025 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dw1M5rr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30AC2594BE;
	Wed,  8 Jan 2025 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736361784; cv=none; b=Ep5z8oSjE2JZOmLZrAbqY5D/sKXHMKjQ4nQKdH2a3zmh81PH4KRTHtM2VPvL4K2J8+eLF7ATxH+MEFYFzqiJBPpWRBFoD7Kup+rJmUJuarah+9FMvX1zTOz+b9142zUYFGALdu9eRw4yeis5F6ytsWPI/oFJr0Bq+F04+RVMHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736361784; c=relaxed/simple;
	bh=t8gzJbEH1XH2UQd2mYTu6BgnZBGFdzqJfZ0f8Bbo8CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jV7SB8+GHrDv12fl9uYYt/OdaTJLZhkEU6TEHjBa6I/d0bjWuMpvzqwmrCWVxCPI4b/IYDbBVJqfUwXCpEL2k0m6LpSmkJ5WwRx/7Hi7ju9zCB3t8t2PDpZYUuegcjqN0oQoaGmzshc9l801hBVWzN7plvJRJAHbXMHAYMXJ4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dw1M5rr4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736361782; x=1767897782;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t8gzJbEH1XH2UQd2mYTu6BgnZBGFdzqJfZ0f8Bbo8CA=;
  b=dw1M5rr4WJNHGUQwB/6ipeL/w3F8l8sgEhbSQYqYpVDy02ILxfcpjZot
   /AKz3kBmpmHPrM05ina+JvXAoLG8K1XnVAG2C+WX+nnVbtF8saelWaZEv
   SMOCGsT5HgAk9IfgnMg9D5jLsBzijCVUCp2Dga4e3Qq3lCBnDvcNShJSZ
   vxhW+pf25rGtLOF8GDrMdT51bguDLS8KqjYn+NM/w94ebvux2fHW9F0fS
   PzIY220baFMkBHgjOSWRVtbuYZjWsOliGokBpR2ZA0OqmYnrD7zBGnB/s
   +nDfIsawKjtvp32XW+1DcMyPxa5AUYAncQY3UmIjM9PuuYMKJo0swtEJ9
   A==;
X-CSE-ConnectionGUID: 8OGy0dBlQ7Kxtq1CMuSfUg==
X-CSE-MsgGUID: 7jASvwhiTgSYD5TJnVTQ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36299871"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36299871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 10:43:02 -0800
X-CSE-ConnectionGUID: Y1waHYzKQb6RdyFD0dZK4w==
X-CSE-MsgGUID: 3Pr9bHMRQV+9q6XVFIcx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103677851"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 10:42:59 -0800
Message-ID: <e181717a-8b3f-4ad4-b075-95c95888ce5c@linux.intel.com>
Date: Wed, 8 Jan 2025 20:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] xhci: introduce xhci->lost_power flag
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Roger Quadros <rogerq@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241210-s2r-cdns-v6-0-28a17f9715a2@bootlin.com>
 <20241210-s2r-cdns-v6-4-28a17f9715a2@bootlin.com>
 <70aced7f-0311-43b9-96af-c8325c39ff2b@kernel.org>
 <D6AP7JCNSME9.3FS7XCZJ37GM8@bootlin.com>
 <ed77988a-ba26-4a71-a8cf-b1e5a6425a2e@kernel.org>
 <D6F0L2L02YIS.3D2DW1P7691L4@bootlin.com>
 <D6WN0T0DLMFJ.30GP099520IHT@bootlin.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <D6WN0T0DLMFJ.30GP099520IHT@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8.1.2025 12.59, Théo Lebrun wrote:
> On Wed Dec 18, 2024 at 6:49 PM CET, Théo Lebrun wrote:
>> On Tue Dec 17, 2024 at 10:00 PM CET, Roger Quadros wrote:
>>> On 13/12/2024 18:03, Théo Lebrun wrote:
>>>> On Thu Dec 12, 2024 at 1:37 PM CET, Roger Quadros wrote:
>>>>> On 10/12/2024 19:13, Théo Lebrun wrote:
>>>>>> The XHCI_RESET_ON_RESUME quirk allows wrappers to signal that they
>>>>>> expect a reset after resume. It is also used by some to enforce a XHCI
>>>>>> reset on resume (see needs-reset-on-resume DT prop).
>>>>>>
>>>>>> Some wrappers are unsure beforehands if they will reset. Add a mechanism
>>>>>> to signal *at resume* if power has been lost. Parent devices can set
>>>>>> this flag, that defaults to false.
>>>>>>
>>>>>> The XHCI_RESET_ON_RESUME quirk still triggers a runtime_pm_get() on the
>>>>>> controller. This is required as we do not know if a suspend will
>>>>>> trigger a reset, so the best guess is to avoid runtime PM.
>>>>>>
>>>>>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>>>>>> ---
>>>>>>   drivers/usb/host/xhci.c | 3 ++-
>>>>>>   drivers/usb/host/xhci.h | 6 ++++++
>>>>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>>>>> index 5ebde8cae4fc44cdb997b0f61314e309bda56c0d..ae2c8daa206a87da24d58a62b0a0485ebf68cdd6 100644
>>>>>> --- a/drivers/usb/host/xhci.c
>>>>>> +++ b/drivers/usb/host/xhci.c
>>>>>> @@ -1017,7 +1017,8 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
>>>>>>   
>>>>>>   	spin_lock_irq(&xhci->lock);
>>>>>>   
>>>>>> -	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
>>>>>> +	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME ||
>>>>>> +	    xhci->broken_suspend || xhci->lost_power)
>>>>>>   		reinit_xhc = true;
>>>>>>   
>>>>>>   	if (!reinit_xhc) {
>>>>>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>>>>>> index 4914f0a10cff42dbc1448dcf7908534d582c848e..32526df75925989d40cbe7d59a187c945f498a30 100644
>>>>>> --- a/drivers/usb/host/xhci.h
>>>>>> +++ b/drivers/usb/host/xhci.h
>>>>>> @@ -1645,6 +1645,12 @@ struct xhci_hcd {
>>>>>>   	unsigned		broken_suspend:1;
>>>>>>   	/* Indicates that omitting hcd is supported if root hub has no ports */
>>>>>>   	unsigned		allow_single_roothub:1;
>>>>>> +	/*
>>>>>> +	 * Signal from upper stacks that we lost power during system-wide
>>>>>> +	 * suspend. Its default value is based on XHCI_RESET_ON_RESUME, meaning
>>>>>> +	 * it is safe for wrappers to not modify lost_power at resume.
>>>>>> +	 */
>>>>>> +	unsigned                lost_power:1;
>>>>>
>>>>> I suppose this is private to XHCI driver and not legitimate to be accessed
>>>>> by another driver after HCD is instantiated?
>>>>
>>>> Yes it is private.
>>>>
>>>>> Doesn't access to xhci_hcd need to be serialized via xhci->lock?
>>>>
>>>> Good question. In theory maybe. In practice I don't see how
>>>> cdns_host_resume(), called by cdns_resume(), could clash with anything
>>>> else. I'll add that to be safe.
>>>>
>>>>> Just curious, what happens if you don't include patch 4 and 5?
>>>>> Is USB functionality still broken for you?
>>>>
>>>> No it works fine. Patches 4+5 are only there to avoid the below warning.
>>>> Logging "xHC error in resume" is a lie, so I want to avoid it.
>>>
>>> How is it a lie?
>>> The XHCI controller did loose its save/restore state during a PM operation.
>>> As far as XHCI is concerned this is an error. no?
>>
>> The `xhci->quirks & XHCI_RESET_ON_RESUME` is exactly the same thing;
>> both the quirk and the flag we add have for purpose:
>>
>> 1. skipping this block
>>
>> 	if (!reinit_xhc) {
>> 		retval = xhci_handshake(&xhci->op_regs->status,
>> 					STS_CNR, 0, 10 * 1000 * 1000);
>> 		// ...
>> 		xhci_restore_registers(xhci);
>> 		xhci_set_cmd_ring_deq(xhci);
>> 		command = readl(&xhci->op_regs->command);
>> 		command |= CMD_CRS;
>> 		writel(command, &xhci->op_regs->command);
>> 		if (xhci_handshake(&xhci->op_regs->status,
>> 			      STS_RESTORE, 0, 100 * 1000)) {
>> 			// ...
>> 		}
>> 	}
>>
>> 2. avoiding this warning:
>>
>> 	xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
>>
>> I don't think the block skipped is important in resume duration (to be
>> confirmed). But the xhci_warn() is not desired: we do not want to log
>> warnings if we know it is expected.
>>
>> I'll think some more about it.
> 
> About this series, there were two discussions:
> 
>   - The desire to avoid putting the hardware init sequence of cdns3-ti
>     inside  runtime_resume() as we don't do runtime PM.
>     *That is fine and will be fixed for the next revision.*
>     See [PATCH V6 2/5]: https://lore.kernel.org/lkml/8a1ed4be-c41c-46b6-ae25-33a6035b8c8d@kernel.org/
> 
>   - [PATCH V6 4/5] and [PATCH V6 5/5] are dedicated to avoiding a warning
>     at XHCI resume on J7200:
> 
>        xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
> 

Adding a new quirk or private xhci_cd meme


>     https://lore.kernel.org/lkml/20241210-s2r-cdns-v6-4-28a17f9715a2@bootlin.com/
>     https://lore.kernel.org/lkml/20241210-s2r-cdns-v6-5-28a17f9715a2@bootlin.com/
> 
>     Roger Quadros asked if we should not instead keep it, as there is
>     indeed a reinit of the xHC block. I don't think we do: we don't want
>     a warning at resume; IMO it would imply the reinit was unexpected.
> 
>     Proof is there is already a platform with a ->broken_suspend boolean
>     that disables the warning even though there is a reinit. It doesn't
>     log a warning as the reinit was expected.
> 
>     So we currently have:
>      - xhci->broken_suspend: set at probe & implies the resume sequence
>        won't work.
>      - xhci->quirks & XHCI_RESET_ON_RESUME: set at probe & implies the
>        controller reset during suspend.
> 
>     IIUC xhci->broken_suspend is NOT equivalent to "the controller reset
>     during suspend". Else we wouldn't have both the broken_suspend flag
>     and the XHCI_RESET_ON_RESUME quirk.
> 
>     In our case we want exactly the same thing as the
>     XHCI_RESET_ON_RESUME quirk but updated at resume depending on what
>     the wrapper driver detects.
> 
>     We could either:
>     1. Update xhci->quirks at resume from upper layers.
>     2. Introduce a xhci->lost_power flag. It would be strictly equivalent
>        to the XHCI_RESET_ON_RESUME quirk BUT updated at resume from
>        upper layers.
> 
>     @Mathias Nyman: what is your thought on the matter? Option (2) was
>     the one taken in this series. Is there another option I am missing?

This would be a fourth way the upper layers inform xhci_resume() that the
xHC host should be reset instead of restoring the registers.

option 1 creates the first dynamic xhci->quirk flag,
option 2 adds a xhci->lost_power flag that is touched outside of xhci driver.

Neither seem like a good idea just to get rid of a dev_warn() message.

Maybe its time to split xhci_resume() into xhci_reset_resume()
and xhci_restore_resume(), and let those upper layers decide what they need.

Doesn't cdns driver already have a xhci_plat_priv resume_quirk() function
called  during xhci_plat_resume(), before xhci_resume()?
Can that be used?

Thanks
Mathias


