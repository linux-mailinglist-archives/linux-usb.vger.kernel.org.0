Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D497BB204
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407624AbfIWKOA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:14:00 -0400
Received: from mga18.intel.com ([134.134.136.126]:40696 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406278AbfIWKN7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 06:13:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 03:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; 
   d="scan'208";a="188100580"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2019 03:13:56 -0700
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     alex zheng <tc0721@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, xiaowei.zheng@dji.com
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com>
 <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com>
Date:   Mon, 23 Sep 2019 13:15:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.9.2019 10.08, alex zheng wrote:
> Hi, balbi,
> 
> Thank you for your reply~
> 
> Felipe Balbi <felipe.balbi@linux.intel.com> 于2019年9月23日周一 下午1:36写道：
>>
>>
>> Hi,
>>
>> (it helps when you Cc correct maintainers ;-)
>>
>> alex zheng <tc0721@gmail.com> writes:
>>
>>> Hi all,
>>>
>>> I am a user of dwc3 USB host controller, I found there are some
>>> confused behavior of trb event on this controller.
>>> When I run a raw USB data transfer(run bulk in&out transfer with
>>> libusb) and iperf3(over rndis) at the same time,
>>> there are some strange interrupts occurs and make the driver report
>>> error(ERROR DMA transfer).
>>> And:
>>
>> So dwc3 is workingo n host mode. Which platform is this?
> 
> This is our self-design platform (ARM v7 cpu core  with synopsys DWC
> USB3.0 controller).
> version info: Linux localhost 4.9.130-645692-g6ecde01-dirty #394 SMP
> PREEMPT Sun Sep 22 15:10:51 CST 2019 armv7l
> 
>>
>>> 1. this problem only hapened in USB SS mode
>>> 2. this problem seems not hapen when I run same test case with other
>>> xhci controller(such as asmedia/intel pcie xhci controller) on PC.
>>> 3. the kernel version is 4.9.130
>>
>> Have you tried a more recent kernel? 4.9 is really ancient. Please try
>> v5.3.
> 
> Our platform only support 4.9 kernel now, and it may take a lot of
> work to do to support the recent kernel.
> Are there any causes may lead the link TRB trigger a interrupt when
> the IOC bit is not setted?
> 
>>
>>> I think this may be a hw bug of DWC3 USB controller, could anyone
>>> please give me some help to debug this problem？
>>>
>>> The detail log see as below:
>>> [  131.074102] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: xHCI
>>> handle event, 8000
>>> 27630 [  131.074109] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> process trans event : ep_index = 11, event_dma = 1eb13e90
>>> 27631 [  131.074117] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> inc_deq, start trb dma = 1eb13e90, dequeue_p = e482ce90, trb_free num
>>> = 1871, ring type = 2
>>> 27632 [  131.074123] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> inc_deq 111, start trb dma = 1eb13ea0, dequeue_p = e482cea0, trb_free
>>> num = 1872, ring type = 2
>>> 27633 [  131.074130] c0 3 (ksoftirqd/0) xhci-hcd xh[  133.057617] c0 3
>>> (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: ERROR Transfer event TRB DMA
>>> ptr not part of current TD ep_index 16 comp_code 1
>>> 27634 [  133.059312] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> Looking for event-dma 000000001eb0fff0 trb-start 000000001eb10000
>>> trb-end 000000001eb10000 seg-start 000000001eb10000 seg-end
>>> 000000001eb10ff0
>>> 27635 [  133.066215] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
>>> comp_code 1
>>> 27636 [  133.067908] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> Looking for event-dma 000000001eb10000 trb-start 000000001eb10230
>>> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
>>> 000000001eb10ff0
>>> 27637 [  133.070572] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
>>> comp_code 1
>>> 27638 [  133.072260] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> Looking for event-dma 000000001eb10010 trb-start 000000001eb10230
>>> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
>>> 000000001eb10ff0
>>> 27639 [  133.075052] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
>>> comp_code 1
>>> 27640 [  133.076739] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> Looking for event-dma 000000001eb10020 trb-start 000000001eb10230
>>> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
>>> 000000001eb10ff0
>>> 27641 [  133.079472] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
>>> comp_code 1
>>> 27642 [  133.081159] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> Looking for event-dma 000000001eb10030 trb-start 000000001eb10230
>>> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
>>> 000000001eb10ff0
>>> 27643 [  133.083896] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
>>> comp_code 1
>>> 27644 [  133.085584] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> Looking for event-dma 000000001eb10040 trb-start 000000001eb10230
>>> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
>>> 000000001eb10ff0
>>> 27645 [  133.088328] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
>>> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
>>> comp_code 1
>>>
>>> 1. According these logs above the link trb whose address is 0x1eb0fff0
>>> occurs a transfer event, but this DMA address is not in the trb ring,
>>> then the driver report an error(and followed a few error logs witch
>>> invalid DMA address).

To me it looks like the controller creates an extra successful transfer event
for the Link TRB.

The link TRB DMA that the event is pointing to is part of the ring, but not part
of next Transfer Descriptor (TD) xhci driver expects to handle.
The link TRB is the last TRB of the previous ring segment, The TD the xhci driver
expects is on the next segment.

>>> 2. I dump the data of the address(0x1eb0fff0) and find the IOC bit is
>>> not set, see as below:
>>> # dump_reg.sh 0x1eb0fff0 4
>>> 0x1eb0fff0:0x1EB10000 0x00000000 0x00000000 0x00001800

The link TRB looks fine. TRB typeis link, and its next segment pointer is 0x1eb10000,
which is also where driver was expecting the next TD to be found.
No other bits are set.

Does everything work normally if you just ignore that error?
Can be done with a hack like this (untested):

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 40fa25c4d041..d5f4c416d0ef 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2531,7 +2531,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
                                 trb_in_td(xhci, ep_ring->deq_seg,
                                           ep_ring->dequeue, td->last_trb,
                                           ep_trb_dma, true);
-                               return -ESHUTDOWN;
+                               xhci_err(xhci, "Ignoring error\n");
+                               goto cleanup;
                         }
  
                         skip_isoc_td(xhci, td, event, ep, &status);

-Mathias
