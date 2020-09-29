Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E70427D61B
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 20:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgI2SuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 14:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728282AbgI2SuJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 14:50:09 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A024C0613D2
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 11:50:09 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so5484344pfd.5
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9VDUVULmJB3Y+7AbCQ1NSMUBMO5bledTUKUB0vzOkYo=;
        b=kuV83tdDUF1UTiC7VoBpXo1vmr5O8uWz7mBNlpUHDdBUMvNtrQ+6JPx1XQQ854fngx
         G8dvlgC3EDApK5ATqQTsmBz3t2rmn/4nunMmMraAG0HQBN0IwikK/XGkm9S3DydDEEgd
         MVOyf0Wu/IFGEz3QUOJ6lDzGZ8hq7ji8KXH7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9VDUVULmJB3Y+7AbCQ1NSMUBMO5bledTUKUB0vzOkYo=;
        b=R0AvBzj7Q9GbKiEbILVqcSQFD4Wdw5p/s9sCbNHrN0/q/1gBXqeQgKv4gcEmE1fgkS
         6QvMlBfnTqYyrS+7Ex0m6wOxhUhJBNxWO1HuZY/lec2oo+c1AqT9RE2cBIYALsGZPR6f
         YrbGRtb1CnY4xHjzccjWfx+hu7FblhiQ/SIhn15IVaL+hk/jwJdFIlzqsUrMf0W8CkIX
         SKHxIwQV8YqpdwBXjt+j4mFLA+oBYxgGZg217y56PHPcPv7P7mcdulgb+XYQq8BNCG/n
         bmtlDLuwoXi8J2DeuRCtrf5dv2KIHo8/xyk5sWbYTvm03psdFThYRTkbrCOUnWFqWKkT
         Jg4w==
X-Gm-Message-State: AOAM530lK2C910w7izwfMjvVWuqlcxkWK8pvv/ulsos67z9i8qBLaS7u
        6vx91AkOps6D9LuL8tTy/+TJuw==
X-Google-Smtp-Source: ABdhPJzO482Tx7l4tsHYQOhdq82ZvPIaRdCpG4EBkBUP86FWHuIICpGgwVYAbmCuaJdaBBX07MoEwg==
X-Received: by 2002:a17:902:146:b029:d2:5615:5700 with SMTP id 64-20020a1709020146b02900d256155700mr5720462plb.84.1601405408033;
        Tue, 29 Sep 2020 11:50:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 36sm5652997pgl.72.2020.09.29.11.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 11:50:07 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:50:06 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] usb: dwc3: host: Add suspend_quirk for dwc3 host
Message-ID: <20200929185006.GC1621304@google.com>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1601376452-31839-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 04:17:29PM +0530, Sandeep Maheswaram wrote:
> Adding suspend quirk function for dwc3 host which will be called
> during xhci suspend.
> Setting hs_phy_flags, ss_phy_flags and phy mode during host suspend.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/host.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index e195176..7f316fa 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,13 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci.h"
> +#include "../host/xhci-plat.h"
> +int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
> +
> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
> +	.suspend_quirk = xhci_dwc3_suspend_quirk,
> +};
>  
>  static int dwc3_host_get_irq(struct dwc3 *dwc)
>  {
> @@ -115,6 +122,13 @@ int dwc3_host_init(struct dwc3 *dwc)
>  		}
>  	}
>  
> +	ret = platform_device_add_data(xhci, &xhci_plat_dwc3_xhci,
> +			sizeof(struct xhci_plat_priv));
> +	if (ret) {
> +		dev_err(dwc->dev, "failed to add data to xHCI\n");
> +		goto err;
> +	}
> +
>  	ret = platform_device_add(xhci);
>  	if (ret) {
>  		dev_err(dwc->dev, "failed to register xHCI device\n");
> @@ -127,6 +141,41 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	return ret;
>  }
>  
> +static void dwc3_set_phy_speed_flags(struct usb_hcd *hcd)

The main thing this function does is setting the PHY mode (see
the phy_set_mode() calls), please rename it to dwc3_set_phy_mode()
to reflect this.

> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	struct device *dev = hcd->self.controller;
> +	struct dwc3 *dwc = dev_get_drvdata(dev->parent);
> +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_flags = 0;

What about 'dwc->ss_phy_flags'?

I suggested in another patch to use a local variable instead, so you
probably have to initialize it anyway or the compiler will be unhappy ;-)

> +
> +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +	num_ports = HCS_MAX_PORTS(reg);
> +	for (i = 0; i < num_ports; i++) {
> +		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_flags |= PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_flags |= PHY_MODE_USB_HOST_LS;

nit: add empty line to visually separate HS from SS

> +			if (DEV_SUPERSPEED(reg))
> +				dwc->ss_phy_flags |= PHY_MODE_USB_HOST_SS;
> +		}
> +	}
> +	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);
> +	phy_set_mode(dwc->usb3_generic_phy, dwc->ss_phy_flags);

Check return values and return any errors?
