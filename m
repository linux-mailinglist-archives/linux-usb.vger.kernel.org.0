Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F8C214019
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 21:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgGCTrK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 15:47:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44451 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726368AbgGCTrK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 15:47:10 -0400
Received: (qmail 632242 invoked by uid 1000); 3 Jul 2020 15:47:09 -0400
Date:   Fri, 3 Jul 2020 15:47:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] usb: ohci-omap: Create private state container
Message-ID: <20200703194709.GB631551@rowland.harvard.edu>
References: <20200703175701.570446-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703175701.570446-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 07:57:00PM +0200, Linus Walleij wrote:
> The OMAP1 was using static locals to hold the clock handles
> which is uncommon and does not scale. Create a private data
> struct and use that to hold the clocks.
> 
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Okay in principle, but the patch needs to be revised.

> @@ -196,6 +201,7 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
>  {
>  	struct ohci_hcd		*ohci = hcd_to_ohci(hcd);
>  	struct omap_usb_config	*config = dev_get_platdata(hcd->self.controller);
> +	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);

Use a tab to align with the other declarations, please.

> @@ -341,6 +333,21 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>  	}
>  	hcd->rsrc_start = pdev->resource[0].start;
>  	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
> +	priv = hcd_to_ohci_omap_priv(hcd);
> +
> +	priv->usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
> +	if (IS_ERR(priv->usb_host_ck))
> +		return PTR_ERR(priv->usb_host_ck);
> +
> +	if (!cpu_is_omap15xx())
> +		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
> +	else
> +		priv->usb_dc_ck = clk_get(&pdev->dev, "lb_ck");
> +
> +	if (IS_ERR(priv->usb_dc_ck)) {
> +		clk_put(priv->usb_host_ck);
> +		return PTR_ERR(priv->usb_dc_ck);

If these two clk_get() calls fail, you mustn't just return.  You need to 
perform the usb_put_hcd() at the bottom of the function.

> +	}
>  
>  	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
>  		dev_dbg(&pdev->dev, "request_mem_region failed\n");
> @@ -373,8 +380,8 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
>  err1:
>  	usb_put_hcd(hcd);
>  err0:
> -	clk_put(usb_dc_ck);
> -	clk_put(usb_host_ck);
> +	clk_put(priv->usb_dc_ck);
> +	clk_put(priv->usb_host_ck);

When usb_put_hcd() is called, priv bacomes a stale pointer.  These two 
lines need to come earlier.  Also, you may as well create a label for the 
second one, so that you can jump there if the second clk_get() fails.

In fact, it wouldn't hurt to rename all these error labels to something
more meaningful than err0, err1, etc.  That could be done in a separate,
preliminary patch.

> @@ -406,8 +414,8 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
>  	iounmap(hcd->regs);
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
>  	usb_put_hcd(hcd);
> -	clk_put(usb_dc_ck);
> -	clk_put(usb_host_ck);
> +	clk_put(priv->usb_dc_ck);
> +	clk_put(priv->usb_host_ck);

Same comment about stale pointers here as before.

Alan Stern
