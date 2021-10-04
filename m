Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84258421A0B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbhJDWbY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:31:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54778 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235841AbhJDWbW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:31:22 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B46D85A1;
        Tue,  5 Oct 2021 00:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633386571;
        bh=vOCEolIzbAaVcR2a3kGTePMgkLJsdOOvoiefuvWi4Xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Av8KQcpvSelvWU6yKSpMfb8IDZ/CFjmt+QZi/KEoPdluEkAsQ+5gsJrO7U5tj7NoL
         5ucg+I/TK35COxBxZYrqixK+9FbEYVhlcJDzUiiF33hBchjO8CcCCX4FTzO+y5PiFF
         fmPh4y5jeNHWCAMgxAglZ0SkSbLHn5ZxZwESvLFg=
Date:   Tue, 5 Oct 2021 01:29:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 5/7] usb: gadget: uvc: only pump video data if necessary
Message-ID: <YVuARarduyZhwio8@pendragon.ideasonboard.com>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-6-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-6-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 30, 2021 at 12:27:15PM +0200, Michael Grzeschik wrote:
> If the streaming endpoint is not enabled, the worker has nothing to do.
> In the case it still got enqueued, this patch ensueres that it will bail

s/it still got enqueued/buffers are still queued/
s/ensueres/ensures/

> out without handling any data.

Does this happen when uvc_function_set_alt() calls usb_ep_disable() ?
The current implementation will cause usb_ep_queue() (called from
uvcg_video_ep_queue(), from uvcg_video_pump()) to return an error in
that case, which will result in uvcg_queue_cancel() being called in
uvcg_video_pump(). With this patch, I believe this will still work fine
as userspace is notified of the stream off event and calls
VIDIOC_STREAMOFF, which in turn calls uvcg_video_enable(0) from
uvc_v4l2_streamoff() (or uvcg_video_enable(0) gets called from
uvc_v4l2_release() in the worst case if the application closes the
device). Could you confirm that your understanding matches this analysis
? If so,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index ccee35177411d..152647495fa61 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -335,12 +335,12 @@ static void uvcg_video_pump(struct work_struct *work)
>  {
>  	struct uvc_video *video = container_of(work, struct uvc_video, pump);
>  	struct uvc_video_queue *queue = &video->queue;
> -	struct usb_request *req;
> +	struct usb_request *req = NULL;
>  	struct uvc_buffer *buf;
>  	unsigned long flags;
>  	int ret;
>  
> -	while (1) {
> +	while (video->ep->enabled) {
>  		/* Retrieve the first available USB request, protected by the
>  		 * request lock.
>  		 */
> @@ -390,6 +390,9 @@ static void uvcg_video_pump(struct work_struct *work)
>  		video->req_int_count++;
>  	}
>  
> +	if (!req)
> +		return;
> +
>  	spin_lock_irqsave(&video->req_lock, flags);
>  	list_add_tail(&req->list, &video->req_free);
>  	spin_unlock_irqrestore(&video->req_lock, flags);

-- 
Regards,

Laurent Pinchart
