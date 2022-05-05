Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC3951C54C
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 18:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381595AbiEEQtd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 12:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbiEEQtc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 12:49:32 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD59140A9
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 09:45:52 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so8488270pjb.5
        for <linux-usb@vger.kernel.org>; Thu, 05 May 2022 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+TBIdvlOJIeAZLlUH3ltx+xD24LgL4B/TL6SthL09iE=;
        b=jPFTxZhNy8P8I57ysGL8O7NhJLEO+m/BV9OiLJqP95qcGWqqcuLbmQ+SiwYeagFWeI
         oZeK0KqiF9tzEmGRX6oTvPzB3JwnjGQLnOQUmDnr2Y92sQQa0ms4lCk1j9Ku60Sap21O
         Rke/rPnerLL2j7fILyK5KqBnefIVvPCjvMSC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+TBIdvlOJIeAZLlUH3ltx+xD24LgL4B/TL6SthL09iE=;
        b=X9FqstamGXVLqMVFPbPDzthQQIvqbnzRCQVbu9U6+aci122rrtsKeIeiAL82seuxea
         zFT0XiUvjLi3JJUsfGKck8TGK1wqbFTkMqbbkfXUL+eYw4JQC87U9Ob6Tm0iRhfJlk2h
         TgZ6d1AWpKc/0mE5OI6hrQv98Wn7O9J3iH6ASdSJzLsG+mq8QjTeBKvj0gTf7r0v4q4A
         Eoj7pbH1beiE4Crdr8lCjCx8YYzsNAljkXWd9F9mo4Yr/PY2S1ua74U2j9u+TQ6KPOiI
         wElBENWu9j9EctityYCpae//kij7HU91nWPhssvDxehsnMCKEFIOJt1PHOAo9RQTghoB
         LNNg==
X-Gm-Message-State: AOAM5325mkqN+tvIkZdbPS91k7gX3A12gkrmmwHExpwadR15k1C9qR8M
        SARNl8CsdumjlUPlCLvOpG/Ktw==
X-Google-Smtp-Source: ABdhPJxXxB4lWpwbKRTOIHg2/PYNrZeJ89rDwPZDBEkxyplEIxF2hwF7jddtU/57yDbA/hTxLLC9tQ==
X-Received: by 2002:a17:90a:a82:b0:1da:3763:5cf5 with SMTP id 2-20020a17090a0a8200b001da37635cf5mr7218492pjw.55.1651769151549;
        Thu, 05 May 2022 09:45:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:827b:7f14:bb7e:2898])
        by smtp.gmail.com with UTF8SMTPSA id x20-20020aa78f14000000b0050dc76281e7sm1588230pfr.193.2022.05.05.09.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 09:45:51 -0700 (PDT)
Date:   Thu, 5 May 2022 09:45:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com, quic_vpulyala@quicinc.com
Subject: Re: [PATCH v14 3/7] usb: dwc3: core: Host wake up support from
 system suspend
Message-ID: <YnP/PZViq1u0f2yl@google.com>
References: <1650395470-31333-1-git-send-email-quic_c_sanm@quicinc.com>
 <1650395470-31333-4-git-send-email-quic_c_sanm@quicinc.com>
 <YnK79i3NiTdMmC98@google.com>
 <20220505032618.GC4640@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220505032618.GC4640@hu-pkondeti-hyd.qualcomm.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 05, 2022 at 08:56:18AM +0530, Pavan Kondeti wrote:
> On Wed, May 04, 2022 at 10:46:30AM -0700, Matthias Kaehlcke wrote:
> > On Wed, Apr 20, 2022 at 12:41:06AM +0530, Sandeep Maheswaram wrote:
> > > During suspend read the status of all port and set hs phy mode
> > > based on current speed. Use this hs phy mode to configure wakeup
> > > interrupts in qcom glue driver.
> > > 
> > > Check wakeup-source property for dwc3 core node to set the
> > > wakeup capability. Drop the device_init_wakeup call from
> > > runtime suspend and resume.
> > > 
> > > Also check during suspend if any wakeup capable devices are
> > > connected to the controller (directly or through hubs), if there
> > > are none set a flag to indicate that the PHY is powered
> > > down during suspend.
> > > 
> > > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > > ---
> > > v14:
> > > Used device_children_wakeup_capable instead of usb_wakeup_enabled_descendants.
> > > 
> > > v13:
> > > Changed dwc3_set_phy_speed_mode to dwc3_check_phy_speed_mode.
> > > Removed device_init_wakeup calls from dwc3_runtime_suspend and dwc3_runtime_resume
> > > as we have a new dt property wakeup-source.
> > > 
> > > 
> > >  drivers/usb/dwc3/core.c | 33 ++++++++++++++++++++-------------
> > >  drivers/usb/dwc3/core.h |  4 ++++
> > >  drivers/usb/dwc3/host.c | 24 ++++++++++++++++++++++++
> > >  3 files changed, 48 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > index 1170b80..898aa66 100644
> > > --- a/drivers/usb/dwc3/core.c
> > > +++ b/drivers/usb/dwc3/core.c
> > > @@ -32,6 +32,7 @@
> > >  #include <linux/usb/gadget.h>
> > >  #include <linux/usb/of.h>
> > >  #include <linux/usb/otg.h>
> > > +#include <linux/usb/hcd.h>
> > >  
> > >  #include "core.h"
> > >  #include "gadget.h"
> > > @@ -1723,6 +1724,7 @@ static int dwc3_probe(struct platform_device *pdev)
> > >  
> > >  	platform_set_drvdata(pdev, dwc);
> > >  	dwc3_cache_hwparams(dwc);
> > > +	device_init_wakeup(&pdev->dev, of_property_read_bool(dev->of_node, "wakeup-source"));
> > >  
> > >  	spin_lock_init(&dwc->lock);
> > >  	mutex_init(&dwc->mutex);
> > > @@ -1865,6 +1867,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > >  {
> > >  	unsigned long	flags;
> > >  	u32 reg;
> > > +	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
> > >  
> > >  	switch (dwc->current_dr_role) {
> > >  	case DWC3_GCTL_PRTCAP_DEVICE:
> > > @@ -1877,10 +1880,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > >  		dwc3_core_exit(dwc);
> > >  		break;
> > >  	case DWC3_GCTL_PRTCAP_HOST:
> > > -		if (!PMSG_IS_AUTO(msg)) {
> > > -			dwc3_core_exit(dwc);
> > > -			break;
> > > -		}
> > > +		dwc3_check_phy_speed_mode(dwc);
> > >  
> > >  		/* Let controller to suspend HSPHY before PHY driver suspends */
> > >  		if (dwc->dis_u2_susphy_quirk ||
> > > @@ -1896,6 +1896,16 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > >  
> > >  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
> > >  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
> > > +
> > > +		if (!PMSG_IS_AUTO(msg)) {
> > > +			if (device_may_wakeup(dwc->dev) &&
> > > +			    device_children_wakeup_capable(&hcd->self.root_hub->dev)) {
> > > +				dwc->phy_power_off = false;
> > > +			} else {
> > > +				dwc->phy_power_off = true;
> > > +				dwc3_core_exit(dwc);
> > 
> > I found that shutting the PHYs down during suspend leads to high power
> > consumption of a downstream hub (about 80mW vs 15mW when the PHYs are
> > not shut down).
> > 
> > It would be interesting to know if this also impacts other non-hub
> > peripherals. Unfortunately I can't test that, the hub on my system is
> > soldered to the board.
> > 
> > I understand that shutting the PHYs down might be beneficial in terms
> > of power on some systems, however on those I'm looking at we'd strongly
> > prefer to save the 65mW of power consumed by the hub, rather than
> > whatever smaller amount of power that is saved by powering down the
> > PHYs.
> > 
> > Could we introduce a sysfs attribute (or some other sort of knob) to
> > allow the admin to configure whether the PHYs should remain on or off
> > during suspend? That is assuming that it is actually desirable to power
> > them off on some systems.
> 
> The result may vary across SoCs also. The current proposal is to keep PHY
> powered during system suspend if any of the downstream USB devices are enabled
> for wakeup. This also includes USB2/USB3 root hub. If one wants to keep PHY
> always powered on even when no device is attached, they can do so by enabling
> wakeup (echo enabled > /sys/bus/usb/devices/usbX/power/wakeup). This is anyway
> needed if you want to detect a peripheral attach during system suspend.

My concern is that it is not evident for an admin what causes the high power
consumption of the USB client (if they detect/localize it in the first place),
and even less that wakeup needs to be enabled to mitigate it.

Why can't we just put the PHYs in suspend, rather than taking the controller
down completely during suspend?
