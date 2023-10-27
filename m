Return-Path: <linux-usb+bounces-2257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC387D9578
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3512823CA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7588D8489;
	Fri, 27 Oct 2023 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jghKYXHs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD13C37
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EDEC433C7;
	Fri, 27 Oct 2023 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698403490;
	bh=vFbCH/srwmD/g9Ctlm/jv6FXmmo0Io9XFkmssXqUuK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jghKYXHsBZLjUbPkLCBCFGCWfW1HyEGi418/UPfR6wdlKB1V0lTQ7ppKvs2cPDhF1
	 rhd1Px+TAe6dAU0RStJvf7lycu4rLFjpnlGtxc0Rqq8rCbfcvewNnXprBFsNfDOcxZ
	 bcnLX4FPjAJGf1ipxafZtmYbzy+NFKTSv3hxji6U=
Date: Fri, 27 Oct 2023 12:44:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: mgr@pengutronix.de, Thinh.Nguyen@synopsys.com, arakesh@google.com,
	etalvala@google.com, dan.scally@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH v2] usb:gadget:uvc Do not use worker thread to pump usb
 requests
Message-ID: <2023102732-paralyze-wow-5d01@gregkh>
References: <ZToOJhyOFeGCGUFj@pengutronix.de>
 <20231026215635.2478767-1-jchowdhary@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026215635.2478767-1-jchowdhary@google.com>

On Thu, Oct 26, 2023 at 09:56:35PM +0000, Jayant Chowdhary wrote:
> This patch is based on top of
> https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
> 
> When we use an async work queue to perform the function of pumping
> usb requests to the usb controller, it is possible that thread scheduling
> affects at what cadence we're able to pump requests. This could mean usb
> requests miss their uframes - resulting in video stream flickers on the host
> device.
> 
> In this patch, we move the pumping of usb requests to
> 1) uvcg_video_complete() complete handler for both isoc + bulk
>    endpoints. We still send 0 length requests when there is no uvc buffer
>    available to encode.
> 2) uvc_v4l2_qbuf - only for bulk endpoints since it is not legal to send
>    0 length requests.

Usually when you have to enumerate things in a patch, that implies it
needs to be broken up into multiple changes.  Why isn't that necessary
here?

> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Jayant Chowdhary <jchowdhary@google.com>
> Suggested-by: Jayant Chowdhary <jchowdhary@google.com>
> Suggested-by: Avichal Rakesh <arakesh@google.com>
> Tested-by: Jayant Chowdhary <jchowdhary@google.com>
> ---
>  v1->v2: Fix code style and add self Signed-off-by
> 
>  drivers/usb/gadget/function/f_uvc.c     |  4 --
>  drivers/usb/gadget/function/uvc.h       |  4 +-
>  drivers/usb/gadget/function/uvc_v4l2.c  |  5 +-
>  drivers/usb/gadget/function/uvc_video.c | 71 ++++++++++++++++---------
>  drivers/usb/gadget/function/uvc_video.h |  2 +
>  5 files changed, 51 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index ae08341961eb..53cb2539486d 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -959,14 +959,10 @@ static void uvc_function_unbind(struct usb_configuration *c,
>  {
>  	struct usb_composite_dev *cdev = c->cdev;
>  	struct uvc_device *uvc = to_uvc(f);
> -	struct uvc_video *video = &uvc->video;
>  	long wait_ret = 1;
>  
>  	uvcg_info(f, "%s()\n", __func__);

meta-comment, lines like this need to be deleted in the future.  Not
relevent here, but for future work if you want to add such a cleanup to
a patch series, I'd be grateful.

>  
> -	if (video->async_wq)
> -		destroy_workqueue(video->async_wq);
> -
>  	/*
>  	 * If we know we're connected via v4l2, then there should be a cleanup
>  	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index be0d012aa244..498f344fda4b 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -88,9 +88,6 @@ struct uvc_video {
>  	struct uvc_device *uvc;
>  	struct usb_ep *ep;
>  
> -	struct work_struct pump;
> -	struct workqueue_struct *async_wq;
> -
>  	/* Frame parameters */
>  	u8 bpp;
>  	u32 fcc;
> @@ -116,6 +113,7 @@ struct uvc_video {
>  	/* Context data used by the completion handler */
>  	__u32 payload_size;
>  	__u32 max_payload_size;
> +	bool is_bulk;

As Laurent said, this should be a separate patch.

>  
>  	struct uvc_video_queue queue;
>  	unsigned int fid;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index f4d2e24835d4..678ea6df7b5c 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -414,10 +414,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  	ret = uvcg_queue_buffer(&video->queue, b);
>  	if (ret < 0)
>  		return ret;
> -
> -	if (uvc->state == UVC_STATE_STREAMING)
> -		queue_work(video->async_wq, &video->pump);
> -
> +	uvcg_video_pump_qbuf(video);
>  	return ret;
>  }
>  
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index ab3f02054e85..0fcd8e5edbac 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -24,6 +24,8 @@
>   * Video codecs
>   */
>  
> +static void uvcg_video_pump(struct uvc_video *video);
> +
>  static int
>  uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
>  		u8 *data, int len)
> @@ -329,7 +331,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	 */
>  	if (video->is_enabled) {
>  		list_add_tail(&req->list, &video->req_free);
> -		queue_work(video->async_wq, &video->pump);
> +		spin_unlock_irqrestore(&video->req_lock, flags);
> +		uvcg_video_pump(video);
> +		return;
>  	} else {
>  		uvc_video_free_request(ureq, ep);
>  	}
> @@ -409,20 +413,31 @@ uvc_video_alloc_requests(struct uvc_video *video)
>   * Video streaming
>   */
>  
> +void uvcg_video_pump_qbuf(struct uvc_video *video)
> +{
> +	/*
> +	 * Only call uvcg_video_pump() from qbuf, for bulk eps since
> +	 * for isoc, the complete handler will call uvcg_video_pump()
> +	 * consistently. Calling it for isoc eps, while correct
> +	 * will increase contention for video->req_lock since the
> +	 * complete handler will be called more often.
> +	*/
> +	if (video->is_bulk)
> +		uvcg_video_pump(video);
> +}
> +
>  /*
>   * uvcg_video_pump - Pump video data into the USB requests
>   *
>   * This function fills the available USB requests (listed in req_free) with
>   * video data from the queued buffers.
>   */
> -static void uvcg_video_pump(struct work_struct *work)
> +static void uvcg_video_pump(struct uvc_video *video)
>  {
> -	struct uvc_video *video = container_of(work, struct uvc_video, pump);
>  	struct uvc_video_queue *queue = &video->queue;
> -	/* video->max_payload_size is only set when using bulk transfer */
> -	bool is_bulk = video->max_payload_size;
>  	struct usb_request *req = NULL;
> -	struct uvc_buffer *buf;
> +	struct uvc_request *ureq = NULL;
> +	struct uvc_buffer *buf = NULL, *last_buf = NULL;
>  	unsigned long flags;
>  	bool buf_done;
>  	int ret;
> @@ -455,7 +470,8 @@ static void uvcg_video_pump(struct work_struct *work)
>  		if (buf != NULL) {
>  			video->encode(req, video, buf);
>  			buf_done = buf->state == UVC_BUF_STATE_DONE;
> -		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
> +		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) &&
> +				!video->is_bulk) {

No need to wrap the line.

>  			/*
>  			 * No video buffer available; the queue is still connected and
>  			 * we're transferring over ISOC. Queue a 0 length request to
> @@ -500,18 +516,30 @@ static void uvcg_video_pump(struct work_struct *work)
>  			req->no_interrupt = 1;
>  		}
>  
> -		/* Queue the USB request */
> -		ret = uvcg_video_ep_queue(video, req);
>  		spin_unlock_irqrestore(&queue->irqlock, flags);
> -
> +		spin_lock_irqsave(&video->req_lock, flags);
> +		if (video->is_enabled) {
> +			/* Queue the USB request */
> +			ret = uvcg_video_ep_queue(video, req);
> +			/* Endpoint now owns the request */
> +			req = NULL;
> +			video->req_int_count++;
> +		} else {
> +			ret =  -ENODEV;
> +			ureq = req->context;
> +			last_buf = ureq->last_buf;
> +			ureq->last_buf = NULL;
> +		}
> +		spin_unlock_irqrestore(&video->req_lock, flags);
>  		if (ret < 0) {
> +			if (last_buf != NULL) {
> +				// Return the buffer to the queue in the case the
> +				// request was not queued to the ep.
> +				uvcg_complete_buffer(&video->queue, last_buf);
> +			}
>  			uvcg_queue_cancel(queue, 0);
>  			break;
>  		}
> -
> -		/* Endpoint now owns the request */
> -		req = NULL;
> -		video->req_int_count++;
>  	}
>  
>  	if (!req)
> @@ -556,7 +584,6 @@ uvcg_video_disable(struct uvc_video *video)
>  	}
>  	spin_unlock_irqrestore(&video->req_lock, flags);
>  
> -	cancel_work_sync(&video->pump);
>  	uvcg_queue_cancel(&video->queue, 0);
>  
>  	spin_lock_irqsave(&video->req_lock, flags);
> @@ -626,14 +653,16 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  	if (video->max_payload_size) {
>  		video->encode = uvc_video_encode_bulk;
>  		video->payload_size = 0;
> -	} else
> +		video->is_bulk = true;
> +	} else {
>  		video->encode = video->queue.use_sg ?
>  			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
> +		video->is_bulk = false;

Isn't this already set to 0?

And wait, this is still the bulk endpoint, right?  Or am I missing
something?

thanks,

greg k-h

