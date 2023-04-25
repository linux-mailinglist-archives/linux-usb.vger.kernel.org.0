Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22DF6EE3FA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 16:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbjDYOdH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 10:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbjDYOdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 10:33:05 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 77AB24EC0
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 07:32:57 -0700 (PDT)
Received: (qmail 83830 invoked by uid 1000); 25 Apr 2023 10:32:56 -0400
Date:   Tue, 25 Apr 2023 10:32:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: libcomposite: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss.
Message-ID: <6061acbc-609f-4c31-921e-5e42b677e822@rowland.harvard.edu>
References: <20230425120810.5365-1-wlodzimierz.lipert@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425120810.5365-1-wlodzimierz.lipert@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 25, 2023 at 02:08:10PM +0200, Wlodzimierz Lipert wrote:
> usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
> bEndpointAddress - this leads to duplicate addresses. Fix is simple -
> use only internal counter and dont rely on ep naming scheme.

I don't think that's the right fix.  On some UDCs the endpoint number 
really is determined by the hardware; you can't change it.  That's why 
the number is part of the endpoint's name.

The proper fix would be to check, when using the internal counter, 
whether a particular endpoint number is already reserved, and skip over 
it if it is.

Alan Stern

PS: usb_ep_autoconfig_ss() isn't part of libcomposite.  It's available 
for use by any gadget, whether that gadget uses the composite framework 
or not.

> 
> Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> ---
>  drivers/usb/gadget/epautoconf.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
> index 1eb4fa2e623f..40adf09079ed 100644
> --- a/drivers/usb/gadget/epautoconf.c
> +++ b/drivers/usb/gadget/epautoconf.c
> @@ -93,10 +93,7 @@ struct usb_ep *usb_ep_autoconfig_ss(
>  
>  	/* report address */
>  	desc->bEndpointAddress &= USB_DIR_IN;
> -	if (isdigit(ep->name[2])) {
> -		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> -		desc->bEndpointAddress |= num;
> -	} else if (desc->bEndpointAddress & USB_DIR_IN) {
> +	if (desc->bEndpointAddress & USB_DIR_IN) {
>  		if (++gadget->in_epnum > 15)
>  			return NULL;
>  		desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
> -- 
> 2.39.2
> 
