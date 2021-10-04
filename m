Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C9B421A36
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbhJDWne (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234828AbhJDWne (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:43:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB521C061745
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 15:41:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E99A25B;
        Tue,  5 Oct 2021 00:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633387303;
        bh=l62vEbQ+ee0l9cnzmzOAD91ETcLPowhzcTikOzUM2lU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bi1UvpmuRy+7oOLu7M2F/8C3BSGEy1z1vciCQpYeqPCQTmhkI6ff0YXgZRQpS2R0u
         1syqNFRlKwFW26SFM9guqaUboTq3J8drKKc+Cgc1x06t3VXZCC+dZszkQeWk1Dh24o
         oa/JqcW6kvA4vM42XvT/Kq1qKrSD6j1STGxQ+A7U=
Date:   Tue, 5 Oct 2021 01:41:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH 7/7] usb: gadget: udc: ensure the gadget is still
 available
Message-ID: <YVuDICOTtHjqSqkq@pendragon.ideasonboard.com>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-8-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-8-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 30, 2021 at 12:27:17PM +0200, Michael Grzeschik wrote:
> It is possible that the configfs gadget layer will be calling the unbind
> functions of all gadget functions on gadget_dev_desc_UDC_store and
> cleaned up the cdev structures pointer to the gadget. This will not
> prevent the usage of the usb_function_de/activate functions.
> 
> f_obex and f_uvc are the candidates to still call the functions with no
> valid gadget set. This patch prevents the usage of the gadget if it was
> already unset.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/composite.c | 4 ++--
>  drivers/usb/gadget/udc/core.c  | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 504c1cbc255d1..1b4cd01e2ae13 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -393,7 +393,7 @@ int usb_function_deactivate(struct usb_function *function)
>  
>  	spin_lock_irqsave(&cdev->lock, flags);
>  
> -	if (cdev->deactivations == 0) {
> +	if (cdev->deactivations == 0 && cdev->gadget) {
>  		spin_unlock_irqrestore(&cdev->lock, flags);
>  		status = usb_gadget_deactivate(cdev->gadget);
>  		spin_lock_irqsave(&cdev->lock, flags);
> @@ -428,7 +428,7 @@ int usb_function_activate(struct usb_function *function)
>  		status = -EINVAL;
>  	else {
>  		cdev->deactivations--;
> -		if (cdev->deactivations == 0) {
> +		if (cdev->deactivations == 0 && cdev->gadget) {
>  			spin_unlock_irqrestore(&cdev->lock, flags);
>  			status = usb_gadget_activate(cdev->gadget);
>  			spin_lock_irqsave(&cdev->lock, flags);
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 14fdf918ecfeb..52964d0e26fa6 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -756,6 +756,9 @@ int usb_gadget_deactivate(struct usb_gadget *gadget)
>  {
>  	int ret = 0;
>  
> +	if (!gadget)
> +		return ret;
> +

As far as I can tell, the only caller of usb_gadget_deactivate() is
usb_function_deactivate(). With the NULL check in
usb_function_deactivate(), do we need one here ? If so, I would expect a
similar NULL check in usb_gadget_activate().

Apart from this the patch looks ok to me, but I'm not sure if it's
really fixing the problem globally or only in specific places. I'll let
Felipe comment on this.

>  	if (gadget->deactivated)
>  		goto out;
>  

-- 
Regards,

Laurent Pinchart
