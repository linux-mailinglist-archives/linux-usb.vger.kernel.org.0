Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D467359FB7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhDINXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:23:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDINXL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 09:23:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D147610FB;
        Fri,  9 Apr 2021 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617974578;
        bh=UCu47Rk85wj+vguz6+Ijt85uLC61/rgNoDopQ02L95Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OrxpG1ONz0Q4mSfEmW7nXdm4jozAL1cIk+fXxiDZRsubUMAnSEJcc6mMSuF2zRKfV
         f6a+p4qIJSbumBh6wJbLEe1qaD9tx+gH0LX/1fst1ywQzKoGuo4e29u9Q/4rc1bWy3
         pDJyQ+97vdKWqiVyj16C0TPqU/mqT1GqAV3alpDU=
Date:   Fri, 9 Apr 2021 15:22:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
Message-ID: <YHBVMHvCHnT3PTGK@kroah.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
 <a792b1ea6b7083d400b3a6b38dcca70588fc5587.1617929509.git.Thinh.Nguyen@synopsys.com>
 <YG/50kPULbzZRlFj@kroah.com>
 <fbc6c921-114b-ed0b-ed68-b425e09e3e9b@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbc6c921-114b-ed0b-ed68-b425e09e3e9b@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 09, 2021 at 08:01:15AM +0000, Thinh Nguyen wrote:
> Greg Kroah-Hartman wrote:
> > On Thu, Apr 08, 2021 at 06:42:32PM -0700, Thinh Nguyen wrote:
> >> We can check for host quirks at runtime base on the controller IP and
> >> version check. Set the following quirks for the DWC_usb31 IP host mode
> >> before creating a platform device for the xHCI driver:
> >>
> >>  * XHCI_ISOC_BLOCKED_DISCONNECT
> >>  * XHCI_LIMIT_FS_BI_INTR_EP
> >>  * XHCI_LOST_DISCONNECT_QUIRK
> >>
> >> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> >> ---
> >>  drivers/usb/dwc3/host.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> >> index f29a264635aa..a486d7fbb163 100644
> >> --- a/drivers/usb/dwc3/host.c
> >> +++ b/drivers/usb/dwc3/host.c
> >> @@ -9,6 +9,7 @@
> >>  
> >>  #include <linux/acpi.h>
> >>  #include <linux/platform_device.h>
> >> +#include <linux/usb/xhci-quirks.h>
> >>  
> >>  #include "core.h"
> >>  
> >> @@ -42,6 +43,17 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
> >>  	return irq;
> >>  }
> >>  
> >> +static void dwc3_host_init_quirks(struct dwc3 *dwc, struct xhci_plat_priv *priv)
> >> +{
> >> +	memset(priv, 0, sizeof(*priv));
> >> +
> >> +	if (DWC3_VER_IS_WITHIN(DWC31, ANY, 190A)) {
> >> +		priv->quirks |= XHCI_ISOC_BLOCKED_DISCONNECT;
> >> +		priv->quirks |= XHCI_LIMIT_FS_BI_INTR_EP;
> >> +		priv->quirks |= XHCI_LOST_DISCONNECT_QUIRK;
> >> +	}
> >> +}
> >> +
> >>  int dwc3_host_init(struct dwc3 *dwc)
> >>  {
> >>  	struct property_entry	props[4];
> >> @@ -49,6 +61,7 @@ int dwc3_host_init(struct dwc3 *dwc)
> >>  	int			ret, irq;
> >>  	struct resource		*res;
> >>  	struct platform_device	*dwc3_pdev = to_platform_device(dwc->dev);
> >> +	struct xhci_plat_priv	dwc3_priv;
> > 
> > Tying the dwc3 code to the xhci code like this feels really wrong to me,
> > are you sure this is the correct resolution?
> > 
> > greg k-h
> > 
> 
> Can you clarify what feels wrong? The way it's originally implemented
> already tied them in that way. What we're doing here simply takes
> advantage of what xhci-plat glue layer can use to set the xhci quirks.
> With this, we don't have to create new and duplicate DT properties for
> dwc3 and xhci to set some quirks. With the expanding list of dwc3 DT, I
> see this as a plus.

Ok, still feels odd, but I'll let the xhci maintainer make the decision
on it as it's their code to maintain, not mine :)

thanks,

greg k-h
