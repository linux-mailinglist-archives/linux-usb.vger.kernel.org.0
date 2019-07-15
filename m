Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79492683AD
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2019 08:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbfGOGua (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jul 2019 02:50:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:30679 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbfGOGua (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jul 2019 02:50:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jul 2019 23:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; 
   d="scan'208";a="187057527"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2019 23:50:29 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Rob Weber <rob@gnarbox.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: dwc3 Disable Compliance Mode
In-Reply-To: <20190715060336.GB30262@coops>
References: <20190710230110.GA3188@coops> <877e8phviw.fsf@linux.intel.com> <20190712050139.GA28879@coops> <871ryvu3js.fsf@linux.intel.com> <20190715060336.GB30262@coops>
Date:   Mon, 15 Jul 2019 09:50:28 +0300
Message-ID: <8736j7eqq3.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Rob Weber <rob@gnarbox.com> writes:
>> I think our best bet is understanding why we're transitioning to
>> compliance and preventing that.
>> 
>> One question comes to mind: Does this happen *only* with the ethernet
>> gadget? Does it happen with *all* hosts or just a particular host?
>
> This issue does not just occur with the ethernet gadget, it also occurs
> with the mass storage mode gadget. I'm guessing that this issue is not
> gadget-specific. This seem to happen with all hosts as well. I tested
> with my Dell laptop, an iPad Pro, a Macbook Pro, and a Lenovo laptop
> running windows.
>
> This issue was 100% reproducible on 2 units I was testing last week
> when I sent you the initial email. These two boards are not particularly
> trustworthy data points: one board was from the first lot of units in
> mass production, and there are known issues with that manufacturing
> process that might be interfering with my testing. The other unit has
> gone through several rounds of modifications while tuning the
> de-emphasis and voltage swing of the SS Redriver on our design. We were
> frequently swapping 0201 resistors around this component, so I'm
> wondering if it was damaged? We also replaced the SoC's crystal
> oscillator during debugging at one point. This is connected to the
> CherryTrail's ICLK_OSCIN and ICLK_OSCOUT pins.
>
> I have since completed the userspace library for controlling our USB
> role and I started testing on newer boards that were recently
> manufactured. So far these issues are not reproducible. Mass storage
> mdoe and ethernet mode are both working well with no compliance mode
> issues. My current objective is to gather more data with several more
> units to see if this is a problem we're experiencing across all units,
> or if I just happened to be testing on two faulty units. I will keep you
> updated on the status of this issue after collecting more data.

Please do, if it happens again, let's start looking at known errata for
the redriver. We need to understand what's causing LFPS timeout.

>> Any chance you can capture a full session with both CATC or Beagle 5000
>> analyzer and dwc3 tracepoints and send it to me?
>
> Sure thing! Please find the beagle 5000 analyzer data and dwc3
> tracepoints attached. I'm still learning how to read the protocol
> analyzer captures, so I'm not sure if my interpretation is correct, but
> it looked like a bunch of unknown packets were being transmitted by the
> device during LFPS Polling. I'm curious to know your interpretation.

Yeah, it just times out polling because of these unknown packets. I
wonder if we can get away from it by disabling scrambling. There's a bit
in dwc3 for that:

#define DWC3_GCTL_DISSCRAMBLE		BIT(3)

Can you apply this hack below and see if it makes any difference?

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c9bb93a2c81e..ef3646f68630 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -771,6 +771,7 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 		reg |= DWC3_GCTL_DISSCRAMBLE;
 	else
 		reg &= ~DWC3_GCTL_DISSCRAMBLE;
+	reg |= DWC3_GCTL_DISSCRAMBLE;
 
 	if (dwc->u2exit_lfps_quirk)
 		reg |= DWC3_GCTL_U2EXIT_LFPS;

Note that you should NOT run your product with this bit set (meaning,
without scrambling disabled) as that will have an effect in EMI. Still,
it may help understand if the redriver is getting confused with the
scrambling or not.

Best

-- 
balbi
