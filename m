Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BACC41E621
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 04:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351792AbhJAC4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 22:56:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhJAC4y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 22:56:54 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28204A16;
        Fri,  1 Oct 2021 04:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633056909;
        bh=N++zTWxSrtp9ofCmT8OyqPTKrlS35/MpjrOqkscElsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oejvh8xTXH/vh1hYjLlL5JkYVz+n1QYoS0iDoJ5VWyvNrx93qnlNjigkjkYvIbO7j
         4KYSNJfJ7xy6MjSQMI+EcaaiSpOt7CHrBbdGtxiSJPkP15aXsNMvDg1EfyFfPuKns4
         VdeRmO4dtFGx9aA2FslqVW2v4QPtOpVSLjFv/2pM=
Date:   Fri, 1 Oct 2021 11:54:59 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 4/7] usb: gadget: uvc: only schedule stream in streaming
 state
Message-ID: <20211001025459.GD3032473@pyrite.rasen.tech>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-5-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-5-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Thu, Sep 30, 2021 at 12:27:14PM +0200, Michael Grzeschik wrote:
> This patch ensures that the video pump thread will only be scheduled if
> the uvc is really in streaming state. This way the worker will not have
> to run on an empty queue.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_v4l2.c  | 3 ++-
>  drivers/usb/gadget/function/uvc_video.c | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 4ca89eab61590..67922b1355e69 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -169,7 +169,8 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  	if (ret < 0)
>  		return ret;
>  
> -	schedule_work(&video->pump);
> +	if (uvc->state == UVC_STATE_STREAMING)
> +		schedule_work(&video->pump);
>  
>  	return ret;
>  }
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index cdfd3726a86ae..ccee35177411d 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -215,6 +215,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	struct uvc_request *ureq = req->context;
>  	struct uvc_video *video = ureq->video;
>  	struct uvc_video_queue *queue = &video->queue;
> +	struct uvc_device *uvc = video->uvc;
>  	unsigned long flags;
>  
>  	switch (req->status) {
> @@ -237,7 +238,8 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	list_add_tail(&req->list, &video->req_free);
>  	spin_unlock_irqrestore(&video->req_lock, flags);
>  
> -	schedule_work(&video->pump);
> +	if (uvc->state == UVC_STATE_STREAMING)
> +		schedule_work(&video->pump);
>  }
>  
>  static int
> -- 
> 2.30.2
> 
