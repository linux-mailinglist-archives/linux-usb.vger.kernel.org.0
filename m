Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCA14EB928
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 06:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240352AbiC3EFe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 00:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiC3EFb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 00:05:31 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB32EA765;
        Tue, 29 Mar 2022 21:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648613024; x=1680149024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vadEC+trwPTFlk33Do/EYDLu46dxriKX977pa9Dtt+k=;
  b=AUiQmUjEdCFf2WiIdDVCB44FO/9AkaDi3iWfELtPBD0sBxTIXWLwHoK/
   diKbmwXFMN7TwbAjr3EUKCA/lz1NJ2uxwZmcaA5zI69TEx2wmJobl+c8A
   /Aam+5J6VrZ6xFlM9u3MpjGY7afrz1hK96JNCRrfMe6CG0wv9ArBKf6P5
   U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 21:03:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 21:03:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 21:03:27 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 21:03:22 -0700
Date:   Wed, 30 Mar 2022 09:33:18 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     "Sandeep Maheswaram (Temp)" <quic_c_sanm@quicinc.com>
CC:     Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v11 2/5] usb: dwc3: core: Host wake up support from
 system suspend
Message-ID: <20220330040318.GB29680@hu-pkondeti-hyd.qualcomm.com>
References: <1647932876-23249-1-git-send-email-quic_c_sanm@quicinc.com>
 <1647932876-23249-3-git-send-email-quic_c_sanm@quicinc.com>
 <YjthzwUldu2+31Pm@google.com>
 <b044f873-c20a-c666-0bd3-8d67c3337b03@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b044f873-c20a-c666-0bd3-8d67c3337b03@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sandeep/Matthias,

On Thu, Mar 24, 2022 at 10:24:55AM +0530, Sandeep Maheswaram (Temp) wrote:
> 
> On 3/23/2022 11:37 PM, Matthias Kaehlcke wrote:
> >On Tue, Mar 22, 2022 at 12:37:53PM +0530, Sandeep Maheswaram wrote:
> >>During suspend read the status of all port and make sure the PHYs
> >>are in the correct mode based on current speed.
> >>Phy interrupt masks are set based on this mode. Keep track of the mode
> >>of the HS PHY to be able to configure wakeup properly.
> >>
> >>Also check during suspend if any wakeup capable devices are
> >>connected to the controller (directly or through hubs), if there
> >>are none set a flag to indicate that the PHY is powered
> >>down during suspend.
> >>
> >>Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> >>---
> >>  drivers/usb/dwc3/core.c | 54 ++++++++++++++++++++++++++++++++++++++++---------
> >>  1 file changed, 45 insertions(+), 9 deletions(-)
> >>
> >>diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >>index 1170b80..232a734 100644
> >>--- a/drivers/usb/dwc3/core.c
> >>+++ b/drivers/usb/dwc3/core.c
> >>@@ -32,12 +32,14 @@
> >>  #include <linux/usb/gadget.h>
> >>  #include <linux/usb/of.h>
> >>  #include <linux/usb/otg.h>
> >>+#include <linux/usb/hcd.h>
> >>  #include "core.h"
> >>  #include "gadget.h"
> >>  #include "io.h"
> >>  #include "debug.h"
> >>+#include "../host/xhci.h"
> >>  #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
> >>@@ -1861,10 +1863,36 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
> >>  	return ret;
> >>  }
> >>+static void dwc3_set_phy_speed_mode(struct dwc3 *dwc)
> >>+{
> >>+
> >>+	int i, num_ports;
> >>+	u32 reg;
> >>+	struct usb_hcd	*hcd = platform_get_drvdata(dwc->xhci);
> >>+	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> >>+
> >>+	dwc->hs_phy_mode = 0;
> >>+
> >>+	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> >>+
> >>+	num_ports = HCS_MAX_PORTS(reg);
> >>+	for (i = 0; i < num_ports; i++) {
> >>+		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
> >s/0x04/NUM_PORT_REGS/
> Okay. Will update in next version.
> >
> >>+		if (reg & PORT_PE) {
> >>+			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> >>+				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_HS;
> >>+			else if (DEV_LOWSPEED(reg))
> >>+				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_LS;
> >>+		}
> >>+	}
> >>+	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_mode);
> >>+}
> >>+
> >>  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >>  {
> >>  	unsigned long	flags;
> >>  	u32 reg;
> >>+	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
> >>  	switch (dwc->current_dr_role) {
> >>  	case DWC3_GCTL_PRTCAP_DEVICE:
> >>@@ -1877,10 +1905,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >>  		dwc3_core_exit(dwc);
> >>  		break;
> >>  	case DWC3_GCTL_PRTCAP_HOST:
> >>-		if (!PMSG_IS_AUTO(msg)) {
> >>-			dwc3_core_exit(dwc);
> >>-			break;
> >>-		}
> >>+		dwc3_set_phy_speed_mode(dwc);
> >>  		/* Let controller to suspend HSPHY before PHY driver suspends */
> >>  		if (dwc->dis_u2_susphy_quirk ||
> >>@@ -1896,6 +1921,16 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >>  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
> >>  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
> >>+
> >>+		if (!PMSG_IS_AUTO(msg)) {
> >>+			if (device_may_wakeup(&dwc->xhci->dev) &&
> >Does the xHCI actually provide the correct information? I think Brian brought
> >up earlier that xhci-plat always marks the xHCI as wakeup capable, regardless
> >of whether the specific implementation actually supports wakeup. So a dwc3
> >without wakeup support would keep the PHY and the dwc3 active during suspend
> >if wakeup capable devices are connected (unless the admin disabled wakeup),
> >even though wakeup it doesn't support wakeup.
> >
> >Using the wakeup capability/policy of the xHCI to make decisions in the dwc3
> >driver might still be the best we can do with the weird driver split over 3
> >drivers for dwc3. Maybe the dwc3 could pass the actual capability to wake up
> >to the xHCI through a property_entry? Then again, it's actually the 'glue'
> >driver (dwc3-qcom) who knows about the actual wakeup capability, and not the
> >dwc3 core/host ...
> Will check if we can do something regarding this.

Can we introduce a device tree param to xhci-plat to specify if the underlying
device is wakeup capable or not. Based on this xhci-plat can call
device_set_wakeup_capable() with correct argument.

One immediate problem is that current code unconditionally calls
device_set_wakeup_capable(&pdev->dev, true). So we may break existing use
cases also.

Given that xHC assumes that the undelying device is wakeup capable but dwc3
tearing the stack during PM suspend does not make any sense. can we atleast
create a device tree param for dwc3 not to do this? 

Thanks,
Pavan
