Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0F941E627
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 05:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhJADI6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 23:08:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47130 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhJADIz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 23:08:55 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7B06A16;
        Fri,  1 Oct 2021 05:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633057631;
        bh=EJGv0JEZMQD4kdrqLPUrOOxN0pZwo26+U4BCgWmQ6fg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJ5Mj3MhY8ky8bE77h5xHlb9AzMsjao6ulN3q/VPx6d9/BiCr3dnIJE0p7yIbLFRs
         0PajgLrsSBJ1Ux4H8q6XIU74GhLsI/dh5sg8Odr4jxwRNrvfyYg9UBx4/pPk2gk2KN
         6v8eTAMIARoOdx0gDYia/JyyXWd3WXIrraYiuVdY=
Date:   Fri, 1 Oct 2021 12:07:02 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 6/7] usb: gadget: uvc: ensure the vdev is unset
Message-ID: <20211001030702.GF3032473@pyrite.rasen.tech>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-7-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-7-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 12:27:16PM +0200, Michael Grzeschik wrote:
> Since the uvc video device will be created on demand, we have to ensure

s/will be/is/

> that the struct is always unprepared. Otherwise the previous settings

s/unprepared/zeroed/

> will colide with the new perparation.

s/will/might/

s/colide/collide/

s/perparation/values/ ? Or s/perparation/preparation/

> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/f_uvc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 1e93ab5c0c88d..b3279ba357331 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -417,6 +417,7 @@ uvc_register_video(struct uvc_device *uvc)
>  	int ret;
>  
>  	/* TODO reference counting. */
> +	memset(&uvc->vdev, 0, sizeof(struct video_device));
>  	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
>  	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;
>  	uvc->vdev.fops = &uvc_v4l2_fops;
> -- 
> 2.30.2
> 
