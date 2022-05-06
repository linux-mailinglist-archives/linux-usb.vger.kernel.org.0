Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6836051DF42
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 20:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385537AbiEFSty (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 14:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346832AbiEFStx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 14:49:53 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D8A56229
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 11:46:08 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id x12so6763106pgj.7
        for <linux-usb@vger.kernel.org>; Fri, 06 May 2022 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NabxoRBCbMlsNprQoyj+QVD3I/J/c1Jl1IsYvc1jels=;
        b=fjpNuG6t6XHGPq9/WYdZ0h2RrGmLaUgM7uXg3G0hVWnkxE9xypFlIQhNmIowBdvLDl
         cZtJESwB7kKuWnqSyd7qJ3V1fur0sduus7PQcywOfRFRn4er5a52YvUHVhW3XjKKmFDN
         gxsZI38U+vt8ibhhpVT2t5ND7cZDMKbRpSYp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NabxoRBCbMlsNprQoyj+QVD3I/J/c1Jl1IsYvc1jels=;
        b=5wu81pNVKCyNaHtbICoO3CRZf1baAnT5t8gA9HX87WrkhRZDuQ+lA3GdYVfyZ0halr
         OrlJq+tUsqO7KduRoRu4l8IeGtubaZLh3FYCKDn80c2eQHurOXmqxABUyjDY94EXG60e
         qJkN2JOyGYrTcoeOjKew9h8lytlUXBclhUFFgOC7Z4wrRStN3B0IfprhHIIzLOpI3i4N
         L3MSedTDBvCz5yo7uq3vdbHN/bPpguuQnM9PWpJ0N6i5fYoGMiSer1ULuNWH0u8LS8D/
         MkUNllDUZ8kDnLVAGPsbwYx3/7TL+EmHeRYgx3AvTwXF7RyEAPyL/w4c04nmcHL90bn/
         H1Gw==
X-Gm-Message-State: AOAM532sKRZf0B16yUsTjL72IuHGzA4put+Uyo2MncuKD9509GtDYHQG
        V/ViGIBunv+dBG7p3TOWpOyXa6fcFyFZlA==
X-Google-Smtp-Source: ABdhPJwG/Mv0QFOm3JzCnXgRnAfUKxHQdRx3+Jdlc7lzSdmMg8kk/iGFgOZJV7A+VN9IUfK3NKizDQ==
X-Received: by 2002:a63:6981:0:b0:3c2:2771:6936 with SMTP id e123-20020a636981000000b003c227716936mr3716180pgc.41.1651862767654;
        Fri, 06 May 2022 11:46:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5605:d5cd:699b:1b26])
        by smtp.gmail.com with UTF8SMTPSA id m3-20020a170902768300b0015e8d4eb24dsm2073030pll.151.2022.05.06.11.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 11:46:07 -0700 (PDT)
Date:   Fri, 6 May 2022 11:46:06 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnVs7kSkpjUBWc5w@google.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-4-git-send-email-quic_kriskura@quicinc.com>
 <YnRUPxBZB55TPmf2@google.com>
 <a83dea08-0920-17e6-ec1c-f9d8a490a08d@quicinc.com>
 <20220506051448.GE4640@hu-pkondeti-hyd.qualcomm.com>
 <YnVD+ltiQhKE+jPf@google.com>
 <YnVSIvwXsKySg33M@google.com>
 <YnVmXmG+6emL4nxv@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YnVmXmG+6emL4nxv@rowland.harvard.edu>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 06, 2022 at 02:18:06PM -0400, Alan Stern wrote:
> [CC: list drastically reduced]
> 
> On Fri, May 06, 2022 at 09:51:46AM -0700, Matthias Kaehlcke wrote:
> > I found this, as I commented on the other thread:
> > 
> >   commit c4a5153e87fdf6805f63ff57556260e2554155a5
> >   Author: Manu Gautam <mgautam@codeaurora.org>
> >   Date:   Thu Jan 18 16:54:30 2018 +0530
> > 
> >   usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode
> > 
> >   Commit 689bf72c6e0d ("usb: dwc3: Don't reinitialize core during
> >   host bus-suspend/resume") updated suspend/resume routines to not
> >   power_off and reinit PHYs/core for host mode.
> >   It broke platforms that rely on DWC3 core to power_off PHYs to
> >   enter low power state on system suspend.
> > 
> >   Perform dwc3_core_exit/init only during host mode system_suspend/
> >   resume to addresses power regression from above mentioned patch
> >   and also allow USB session to stay connected across
> >   runtime_suspend/resume in host mode. While at it also replace
> >   existing checks for HOST only dr_mode with current_dr_role to
> >   have similar core driver behavior for both Host-only and DRD+Host
> >   configurations.
> > 
> >   Fixes: 689bf72c6e0d ("usb: dwc3: Don't reinitialize core during host bus-suspend/resume")
> >   Reviewed-by: Roger Quadros <rogerq@ti.com>
> >   Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> >   Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> > 
> > 
> > So apparently powering off the core and PHYs is needed on some
> > platforms.
> > 
> > Let's move forward with the core/PHYs off for now and try to
> > come up with a solution (e.g. a DT property that indicates
> > that the core/PHYs can remain powererd) in a separate
> > patch/series.
> 
> Isn't it true that if you power off the PHY, the controller will be 
> unable to detect resume requests from attached devices? Similarly, won't 
> the controller will be unable to detect plug and unplug events on the 
> root hub?
> 
> Doesn't this mean that if wakeup is enabled on the root hub or any of 
> the devices downstream from a root-hub port, the port's PHY must remain 
> powered during suspend?

Yes.

Currently the core/PHYs are always powered off during suspend in host mode:

static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
{
	...

	switch (dwc->current_dr_role) {
	case DWC3_GCTL_PRTCAP_HOST:
		if (!PMSG_IS_AUTO(msg)) {
			dwc3_core_exit(dwc);
			break;
		}

	...
}

With that I would expect wakeup to be broken for all dwc3. I'm a bit confused
though, since dwc3-imx8mp.c seems to support wakeup and the driver landed
after the above patch ...

This series intends to change the above code to something like this:

	if (!PMSG_IS_AUTO(msg)) {
	       if (device_may_wakeup(dwc->dev) &&
	                       device_wakeup_path(dwc->dev)) {
	               dwc->phy_power_off = false;
	       } else {
	               dwc->phy_power_off = true;
	               dwc3_core_exit(dwc);
	       }
	}

i.e. the core/PHYs would only be powered down if wakeup is disabled or no
wakeup capable devices are connected. With that plug/unplug events still
wouldn't be detected.
