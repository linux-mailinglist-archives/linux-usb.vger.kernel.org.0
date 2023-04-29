Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90D46F2535
	for <lists+linux-usb@lfdr.de>; Sat, 29 Apr 2023 17:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjD2PdO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Apr 2023 11:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjD2PdN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Apr 2023 11:33:13 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6B5BA10E3
        for <linux-usb@vger.kernel.org>; Sat, 29 Apr 2023 08:33:09 -0700 (PDT)
Received: (qmail 241797 invoked by uid 1000); 29 Apr 2023 11:33:08 -0400
Date:   Sat, 29 Apr 2023 11:33:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <050c533c-4837-4a87-be6e-d04f03aa455e@rowland.harvard.edu>
References: <20230429144516.2848-1-wlodzimierz.lipert@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429144516.2848-1-wlodzimierz.lipert@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 29, 2023 at 04:45:16PM +0200, Wlodzimierz Lipert wrote:
> usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
> bEndpointAddress - this leads to duplicate addresses. Fix changes the
> way in/out_epnum is used, now as bitmap which represents unavailable ep numbers.
> Refined autoconf logic.
> 
> Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> ---

You didn't describe here the difference from the previous version.

>  drivers/usb/gadget/epautoconf.c | 25 ++++++++++++++++---------
>  include/linux/usb/gadget.h      |  4 ++--
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
> index 1eb4fa2e623f..74430807b803 100644
> --- a/drivers/usb/gadget/epautoconf.c
> +++ b/drivers/usb/gadget/epautoconf.c
> @@ -67,6 +67,8 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  )
>  {
>  	struct usb_ep	*ep;
> +	unsigned *epmap;
> +	u8 num;

Please copy the indentation style of the surrounding code.

>  
>  	if (gadget->ops->match_ep) {
>  		ep = gadget->ops->match_ep(gadget, desc, ep_comp);
> @@ -93,19 +95,23 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  
>  	/* report address */
>  	desc->bEndpointAddress &= USB_DIR_IN;
> +	epmap = usb_endpoint_dir_in(desc) ?
> +		&gadget->in_epnum : &gadget->out_epnum;

A continuation line should be indented by something other than one tab 
stop, to make it look different from a nested statement.

Other than these minor stylistic issues, the patch looks fine.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> +
>  	if (isdigit(ep->name[2])) {
> -		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> -		desc->bEndpointAddress |= num;
> -	} else if (desc->bEndpointAddress & USB_DIR_IN) {
> -		if (++gadget->in_epnum > 15)
> +		num = simple_strtoul(&ep->name[2], NULL, 10);
> +		WARN_ON(num == 0 || num > 15);
> +		if (*epmap & (1U << num))
>  			return NULL;
> -		desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
>  	} else {
> -		if (++gadget->out_epnum > 15)
> +		/* find first available ep number (not encoded in ep name) */
> +		num = ffz(*epmap);
> +		if (num > 15)
>  			return NULL;
> -		desc->bEndpointAddress |= gadget->out_epnum;
>  	}
>  
> +	*epmap |= 1U << num;
> +	desc->bEndpointAddress |= num;
>  	ep->address = desc->bEndpointAddress;
>  	ep->desc = NULL;
>  	ep->comp_desc = NULL;
> @@ -208,7 +214,8 @@ void usb_ep_autoconfig_reset (struct usb_gadget *gadget)
>  		ep->claimed = false;
>  		ep->driver_data = NULL;
>  	}
> -	gadget->in_epnum = 0;
> -	gadget->out_epnum = 0;
> +	/* ep num 0 is reserved: not available for auto configuration */
> +	gadget->in_epnum = 1U;
> +	gadget->out_epnum = 1U;
>  }
>  EXPORT_SYMBOL_GPL(usb_ep_autoconfig_reset);
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index 6a178177e4c9..1e00e22202bc 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -343,8 +343,8 @@ struct usb_gadget_ops {
>   *	and sometimes configuration.
>   * @dev: Driver model state for this abstract device.
>   * @isoch_delay: value from Set Isoch Delay request. Only valid on SS/SSP
> - * @out_epnum: last used out ep number
> - * @in_epnum: last used in ep number
> + * @out_epnum: bitmap of allocated out ep numbers
> + * @in_epnum: bitmap of allocated in ep numbers
>   * @mA: last set mA value
>   * @otg_caps: OTG capabilities of this gadget.
>   * @sg_supported: true if we can handle scatter-gather
> -- 
> 2.39.2
> 
