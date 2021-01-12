Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECBC2F3D72
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 01:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732038AbhALVj6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 16:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389026AbhALVjv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jan 2021 16:39:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C31C061575
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 13:30:18 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kzREw-0003VY-K8; Tue, 12 Jan 2021 22:30:10 +0100
Subject: Re: [PATCH] usb: dwc2: Change ordering of phy_init and phy_power_on
To:     Jules Maselbas <jmaselbas@kalray.eu>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
References: <6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de>
 <20210112170124.14148-1-jmaselbas@kalray.eu>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20c8617b-069c-e9a5-f394-4e5a8e67deb4@pengutronix.de>
Date:   Tue, 12 Jan 2021 22:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210112170124.14148-1-jmaselbas@kalray.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Jules,

+ linux-stm32 and Amelie, who upstreamed dwc2 glue for the stm32mp1.

[ some context: https://lore.kernel.org/lkml/6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de/ ]

On 12.01.21 18:01, Jules Maselbas wrote:
> Call phy_init before phy_power_on as this is the intended way of using
> the generic phy api.

Even if the PHY driver code itself doesn't show an apparent dependency
between the power on and init operation, the hardware may expect things to
happen in a defined order. This is at least the case for the stm32-usbphyc
and would be violated if we just swap the order in the controller.

Instead, why not take it slow:

 - Document that phy_init -> phy_power_on is the correct order
 - Throw a warning when the order is violated
 - Ask for this patch to marinate a while in linux-next, so people
   have a chance to sort out incompatibilities with their PHY drivers

Cheers,
Ahmad

> 
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Minas Harutyunyan <hminas@synopsys.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> 
> ---
> 
> I have quickly looked at usb-phy if this change could break something or
> not. The following cmd list the compatible strings for usb-phy used by dwc2:
> 
> git grep 'snps,dwc2' -- arch/ | sed 's/:.*$//' | { while read file; do \
>         phyname=$(git grep -A10 'snps,dwc2' -- "$file" | \
>                 sed -n '/phys/{s/.*<&\([^ >]*\).*/\1/p}'); \
>         [ "$phyname" ] && { \
> 	        git grep -A10 "${phyname}: " -- "$file" | \
>                 grep -m1 'compatible'; \
>         }; done };
> 
> From this output I took a look at:
>  - brcm,kona-usb2-phy
>  - samsung,exynos3250-usb2-phy
>  - rockchip,rk3288-usb
>  - amlogic,meson-gxbb-usb2-phy
>  - amlogic,meson-gxl-usb2-phy
>  - img,pistachio-usb-phy
> 
> Most of these phys only defines .power_on and .power_off;
> brcm,kona-usb2-phy also defines .init; and amlogic,meson-gxl-usb2-phy defines
> .init .exit and .reset
> 
> From what I've seen it seems to be OK for these two phy to call
> init/exit first and then power_on/power_off.
> ---
>  drivers/usb/dwc2/platform.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index b58ce996add7..a07dff088a26 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -142,9 +142,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
>  	} else if (hsotg->plat && hsotg->plat->phy_init) {
>  		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
>  	} else {
> -		ret = phy_power_on(hsotg->phy);
> +		ret = phy_init(hsotg->phy);
>  		if (ret == 0)
> -			ret = phy_init(hsotg->phy);
> +			ret = phy_power_on(hsotg->phy);
>  	}
>  
>  	return ret;
> @@ -176,9 +176,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
>  	} else if (hsotg->plat && hsotg->plat->phy_exit) {
>  		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
>  	} else {
> -		ret = phy_exit(hsotg->phy);
> +		ret = phy_power_off(hsotg->phy);
>  		if (ret == 0)
> -			ret = phy_power_off(hsotg->phy);
> +			ret = phy_exit(hsotg->phy);
>  	}
>  	if (ret)
>  		return ret;
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
