Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82312BAD7E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 07:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbfIWFgn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 23 Sep 2019 01:36:43 -0400
Received: from mga04.intel.com ([192.55.52.120]:44574 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729173AbfIWFgn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 01:36:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Sep 2019 22:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; 
   d="scan'208";a="188042442"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2019 22:36:41 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     alex zheng <tc0721@gmail.com>, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without IOC being setted
In-Reply-To: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
Date:   Mon, 23 Sep 2019 08:36:41 +0300
Message-ID: <87a7avh8uu.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

(it helps when you Cc correct maintainers ;-)

alex zheng <tc0721@gmail.com> writes:

> Hi all,
>
> I am a user of dwc3 USB host controller, I found there are some
> confused behavior of trb event on this controller.
> When I run a raw USB data transfer(run bulk in&out transfer with
> libusb) and iperf3(over rndis) at the same time,
> there are some strange interrupts occurs and make the driver report
> error(ERROR DMA transfer).
> And:

So dwc3 is workingo n host mode. Which platform is this?

> 1. this problem only hapened in USB SS mode
> 2. this problem seems not hapen when I run same test case with other
> xhci controller(such as asmedia/intel pcie xhci controller) on PC.
> 3. the kernel version is 4.9.130

Have you tried a more recent kernel? 4.9 is really ancient. Please try
v5.3.

> I think this may be a hw bug of DWC3 USB controller, could anyone
> please give me some help to debug this problem？
>
> The detail log see as below:
> [  131.074102] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: xHCI
> handle event, 8000
> 27630 [  131.074109] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> process trans event : ep_index = 11, event_dma = 1eb13e90
> 27631 [  131.074117] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> inc_deq, start trb dma = 1eb13e90, dequeue_p = e482ce90, trb_free num
> = 1871, ring type = 2
> 27632 [  131.074123] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> inc_deq 111, start trb dma = 1eb13ea0, dequeue_p = e482cea0, trb_free
> num = 1872, ring type = 2
> 27633 [  131.074130] c0 3 (ksoftirqd/0) xhci-hcd xh[  133.057617] c0 3
> (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto: ERROR Transfer event TRB DMA
> ptr not part of current TD ep_index 16 comp_code 1
> 27634 [  133.059312] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> Looking for event-dma 000000001eb0fff0 trb-start 000000001eb10000
> trb-end 000000001eb10000 seg-start 000000001eb10000 seg-end
> 000000001eb10ff0
> 27635 [  133.066215] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> comp_code 1
> 27636 [  133.067908] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> Looking for event-dma 000000001eb10000 trb-start 000000001eb10230
> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> 000000001eb10ff0
> 27637 [  133.070572] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> comp_code 1
> 27638 [  133.072260] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> Looking for event-dma 000000001eb10010 trb-start 000000001eb10230
> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> 000000001eb10ff0
> 27639 [  133.075052] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> comp_code 1
> 27640 [  133.076739] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> Looking for event-dma 000000001eb10020 trb-start 000000001eb10230
> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> 000000001eb10ff0
> 27641 [  133.079472] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> comp_code 1
> 27642 [  133.081159] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> Looking for event-dma 000000001eb10030 trb-start 000000001eb10230
> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> 000000001eb10ff0
> 27643 [  133.083896] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> comp_code 1
> 27644 [  133.085584] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> Looking for event-dma 000000001eb10040 trb-start 000000001eb10230
> trb-end 000000001eb10230 seg-start 000000001eb10000 seg-end
> 000000001eb10ff0
> 27645 [  133.088328] c0 3 (ksoftirqd/0) xhci-hcd xhci-hcd.0.auto:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16
> comp_code 1
>
> 1. According these logs above the link trb whose address is 0x1eb0fff0
> occurs a transfer event, but this DMA address is not in the trb ring,
> then the driver report an error(and followed a few error logs witch
> invalid DMA address).
> 2. I dump the data of the address(0x1eb0fff0) and find the IOC bit is
> not set, see as below:
> # dump_reg.sh 0x1eb0fff0 4
> 0x1eb0fff0:0x1EB10000 0x00000000 0x00000000 0x00001800

-- 
balbi
