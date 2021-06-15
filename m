Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F9F3A747A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 04:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFOC6G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 22:58:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49310 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhFOC6E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 22:58:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACC261838;
        Tue, 15 Jun 2021 03:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623721033;
        bh=uTF87iinzbRY/WAQwIL3pIhAbEW7OwsCZdI7eM4rgPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HKtPLSlxKuh88M0+O2NCnHaKyLnBpfuzpFu2oEhCkwmskXZZcE7jX7oKLK51Mnech
         +YiK+JDF4u+CgimL+EIf65D6BG46GN02/sE69i9v0mizL3eNSn94PH1K00ojO1tc2A
         TDHBCzPXVQpF7pqFSp4Tts1+GZpHo9INEscR7IRY=
Date:   Tue, 15 Jun 2021 04:36:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     paul.elder@ideasonboard.com
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] usb: gadget: uvc: decrease the interrupt load to
 a quarter
Message-ID: <YMgENcJoomZULu+J@pendragon.ideasonboard.com>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
 <20210530223041.15320-4-m.grzeschik@pengutronix.de>
 <20210614103558.GB1234605@pyrite.rasen.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103558.GB1234605@pyrite.rasen.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, Jun 14, 2021 at 07:35:58PM +0900, paul.elder@ideasonboard.com wrote:
> On Mon, May 31, 2021 at 12:30:41AM +0200, Michael Grzeschik wrote:
> > With usb3 we handle much more requests. It only enables the interrupt on
> 
> s/much/many/
> 
> > every quarter of the allocated requests. This patch decreases the
> > interrupt load.
> 
> The last two sentences might be better combined, like:
> 
> "Decrease the interrupt load by only enabling the interrupt every
> quarter of the allocated requests."
> 
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> Other than that, looks good to me.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> > ---
> >  drivers/usb/gadget/function/uvc.h       |  2 ++
> >  drivers/usb/gadget/function/uvc_video.c | 12 ++++++++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> > index c1f06d9df5820..5a76e9351b530 100644
> > --- a/drivers/usb/gadget/function/uvc.h
> > +++ b/drivers/usb/gadget/function/uvc.h
> > @@ -101,6 +101,8 @@ struct uvc_video {
> >  	struct list_head req_free;
> >  	spinlock_t req_lock;
> >  
> > +	int req_int_count;

unsigned int.

> > +
> >  	void (*encode) (struct usb_request *req, struct uvc_video *video,
> >  			struct uvc_buffer *buf);
> >  
> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> > index 240d361a45a44..66754687ce217 100644
> > --- a/drivers/usb/gadget/function/uvc_video.c
> > +++ b/drivers/usb/gadget/function/uvc_video.c
> > @@ -357,6 +357,16 @@ static void uvcg_video_pump(struct work_struct *work)
> >  
> >  		video->encode(req, video, buf);
> >  

A comment to explain the logic would be useful.

> > +		if (list_empty(&video->req_free) ||
> > +		    (buf->state == UVC_BUF_STATE_DONE) ||

No need for parentheses here.

> > +		    (!(video->req_int_count %
> > +		       DIV_ROUND_UP(video->uvc_num_requests, 4)))) {
> > +			video->req_int_count = 0;
> > +			req->no_interrupt = 0;
> > +		} else {
> > +			req->no_interrupt = 1;
> > +		}
> > +
> >  		/* Queue the USB request */
> >  		ret = uvcg_video_ep_queue(video, req);
> >  		spin_unlock_irqrestore(&queue->irqlock, flags);
> > @@ -365,6 +375,7 @@ static void uvcg_video_pump(struct work_struct *work)
> >  			uvcg_queue_cancel(queue, 0);
> >  			break;
> >  		}
> > +		video->req_int_count++;
> >  	}
> >  
> >  	spin_lock_irqsave(&video->req_lock, flags);
> > @@ -437,6 +448,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
> >  	video->width = 320;
> >  	video->height = 240;
> >  	video->imagesize = 320 * 240 * 2;
> > +	video->req_int_count = 0;

Should this be initialized to 0 in uvcg_video_enable() instead of
uvcg_video_init(), to ensure that stop/start cycles will operate in a
predictable way ?

> >  
> >  	/* Initialize the video buffers queue. */
> >  	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,

-- 
Regards,

Laurent Pinchart
