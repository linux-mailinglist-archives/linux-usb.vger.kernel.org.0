Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96188E4BC
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 08:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfHOGGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 02:06:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:40175 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOGGH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 02:06:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 23:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; 
   d="scan'208";a="181785528"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga006.jf.intel.com with ESMTP; 14 Aug 2019 23:06:03 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Vicente Bergas <vicencb@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: kexec on rk3399
In-Reply-To: <59055782-7fc2-4b16-af8b-a56fb845a43f@gmail.com>
References: <ebcb52be-2063-4e2c-9a09-fdcacb94f855@gmail.com> <c6993a1e-6fc2-44ab-b59e-152142e2ff4d@gmail.com> <0408cb6c-1b16-eacb-d47e-17f4ff89e2b8@arm.com> <59055782-7fc2-4b16-af8b-a56fb845a43f@gmail.com>
Date:   Thu, 15 Aug 2019 09:06:02 +0300
Message-ID: <87pnl7t12t.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Vicente Bergas <vicencb@gmail.com> writes:

> On Wednesday, August 14, 2019 3:12:26 PM CEST, Robin Murphy wrote:
>> On 14/08/2019 13:53, Vicente Bergas wrote:
>>> On Monday, July 22, 2019 4:31:27 PM CEST, Vicente Bergas wrote: ...
>>
>> This particular change looks like it's implicitly specific to 
>> RK3399, which wouldn't be ideal. Presumably if the core dwc3 
>> driver implemented shutdown correctly (echoing parts of 
>> dwc3_remove(), I guess) then the glue layers shouldn't need 
>> anything special anyway.
>>
>> Robin.
>
> I just checked simple->resets from dwc3-of-simple.c and it is an array
> with multiple resets whereas dwc->reset from core.c is NULL.
> So the reset seems specific to the glue layers.
> Is there another way than resetting the thing that is
> generic enough to go to core.c and allows kexec?

This is a really odd 'failure'. We do full soft reset during driver
initialization on dwc3. We shouldn't need to assert reset on shutdown,
really.

I think the problem is here:

	if (simple->pulse_resets) {
		ret = reset_control_reset(simple->resets);
		if (ret)
			goto err_resetc_put;
	} else {
		ret = reset_control_deassert(simple->resets);
		if (ret)
			goto err_resetc_put;
	}

Note that if pulse_resets is set, we will run a reset. But if
pulse_resets is false and need_reset is true, we deassert the reset.

I think below patch is enough:

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index bdac3e7d7b18..9a2f3e09aa2e 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -72,7 +72,15 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 		ret = reset_control_reset(simple->resets);
 		if (ret)
 			goto err_resetc_put;
-	} else {
+	}
+
+	if (simple->need_reset) {
+		ret = reset_control_assert(simple->resets);
+		if (ret)
+			goto err_resetc_put;
+
+		usleep_range(1000, 2000);
+
 		ret = reset_control_deassert(simple->resets);
 		if (ret)
 			goto err_resetc_put;
@@ -121,9 +129,6 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 	clk_bulk_put_all(simple->num_clocks, simple->clks);
 	simple->num_clocks = 0;
 
-	if (!simple->pulse_resets)
-		reset_control_assert(simple->resets);
-
 	reset_control_put(simple->resets);
 
 	pm_runtime_disable(dev);

Can you test?

-- 
balbi
