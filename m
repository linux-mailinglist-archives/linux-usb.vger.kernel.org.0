Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3333441E60E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 04:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351435AbhJACm7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 22:42:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46966 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhJACm7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 22:42:59 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02396A16;
        Fri,  1 Oct 2021 04:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633056074;
        bh=InnTs9H2p5rEK9zXEuJuOHhe/OE3h0EdZAlBb+VxZc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iidrUymij5XqJ9NbBVWnY0fn0CQN4vwQse9r897pxLy7wasA0eMruA2rUjIYqF7Yk
         BiODzikVsNMbEkRKaQoUGmy3+I1MrV+JxNHOTnruVTcKgOuTIUusdR55Cu0zWA7mYK
         iX6GRSZfmaI3+1zJXnH9jo3/mINM7yme2z+0B1wg=
Date:   Fri, 1 Oct 2021 11:41:06 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 2/7] usb: gadget: uvc: rename function to be more
 consistent
Message-ID: <20211001024106.GB3032473@pyrite.rasen.tech>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-3-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Thu, Sep 30, 2021 at 12:27:12PM +0200, Michael Grzeschik wrote:
> From: Michael Tretter <m.tretter@pengutronix.de>
> 
> When enabling info debugging for the uvc gadget, the bind and unbind
> infos use different formats. Change the unbind to visually match the
> bind.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/f_uvc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 9d87c0fb8f92e..1e93ab5c0c88d 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -884,12 +884,12 @@ static void uvc_free(struct usb_function *f)
>  	kfree(uvc);
>  }
>  
> -static void uvc_unbind(struct usb_configuration *c, struct usb_function *f)
> +static void uvc_function_unbind(struct usb_configuration *c, struct usb_function *f)
>  {
>  	struct usb_composite_dev *cdev = c->cdev;
>  	struct uvc_device *uvc = to_uvc(f);
>  
> -	uvcg_info(f, "%s\n", __func__);
> +	uvcg_info(f, "%s()\n", __func__);
>  
>  	device_remove_file(&uvc->vdev.dev, &dev_attr_function_name);
>  	video_unregister_device(&uvc->vdev);
> @@ -943,7 +943,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
>  	/* Register the function. */
>  	uvc->func.name = "uvc";
>  	uvc->func.bind = uvc_function_bind;
> -	uvc->func.unbind = uvc_unbind;
> +	uvc->func.unbind = uvc_function_unbind;
>  	uvc->func.get_alt = uvc_function_get_alt;
>  	uvc->func.set_alt = uvc_function_set_alt;
>  	uvc->func.disable = uvc_function_disable;
> -- 
> 2.30.2
> 
