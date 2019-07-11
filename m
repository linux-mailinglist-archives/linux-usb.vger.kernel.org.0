Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15E465292
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 09:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbfGKHhP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 03:37:15 -0400
Received: from mga09.intel.com ([134.134.136.24]:51049 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbfGKHhP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 03:37:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jul 2019 00:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; 
   d="scan'208";a="189420825"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2019 00:37:12 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Rob Weber <rob@gnarbox.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: dwc3 Disable Compliance Mode
In-Reply-To: <20190710230110.GA3188@coops>
References: <20190710230110.GA3188@coops>
Date:   Thu, 11 Jul 2019 10:37:11 +0300
Message-ID: <877e8phviw.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Rob,

Rob Weber <rob@gnarbox.com> writes:

> Hi Felipe,
>
> I hope you are doing well. My team and I are frequently experiencing an
> issue with the dwc3 in our CherryTrail SoC where we encounter an LFPS
> Polling timeout while our device is being enumerated.
>
> We configured the dwc3 as an ethernet gadget using configfs and the ecm
> and RNDIS functions. The dwc3 transitions to U3 after configuration as
> expected. Only once we connect our device to a USB host do we see the
> link state transition to Polling. We are assuming LFPS Polling times
> out because the link_state file in debugfs shows the link has
> transitioned to compliance mode only after entering LFPS.Polling, and we
> recently learned that compliance mode is triggered by a timeout during
> LFPS.Polling.
>
> This issue is not 100% reproducible, but is occuring rather frequently
> at the moment. We're unsure of the root cause of the issue as well. One
> culprit might be the USB SuperSpeed Redriver we use in our design.
>
> We would like to disable compliance mode in the meantime to allow other
> team members to continue developing and testing USB device mode features
> while we dig into the root cause of the issue. Is there a proper way to
> disable compliance mode entirely?

That's not something that can be done, unfortunately.

> If not, is there some mechanism we could implement to reset the
> dwc3 when we enter compliance mode? I attempted some sort of mechanism
> to reset the link state, but it does not seem to help the issue. I've
> attached my patch and the trace events for my attempted workaround to
> this email. My initial approach was to transition the link from
> Compliance -> SS.Disabled -> Rx.Detect when we detect we've entered
> compliance mode. The traces show that the dwc3 just enters LFPS.Polling
> and subsequently enters compliance mode, despite the link being reset.

I think you would have to go through the entire Power On Reset
sequence, but that's likely to be flakey.

> Do you have any ideas on how we might work around compliance mode in the
> meantime?

We have a few quirk flags that may help. snps,u2exit_lfps_quirk comes to
mind, but I suggest trying a few of them and see if any helps.

All flags are described in
Documentation/devicetree/bindings/usb/dwc3.txt

>  /* -------------------------------------------------------------------------- */
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 220/220   #P:4
> #
> #                              _-----=> irqs-off
> #                             / _----=> need-resched
> #                            | / _---=> hardirq/softirq
> #                            || / _--=> preempt-depth
> #                            ||| /     delay
> #           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
> #              | |       |   ||||       |         |
>           <idle>-0     [003] ..s1   178.444339: dwc3_core: Tick! Checking for compliance mode
>
>           <idle>-0     [003] d.s2   178.444352: dwc3_core: Compliance Mode detected. Attempting recovery routine

>      irq/23-dwc3-1115  [002] d..1   178.445380: dwc3_event: event (00140301): Link Change [SS.Disabled]
>      irq/23-dwc3-1115  [002] d..1   178.445826: dwc3_event: event (00150301): Link Change [RX.Detect]
>      irq/23-dwc3-1115  [002] d..1   178.445832: dwc3_event: event (00170301): Link Change [Polling]
>           <idle>-0     [003] ..s1   180.492293: dwc3_core: Tick! Checking for compliance mode
>
>           <idle>-0     [003] d.s2   180.492306: dwc3_core: Compliance Mode detected. Attempting recovery routine
>
>      irq/23-dwc3-1115  [002] d..1   180.493333: dwc3_event: event (00140301): Link Change [SS.Disabled]
>      irq/23-dwc3-1115  [002] d..1   180.493636: dwc3_event: event (00150301): Link Change [RX.Detect]
>      irq/23-dwc3-1115  [002] d..1   180.493641: dwc3_event: event (00170301): Link Change [Polling]
>           <idle>-0     [003] ..s1   182.540350: dwc3_core: Tick! Checking for compliance mode
>
>           <idle>-0     [003] d.s2   182.540362: dwc3_core: Compliance Mode detected. Attempting recovery routine
>
>      irq/23-dwc3-1115  [002] d..1   182.541392: dwc3_event: event (00140301): Link Change [SS.Disabled]
>      irq/23-dwc3-1115  [002] d..1   182.541976: dwc3_event: event (00150301): Link Change [RX.Detect]
>      irq/23-dwc3-1115  [002] d..1   182.541982: dwc3_event: event (00170301): Link Change [Polling]
>           <idle>-0     [003] .Ns1   184.588211: dwc3_core: Tick! Checking for compliance mode
>
>           <idle>-0     [003] dNs2   184.588232: dwc3_core: Compliance Mode detected. Attempting recovery routine

Don't we get an interrupt for Compliance mode entry?

cheers

-- 
balbi
