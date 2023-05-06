Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8A36F8EBA
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 07:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjEFFsi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 01:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEFFsg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 01:48:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41857DBD
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 22:48:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 616F86150F
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 05:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07F7C433D2;
        Sat,  6 May 2023 05:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1683352113;
        bh=7xQSd2OGyugnEbW+GKeNDgFe7w6ZrF7zQ2c6egpDJcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bsMytLBblUBCEAWXKpL2QDGqaQZRl4JFMqfgpBY8xHbadYEoX7qdkOiNvlhNOA1jg
         8IzXmWCvryNcDqbaFJ8uUGz2Nxz1UFZm+qTJ6E/hOJwegWOo8efn9kY9WzM1N6ftPz
         zCo2PaSdLmwGYDRstFW2+1BefZFlzo0E1JkyIuoY=
Date:   Sat, 6 May 2023 09:44:17 +0900
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     balbi@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <2023050616-large-nastily-88a1@gregkh>
References: <20230429154733.4429-1-wlodzimierz.lipert@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429154733.4429-1-wlodzimierz.lipert@gmail.com>
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 29, 2023 at 05:47:33PM +0200, Wlodzimierz Lipert wrote:
> usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
> bEndpointAddress - this leads to duplicate addresses. Fix changes the
> way in/out_epnum is used, now as bitmap which represents unavailable ep numbers.

Please properly wrap your changelog lines at 72 columns like your editor
asked you to.

> v2: formatting fixes only (errors).
> v3: refined autoconf logic (removed num_mask, switched to use ffz).
> v4: formatting only changes (style).

As per the documentation, this information about changes needs to go
below the --- line.



> 
> Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> ---
>  drivers/usb/gadget/epautoconf.c | 25 ++++++++++++++++---------
>  include/linux/usb/gadget.h      |  4 ++--
>  2 files changed, 18 insertions(+), 11 deletions(-)

What commit id does this fix?  Does it need to go to older stable
kernels?  If so, how far back?

> 
> diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
> index 1eb4fa2e623f..f73a7fe3d7d7 100644
> --- a/drivers/usb/gadget/epautoconf.c
> +++ b/drivers/usb/gadget/epautoconf.c
> @@ -67,6 +67,8 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  )
>  {
>  	struct usb_ep	*ep;
> +	unsigned	*epmap;

Why "unsigned"?  Didn't checkpatch complain about this?

> +	u8		num;
>  
>  	if (gadget->ops->match_ep) {
>  		ep = gadget->ops->match_ep(gadget, desc, ep_comp);
> @@ -93,19 +95,23 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  
>  	/* report address */
>  	desc->bEndpointAddress &= USB_DIR_IN;
> +	epmap = usb_endpoint_dir_in(desc) ?
> +			&gadget->in_epnum : &gadget->out_epnum;

I hate ?: lines with a passion.  Please spell it out with a real if
statement as the generated code is the same and it's easier to actually
read by humans.

> +
>  	if (isdigit(ep->name[2])) {
> -		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> -		desc->bEndpointAddress |= num;
> -	} else if (desc->bEndpointAddress & USB_DIR_IN) {
> -		if (++gadget->in_epnum > 15)
> +		num = simple_strtoul(&ep->name[2], NULL, 10);
> +		WARN_ON(num == 0 || num > 15);

You just crashed the system if this happened if panic-on-warn is enabled :(

Please never do this, if there is an issue, fix it up and handle it
properly.

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

BIT()?

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

As you changed the functionality of these variables, why not rename them
at the same time to make it obvious?  'in_epnum_bitmap'?

thanks,

greg k-h
