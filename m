Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EBBB5A5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 15:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730898AbfIWNpD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 09:45:03 -0400
Received: from mga11.intel.com ([192.55.52.93]:32567 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfIWNpC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 09:45:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 06:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; 
   d="scan'208";a="188145235"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2019 06:45:01 -0700
Subject: Re: Event ring is full when do iozone test on UAS storage
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
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
 <e9090913-3ef8-5211-8f70-550df5dbe7ec@linux.intel.com>
Message-ID: <ba5ab485-cd06-6480-fffb-5b9c6a99d7f1@linux.intel.com>
Date:   Mon, 23 Sep 2019 16:46:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9090913-3ef8-5211-8f70-550df5dbe7ec@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.9.2019 14.19, Mathias Nyman wrote:
> On 19.9.2019 16.59, Suwan Kim wrote:
>> On Thu, Sep 19, 2019 at 05:54:25PM +0800, Peter Chen wrote:
>>>> On 17.9.2019 12.55, Peter Chen wrote:
>>>>>>>
>>>>>>> I met "event ring full error" like below, this error is met when
>>>>>>> I do iozone test on UAS storage at v4.19.35 kernel, but not meet
>>>>>>> this error at linux-next tree (08/24). The same host and test
>>>>>>> UAS storage device are used. This issue is due to xhci_handle_event
>>>>>>> does not return 0 long time, maybe the xHC speed is fast enough
>>>>>>> at that time. If I force the xhci_handle_event only run 100 times
>>>>>>> before update ERST dequene pointer, it will not occur this error.
>>>>>>> I did not  see any changes for xhci_handle_event at the latest code,
>>>>>>> so in theory, it should have this issue too. Do you think if we need
>>>>>>> to improve xhci_handle_event to avoid event ring?
>>>>>>
>>>>> The root cause is UAS protocol is very fast
>>>>> protocol, the
>>>>> other threads at non-CPU0 will add TRBs during we are handling event, so if
>>>>> hardware (xHC) has always consumed TD the non-CPU0s are adding,
>>>>> the ERST dequene pointer never get change to update, then this
>>>>> "event ring full" error will occur.
>>>>>
>>>>> The one reason why v4.19 has this issue is the max request length is larger
>>>>> than the latest kernel. At v4.19, it is 512KB, At the latest kernel,
>>>>> it is 256 KB.
>>>>> see /sys/block/sda/queue/max_sectors_kb.
>>>>> When I change max_sectors_kb as smaller value, the test will be more smooth.
>>>>> Besides, At v4.19, the UAS completion handler seems take more time
>>>>> compares to the latest kernel.
>>>>>
>>>>> I suggest adding threshold flag for event ring when it closes to full
>>>>> since we can't
>>>>> avoid USB3 use cases when the throughput is high, but the system is a
>>>>> little slow.
>>>>> Do you agree?
>>>>
>>>> I agree that it makes sense to force a ERDP write after handling some amount
>>>> of events, it can solve some event ring full issues, but not the fact that
>>>> we spend a lot of time in the interrupt handler.
>>>
>>> Ok, I will proposal one patch to fix event ring full issue.
> 
> Great
> 
>>>
>>>>
>>>> Your logs show that you have TDs containing up to 128 TRBs.
>>>> When a TD like that finishes the driver will increase the sw dequeue pointer of the
>>>> transfer ring one by one until we reach the end of the TD.
>>>>
>>>> This means we call inc_deq() function 128 times in interrupt context, and each time
>>>> do a few comparisons. According to traces this takes ~120us. There might be some
>>>> tracing overhead but this could anyway be done in a saner way.
>>>>
>>>> I'll look into this
>>>>
>>>
>>> Since we use hard irq for xHCI, for high performance protocol, it may hard to
>>> reduce interrupt context time since we have lots of request handling,
>>> cache operation,
>>> and completion are interrupt context.
> 
> I'm working on one improvement at the moment, it would be great if you could test
> it out once i get it done.

Got something  done on top of 5.3.
It's in my tree in the irqoff_optimization branch

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git  irqoff_optimization

Does it help at all in your case?

-Mathias
