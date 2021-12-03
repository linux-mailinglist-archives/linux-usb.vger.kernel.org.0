Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFA74675D9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 12:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352044AbhLCLGM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 06:06:12 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:40716 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbhLCLGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 06:06:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1449B82670
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 11:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED208C53FD2;
        Fri,  3 Dec 2021 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638529365;
        bh=HLBaNUlaBpzVHLn7azaJVLOSO7rIcu9WUp0IIO4PY2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BCh2qznfTYSsvYAcjNJp3Da0fwELMCEKFhLoUoLLkBFzPoAQZ5mx1BBp0+dif/feC
         D5JW/dGU5zJjPeV7GG4KrkmtkVLmENT1LrI0LBonolN7G98FVY+44pJqvhYGD0TuwR
         Y7IfysWKJnwIp7qskQR4MGOhfqGr7qC14EN5wkYE=
Date:   Fri, 3 Dec 2021 12:02:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: dwc3: drd: Add support for usb-conn-gpio
 based usb-role-switch
Message-ID: <Yan5Uhsi8q1MDfcn@kroah.com>
References: <20211125141516.1668633-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125141516.1668633-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 25, 2021 at 03:15:16PM +0100, Alexander Stein wrote:
> usb-conn-gpio devices are a subnode of the USB interface controller, which
> needs to be populated.
> This allows having a non-type-c connector providing dual-role.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Added missing variable declaration
> 
>  drivers/usb/dwc3/drd.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index d7f76835137f..8b5ac689b8da 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/extcon.h>
>  #include <linux/of_graph.h>
> +#include "linux/of_platform.h"
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  
> @@ -542,6 +543,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>  {
>  	struct usb_role_switch_desc dwc3_role_switch = {NULL};
>  	u32 mode;
> +	int ret;
>  
>  	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
>  	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
> @@ -559,6 +561,13 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>  	if (IS_ERR(dwc->role_sw))
>  		return PTR_ERR(dwc->role_sw);
>  
> +	/* populate connector entry */
> +	ret = devm_of_platform_populate(dwc->dev);
> +	if (ret) {
> +		dev_err(dwc->dev, "DWC3 platform devices creation failed: %i\n", ret);
> +		return ret;
> +	}

You do not have to unwind what usb_role_switch_register() did here if
there is an error?

And will ALL systems always succeed at the call to
devm_of_platform_populate()?  Or will this break older systems that are
running today?  What was this tested with?

thanks,

greg k-h
