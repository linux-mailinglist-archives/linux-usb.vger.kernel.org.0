Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE48731733B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 23:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbhBJWVD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 17:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhBJWVB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 17:21:01 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F12C06174A
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 14:20:21 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id j12so2214410pfj.12
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 14:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z0iXqoizGv91iyESBFZbI0I06iIFsCEP1OVkjYLnlPA=;
        b=Miw6iK6/OvFwa7tHc1eUpNg6VrNTbW9r3+7lFtnixy33N4q94B2iBjswjV3wBykU+9
         ALEKv76fL34vruF33g+D41IBv44wlvAt10T8XyC5qGgJs8raPOoYzpHkzWAbN+6O1wb1
         TdWa81hT2enNnkZBd/NAxbY2WoMWr4M5R7if0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z0iXqoizGv91iyESBFZbI0I06iIFsCEP1OVkjYLnlPA=;
        b=Jd9QO2wHWDmcpH0miIsDqTic5DqakFI6GvliA4+lqI7BVO4FjZAH/a8ttsaAnv1kej
         3Y4jQ4PbvzWRD/19TPI8bmhmzx5v7oQLznMZEzQmI+HkbFdyYw5w9kvNPeTr5UvT9CJh
         WRBBlbj+qHdhMRcMTFXVmMsbji8zD9Rt3/roMz7Vi5Frj83KyAacn3ZaP0i8J3iR9flP
         m4TsIu++ifMB5YDSYei0/ZAk01o9W30r5hreSNJ2zpeL8S6svV+rWTZ5pGArUe8uYk/Q
         VgG2QWNjtYrqRQ9ETY3mC8++JS/5GyM53rP/24QzCPN733F+3rz58EJXwzj2vNsyX5LK
         FMcA==
X-Gm-Message-State: AOAM531CsaOeRXThzrs2ydzqu8AOxkkJgbks8tZBPd4/6nuSR5tdVDVt
        0kKbZBOnoiDK9i6Gc9pcV/h+2w==
X-Google-Smtp-Source: ABdhPJwxIyrwCZVepYfSfD+e4R52iXFCJYsOnislND8kiKov6V5bb2es7O8gG7efrH8gABeV3cGHXQ==
X-Received: by 2002:a63:ec0e:: with SMTP id j14mr5132698pgh.62.1612995621142;
        Wed, 10 Feb 2021 14:20:21 -0800 (PST)
Received: from localhost ([2620:15c:202:1:d8e6:826a:fc50:2158])
        by smtp.gmail.com with UTF8SMTPSA id q15sm2804340pfk.181.2021.02.10.14.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 14:20:20 -0800 (PST)
Date:   Wed, 10 Feb 2021 14:20:18 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v5 3/4] usb: host: xhci-plat: Create platform device for
 onboard hubs in probe()
Message-ID: <YCRcIuCxB8nYi7/e@google.com>
References: <20210210171040.684659-1-mka@chromium.org>
 <20210210091015.v5.3.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
 <20210210210645.xapaua7djdsvr3ca@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210210645.xapaua7djdsvr3ca@kozik-lap>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

On Wed, Feb 10, 2021 at 10:06:45PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 10, 2021 at 09:10:38AM -0800, Matthias Kaehlcke wrote:
> > Check during probe() if a hub supported by the onboard_usb_hub
> > driver is connected to the controller. If such a hub is found
> > create the corresponding platform device. This requires the
> > device tree to have a node for the hub with its vendor and
> > product id (which is not common for USB devices). Further the
> > platform device is only created when CONFIG_USB_ONBOARD_HUB=y/m.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > 
> > Changes in v5:
> > - patch added to the series
> > 
> >  drivers/usb/host/xhci-plat.c | 16 ++++++++++++++++
> >  include/linux/usb/hcd.h      |  2 ++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index 4d34f6005381..e785fa109eea 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/usb/onboard_hub.h>
> >  #include <linux/usb/phy.h>
> >  #include <linux/slab.h>
> >  #include <linux/acpi.h>
> > @@ -184,6 +185,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
> >  	int			ret;
> >  	int			irq;
> >  	struct xhci_plat_priv	*priv = NULL;
> > +	struct device_node	*np;
> >  
> >  
> >  	if (usb_disabled())
> > @@ -356,6 +358,17 @@ static int xhci_plat_probe(struct platform_device *pdev)
> >  	 */
> >  	pm_runtime_forbid(&pdev->dev);
> >  
> > +	np = usb_of_get_device_node(hcd->self.root_hub, hcd->self.busnum);
> > +	if (np && of_is_onboard_usb_hub(np)) {
> 
> This looks hackish... what if later we have something else than hub?
> Another if()?
> 
> What if hub could be connected to something else than XHCI controller?

In earlier versions this was standalone driver, which was more flexible and
didn't require cooperation from the XHCI driver:

https://lore.kernel.org/patchwork/patch/1313001/

Rob Herring raised objections about the DT bindings, since the USB hub would be
represented twice in the DT, once in the USB hierachry (with an explicit node or
implicitly) plus a node for the platform device for the new driver:

https://lore.kernel.org/patchwork/patch/1305395/
https://lore.kernel.org/patchwork/patch/1313000/

Alan Stern suggested to create the platform device in the XHCI platform driver:

https://lore.kernel.org/patchwork/patch/1313000/#1510227

I wasn't super happy about involving xhci-plat, but at least the code is minimal
and all the device specific stuff is handled by the onboard_usb_hub driver.

If you have better suggestions that might satisfy all parties please let us
know :)

Matthias
