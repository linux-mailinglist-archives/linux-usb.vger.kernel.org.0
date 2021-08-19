Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C304F3F191A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 14:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbhHSM1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 08:27:25 -0400
Received: from mga03.intel.com ([134.134.136.65]:15064 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230292AbhHSM1Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Aug 2021 08:27:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216575616"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; 
   d="scan'208";a="216575616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 05:26:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; 
   d="scan'208";a="511891986"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 05:26:44 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mGh81-00BSj7-Pg; Thu, 19 Aug 2021 15:26:37 +0300
Date:   Thu, 19 Aug 2021 15:26:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ferry Toth <fntoth@gmail.com>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Message-ID: <YR5N/U3QAVy9uEzQ@smile.fi.intel.com>
References: <20210812082635.12924-1-jackp@codeaurora.org>
 <20210818012859.GB30805@jackp-linux.qualcomm.com>
 <YRzT4y87Nt8ICFJ/@smile.fi.intel.com>
 <de4c1fd9-7d2d-1038-8b8f-856e9dfd88cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4c1fd9-7d2d-1038-8b8f-856e9dfd88cd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 18, 2021 at 09:48:18PM +0200, Ferry Toth wrote:
> Op 18-08-2021 om 11:33 schreef Andy Shevchenko:
> > On Tue, Aug 17, 2021 at 06:28:59PM -0700, Jack Pham wrote:
> > > On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:

...

> > > The overall goal of this patch is to eliminate events generated for
> > > L1 entry/exit, so we should see a slight reduction in interrupt counts
> > > when checking `grep dwc3 /proc/interrupts` for comparable traffic.
> 
> I didn't compare interrupts
> 
> > Unfortunately I'm quite busy lately with more important stuff and I dunno if I
> > will be able to test this in reasonable time. So, if Ferry volunteers, then we
> > can cover Intel Merrifield platform as well.
> 
> Performance unchanged, no regressions found.
> Tested-by: Ferry Toth <fntoth@gmail.com> # for Merrifield

Thank you, Ferry!

-- 
With Best Regards,
Andy Shevchenko


