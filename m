Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583466EFEC9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 03:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242752AbjD0BIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 21:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240955AbjD0BIp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 21:08:45 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B346FC0
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 18:08:43 -0700 (PDT)
Received: (qmail 144271 invoked by uid 1000); 26 Apr 2023 21:08:42 -0400
Date:   Wed, 26 Apr 2023 21:08:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <99b09680-b362-431c-aa9f-a07722d0eba3@rowland.harvard.edu>
References: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 26, 2023 at 01:45:28PM +0200, Wlodzimierz Lipert wrote:
> usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
> bEndpointAddress - this leads to duplicate addresses. Fix changes the
> way in/out_epnum is used, now as bitmap which represents unavailable ep numbers.
> 
> Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> ---
>  drivers/usb/gadget/epautoconf.c | 35 ++++++++++++++++++++++-----------
>  include/linux/usb/gadget.h      |  4 ++--
>  2 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
> index 1eb4fa2e623f..50a2e8a90447 100644
> --- a/drivers/usb/gadget/epautoconf.c
> +++ b/drivers/usb/gadget/epautoconf.c
> @@ -67,6 +67,11 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  )
>  {
>  	struct usb_ep	*ep;
> +	unsigned *epnum_map;
> +	/* ep num 0 is reserved: not available for auto configuration */
> +	u8 num = 1;
> +	/* USB allows up to 16 IN and 16 OUT enpoints */
> +	unsigned num_mask = 0xFFFFU;

I think these initializers aren't needed.  They apply only in the case 
where the endpoint name doesn't encode a number.

>  	if (gadget->ops->match_ep) {
>  		ep = gadget->ops->match_ep(gadget, desc, ep_comp);
> @@ -94,18 +99,25 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  	/* report address */
>  	desc->bEndpointAddress &= USB_DIR_IN;
>  	if (isdigit(ep->name[2])) {
> -		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> -		desc->bEndpointAddress |= num;
> -	} else if (desc->bEndpointAddress & USB_DIR_IN) {
> -		if (++gadget->in_epnum > 15)
> +		num = simple_strtoul(&ep->name[2], NULL, 10);
> +		if (num > 15)
>  			return NULL;

This check shouldn't be here, at least, not in this form.  If num > 15 
it's a bug in the UDC driver; we could report it that way.

> -		desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
> -	} else {
> -		if (++gadget->out_epnum > 15)
> -			return NULL;
> -		desc->bEndpointAddress |= gadget->out_epnum;
> +		num_mask = 1U << num;
>  	}
>  
> +	epnum_map = desc->bEndpointAddress & USB_DIR_IN
> +		? &gadget->in_epnum : &gadget->out_epnum;
> +
> +	/* check if requested ep number (if name encodes it) or any is available */
> +	if (num_mask == (*epnum_map & num_mask))
> +		return NULL;
> +
> +	/* find first available ep number (if not encoded in ep name) */
> +	while (*epnum_map & (1U << num))
> +		++num;

This rearrangement of the code is kind of awkward.  It would be better 
to put the availability check for the encoded-number case into the "if" 
clause, and put the search inside an "else" section, rather than trying 
to combine two rather different computations into a single piece of 
code.  That way you wouldn't need num_mask at all.

Also, your "while" loop doesn't enforce num <= 15.  For that matter, it 
might be more efficient to use a "find first bit" library routine rather 
than coding your own loop.

> +
> +	*epnum_map |= 1U << num;
> +	desc->bEndpointAddress |= num;
>  	ep->address = desc->bEndpointAddress;
>  	ep->desc = NULL;
>  	ep->comp_desc = NULL;
> @@ -208,7 +220,8 @@ void usb_ep_autoconfig_reset (struct usb_gadget *gadget)
>  		ep->claimed = false;
>  		ep->driver_data = NULL;
>  	}
> -	gadget->in_epnum = 0;
> -	gadget->out_epnum = 0;
> +	/* ep num 0 is reserved: not available for auto configuration */
> +	gadget->in_epnum = 1U;
> +	gadget->out_epnum = 1U;

This change doesn't really do anything, since the search doesn't allow 
num == 0 anyway.

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

Should these be changed to u16?  I guess it doesn't matter...

>   * @mA: last set mA value
>   * @otg_caps: OTG capabilities of this gadget.
>   * @sg_supported: true if we can handle scatter-gather

Alan Stern
