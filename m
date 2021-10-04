Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AEA4219D0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbhJDWP1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhJDWP0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:15:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C4DC061745
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 15:13:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF7DBEF;
        Tue,  5 Oct 2021 00:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633385615;
        bh=Lz/THHnZqt6C4DTs/+D9Ae1ZaRUWNWgZopFLGaHYPmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vHGETlC2cNKEJqqpi7CD+wOAohaxCRFf0VlNdAOvg7BxhRsWWcyOixnkDjprLy1DY
         trV3eo5o1JRsw7ucRJb07OyPJEPpUabRFUwQDd05EKnlfn3X3YY7+Zh6ALM+gslE1Z
         sr56X1AOh3r3NM4lRyjnA3sSy7aszztMPn2xSkOo=
Date:   Tue, 5 Oct 2021 01:13:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 2/7] usb: gadget: uvc: rename function to be more
 consistent
Message-ID: <YVt8iG6Qzyw6u7Pa@pendragon.ideasonboard.com>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-3-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 30, 2021 at 12:27:12PM +0200, Michael Grzeschik wrote:
> From: Michael Tretter <m.tretter@pengutronix.de>
> 
> When enabling info debugging for the uvc gadget, the bind and unbind
> infos use different formats. Change the unbind to visually match the
> bind.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
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

I'd wrap this line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
