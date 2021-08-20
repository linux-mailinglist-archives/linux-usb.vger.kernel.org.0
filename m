Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3DD3F2BD5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 14:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240189AbhHTMSj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 08:18:39 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55812 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239903AbhHTMSi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Aug 2021 08:18:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629461880; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=jHbcx4kqocmAhiZAlzU0d5DWyvPm72GZtve4b2ov9Qc=; b=oId3mMg/aV/8VJ0Fbpv+dTSZqUfwMrkvs5fynY8vHDP3PKdNyFg5XOFVXyKkuq0nSEJVV8XG
 0bY4WKLQ3dGfThFslqUlMNgvQ+ISdK5rIXwfa+eMF0qb7nsYC+FONAZ6Ha1W7m98l/pZihTy
 LedER6bDb5ZE7aZg1NEUrmqQ88g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 611f9d601d4eeff4c393cf51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:17:36
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5A5FBC43618; Fri, 20 Aug 2021 12:17:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 631E6C4338F;
        Fri, 20 Aug 2021 12:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 631E6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Fri, 20 Aug 2021 05:17:31 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Ferry Toth <fntoth@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <20210820121731.GC30805@jackp-linux.qualcomm.com>
References: <20210812082635.12924-1-jackp@codeaurora.org>
 <20210818012859.GB30805@jackp-linux.qualcomm.com>
 <YRzT4y87Nt8ICFJ/@smile.fi.intel.com>
 <de4c1fd9-7d2d-1038-8b8f-856e9dfd88cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4c1fd9-7d2d-1038-8b8f-856e9dfd88cd@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 18, 2021 at 09:48:18PM +0200, Ferry Toth wrote:
> Op 18-08-2021 om 11:33 schreef Andy Shevchenko:
> > On Tue, Aug 17, 2021 at 06:28:59PM -0700, Jack Pham wrote:
> > > On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:
> > > > On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
> > > > DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
> > > > field (bit 31) which when enabled allows the controller in device
> > > > mode to treat USB 2.0 L1 LPM & L2 events separately.
> > > > 
> > > > After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
> > > > events") the controller will now receive events (and therefore
> > > > interrupts) for every state change when entering/exiting either
> > > > L1 or L2 states.  Since L1 is handled entirely by the hardware
> > > > and requires no software intervention, there is no need to even
> > > > enable these events and unnecessarily notify the gadget driver.
> > > > Enable the aforementioned bit to help reduce the overall interrupt
> > > > count for these L1 events that don't need to be handled while
> > > > retaining the events for full L2 suspend/wakeup.
> > > 
> > > Hi folks in To:
> > > 
> > > I'd like to request if any of you could help test this patch on your
> > > boards to help make sure it doesn't cause any regressions since I know
> > > some of the recent dwc3 patches from Qualcomm have been found to break
> > > other devices :(. So I'm hoping to avoid that even for a patch as
> > > small as this.
> > > 
> > > Hoping this could be tried out on boards/SoCs such as db845c, hikey960,
> > > Exynos, the Intel "lakes", etc.  Ideally this needs validation with a
> > > high-speed connection to a USB 3.x host, which increases the chances
> > > that USB 2.0 Link Power Management is supported.
> 
> Merrifield: We currently have
> PROPERTY_ENTRY_BOOL("snps,usb2-gadget-lpm-disable")
> 
> Should I retest with this reverted?

Maybe best to leave it, since it looks like you had added this quirk
for other L1 LPM incompatibility issues you faced on this platform.

> > > The overall goal of this patch is to eliminate events generated for
> > > L1 entry/exit, so we should see a slight reduction in interrupt counts
> > > when checking `grep dwc3 /proc/interrupts` for comparable traffic.
> 
> I didn't compare interrupts
> 
> > Unfortunately I'm quite busy lately with more important stuff and I dunno if I
> > will be able to test this in reasonable time. So, if Ferry volunteers, then we
> > can cover Intel Merrifield platform as well.
> > 
> 
> Performance unchanged, no regressions found.
> Tested-by: Ferry Toth <fntoth@gmail.com> # for Merrifield

At least it is a no-op for you. Thanks for verifying!

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
