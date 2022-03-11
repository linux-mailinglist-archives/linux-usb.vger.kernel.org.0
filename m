Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CE04D5BF9
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 08:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238326AbiCKHF7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 02:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346623AbiCKHF5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 02:05:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FC5FABDA
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 23:04:54 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-042-148.catv02.itscom.jp [175.177.42.148])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FFDD488;
        Fri, 11 Mar 2022 08:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646982292;
        bh=K+hwxi2WlF+xfa+GZijuHbBewmeJDw8Pk9b+TAOY6ic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KXSFQgbCNRjntokF3/YrWgubp5nn82wOFieo5m0Kb2QzDdnLYuWgoCYKRTyLDetOr
         3PG6XoEIKdHku8Ipn9SxrabHFocAYQxrP+0DPTD9AunaqKziwCZAAd/aMPl6yLAZl6
         /W0g0N2OhA5Cfg60qADNNPmlcrVoQm8FWuJeZFKA=
Date:   Fri, 11 Mar 2022 16:04:44 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/2] usb: gadget: uvc: clean and rename
 uvcg_queue_next_buffer to uvcg_complete_buffer
Message-ID: <20220311070444.GC1046627@pyrite.rasen.tech>
References: <20220228141659.775302-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228141659.775302-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thanks for the patch.

On Mon, Feb 28, 2022 at 03:16:58PM +0100, Michael Grzeschik wrote:
> The functions purpose is different to its name. We change the function
> name and remove all unused code.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_queue.c | 18 +-----------------
>  drivers/usb/gadget/function/uvc_queue.h |  2 +-
>  drivers/usb/gadget/function/uvc_video.c |  6 +++---
>  3 files changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index d852ac9e47e72c..73ff56043d2e6a 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -326,24 +326,10 @@ int uvcg_queue_enable(struct uvc_video_queue *queue, int enable)
>  }
>  
>  /* called with &queue_irqlock held.. */
> -struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
> +void uvcg_complete_buffer(struct uvc_video_queue *queue,
>  					  struct uvc_buffer *buf)
>  {
> -	struct uvc_buffer *nextbuf;
> -
> -	if ((queue->flags & UVC_QUEUE_DROP_INCOMPLETE) &&
> -	     buf->length != buf->bytesused) {
> -		buf->state = UVC_BUF_STATE_QUEUED;
> -		vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
> -		return buf;
> -	}
> -
>  	list_del(&buf->queue);
> -	if (!list_empty(&queue->irqqueue))
> -		nextbuf = list_first_entry(&queue->irqqueue, struct uvc_buffer,
> -					   queue);
> -	else
> -		nextbuf = NULL;

Is it fine to drop these? They look important to me. If they're not,
then the reason should be explained in the commit message.

>  
>  	buf->buf.field = V4L2_FIELD_NONE;
>  	buf->buf.sequence = queue->sequence++;
> @@ -351,8 +337,6 @@ struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
>  
>  	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
>  	vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
> -
> -	return nextbuf;

This looks fine since all callers ignore it anyway.


Paul

>  }
>  
>  struct uvc_buffer *uvcg_queue_head(struct uvc_video_queue *queue)
> diff --git a/drivers/usb/gadget/function/uvc_queue.h b/drivers/usb/gadget/function/uvc_queue.h
> index 05360a0767f61f..b668927b5d2c4e 100644
> --- a/drivers/usb/gadget/function/uvc_queue.h
> +++ b/drivers/usb/gadget/function/uvc_queue.h
> @@ -93,7 +93,7 @@ void uvcg_queue_cancel(struct uvc_video_queue *queue, int disconnect);
>  
>  int uvcg_queue_enable(struct uvc_video_queue *queue, int enable);
>  
> -struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
> +void uvcg_complete_buffer(struct uvc_video_queue *queue,
>  					  struct uvc_buffer *buf);
>  
>  struct uvc_buffer *uvcg_queue_head(struct uvc_video_queue *queue);
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 7f59a0c4740209..0c8d146b840321 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -112,7 +112,7 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
>  	if (buf->bytesused == video->queue.buf_used) {
>  		video->queue.buf_used = 0;
>  		buf->state = UVC_BUF_STATE_DONE;
> -		uvcg_queue_next_buffer(&video->queue, buf);
> +		uvcg_complete_buffer(&video->queue, buf);
>  		video->fid ^= UVC_STREAM_FID;
>  
>  		video->payload_size = 0;
> @@ -183,7 +183,7 @@ uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
>  		video->queue.buf_used = 0;
>  		buf->state = UVC_BUF_STATE_DONE;
>  		buf->offset = 0;
> -		uvcg_queue_next_buffer(&video->queue, buf);
> +		uvcg_complete_buffer(&video->queue, buf);
>  		video->fid ^= UVC_STREAM_FID;
>  	}
>  }
> @@ -210,7 +210,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>  	if (buf->bytesused == video->queue.buf_used) {
>  		video->queue.buf_used = 0;
>  		buf->state = UVC_BUF_STATE_DONE;
> -		uvcg_queue_next_buffer(&video->queue, buf);
> +		uvcg_complete_buffer(&video->queue, buf);
>  		video->fid ^= UVC_STREAM_FID;
>  	}
>  }
> -- 
> 2.30.2
> 
