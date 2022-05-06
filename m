Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9AEE51DEF8
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 20:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346616AbiEFSVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 14:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235427AbiEFSVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 14:21:51 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DED08120AD
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 11:18:07 -0700 (PDT)
Received: (qmail 51085 invoked by uid 1000); 6 May 2022 14:18:07 -0400
Date:   Fri, 6 May 2022 14:18:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnVmXmG+6emL4nxv@rowland.harvard.edu>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-4-git-send-email-quic_kriskura@quicinc.com>
 <YnRUPxBZB55TPmf2@google.com>
 <a83dea08-0920-17e6-ec1c-f9d8a490a08d@quicinc.com>
 <20220506051448.GE4640@hu-pkondeti-hyd.qualcomm.com>
 <YnVD+ltiQhKE+jPf@google.com>
 <YnVSIvwXsKySg33M@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnVSIvwXsKySg33M@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[CC: list drastically reduced]

On Fri, May 06, 2022 at 09:51:46AM -0700, Matthias Kaehlcke wrote:
> I found this, as I commented on the other thread:
> 
>   commit c4a5153e87fdf6805f63ff57556260e2554155a5
>   Author: Manu Gautam <mgautam@codeaurora.org>
>   Date:   Thu Jan 18 16:54:30 2018 +0530
> 
>   usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode
> 
>   Commit 689bf72c6e0d ("usb: dwc3: Don't reinitialize core during
>   host bus-suspend/resume") updated suspend/resume routines to not
>   power_off and reinit PHYs/core for host mode.
>   It broke platforms that rely on DWC3 core to power_off PHYs to
>   enter low power state on system suspend.
> 
>   Perform dwc3_core_exit/init only during host mode system_suspend/
>   resume to addresses power regression from above mentioned patch
>   and also allow USB session to stay connected across
>   runtime_suspend/resume in host mode. While at it also replace
>   existing checks for HOST only dr_mode with current_dr_role to
>   have similar core driver behavior for both Host-only and DRD+Host
>   configurations.
> 
>   Fixes: 689bf72c6e0d ("usb: dwc3: Don't reinitialize core during host bus-suspend/resume")
>   Reviewed-by: Roger Quadros <rogerq@ti.com>
>   Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
>   Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> 
> 
> So apparently powering off the core and PHYs is needed on some
> platforms.
> 
> Let's move forward with the core/PHYs off for now and try to
> come up with a solution (e.g. a DT property that indicates
> that the core/PHYs can remain powererd) in a separate
> patch/series.

Isn't it true that if you power off the PHY, the controller will be 
unable to detect resume requests from attached devices? Similarly, won't 
the controller will be unable to detect plug and unplug events on the 
root hub?

Doesn't this mean that if wakeup is enabled on the root hub or any of 
the devices downstream from a root-hub port, the port's PHY must remain 
powered during suspend?

Or am I totally off-base?

Alan Stern
