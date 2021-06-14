Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BED3A611A
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 12:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhFNKmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 06:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233417AbhFNKkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 06:40:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F10EC06124A
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 03:36:07 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C598F103F;
        Mon, 14 Jun 2021 12:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623666966;
        bh=x2YQkYljleandnl2PsaPox7SW+V7GCyBb/cB5tioMlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rfyk6dHy6lXgiRRDA3qSNgn1JUnIzKvOc0kxochh8Vcp8kQOcpxH0c1806NW0dnWF
         jy+FGBzeexxRDL3m8BxUs3JpHW1pGl78vU8lYe6yTLvMi+QzNucZVzK17uK4UIksLu
         BbNMzFko0ndXu55jqlixB68uQW7B+AkINAZIKBMY=
Date:   Mon, 14 Jun 2021 19:35:58 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] usb: gadget: uvc: decrease the interrupt load to
 a quarter
Message-ID: <20210614103558.GB1234605@pyrite.rasen.tech>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-4-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530223041.15320-4-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Mon, May 31, 2021 at 12:30:41AM +0200, Michael Grzeschik wrote:
> With usb3 we handle much more requests. It only enables the interrupt on

s/much/many/

> every quarter of the allocated requests. This patch decreases the
> interrupt load.

The last two sentences might be better combined, like:

"Decrease the interrupt load by only enabling the interrupt every
quarter of the allocated requests."

> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Other than that, looks good to me.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc.h       |  2 ++
>  drivers/usb/gadget/function/uvc_video.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index c1f06d9df5820..5a76e9351b530 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -101,6 +101,8 @@ struct uvc_video {
>  	struct list_head req_free;
>  	spinlock_t req_lock;
>  
> +	int req_int_count;
> +
>  	void (*encode) (struct usb_request *req, struct uvc_video *video,
>  			struct uvc_buffer *buf);
>  
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 240d361a45a44..66754687ce217 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -357,6 +357,16 @@ static void uvcg_video_pump(struct work_struct *work)
>  
>  		video->encode(req, video, buf);
>  
> +		if (list_empty(&video->req_free) ||
> +		    (buf->state == UVC_BUF_STATE_DONE) ||
> +		    (!(video->req_int_count %
> +		       DIV_ROUND_UP(video->uvc_num_requests, 4)))) {
> +			video->req_int_count = 0;
> +			req->no_interrupt = 0;
> +		} else {
> +			req->no_interrupt = 1;
> +		}
> +
>  		/* Queue the USB request */
>  		ret = uvcg_video_ep_queue(video, req);
>  		spin_unlock_irqrestore(&queue->irqlock, flags);
> @@ -365,6 +375,7 @@ static void uvcg_video_pump(struct work_struct *work)
>  			uvcg_queue_cancel(queue, 0);
>  			break;
>  		}
> +		video->req_int_count++;
>  	}
>  
>  	spin_lock_irqsave(&video->req_lock, flags);
> @@ -437,6 +448,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  	video->width = 320;
>  	video->height = 240;
>  	video->imagesize = 320 * 240 * 2;
> +	video->req_int_count = 0;
>  
>  	/* Initialize the video buffers queue. */
>  	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
> -- 
> 2.29.2
> 
