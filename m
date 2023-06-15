Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62237731ECC
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jun 2023 19:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238484AbjFORQC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 13:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjFORQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 13:16:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB1C270A
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 10:15:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B971A547;
        Thu, 15 Jun 2023 19:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686849326;
        bh=tR7IzJMq1+KrujcCRDAsORFmWkrsfDcaVIAWOybLuV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sZjfRvEJ2LpM8cKLanNOU3Hz4NNvZY6xGI/mV5pjdT25ku0RJNwVbQa6rb/24q8FZ
         n2BbxxcMVsqDmIhWUZyIH44Lf50EvVk69QJt5+yYctI51jyF0Kz9m/oytC8bt6PtID
         02CSMSLcIEMXOfh1QjTOIC23Q0yCywCXlWI3+A60=
Date:   Thu, 15 Jun 2023 20:15:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to
 uvcg_video_enable()
Message-ID: <20230615171558.GK741@pendragon.ideasonboard.com>
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615093406.80195-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Thu, Jun 15, 2023 at 10:34:06AM +0100, Daniel Scally wrote:
> Currently the UVC Gadget's .set_alt() callback disables the USB
> endpoint, following which a V4L2 event is queued that closes
> down the workqueue. This ordering results in repeated calls to
> usb_ep_queue() from the workqueue whilst usb_ep_disable() is
> running - behaviour that the documentation for usb_ep_disable()
> specifically prohibits.
> 
> Move the call to usb_ep_disable() until after cancel_work_sync(),
> which will guarantee the endpoint is no longer in use when
> usb_ep_disable() is called.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c     | 3 ---
>  drivers/usb/gadget/function/uvc_video.c | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 5e919fb65833..4b91bd572a83 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -337,9 +337,6 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
>  		if (uvc->state != UVC_STATE_STREAMING)
>  			return 0;
>  
> -		if (uvc->video.ep)
> -			usb_ep_disable(uvc->video.ep);
> -
>  		memset(&v4l2_event, 0, sizeof(v4l2_event));
>  		v4l2_event.type = UVC_EVENT_STREAMOFF;
>  		v4l2_event_queue(&uvc->vdev, &v4l2_event);

If we don't disable the endpoint here, should we return
USB_GADGET_DELAYED_STATUS here (and call uvc_function_setup_continue()
in uvc_v4l2_streamoff()) or is that not needed ? The uvc->state updated
should then possibly be moved to uvc_v4l2_streamoff() (checking if this
would cause any race condition would also be a nice bonus :-)).

> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 91af3b1ef0d4..c7e38fa26492 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -499,6 +499,10 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  
>  	if (!enable) {
>  		cancel_work_sync(&video->pump);
> +
> +		if (video->ep)
> +			usb_ep_disable(video->ep);
> +
>  		uvcg_queue_cancel(&video->queue, 0);
>  
>  		for (i = 0; i < video->uvc_num_requests; ++i)

-- 
Regards,

Laurent Pinchart
