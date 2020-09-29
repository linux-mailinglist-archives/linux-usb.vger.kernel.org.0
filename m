Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9635327BD98
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 09:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727622AbgI2HKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 03:10:18 -0400
Received: from mga05.intel.com ([192.55.52.43]:10159 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727530AbgI2HKO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 03:10:14 -0400
IronPort-SDR: 5/4oYCNjNlaqU7vfsjTfeoSEoMzG/Z1PCtdXdAreNh0dR77Gk9A2eNYnaIjGfdmCyJsujEFQOv
 9pN2UPAPMP2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="246865974"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="246865974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 00:10:10 -0700
IronPort-SDR: ITYNdHqP8W7kUfmWOeUqHgQy9lKPT2LfPVMJfKoVTCnCg8+fthlScUejEHTXIeAKuHulBbIhvc
 GsRQ8VvAabuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="457161011"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 29 Sep 2020 00:10:08 -0700
Subject: Re: xhci problem -> general protection fault
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Ross Zwisler <zwisler@google.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
 <5ec81b1e-2139-7fb9-f08e-240309ca5ccd@collabora.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <501d5a6c-0588-1d0b-17cd-7544932f72a4@linux.intel.com>
Date:   Tue, 29 Sep 2020 10:13:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5ec81b1e-2139-7fb9-f08e-240309ca5ccd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 28.9.2020 16.32, Andrzej Pietrasiewicz wrote:
> Hi Ross, hi Mathias,
> 
> W dniu 25.09.2020 o 23:05, Ross Zwisler pisze:
>> On Fri, Sep 25, 2020 at 04:40:29PM +0300, Mathias Nyman wrote:
>>> On 18.9.2020 17.20, Andrzej Pietrasiewicz wrote:
>>>> Hi Mathias,
>>>>
>>>> W dniu 18.09.2020 o 12:50, Mathias Nyman pisze:
>>>>> On 17.9.2020 18.30, Andrzej Pietrasiewicz wrote:
>>>>>> Dear All,
>>>>>>
>>>>>> I have encountered a problem in xhci which leads to general protection fault.
>>>>>>
>>>>>> The problem is triggered by running this program:
>>>>>>
>>>>>> https://gitlab.collabora.com/andrzej.p/bulk-cancel.git
>>>>>>
>>>>>> $ sudo ./bulk-cancel -D /dev/bus/usb/002/006 -i 1 -b 1
>>>>>>
>>>>>> where /dev/bus/usb/002/006 is a Gadget Zero:
>>>>>>
>>>>>> It takes less than a minute until the crash happens.
>>>>>> The DMAR (iommu) errors don't happen always, i.e. there are crashes
>>>>>> when they are not reported in the system log. In either case the
>>>>>>
>>>>>> "WARN Cannot submit Set TR Deq Ptr"
>>>>>> "A Set TR Deq Ptr command is pending."
>>>>>> "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."
>>>>>>
>>>>>> messages do appear.
>>>>>>
>>>>>
>>>>> Nice testcase and report, thanks.
>>>>>
>>>>> I started looking at issues in this area some time ago, and wrote a couple patches but
>>>>> it was left hanging. The two patches (now rebased on 5.9-rc3) can be found in my tree in the
>>>>> fix_invalid_context_at_stop_endpoint branch
>>>>>
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_invalid_context_at_stop_endpoint
>>>>>
>>>>> If you could give those a try and see if they help I'd be grateful.
>>>>
>>>> No, it doesn't help, albeit the errors are slightly different:
>>>>
>>>> xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
>>>> xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
>>>> dmar_fault: 44 callbacks suppressed
>>>> DRHD: handling fault status reg 3> DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffcda000 [fault reason 05] PTE Write access is not set
>>>> DMAR: DRHD: handling fault status reg 3
>>>
>>> Ok, thanks, the DMA problems make sense to me now.
>>>
>>> If a transfer ring stops on a transfer request (TRB) that should be canceled (manual cancel,
>>> or error) it's not enough to just turn the  TRB to a no-op.
>>> HW has most likely cached the TRB, and we need to move the transfer ring dequeue pointer past this TRB.
>>> Moving deq also clears controller cache.
>>>
>>> We do all this, but if we fail to queue the Set TR Deq command the TRB (with DMA  pointers) will stay on the ring,
>>> and controller will access the TRB DMA  address once it continues running. At this point xhci driver has already
>>> given back the canceled/erroneous TRB, and is probably unmapped already.
>>> Hence the DMAR entries.
>>>
>>> Looks like this part of the code needs a more extensive rewrite, on top of this we are not handling
>>> races between endpoints halted due errors, and endpoints stopped by driver to cancel URBs.
>>>
>>> -Mathias
>>
>> I'm chasing a similar problem which is also most easily reproduced using
>> Andrzej's bulk-cancel program, though we have seen it in the field many times
>> as well with normal usage.
>>
>> The symptom is that we get the following errors in dmesg:
>>
>>   xhci_hcd 0000:00:14.0: Mismatch between completed Set TR Deq Ptr command & xHCI internal state.
>>   xhci_hcd 0000:00:14.0: ep deq seg = 000000001141d6a0, deq ptr = 00000000ebd28dcf
>>   xhci_hcd 0000:00:14.0: WARNING: Host System Error
>>   DMAR: DRHD: handling fault status reg 2
>>   DMAR: [DMA Read] Request device [00:14.0] PASID ffffffff fault addr 0 [fault reason 06] PTE Read access is not set
>>   xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint command.
>>   xhci_hcd 0000:00:14.0: USBSTS: HCHalted HSE EINT
>>   xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
>>   xhci_hcd 0000:00:14.0: HC died; cleaning up
>>
>> The xhci USB stack loses all attached devices, and on my system at least has
>> only been recoverable by rebooting.
>>
>> Full dmesg and trace after 'echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable'
>> can be found here:
>>
>> https://gist.github.com/rzwisler/531b926e3d160609ead371c23fc15b55
>> https://gist.github.com/rzwisler/4621f805737993fec30b5ae23bfd8289
>>
>> One interesting bit from the trace is that we observe the ep_ctx->deq pointer
>> being 0 in xhci_handle_cmd_set_deq():
>>
>>   xhci_inc_enq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe090(0x00000000ffffe000) segs 1 stream 0 free_trbs 251 bounce 0 cycle 0
>>   xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
>>   xhci_urb_giveback: ep7in-bulk: urb 000000003c80b7a8 pipe 3221455744 slot 2 length 0/256 sgs 0/0 stream 0 flags 00010200
>>   xhci_inc_deq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe0a0(0x00000000ffffe000) segs 1 stream 0 free_trbs 252 bounce 0 cycle 0
>>   xhci_inc_deq: EVENT 00000000b5c6e6a2: enq 0x00000000ffffc000(0x00000000ffffc000) deq 0x00000000ffffc1b0(0x00000000ffffc000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
>>   xhci_handle_event: EVENT: TRB 00000000ffffe0a0 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
>>   xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff296a1 stream 0 slot 4 ep 3 flags c
>>   xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 13/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 4 State configured
>>   xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 64 deq 0000000000000000 avg trb len 0
>>                                                                       ^^^^^^^^^^^^^^^^^^^^
>>   xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @00000000
>>                              ^^^^^^^^^^^^^^^
>>
>> In successful completions they are real values:
>>
>>   xhci_ring_ep_doorbell: Ring doorbell for Slot 4 ep1in
>>   xhci_inc_deq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe0b0(0x00000000ffffe000) segs 1 stream 0 free_trbs 253 bounce 0 cycle 0
>>   xhci_inc_deq: EVENT 00000000b5c6e6a2: enq 0x00000000ffffc000(0x00000000ffffc000) deq 0x00000000ffffc1c0(0x00000000ffffc000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
>>   xhci_handle_event: EVENT: TRB 00000000ffffe0b0 status 'Success' len 0 slot 2 ep 0 type 'Command Completion Event' flags e:C
>>   xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff86551 stream 0 slot 2 ep 15 flags c
>>   xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 11/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 2 State configured
>>   xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 16 deq 00000000fff86551 avg trb len 0
>>                                                                       ^^^^^^^^^^^^^^^^^^^^
>>   xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @fff86550
>>                              ^^^^^^^^^^^^^^^
>>
>> I've noticed that I have to have CONFIG_INTEL_IOMMU_DEFAULT_ON=y for this
>> clean repro case, else the system still fails but I don't always (ever?) see
>> the failure to read at address 0.
>>
>> Mathias, do you think that your above explanation also covers my failure case?
>> Are we just failing to enqueue a Set TR Deq command, and the HC is processing
>> a stale TRB?  Or does the fact that ep_ctx->deq == 0 not fit with that
>> explanation?
>>
> 
> From the logs from Ross it seems that the direct cause of the HC dying
> is Stop Endpoint not completing and, consequently, timing out.
Stop endpoint command does not complete due to the 'catastrophic' HSE 
(host system error) which stops the controller completely. 

I'd guess the HSE is related to the zeroed dequeue pointer.

> 
> In the xHCI spec, section "4.6.9 Stop Endpoint" we can read:
> 
> "Note that when an endpoint is stopped, the xHC maintains the state
> necessary to restart the last active Transfer Ring where it left off,
> however software may not want to do this. The options are discussed below:
> 
> 1. Temporarily Stop Transfer Ring Activity - [...]
> 
> 2. Aborting a Transfer - If, because of a timeout or other reason, software
> issued the Stop Endpoint Command to abort the current TD. Then the
> Set TR Dequeue Pointer Command may be used to force the xHC to
> dump any internal state that it has for the ring and restart activity at the
> new Transfer Ring location specified by the Set TR Dequeue Pointer Command."
> 
> If bulk-cancel reproducer is used then the software's intention is definitely
> to abort a transfer, so indeed a Set TR Dequeue Pointer is needed.
> 
> On the other hand, in that same spec, in "4.6.10 Set TR Dequeue Pointer"
> we read:
> 
> "This command may be executed only if the target endpoint is in the Error
> or Stopped state."
> 
> My question is: why in the crash scenario Ross describes "Set TR Dequeue
> Pointer" is being carried out while Stop Endpoint has not been completed
> (and timed out instead)?

Every time a URB is canceled the xhci driver will queue a "stop endpoint command"
if there isn't one already pending. 
The Set TR Dequeue command you see is probably for the previous URB, while the stop is
for the next URB. 
 Andrzej, any change of getting traces from your case? They would tell more than just
the dynamic debug.

Thanks
-Mathias
