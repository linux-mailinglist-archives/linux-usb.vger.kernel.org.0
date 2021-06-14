Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5B43A60D2
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 12:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbhFNKiS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 06:38:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57192 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbhFNKgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 06:36:16 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2427EA59;
        Mon, 14 Jun 2021 12:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623666852;
        bh=+X+e7ka6eAOFM4N5akD3JITUCPQXC0201jbPhlQCg2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PG61u77s5Ukpef3fKokpT14jg+O12xO8lmOwFEk2LYsB8bfGiQrREVA2xdbK1CZ9j
         56jdq2wGxQwhz2JoEvacxyJ56yQ9gsoVq0ds84Em/joDa27OT+vUtR06ITKzx/Sk/X
         xj3EUemW9rwVZ7Icbpf96NUjf87I/9NRc5XA+QVY=
Date:   Mon, 14 Jun 2021 19:34:03 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: make uvc_num_requests depend on
 gadget speed
Message-ID: <20210614103403.GA1234605@pyrite.rasen.tech>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530223041.15320-2-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Mon, May 31, 2021 at 12:30:39AM +0200, Michael Grzeschik wrote:
> While sending bigger images is possible with USB_SPEED_SUPER it is
> better to use more isochronous requests in flight. This patch makes the
> number uvc_num_requests dynamic by changing it depending on the gadget
> speed.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Looks good to me.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> v1 -> v2: - fixed null pointer dereference in uvc_video_free_requests
> 
>  drivers/usb/gadget/function/uvc.h       | 11 +++--
>  drivers/usb/gadget/function/uvc_queue.c |  7 ++++
>  drivers/usb/gadget/function/uvc_video.c | 56 +++++++++++++++----------
>  3 files changed, 48 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 23ee25383c1f7..83b9e945944e8 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -65,13 +65,17 @@ extern unsigned int uvc_gadget_trace_param;
>   * Driver specific constants
>   */
>  
> -#define UVC_NUM_REQUESTS			4
>  #define UVC_MAX_REQUEST_SIZE			64
>  #define UVC_MAX_EVENTS				4
>  
>  /* ------------------------------------------------------------------------
>   * Structures
>   */
> +struct uvc_request {
> +	struct usb_request *req;
> +	__u8 *req_buffer;
> +	struct uvc_video *video;
> +};
>  
>  struct uvc_video {
>  	struct uvc_device *uvc;
> @@ -87,10 +91,11 @@ struct uvc_video {
>  	unsigned int imagesize;
>  	struct mutex mutex;	/* protects frame parameters */
>  
> +	int uvc_num_requests;
> +
>  	/* Requests */
>  	unsigned int req_size;
> -	struct usb_request *req[UVC_NUM_REQUESTS];
> -	__u8 *req_buffer[UVC_NUM_REQUESTS];
> +	struct uvc_request *ureq;
>  	struct list_head req_free;
>  	spinlock_t req_lock;
>  
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index 61e2c94cc0b0c..dcd71304d521c 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -43,6 +43,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> +	struct uvc_device *uvc = video->uvc;
> +	struct usb_composite_dev *cdev = uvc->func.config->cdev;
>  
>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>  		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
> @@ -51,6 +53,11 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = video->imagesize;
>  
> +	if (cdev->gadget->speed < USB_SPEED_SUPER)
> +		video->uvc_num_requests = 4;
> +	else
> +		video->uvc_num_requests = 64;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 633e23d58d868..57840083dfdda 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -11,6 +11,7 @@
>  #include <linux/errno.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> +#include <linux/module.h>
>  #include <linux/usb/video.h>
>  
>  #include <media/v4l2-dev.h>
> @@ -145,7 +146,8 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
>  static void
>  uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  {
> -	struct uvc_video *video = req->context;
> +	struct uvc_request *ureq = req->context;
> +	struct uvc_video *video = ureq->video;
>  	struct uvc_video_queue *queue = &video->queue;
>  	unsigned long flags;
>  
> @@ -177,16 +179,19 @@ uvc_video_free_requests(struct uvc_video *video)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < UVC_NUM_REQUESTS; ++i) {
> -		if (video->req[i]) {
> -			usb_ep_free_request(video->ep, video->req[i]);
> -			video->req[i] = NULL;
> -		}
> -
> -		if (video->req_buffer[i]) {
> -			kfree(video->req_buffer[i]);
> -			video->req_buffer[i] = NULL;
> +	if (video->ureq) {
> +		for (i = 0; i < video->uvc_num_requests; ++i) {
> +			if (video->ureq[i].req) {
> +				usb_ep_free_request(video->ep, video->ureq[i].req);
> +				video->ureq[i].req = NULL;
> +			}
> +			if (video->ureq[i].req_buffer) {
> +				kfree(video->ureq[i].req_buffer);
> +				video->ureq[i].req_buffer = NULL;
> +			}
>  		}
> +		kfree(video->ureq);
> +		video->ureq = NULL;
>  	}
>  
>  	INIT_LIST_HEAD(&video->req_free);
> @@ -207,21 +212,26 @@ uvc_video_alloc_requests(struct uvc_video *video)
>  		 * max_t(unsigned int, video->ep->maxburst, 1)
>  		 * (video->ep->mult);
>  
> -	for (i = 0; i < UVC_NUM_REQUESTS; ++i) {
> -		video->req_buffer[i] = kmalloc(req_size, GFP_KERNEL);
> -		if (video->req_buffer[i] == NULL)
> +	video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
> +	if (video->ureq == NULL)
> +		return ret;
> +
> +	for (i = 0; i < video->uvc_num_requests; ++i) {
> +		video->ureq[i].req_buffer = kmalloc(req_size, GFP_KERNEL);
> +		if (video->ureq[i].req_buffer == NULL)
>  			goto error;
>  
> -		video->req[i] = usb_ep_alloc_request(video->ep, GFP_KERNEL);
> -		if (video->req[i] == NULL)
> +		video->ureq[i].req = usb_ep_alloc_request(video->ep, GFP_KERNEL);
> +		if (video->ureq[i].req == NULL)
>  			goto error;
>  
> -		video->req[i]->buf = video->req_buffer[i];
> -		video->req[i]->length = 0;
> -		video->req[i]->complete = uvc_video_complete;
> -		video->req[i]->context = video;
> +		video->ureq[i].req->buf = video->ureq[i].req_buffer;
> +		video->ureq[i].req->length = 0;
> +		video->ureq[i].req->complete = uvc_video_complete;
> +		video->ureq[i].req->context = &video->ureq[i];
> +		video->ureq[i].video = video;
>  
> -		list_add_tail(&video->req[i]->list, &video->req_free);
> +		list_add_tail(&video->ureq[i].req->list, &video->req_free);
>  	}
>  
>  	video->req_size = req_size;
> @@ -312,9 +322,9 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  		cancel_work_sync(&video->pump);
>  		uvcg_queue_cancel(&video->queue, 0);
>  
> -		for (i = 0; i < UVC_NUM_REQUESTS; ++i)
> -			if (video->req[i])
> -				usb_ep_dequeue(video->ep, video->req[i]);
> +		for (i = 0; i < video->uvc_num_requests; ++i)
> +			if (video->ureq && video->ureq[i].req)
> +				usb_ep_dequeue(video->ep, video->ureq[i].req);
>  
>  		uvc_video_free_requests(video);
>  		uvcg_queue_enable(&video->queue, 0);
> -- 
> 2.29.2
> 
