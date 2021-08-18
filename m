Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A633F0093
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 11:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbhHRJfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 05:35:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:31697 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233074AbhHRJe1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 05:34:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="216016983"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="216016983"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 02:33:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="510788468"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 02:33:29 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mGHwp-00B43I-6B; Wed, 18 Aug 2021 12:33:23 +0300
Date:   Wed, 18 Aug 2021 12:33:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Message-ID: <YRzT4y87Nt8ICFJ/@smile.fi.intel.com>
References: <20210812082635.12924-1-jackp@codeaurora.org>
 <20210818012859.GB30805@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818012859.GB30805@jackp-linux.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 17, 2021 at 06:28:59PM -0700, Jack Pham wrote:
> On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:
> > On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
> > DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
> > field (bit 31) which when enabled allows the controller in device
> > mode to treat USB 2.0 L1 LPM & L2 events separately.
> > 
> > After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
> > events") the controller will now receive events (and therefore
> > interrupts) for every state change when entering/exiting either
> > L1 or L2 states.  Since L1 is handled entirely by the hardware
> > and requires no software intervention, there is no need to even
> > enable these events and unnecessarily notify the gadget driver.
> > Enable the aforementioned bit to help reduce the overall interrupt
> > count for these L1 events that don't need to be handled while
> > retaining the events for full L2 suspend/wakeup.
> 
> Hi folks in To:
> 
> I'd like to request if any of you could help test this patch on your
> boards to help make sure it doesn't cause any regressions since I know
> some of the recent dwc3 patches from Qualcomm have been found to break
> other devices :(. So I'm hoping to avoid that even for a patch as
> small as this.
> 
> Hoping this could be tried out on boards/SoCs such as db845c, hikey960,
> Exynos, the Intel "lakes", etc.  Ideally this needs validation with a
> high-speed connection to a USB 3.x host, which increases the chances
> that USB 2.0 Link Power Management is supported.
> 
> The overall goal of this patch is to eliminate events generated for
> L1 entry/exit, so we should see a slight reduction in interrupt counts
> when checking `grep dwc3 /proc/interrupts` for comparable traffic.

Unfortunately I'm quite busy lately with more important stuff and I dunno if I
will be able to test this in reasonable time. So, if Ferry volunteers, then we
can cover Intel Merrifield platform as well.

-- 
With Best Regards,
Andy Shevchenko


