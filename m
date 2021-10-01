Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536B041E617
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 04:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351696AbhJACtA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 22:49:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351678AbhJACs7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 22:48:59 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07CEEA16;
        Fri,  1 Oct 2021 04:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633056435;
        bh=KjoAS2wSX7uzp7OKClGJyoJcYpR2VrWr6XWaHes5TiA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lPIpHUN3SNQGUNXrWlELpjZRCqoyc0s2keHvrBMO1KGk3nuto1bI2OkTL6wDJ4MSw
         xkrOuE+2+Lpy6nTkGapyJDCrV0Yw9tr4Ewz9ugWoNl/T0tRq8AqfHkCZ0GzHClWf0C
         XoMe2VBcUixg34UMb5SqfE7WsPDVz3Vgtfo6N2bQ=
Date:   Fri, 1 Oct 2021 11:47:06 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 3/7] usb: gadget: uvc: test if ep->desc is valid on
 ep_queue
Message-ID: <20211001024706.GC3032473@pyrite.rasen.tech>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-4-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-4-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Thu, Sep 30, 2021 at 12:27:13PM +0200, Michael Grzeschik wrote:
> The reason that the ep_queue has failed could be an disabled endpoint.

s/an/a/

> In that case it is not guaranteed that the ep->desc is still valid.
> This patch adds an check for NULL.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_video.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index da93b46df464d..cdfd3726a86ae 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -199,9 +199,11 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
>  		uvcg_err(&video->uvc->func, "Failed to queue request (%d).\n",
>  			 ret);
>  
> -		/* Isochronous endpoints can't be halted. */
> -		if (usb_endpoint_xfer_bulk(video->ep->desc))
> -			usb_ep_set_halt(video->ep);
> +		if (video->ep->desc) {
> +			/* Isochronous endpoints can't be halted. */
> +			if (usb_endpoint_xfer_bulk(video->ep->desc))
> +				usb_ep_set_halt(video->ep);
> +		}
>  	}
>  
>  	return ret;
> -- 
> 2.30.2
> 
