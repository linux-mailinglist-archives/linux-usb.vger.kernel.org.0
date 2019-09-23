Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87702BB265
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfIWKpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:45:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:42701 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727145AbfIWKpJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 06:45:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 03:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; 
   d="scan'208";a="272243057"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga001.jf.intel.com with ESMTP; 23 Sep 2019 03:45:06 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     alex zheng <tc0721@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        xiaowei.zheng@dji.com
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without IOC being setted
In-Reply-To: <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com> <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
Date:   Mon, 23 Sep 2019 13:45:06 +0300
Message-ID: <87muevs34d.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Alex,

alex zheng <tc0721@gmail.com> writes:
>> > I am a user of dwc3 USB host controller, I found there are some
>> > confused behavior of trb event on this controller.
>> > When I run a raw USB data transfer(run bulk in&out transfer with
>> > libusb) and iperf3(over rndis) at the same time,
>> > there are some strange interrupts occurs and make the driver report
>> > error(ERROR DMA transfer).
>> > And:
>>
>> So dwc3 is workingo n host mode. Which platform is this?
>
> This is our self-design platform (ARM v7 cpu core  with synopsys DWC
> USB3.0 controller).
> version info: Linux localhost 4.9.130-645692-g6ecde01-dirty #394 SMP
> PREEMPT Sun Sep 22 15:10:51 CST 2019 armv7l

This is a brand new design and you're waking it up on v4.9? Could've
tracked upstream more closely, IMHO.

>> > 1. this problem only hapened in USB SS mode
>> > 2. this problem seems not hapen when I run same test case with other
>> > xhci controller(such as asmedia/intel pcie xhci controller) on PC.
>> > 3. the kernel version is 4.9.130
>>
>> Have you tried a more recent kernel? 4.9 is really ancient. Please try
>> v5.3.
>
> Our platform only support 4.9 kernel now, and it may take a lot of
> work to do to support the recent kernel.

In that case, I'm afraid you're on your own. Have a look at known
synopsys errata.

On a side-node, getting a cortex-A7 to boot with upstream kernel should
be only about adding a DeviceTree nowadays. Remember that for Linux to
boot, all you need is a system timer and UART. If you're using ARM IP
for interrupts, timers, etc, it should be really straight forward to
boot on v5.3

> Are there any causes may lead the link TRB trigger a interrupt when
> the IOC bit is not setted?

No idea, perhaps you should have a deeper look at both Synopsys databook
and xHCI specification.

In any case, v4.9 is really old.

Good luck

-- 
balbi
