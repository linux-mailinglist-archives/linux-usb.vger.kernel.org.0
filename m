Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A7D3A747B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 04:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhFOC6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 22:58:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49308 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhFOC6E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 22:58:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 343F7355C;
        Tue, 15 Jun 2021 03:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623721129;
        bh=lhpAB2GD2wbkLMl++lWlJfJxU/CUBHI8ysDi+llPkvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AQi12wpPIMuGbzMXuW2ok2Hh3DRjiWZRHKMLqgX5N1PDg9v4x94KjFq3MmqySMeXg
         d1r8HyQi3WJgiEJ0SP+U0ZAhVo02RlwsygtEB1FaCiYfRRU0OMWhBat5tKk8LKbOOm
         o5Uy0SoTOpeYn7ptr9rJc6igE1M2p5qpzXWBIXVU=
Date:   Tue, 15 Jun 2021 04:38:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: make uvc_num_requests depend on
 gadget speed
Message-ID: <YMgElaUrfYuuZJMj@pendragon.ideasonboard.com>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-2-m.grzeschik@pengutronix.de>
 <YMgCJAHV4vYYZKlv@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMgCJAHV4vYYZKlv@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Another comment.

On Tue, Jun 15, 2021 at 04:28:05AM +0300, Laurent Pinchart wrote:
> On Mon, May 31, 2021 at 12:30:39AM +0200, Michael Grzeschik wrote:
> > While sending bigger images is possible with USB_SPEED_SUPER it is
> > better to use more isochronous requests in flight. This patch makes the
> > number uvc_num_requests dynamic by changing it depending on the gadget
> > speed.
> > 
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> > v1 -> v2: - fixed null pointer dereference in uvc_video_free_requests
> > 
> >  drivers/usb/gadget/function/uvc.h       | 11 +++--
> >  drivers/usb/gadget/function/uvc_queue.c |  7 ++++
> >  drivers/usb/gadget/function/uvc_video.c | 56 +++++++++++++++----------
> >  3 files changed, 48 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> > index 23ee25383c1f7..83b9e945944e8 100644
> > --- a/drivers/usb/gadget/function/uvc.h
> > +++ b/drivers/usb/gadget/function/uvc.h
> > @@ -65,13 +65,17 @@ extern unsigned int uvc_gadget_trace_param;
> >   * Driver specific constants
> >   */
> >  
> > -#define UVC_NUM_REQUESTS			4
> >  #define UVC_MAX_REQUEST_SIZE			64
> >  #define UVC_MAX_EVENTS				4
> >  
> >  /* ------------------------------------------------------------------------
> >   * Structures
> >   */
> > +struct uvc_request {
> > +	struct usb_request *req;
> > +	__u8 *req_buffer;
> 
> While at it, you could s/__u8/u8/ as this header isn't used by
> userspace.
> 
> > +	struct uvc_video *video;
> > +};
> >  
> >  struct uvc_video {
> >  	struct uvc_device *uvc;
> > @@ -87,10 +91,11 @@ struct uvc_video {
> >  	unsigned int imagesize;
> >  	struct mutex mutex;	/* protects frame parameters */
> >  
> > +	int uvc_num_requests;
> 
> Never negative, you can make it an unsigned int.
> 
> > +
> >  	/* Requests */
> >  	unsigned int req_size;
> > -	struct usb_request *req[UVC_NUM_REQUESTS];
> > -	__u8 *req_buffer[UVC_NUM_REQUESTS];
> > +	struct uvc_request *ureq;
> >  	struct list_head req_free;
> >  	spinlock_t req_lock;
> >  
> > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> > index 61e2c94cc0b0c..dcd71304d521c 100644
> > --- a/drivers/usb/gadget/function/uvc_queue.c
> > +++ b/drivers/usb/gadget/function/uvc_queue.c
> > @@ -43,6 +43,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
> >  {
> >  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >  	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> > +	struct uvc_device *uvc = video->uvc;
> > +	struct usb_composite_dev *cdev = uvc->func.config->cdev;
> 
> 	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
> 
> >  
> >  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
> >  		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
> > @@ -51,6 +53,11 @@ static int uvc_queue_setup(struct vb2_queue *vq,
> >  
> >  	sizes[0] = video->imagesize;
> >  
> > +	if (cdev->gadget->speed < USB_SPEED_SUPER)
> > +		video->uvc_num_requests = 4;
> > +	else
> > +		video->uvc_num_requests = 64;
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> > index 633e23d58d868..57840083dfdda 100644
> > --- a/drivers/usb/gadget/function/uvc_video.c
> > +++ b/drivers/usb/gadget/function/uvc_video.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/usb/ch9.h>
> >  #include <linux/usb/gadget.h>
> > +#include <linux/module.h>
> 
> Alphabetical order please.

Why is this header needed ? I can't see anything below related to it.

> >  #include <linux/usb/video.h>
> >  
> >  #include <media/v4l2-dev.h>
> > @@ -145,7 +146,8 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
> >  static void
> >  uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
> >  {
> > -	struct uvc_video *video = req->context;
> > +	struct uvc_request *ureq = req->context;
> > +	struct uvc_video *video = ureq->video;
> >  	struct uvc_video_queue *queue = &video->queue;
> >  	unsigned long flags;
> >  
> > @@ -177,16 +179,19 @@ uvc_video_free_requests(struct uvc_video *video)
> >  {
> >  	unsigned int i;
> >  
> > -	for (i = 0; i < UVC_NUM_REQUESTS; ++i) {
> > -		if (video->req[i]) {
> > -			usb_ep_free_request(video->ep, video->req[i]);
> > -			video->req[i] = NULL;
> > -		}
> > -
> > -		if (video->req_buffer[i]) {
> > -			kfree(video->req_buffer[i]);
> > -			video->req_buffer[i] = NULL;
> > +	if (video->ureq) {
> > +		for (i = 0; i < video->uvc_num_requests; ++i) {
> > +			if (video->ureq[i].req) {
> > +				usb_ep_free_request(video->ep, video->ureq[i].req);
> > +				video->ureq[i].req = NULL;
> > +			}
> 
> Blank line here please.
> 
> > +			if (video->ureq[i].req_buffer) {
> > +				kfree(video->ureq[i].req_buffer);
> > +				video->ureq[i].req_buffer = NULL;
> > +			}
> >  		}
> 
> Here too.
> 
> > +		kfree(video->ureq);
> > +		video->ureq = NULL;
> >  	}
> >  
> >  	INIT_LIST_HEAD(&video->req_free);
> > @@ -207,21 +212,26 @@ uvc_video_alloc_requests(struct uvc_video *video)
> >  		 * max_t(unsigned int, video->ep->maxburst, 1)
> >  		 * (video->ep->mult);
> >  
> > -	for (i = 0; i < UVC_NUM_REQUESTS; ++i) {
> > -		video->req_buffer[i] = kmalloc(req_size, GFP_KERNEL);
> > -		if (video->req_buffer[i] == NULL)
> > +	video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
> > +	if (video->ureq == NULL)
> > +		return ret;
> 
> 		return -ENOMEM;
> 
> would be more readable (I had to check the value of ret to review this
> patch).
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> > +	for (i = 0; i < video->uvc_num_requests; ++i) {
> > +		video->ureq[i].req_buffer = kmalloc(req_size, GFP_KERNEL);
> > +		if (video->ureq[i].req_buffer == NULL)
> >  			goto error;
> >  
> > -		video->req[i] = usb_ep_alloc_request(video->ep, GFP_KERNEL);
> > -		if (video->req[i] == NULL)
> > +		video->ureq[i].req = usb_ep_alloc_request(video->ep, GFP_KERNEL);
> > +		if (video->ureq[i].req == NULL)
> >  			goto error;
> >  
> > -		video->req[i]->buf = video->req_buffer[i];
> > -		video->req[i]->length = 0;
> > -		video->req[i]->complete = uvc_video_complete;
> > -		video->req[i]->context = video;
> > +		video->ureq[i].req->buf = video->ureq[i].req_buffer;
> > +		video->ureq[i].req->length = 0;
> > +		video->ureq[i].req->complete = uvc_video_complete;
> > +		video->ureq[i].req->context = &video->ureq[i];
> > +		video->ureq[i].video = video;
> >  
> > -		list_add_tail(&video->req[i]->list, &video->req_free);
> > +		list_add_tail(&video->ureq[i].req->list, &video->req_free);
> >  	}
> >  
> >  	video->req_size = req_size;
> > @@ -312,9 +322,9 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
> >  		cancel_work_sync(&video->pump);
> >  		uvcg_queue_cancel(&video->queue, 0);
> >  
> > -		for (i = 0; i < UVC_NUM_REQUESTS; ++i)
> > -			if (video->req[i])
> > -				usb_ep_dequeue(video->ep, video->req[i]);
> > +		for (i = 0; i < video->uvc_num_requests; ++i)
> > +			if (video->ureq && video->ureq[i].req)
> > +				usb_ep_dequeue(video->ep, video->ureq[i].req);
> >  
> >  		uvc_video_free_requests(video);
> >  		uvcg_queue_enable(&video->queue, 0);

-- 
Regards,

Laurent Pinchart
