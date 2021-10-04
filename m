Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676974219D2
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbhJDWRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:17:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54642 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhJDWRc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:17:32 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C311EF;
        Tue,  5 Oct 2021 00:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633385741;
        bh=77gPJztlXOCTwImeeSrBBU5XhOhEqYpgX8xJPRdiUkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gNpRAG3epMyy1QlXy3MF8W6Cwjmc1GUPHrmzypXZ9QP8rEXGjvLwlK3n3MDYkdD9G
         4myzSzpDnnSSdjiC77uFpiPS6mY/FTdCkuYy6Wu27LvhDXSb7Pguih0zNAP9Y8hiqc
         N7fA1Koa489Bye2iJDRvDdlvL7B/6Gd0pZMCouj4=
Date:   Tue, 5 Oct 2021 01:15:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 3/7] usb: gadget: uvc: test if ep->desc is valid on
 ep_queue
Message-ID: <YVt9BrNe1e9C1A42@pendragon.ideasonboard.com>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-4-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-4-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 30, 2021 at 12:27:13PM +0200, Michael Grzeschik wrote:
> The reason that the ep_queue has failed could be an disabled endpoint.

s/an/a/

> In that case it is not guaranteed that the ep->desc is still valid.
> This patch adds an check for NULL.

s/an/a/

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
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

I'd add a comment here:

		/* If the endpoint is disabled the descriptor may be NULL. */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		if (video->ep->desc) {
> +			/* Isochronous endpoints can't be halted. */
> +			if (usb_endpoint_xfer_bulk(video->ep->desc))
> +				usb_ep_set_halt(video->ep);
> +		}
>  	}
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart
