Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB9F213D0D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 17:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGCP44 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 11:56:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:16636 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCP4z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 11:56:55 -0400
IronPort-SDR: jdbYWZoBeeJdgxJ0XhSD273XNFv2QxHsPtuMxZS0RP42eC/RuwBQtWgGe+ado8NtE3NGf/QMlM
 uJjW34VutbIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9671"; a="148687117"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="148687117"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 08:56:54 -0700
IronPort-SDR: /uZiW6UkDkGdcjkK2rbWDnB+j55RFn17OHeiv1E8zTcbUIoDVvH7FmwjSmE8sq0F0NkDaLQd4h
 728JU0Cvadog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="313349728"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2020 08:56:53 -0700
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 4 comp_code 1
To:     David Heinzelmann <heinzelmann.david@gmail.com>
Cc:     Fabian Melzow <fabian.melzow@gmail.com>, linux-usb@vger.kernel.org
References: <20200620211913.1535bac0@ping>
 <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
 <20200630185803.2a72c123@ping>
 <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
 <20200701091755.GA17742@dhe>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <b9a837bc-b962-d868-1ac1-5e4c934da3a3@linux.intel.com>
Date:   Fri, 3 Jul 2020 19:00:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200701091755.GA17742@dhe>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1.7.2020 12.17, David Heinzelmann wrote:
> On Tue, Jun 30, 2020 at 10:03:29PM +0300, Mathias Nyman wrote:
>> On 30.6.2020 19.58, Fabian Melzow wrote:
>>> Hi!
>>>
>>> Am Mon, 29 Jun 2020 20:47:24 +0300
>>> schrieb Mathias Nyman <mathias.nyman@linux.intel.com>:
>>>
>>>> First issue I see is that the attempt to recover from a transaction
>>>> error with a soft retry isn't working. We expect the hardware to
>>>> retry the transfer but nothing seems to happen. Soft retry is
>>>> described in xhci specs 4.6.8.1 and is basically a reset endpoint
>>>> command with TSP set, followed by ringing the endpoint doorbell.
>>>> Traces indicate driver does this correctly but hardware isn't
>>>> retrying. We get don't get any event, no error, success or stall.
>>>>
>>>> This could be hardware flaw.
>>>> Any chance you could try this on a xHC from some other vendor?
>>>
>>> There is no other xHC hardware available to me.
>>>
>>>> Second issue is a driver flaw, when nothing happened for 20 seconds
>>>> we see the URB is canceled. xhci driver needs to stop then endpoint
>>>> to cancel the URB, but there is a hw race and endpoint ends up halted
>>>> instead of stopped. The xhci driver can't handle a halted endpoint in
>>>> its stop endpoint handler properly, and the URB is never actually
>>>> removed from the ring.
>>>>
>>>> The reason you see the IO_PAGE_FAULT is probably because once the
>>>> ring starts running the driver will handle the cancelled URB, and
>>>> touch already freed memory: AMD-Vi: Event logged [IO_PAGE_FAULT
>>>> domain=0x000d address=0xdc707028 flags=0x0020]
>>>>
>>>> I have a patch for this second case, I haven't upstreamed it as it
>>>> got some conflicting feedback earlier. It won't solve the 20 second
>>>> delay, but should solve the the IO_PAGE_FAULT and the "WARN Set TR
>>>> Deq Ptr cmd failed due to incorrect slot or ep state" message
>>>>
>>>> Can you try it out?
>>>
>>> I successful applied the patch against Linux 5.7.4, but get this error when
>>> compiling drivers/usb/host/xhci-ring.c:
>>>
>>>   CC [M]  drivers/usb/host/xhci-ring.o
>>> drivers/usb/host/xhci-ring.c: In function ‘xhci_handle_cmd_stop_ep’:
>>> drivers/usb/host/xhci-ring.c:857:3: error: implicit declaration of function ‘xhci_reset_halted_ep’ [-Werror=implicit-function-declaration]
>>>   857 |   xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type);
>>>       |   ^~~~~~~~~~~~~~~~~~~~
>>>
>>
>> Right, forgot that you need another patch before this.
>>
>> both patches attached, also applied to 5.8-rc1 in branch "fix_invalid_context_at_stop_endpoint"
>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint
>>
>> -Mathias
>>
> 
> Hi,
> 
> I've been investigating what appears to be an identical problem recently which I think is related
> to the description from xhci 4.6.9. I have an fx2 device which stalls its endpoint while at the
> same time the URBs are aborted from the software.
> 
> Kernel logs which occured when the xhci driver is stucked at the halted endpoint.
> 
> Jun 29 17:27:12 dhe-pc kernel: xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
> Jun 29 17:27:12 dhe-pc kernel: xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
> Jun 29 17:27:12 dhe-pc kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> Jun 29 17:27:21 dhe-pc kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 6
> Jun 29 17:27:21 dhe-pc kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 00000001173dc630 trb-start 00000001173dcc30 trb-end 0000000000000000 seg-start 00000001173dc000 seg-end 00000001173dcff0
> Jun 29 17:27:21 dhe-pc kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 00000001173dc630 trb-start 0000000116e53000 trb-end 0000000116e53830 seg-start 0000000116e53000 seg-end 0000000116e53ff0
> 
> I have applied your patch to kernel version 5.8-rc3 and I can confirm that the patch solves
> my problem for the halted endpoint.
> 
> I still get the following error messages from time to time.
> 
> Jul 01 09:56:56 dhe kernel: xhci_hcd 0000:00:14.0: WARN Event TRB for slot 11 ep 4 with no TDs queued?
> Jul 01 09:56:56 dhe kernel: xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
> Jul 01 09:56:56 dhe kernel: xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
> 
> or
> 
> Jul 01 10:09:27 dhe kernel: xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
> Jul 01 10:09:27 dhe kernel: xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
> Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 13
> Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66d90 trb-start 0000000473d66e70 trb-end 0000000000000000 seg-start 0000000473d66000 seg-end 0000000473d66ff0
> Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66d90 trb-start 0000000473d65000 trb-end 0000000473d65a70 seg-start 0000000473d65000 seg-end 0000000473d65ff0
> Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 13
> Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66e60 trb-start 0000000473d66e70 trb-end 0000000000000000 seg-start 0000000473d66000 seg-end 0000000473d66ff0
> Jul 01 10:09:29 dhe kernel: xhci_hcd 0000:00:14.0: Looking for event-dma 0000000473d66e60 trb-start 0000000473d65000 trb-end 0000000473d65a70 seg-start 0000000473d65000 seg-end 0000000473d65ff0
> 
> but the core problem that the xhci is stucked at the halted endpoint state does not occur anymore.
> If you are interested in more detailed debug logs I can provide them.

Thanks, that could be useful and interesting, this is hard issue for me reproduce
I'll however be away for next couple of weeks.I can look at this in more detail when I get back

-Mathias
