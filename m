Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEDBBB2B5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 13:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732191AbfIWLRM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 07:17:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:35496 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730155AbfIWLRM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 07:17:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 04:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; 
   d="scan'208";a="188114173"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2019 04:17:09 -0700
Subject: Re: Event ring is full when do iozone test on UAS storage
To:     Suwan Kim <suwan.kim027@gmail.com>,
        Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190916094305.GB21844@b29397-desktop>
 <0aae13f2-04cf-f45a-e6ee-4bf9e515faba@linux.intel.com>
 <CAL411-oirjSLZzwoN8axqpfn-JQ8eEGMWD-w9p24Krap+dPs9g@mail.gmail.com>
 <92a09240-6489-b405-7916-26a77f2e0b06@linux.intel.com>
 <CAL411-p5TPHtBTe2cVtPsX07LhjeHw19qLjxz_XOXigEfG7_DQ@mail.gmail.com>
 <20190919135935.GA3133@localhost.localdomain>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <e9090913-3ef8-5211-8f70-550df5dbe7ec@linux.intel.com>
Date:   Mon, 23 Sep 2019 14:19:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919135935.GA3133@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19.9.2019 16.59, Suwan Kim wrote:
> On Thu, Sep 19, 2019 at 05:54:25PM +0800, Peter Chen wrote:
>>> On 17.9.2019 12.55, Peter Chen wrote:
>>>>>>
>>>>>> I met "event ring full error" like below, this error is met when
>>>>>> I do iozone test on UAS storage at v4.19.35 kernel, but not meet
>>>>>> this error at linux-next tree (08/24). The same host and test
>>>>>> UAS storage device are used. This issue is due to xhci_handle_event
>>>>>> does not return 0 long time, maybe the xHC speed is fast enough
>>>>>> at that time. If I force the xhci_handle_event only run 100 times
>>>>>> before update ERST dequene pointer, it will not occur this error.
>>>>>> I did not  see any changes for xhci_handle_event at the latest code,
>>>>>> so in theory, it should have this issue too. Do you think if we need
>>>>>> to improve xhci_handle_event to avoid event ring?
>>>>>
>>>> The root cause is UAS protocol is very fast
>>>> protocol, the
>>>> other threads at non-CPU0 will add TRBs during we are handling event, so if
>>>> hardware (xHC) has always consumed TD the non-CPU0s are adding,
>>>> the ERST dequene pointer never get change to update, then this
>>>> "event ring full" error will occur.
>>>>
>>>> The one reason why v4.19 has this issue is the max request length is larger
>>>> than the latest kernel. At v4.19, it is 512KB, At the latest kernel,
>>>> it is 256 KB.
>>>> see /sys/block/sda/queue/max_sectors_kb.
>>>> When I change max_sectors_kb as smaller value, the test will be more smooth.
>>>> Besides, At v4.19, the UAS completion handler seems take more time
>>>> compares to the latest kernel.
>>>>
>>>> I suggest adding threshold flag for event ring when it closes to full
>>>> since we can't
>>>> avoid USB3 use cases when the throughput is high, but the system is a
>>>> little slow.
>>>> Do you agree?
>>>
>>> I agree that it makes sense to force a ERDP write after handling some amount
>>> of events, it can solve some event ring full issues, but not the fact that
>>> we spend a lot of time in the interrupt handler.
>>
>> Ok, I will proposal one patch to fix event ring full issue.

Great

>>
>>>
>>> Your logs show that you have TDs containing up to 128 TRBs.
>>> When a TD like that finishes the driver will increase the sw dequeue pointer of the
>>> transfer ring one by one until we reach the end of the TD.
>>>
>>> This means we call inc_deq() function 128 times in interrupt context, and each time
>>> do a few comparisons. According to traces this takes ~120us. There might be some
>>> tracing overhead but this could anyway be done in a saner way.
>>>
>>> I'll look into this
>>>
>>
>> Since we use hard irq for xHCI, for high performance protocol, it may hard to
>> reduce interrupt context time since we have lots of request handling,
>> cache operation,
>> and completion are interrupt context.

I'm working on one improvement at the moment, it would be great if you could test
it out once i get it done.

>>
>>> Other things to consider in addition to writing ERDP and fixing the inc_dec() loop is
>>> increasing event ring size (adding more than current 1 segment), and support giving
>>> back URBs in tasklet by adding the HCD_BH flag to xhci hcd.
>>>
>>
>> So, Mathias, which solutions do you prefer:
>> - One way to quit xhci_handle_event if there are enough events have handled
>> - Change giveback as bottom half
> 

I think it makes sense to add all patches.

Two that reduces time spent in interrupt handler, and thus makes it less likely to
trigger the event ring full issue. This would be the "giving back urb in tasklet"
patch by Suwan Kim, and my loop removal patch. These make sense anyway even without
the event ring full issue.

And that one Peter suggested which writes back the ERDP if some limit of consecutive
event were handled, this will prevent most of event ring full issues, not related to
time spent in interrupt handler. There is probably no need to exit interrupt handler
with this solution, just make sure the ERDP gets written back every now and then.

> Hi Peter and Mathias,
> 
> Please consider the patch that deals with the bottom half of
> xhci.
> 
> 	https://patchwork.kernel.org/patch/10880073/
> 
> I think it is better to use tasklet as bottom half in xhci because
> HCD layer supports tasklet bottom half and other host controller
> dirvers use this feature to defer URB processing.
> 
> Moreover, some devices (1Gbit USB ethernet controller) can show
> improved performance with tasklet bottom half in xhci.
> 

Yes, this is the patch I have in mind, I have it in a internal
branch where it gets some testing exposure. So far it hasn't triggered any new issues.

-Mathias
