Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123296EF43C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 14:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240722AbjDZMZ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 08:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240143AbjDZMZ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 08:25:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C675B85
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 05:25:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA988635F3
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 12:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23B8C433EF;
        Wed, 26 Apr 2023 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1682511943;
        bh=kWd3EF0VU3aLMDssMpwSTSs7GIeUWs2lPc2YH0N4nyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=stNo5QpiecYG6yheFkFMNQ/n4j7FpEA7NT+uHKoMhTHF3YzD2dN4pAqfxm9byxg57
         Q0WgZOxkg11qddxMGNQbJ/ybMxDIAGnhSfxJwOu6dhfgNuzSRbaPbxV9qumUtvYb+Y
         +ij9oDj4cTUEBy9IKsC2nOtBD95NvGi3p/MZve8M=
Date:   Wed, 26 Apr 2023 14:25:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <2023042629-slobbery-headway-b5f5@gregkh>
References: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
>  
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
