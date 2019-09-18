Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3B6B663A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 16:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730688AbfIROgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 10:36:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:3483 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbfIROgu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 10:36:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 07:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; 
   d="scan'208";a="186482565"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2019 07:36:49 -0700
Subject: Re: Event ring is full when do iozone test on UAS storage
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190916094305.GB21844@b29397-desktop>
 <0aae13f2-04cf-f45a-e6ee-4bf9e515faba@linux.intel.com>
 <CAL411-oirjSLZzwoN8axqpfn-JQ8eEGMWD-w9p24Krap+dPs9g@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <92a09240-6489-b405-7916-26a77f2e0b06@linux.intel.com>
Date:   Wed, 18 Sep 2019 17:38:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL411-oirjSLZzwoN8axqpfn-JQ8eEGMWD-w9p24Krap+dPs9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.9.2019 12.55, Peter Chen wrote:
>>>
>>> I met "event ring full error" like below, this error is met when
>>> I do iozone test on UAS storage at v4.19.35 kernel, but not meet
>>> this error at linux-next tree (08/24). The same host and test
>>> UAS storage device are used. This issue is due to xhci_handle_event
>>> does not return 0 long time, maybe the xHC speed is fast enough
>>> at that time. If I force the xhci_handle_event only run 100 times
>>> before update ERST dequene pointer, it will not occur this error.
>>> I did not  see any changes for xhci_handle_event at the latest code,
>>> so in theory, it should have this issue too. Do you think if we need
>>> to improve xhci_handle_event to avoid event ring?
>>
> The root cause is UAS protocol is very fast
> protocol, the
> other threads at non-CPU0 will add TRBs during we are handling event, so if
> hardware (xHC) has always consumed TD the non-CPU0s are adding,
> the ERST dequene pointer never get change to update, then this
> "event ring full" error will occur.
> 
> The one reason why v4.19 has this issue is the max request length is larger
> than the latest kernel. At v4.19, it is 512KB, At the latest kernel,
> it is 256 KB.
> see /sys/block/sda/queue/max_sectors_kb.
> When I change max_sectors_kb as smaller value, the test will be more smooth.
> Besides, At v4.19, the UAS completion handler seems take more time
> compares to the latest kernel.
> 
> I suggest adding threshold flag for event ring when it closes to full
> since we can't
> avoid USB3 use cases when the throughput is high, but the system is a
> little slow.
> Do you agree?

I agree that it makes sense to force a ERDP write after handling some amount
of events, it can solve some event ring full issues, but not the fact that
we spend a lot of time in the interrupt handler.

Your logs show that you have TDs containing up to 128 TRBs.
When a TD like that finishes the driver will increase the sw dequeue pointer of the
transfer ring one by one until we reach the end of the TD.

This means we call inc_deq() function 128 times in interrupt context, and each time
do a few comparisons. According to traces this takes ~120us. There might be some
tracing overhead but this could anyway be done in a saner way.

I'll look into this

Other things to consider in addition to writing ERDP and fixing the inc_dec() loop is
increasing event ring size (adding more than current 1 segment), and support giving
back URBs in tasklet by adding the HCD_BH flag to xhci hcd.

-Mathias
