Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94EBC507B2B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 22:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357704AbiDSUtn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 16:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357370AbiDSUtm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 16:49:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E4D4130B
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 13:46:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-145-nat.elisa-mobile.fi [85.76.5.145])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1A1425B;
        Tue, 19 Apr 2022 22:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650401217;
        bh=Z7qVvTmzcoWqIVhENl92K6hHEseW+EyMDZ+60xOGgCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kaJikOH29TQHROac3A5BTz58lYtZjBkgfzIzyFFIorEig/8M9eq2lCGTAJygaVSuB
         g9YlMYK8Tm7oiMFMqLwRjPEVP6/MJToell5d3++Oi5LEKFISZXOyuuaYXef3W0h98j
         wyfCeBbEX3ZkXKWtUooYeON9NjxIdajs9FgBI8SQ=
Date:   Tue, 19 Apr 2022 23:46:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Sun, Apr 03, 2022 at 01:39:12AM +0200, Michael Grzeschik wrote:
> Likewise to the uvcvideo hostside driver, this patch is changing the
> simple workqueue to an async_wq with higher priority. This ensures that
> the worker will not be scheduled away while the video stream is handled.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc.h       | 1 +
>  drivers/usb/gadget/function/uvc_v4l2.c  | 2 +-
>  drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index c3607a32b98624..ab537acdae3184 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -86,6 +86,7 @@ struct uvc_video {
>  	struct usb_ep *ep;
>  
>  	struct work_struct pump;
> +	struct workqueue_struct *async_wq;
>  
>  	/* Frame parameters */
>  	u8 bpp;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a2c78690c5c288..9b1488f7abd736 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -170,7 +170,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  		return ret;
>  
>  	if (uvc->state == UVC_STATE_STREAMING)
> -		schedule_work(&video->pump);
> +		queue_work(video->async_wq, &video->pump);
>  
>  	return ret;
>  }
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 7f59a0c4740209..b1075e23a61010 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -269,7 +269,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	spin_unlock_irqrestore(&video->req_lock, flags);
>  
>  	if (uvc->state == UVC_STATE_STREAMING)
> -		schedule_work(&video->pump);
> +		queue_work(video->async_wq, &video->pump);
>  }
>  
>  static int
> @@ -469,7 +469,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  
>  	video->req_int_count = 0;
>  
> -	schedule_work(&video->pump);
> +	queue_work(video->async_wq, &video->pump);
>  
>  	return ret;
>  }
> @@ -483,6 +483,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  	spin_lock_init(&video->req_lock);
>  	INIT_WORK(&video->pump, uvcg_video_pump);
>  
> +	/* Allocate a stream specific work queue for asynchronous tasks. */

You can drop the "stream" here. The gadget driver handles a single
stream.

> +	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI, 0);

Unless I'm mistaken, an unbound work queue means that multiple CPUs will
handle tasks in parallel. Is that safe ?

> +	if (!video->async_wq)
> +		return -EINVAL;

No need to destroy the work queue somewhere ?

> +
>  	video->uvc = uvc;
>  	video->fcc = V4L2_PIX_FMT_YUYV;
>  	video->bpp = 16;

-- 
Regards,

Laurent Pinchart
