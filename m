Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541AE27B847
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 01:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgI1XfO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 19:35:14 -0400
Received: from mga18.intel.com ([134.134.136.126]:61329 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbgI1XfO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 19:35:14 -0400
IronPort-SDR: MGeoCIzLjvFhVok5WuJvBbns8vFZ1AhFkvy9U0CK3YY2MsWdH0Q87cmRI2ravQ54vb5iEALUYt
 wVWnMdze9fGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149849277"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="149849277"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 15:32:00 -0700
IronPort-SDR: QjVJObmnKXsPIn06zvMEToC4tokZ7+Q2yYALuttP7uGtfqx4A4r02IMM/DcIYKDd2rnBTKCZm3
 ZQQJYRXmN/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="457017745"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2020 15:31:58 -0700
Subject: Re: xhci problem -> general protection fault
To:     Ross Zwisler <zwisler@google.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
Date:   Tue, 29 Sep 2020 01:35:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200925210517.GA4487@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.9.2020 0.05, Ross Zwisler wrote:
> On Fri, Sep 25, 2020 at 04:40:29PM +0300, Mathias Nyman wrote:
>> On 18.9.2020 17.20, Andrzej Pietrasiewicz wrote:
>>> Hi Mathias,
>>>
>>> W dniu 18.09.2020 o 12:50, Mathias Nyman pisze:
>>>> On 17.9.2020 18.30, Andrzej Pietrasiewicz wrote:
>>>>> Dear All,
>>>>>
>>>>> I have encountered a problem in xhci which leads to general protection fault.
>>>>>
>>>>> The problem is triggered by running this program:
>>>>>
>>>>> https://gitlab.collabora.com/andrzej.p/bulk-cancel.git
>>>>>
>>>>> $ sudo ./bulk-cancel -D /dev/bus/usb/002/006 -i 1 -b 1
>>>>>
>>>>> where /dev/bus/usb/002/006 is a Gadget Zero:
>>>>>
>>>>> It takes less than a minute until the crash happens.
>>>>> The DMAR (iommu) errors don't happen always, i.e. there are crashes
>>>>> when they are not reported in the system log. In either case the
>>>>>
>>>>> "WARN Cannot submit Set TR Deq Ptr"
>>>>> "A Set TR Deq Ptr command is pending."
>>>>> "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."
>>>>>
>>>>> messages do appear.
>>>>>
>>>>
>>>> Nice testcase and report, thanks.
>>>>
>>>> I started looking at issues in this area some time ago, and wrote a couple patches but
>>>> it was left hanging. The two patches (now rebased on 5.9-rc3) can be found in my tree in the
>>>> fix_invalid_context_at_stop_endpoint branch
>>>>
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_invalid_context_at_stop_endpoint
>>>>
>>>> If you could give those a try and see if they help I'd be grateful.
>>>
>>> No, it doesn't help, albeit the errors are slightly different:
>>>
>>> xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
>>> xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
>>> dmar_fault: 44 callbacks suppressed
>>> DRHD: handling fault status reg 3> DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffcda000 [fault reason 05] PTE Write access is not set
>>> DMAR: DRHD: handling fault status reg 3
>>
>> Ok, thanks, the DMA problems make sense to me now.
>>
>> If a transfer ring stops on a transfer request (TRB) that should be canceled (manual cancel,
>> or error) it's not enough to just turn the  TRB to a no-op.
>> HW has most likely cached the TRB, and we need to move the transfer ring dequeue pointer past this TRB.
>> Moving deq also clears controller cache.
>>
>> We do all this, but if we fail to queue the Set TR Deq command the TRB (with DMA  pointers) will stay on the ring,
>> and controller will access the TRB DMA  address once it continues running. At this point xhci driver has already
>> given back the canceled/erroneous TRB, and is probably unmapped already.
>> Hence the DMAR entries.  
>>
>> Looks like this part of the code needs a more extensive rewrite, on top of this we are not handling
>> races between endpoints halted due errors, and endpoints stopped by driver to cancel URBs. 
>>
>> -Mathias
> 
> I'm chasing a similar problem which is also most easily reproduced using
> Andrzej's bulk-cancel program, though we have seen it in the field many times
> as well with normal usage.
> 
> The symptom is that we get the following errors in dmesg:
> 
>  xhci_hcd 0000:00:14.0: Mismatch between completed Set TR Deq Ptr command & xHCI internal state.
>  xhci_hcd 0000:00:14.0: ep deq seg = 000000001141d6a0, deq ptr = 00000000ebd28dcf
>  xhci_hcd 0000:00:14.0: WARNING: Host System Error
>  DMAR: DRHD: handling fault status reg 2
>  DMAR: [DMA Read] Request device [00:14.0] PASID ffffffff fault addr 0 [fault reason 06] PTE Read access is not set
>  xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint command.
>  xhci_hcd 0000:00:14.0: USBSTS: HCHalted HSE EINT
>  xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
>  xhci_hcd 0000:00:14.0: HC died; cleaning up
> 
> The xhci USB stack loses all attached devices, and on my system at least has
> only been recoverable by rebooting.
> 
> Full dmesg and trace after 'echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable'
> can be found here:
> 
> https://gist.github.com/rzwisler/531b926e3d160609ead371c23fc15b55
> https://gist.github.com/rzwisler/4621f805737993fec30b5ae23bfd8289
> 
> One interesting bit from the trace is that we observe the ep_ctx->deq pointer
> being 0 in xhci_handle_cmd_set_deq():
> 
>  xhci_inc_enq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe090(0x00000000ffffe000) segs 1 stream 0 free_trbs 251 bounce 0 cycle 0
>  xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
>  xhci_urb_giveback: ep7in-bulk: urb 000000003c80b7a8 pipe 3221455744 slot 2 length 0/256 sgs 0/0 stream 0 flags 00010200
>  xhci_inc_deq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe0a0(0x00000000ffffe000) segs 1 stream 0 free_trbs 252 bounce 0 cycle 0
>  xhci_inc_deq: EVENT 00000000b5c6e6a2: enq 0x00000000ffffc000(0x00000000ffffc000) deq 0x00000000ffffc1b0(0x00000000ffffc000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
>  xhci_handle_event: EVENT: TRB 00000000ffffe0a0 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
>  xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff296a1 stream 0 slot 4 ep 3 flags c
>  xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 13/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 4 State configured
>  xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 64 deq 0000000000000000 avg trb len 0
> 																	  ^^^^^^^^^^^^^^^^^^^^
>  xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @00000000
> 						     ^^^^^^^^^^^^^^^
> 
> In successful completions they are real values:
> 
>  xhci_ring_ep_doorbell: Ring doorbell for Slot 4 ep1in
>  xhci_inc_deq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe0b0(0x00000000ffffe000) segs 1 stream 0 free_trbs 253 bounce 0 cycle 0
>  xhci_inc_deq: EVENT 00000000b5c6e6a2: enq 0x00000000ffffc000(0x00000000ffffc000) deq 0x00000000ffffc1c0(0x00000000ffffc000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
>  xhci_handle_event: EVENT: TRB 00000000ffffe0b0 status 'Success' len 0 slot 2 ep 0 type 'Command Completion Event' flags e:C
>  xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff86551 stream 0 slot 2 ep 15 flags c
>  xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 11/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 2 State configured
>  xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 16 deq 00000000fff86551 avg trb len 0
> 																	  ^^^^^^^^^^^^^^^^^^^^
>  xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @fff86550
> 						     ^^^^^^^^^^^^^^^
> 
> I've noticed that I have to have CONFIG_INTEL_IOMMU_DEFAULT_ON=y for this
> clean repro case, else the system still fails but I don't always (ever?) see
> the failure to read at address 0.  
> 
> Mathias, do you think that your above explanation also covers my failure case?  
> Are we just failing to enqueue a Set TR Deq command, and the HC is processing
> a stale TRB?  Or does the fact that ep_ctx->deq == 0 not fit with that
> explanation?

The ep_ctx->deq == 0 is very odd. 
The Set TR Deq command looks correct when it was queued:
77.313308: xhci_queue_trb: CMD: Set TR Dequeue Pointer Command: deq 00000000fff296a1 stream 0 slot 4 ep 3 flags c

and the command TRB was intact still when the command completed:
77.313318: xhci_handle_event: EVENT: TRB 00000000ffffe0a0 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
77.313318: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff296a1 stream 0 slot 4 ep 3 flags c
77.313318: xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 13/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 4 State configured

But when we read the deq ptr from the endpoint (output) context it's suddenly 0
77.313318: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 64 deq 0000000000000000 avg trb len 0

On a successful Set TR Deq command the xHC controller should "Copy the value of
the New TR Dequeue Pointer field in the Set TR Dequeue Pointer TRB to the 
TR Dequeue Pointer field of the target Endpoint or Stream Context." xhci 4.6.10

The xHC controller starts reading TRBs from the deq ptr address (0 in this case)
which explains the DMAR entries, and possibse the Host System Error (HSE)

> 
> Other tidbits that I've disovered along the way:
> 
> 1) We first started noticing this in the field with v4.19 based kernels, but
>    I've been able to reproduce it using bulk-cancel with a v4.18 kernel
>    without much trouble, so I'm pretty sure it's an old issue.
> 
> 2) This definitely looks like a race which is very sensitive to timing.  If I
>    put a single trace_printk() line in xhci_handle_cmd_set_deq() function, the
>    issue is 10x harder to repro (on average 3 seconds to on average 30
>    seconds).  Similarly, when we turned on tracing in the field to try and get
>    logs the issue reproduces much less frequently.  I also tried to bisect,
>    and it turns out that whether or not it reproduced on my system with older
>    kernels was dependent on how tracing functions were inlined (!!).
> 
>    I think that we started seeing this in the field with v4.19 based kernels
>    purely because of a timing change.
> 
> 3) I did run with your patches from
>    https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_invalid_context_at_stop_endpoint
>    and it didn't change anything for me.
> 
> I'm reading up more on xhci and trying to understand this race, but would
> appreciate any help or direction that you're able to provide.

The race I was referring to is if a driver issues a "Stop endpoint" command,
and it races with an endpoint error/halt initiated by the xHC controller. 

The additional note in xhci 4.6.9 - Stop Endpoint, explains it:
"Note: A Busy endpoint may asynchronously transition from the Running to the Halted
or Error state due to error conditions detected while processing TRBs. A possible
race condition may occur if software, thinking an endpoint is in the Running state,
issues a Stop Endpoint Command however at the same time the xHC
asynchronously transitions the endpoint to the Halted or Error state. In this case,
a Context State Error may be generated for the command completion. Software
may verify that this case occurred by inspecting the EP State for Halted or Error
when a Stop Endpoint Command results in a Context State Error."

There are several context state errors in your trace.

Thanks
-Mathias

