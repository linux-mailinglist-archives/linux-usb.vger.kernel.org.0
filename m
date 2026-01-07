Return-Path: <linux-usb+bounces-32016-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56730CFFBC8
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 20:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B598A302AAE7
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 19:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93813563E0;
	Wed,  7 Jan 2026 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIb4bIcq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E8533893A;
	Wed,  7 Jan 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804653; cv=none; b=lODyqHbCLcC8r984s3XkM1gmPw+BBQQtc1KWtjYLVYNkCiBJYMrCFizz2tKPyDS3OgFR68s0SXKPopgfyEldbZUHJvrmCBfSNQ2G2cEk/7QiYbHDKi/9fKnL4wELDcgmwunPeixG+U0j4g6zmev+DeJTZmbgwkhrEor5AHKgIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804653; c=relaxed/simple;
	bh=i/U5MZWtlXTGl/E8czaA+BEf0sT081SVk9J0XXvf3so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4pT5QqZxGj39fFEoV/++y2SOQHPXbe09C18Hiibrhs7+1Lzt7AKt+JDte8vXHYQrTriQtwxk2+IW9N+e1MLAPF+8zbkY6MuqtT4PW8kuQoPlftvj7gaHlImrn9EwTwayiCgMRHIAgQ1qlvOsTU+5r/ycPXAiveqZtJoG8ROhfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIb4bIcq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767804649; x=1799340649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i/U5MZWtlXTGl/E8czaA+BEf0sT081SVk9J0XXvf3so=;
  b=EIb4bIcqhWwicLnzDu91F9AIuUwHj7qCB3G1/a4MO12xwdVaoSp0ghqm
   7qsamt3rtZgBLQzMkXlr+dh05eeYZScq+aieQ6+vjq4xrxSTC9cq7yts2
   mrmQknRNm4jsMy2PElg/pA04CMlRhAVxTLNDfUXXG+u3TCsN+Bv1UcCjK
   IhEfk7BbKpwWz00LPax27TgnXZtlft8QSKIuOstFebHpUmDw8tgoGEnxy
   Rw5tewc68SnzL6WIwSC6mCD1+MiVu2tBnXM8jNUZz4PtInMbHVaV2gMRI
   z7T9yFn2AT8qEJ2ITsBC6MEPVUSY0icRp0pespIxnjnyrKwnpmtOcfpcV
   A==;
X-CSE-ConnectionGUID: b/VeXuZIQKuk1zsKqUusfw==
X-CSE-MsgGUID: /Scq98l3RxG/PeeHXpGhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94648347"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="94648347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:50:45 -0800
X-CSE-ConnectionGUID: kuTaT++hS2CJrN8LbpYrSQ==
X-CSE-MsgGUID: UG21bC86Rg2nnMWX/KkFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202588373"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.115]) ([10.245.245.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:50:43 -0800
Message-ID: <7631bc7d-e3b2-45b2-9b85-f03ed1d6b3cd@linux.intel.com>
Date: Wed, 7 Jan 2026 18:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: xhci: Skip configure EP for disabled slots
 during teardown
To: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
References: <20260105084805.2155251-1-udipto.goswami@oss.qualcomm.com>
 <5f0e0401-fc0b-4ac7-ab95-7f85e6677b86@linux.intel.com>
 <CAMTwNXDFM=csMEJ1ZhiTOeQ-dDH4eu4ze9XRFbSj0d-4Fxsp=g@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAMTwNXDFM=csMEJ1ZhiTOeQ-dDH4eu4ze9XRFbSj0d-4Fxsp=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/6/26 12:22, Udipto Goswami wrote:
> On Mon, Jan 5, 2026 at 4:32 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> Hi
>>
>> On 1/5/26 10:48, Udipto Goswami wrote:
>>> Consider a scenario when a HS headset fails resume and the hub performs
>>> a logical disconnect, the USB core tears down endpoints and calls
>>> hcd->check_bandwidth() on the way out, which with xHCI translates to a
>>> drop-only Configure Endpoint command (add_flags == SLOT_FLAG, drop_flags
>>> != 0). If the slot is already disabled (slot_id == 0) or the virtual
>>> device has been freed, issuing this Configure Endpoint command is
>>> pointless and may appear stuck until event handling catches up,
>>> causing unnecessary delays during disconnect teardown.
>>>
>>> Fix this by adding a check in xhci_check_bandwidth(), return success
>>> immediately if slot_id == 0 or vdev is missing, preventing the
>>> Configure Endpoint command from being queued at all. Additionally,
>>> in xhci_configure_endpoint() for drop-only Configure Endpoint operations,
>>> return success early if slot_id == 0 or vdev is already freed,
>>> avoiding spurious command waits.
>>>
>>> Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
>>
>> Makes sense to prevent unnecessary 'configure endpoint' commands
>>
>> Could you share more details how we end up tearing down endpoints and
>> calling xhci_check_bandwidth() after vdev is freed and slot_id set to zero?
>>
>> Did the whole xHC controller fail to resume and was reinitialized in
>> xhci_resume() power_lost path?
>>
>> Or is this related to audio offload and xhci sideband usage?
>>
>> If we end up in this situation in normal headset resume failure then there
>> might be something else wrong.
>>
> 
> Apologies! My mailbox was configured with HTML.
> Re-sending in plain text.
> 
> Hi Mathias,
> 
> Yes, we are using offloaded audio in this case and xhci-sideband is involved.
> 
> Scenario:
> The headset is connected to the platform with no active playback, so
> it suspends. No physical disconnect occurs.
> 
> 1. Audio DSP sends a playback request while the USB headset (device
> 1-1) is suspended
> 2. Resume chain is triggered:
>     handle_uaudio_stream_req
>     → enable_audio_stream
>     → snd_usb_autoresume
>     → dwc3-parent_wrapper (Qualcomm) → xhci → roothub → USB headset (1-1)
> 3. Resume fails at device 1-1:The headset fails to resume from
> suspend. Note that the xHCI controller itself resumes
> successfully—only the headset device fails.
> 4. Hub performs logical disconnect as a recovery mechanism
> 5. Race condition occurs: The USB core begins to teardown (calling
> 'check_bandwidth()'), but the xHCI driver may have already started
> freeing the slot due to the failed resume.
> 
> Two parallel paths:
> PATH1: (slower usb core teardown)
> 
> hub_port_connect_change()
> └─ Device resume fails
>     └─ hub_port_logical_disconnect()
>        └─ usb_disconnect()
>           └─ usb_disable_device()
>              ├─ usb_disable_endpoint() [for each endpoint]
>              │  └─ usb_hcd_disable_endpoint()
>              └─ usb_hcd_alloc_bandwidth()
>                 └─ usb_hcd_check_bandwidth()
>                    └─ xhci_check_bandwidth() ← POINT OF FAILURE
>                       └─ Tries to issue Configure Endpoint
>                          └─ But slot_id == 0 or virt_dev == NULL!
> 
> PATH2: (faster - xhci slot cleanup)
> hub_port_logical_disconnect()
> └─ usb_disconnect()
>     └─ usb_release_dev()
>        └─ usb_hcd_free_dev()
>           └─ xhci_free_dev()
>              └─ xhci_disable_slot()
>                 ├─ Issues TRB_DISABLE_SLOT command
>                 ├─ Waits for completion
>                 └─ xhci_free_virt_device()
>                    ├─ Sets udev->slot_id = 0
>                    ├─ Frees virt_dev
>                    └─ Sets xhci->devs[slot_id] = NULL
> 
> RACE TIMELINE:
> 
> Path 2 (fast)
>        Path 1 (slow)
> ─────────────────────────────────────────────────
> T1: xhci_free_dev() starts
> T2: xhci_disable_slot() issued
> T3: slot_id = 0
> T4: virt_dev freed
> usb_disable_endpoint()
> T5: xhci->devs[slot_id] = NULL                             (still processing...)
> T6:
>       xhci_check_bandwidth() ← RACE!
> T7:
>       Tries Configure Endpoint
> T8:
>       But slot is already freed!
> 
> Path 1 is slower because it must iterate through all endpoints,
> calling usb_disable_endpoint() for each one before reaching
> check_bandwidth().
> Path 2 completes faster with a single disable slot command. So if
> T3-T5 has already executed, meaning tthe slot has already freed then
> configure endpoint commands can be skipped i.e T6-T8.
> Please let me know if this makes sense ?

Thanks, well explained and nicely laid out.

There is something still odd in this scenario.

There shouldn't be two racing paths as both cases should be handled by
the hub work 'thread' that only has one active work item.

If resume fails then hub_port_logical_disconnect() is called and marks the device
as "USB_STATE_NOTATTACHED", and adds a change_bit for the port.
hub work should take over from there.

hub work should then do:
hub_event()
   port_event(hub, i);    // because hub->change_bit is set for this port
     hub_port_connect_change()
       hub_port_connect()
         if (udev)
           usb_disconnect()
             usb_disable_device()  //children first
               usb_disable_device_endpoints()  // for each endpoint
                 usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
                   hcd->driver->check_bandwidth()  // does all the configure endpoint commands
             device_del(&udev->dev);
             hub_free_dev(udev)
               hcd->driver->free_dev(hcd, udev);  // clears virt_dev and slot_id here
             put_device(&udev->dev);

To me this looks like driver->check_bandwitdth() is called before driver->free_dev().
  
Thanks
Mathias


