Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8BBB41E626
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 05:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhJADFT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 23:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhJADFT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 23:05:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28B8C06176A
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 20:03:35 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01CBBA16;
        Fri,  1 Oct 2021 05:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633057414;
        bh=+OFHvaU+UZhPp/1HZzUc43XUMAri2tR/vvDP6chJcVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mrpSWGu6IVQUK9hhQww/DW/6ZUaBXnSFkvNyFGxgG0iW1v39RDYvTm9Ow4r/nkt1e
         TheYa1E9N10x3g75rP9AmBY2hVw4mEFwPGLSGn/7xlBZq74tcLT9PvMgD+DdxCOAvS
         qEIfHoNzH5slIv74VzSbkElak0Wtq56luGsd++2U=
Date:   Fri, 1 Oct 2021 12:03:25 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 5/7] usb: gadget: uvc: only pump video data if necessary
Message-ID: <20211001030325.GE3032473@pyrite.rasen.tech>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-6-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-6-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Thu, Sep 30, 2021 at 12:27:15PM +0200, Michael Grzeschik wrote:
> If the streaming endpoint is not enabled, the worker has nothing to do.
> In the case it still got enqueued, this patch ensueres that it will bail
> out without handling any data.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

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
> -- 
> 2.30.2
> 
