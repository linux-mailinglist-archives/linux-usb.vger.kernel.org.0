Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92AFA43118C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 09:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhJRHs2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 03:48:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhJRHs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 03:48:28 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC4A58C6;
        Mon, 18 Oct 2021 09:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634543176;
        bh=+5DXgvGO51l5WW2VyIFmBw/6Dg+7y/nxyoPkvnT4H9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oF9ZKuKm1V3+X6DoATCqwDzjTWcnxiqCdQx0WYbias0wxsOqYjeRkcAVkMZE6qLqt
         f1w/LUBEv74ZSGcYMFXWFCmVF+YLpxgvAFtKbzb7Gmir/NOdegduIQ4iqDYWSJxZIk
         wOAUQE8VUOM8eAor54kk6H0B8wZ8d98lNQmLw0wc=
Date:   Mon, 18 Oct 2021 10:45:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v4] usb: gadget: uvc: consistently use define for
 headerlen
Message-ID: <YW0mN3tyyV6U3Mjo@pendragon.ideasonboard.com>
References: <20211017215017.18392-2-m.grzeschik@pengutronix.de>
 <20211018072059.11465-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211018072059.11465-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, Oct 18, 2021 at 09:20:59AM +0200, Michael Grzeschik wrote:
> The uvc request headerlen of 2 was defined as UVCG_REQUEST_HEADER_LEN
> in commit e81e7f9a0eb9 ("usb: gadget: uvc: add scatter gather support").
> We missed to use it consistently. This patch fixes that.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3: - fixed wrong use of define
>     - added missing use of define in uvc_video_encode_header
> v4: - fixed headersize in struct uvc_request to also use the define
> 
>  drivers/usb/gadget/function/uvc.h       | 4 +++-
>  drivers/usb/gadget/function/uvc_video.c | 6 +++---
>  drivers/usb/gadget/function/uvc_video.h | 2 --
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 9d5f17b551bbd..b05de36e2c605 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -68,6 +68,8 @@ extern unsigned int uvc_gadget_trace_param;
>  #define UVC_MAX_REQUEST_SIZE			64
>  #define UVC_MAX_EVENTS				4
>  
> +#define UVCG_REQUEST_HEADER_LEN			2
> +
>  /* ------------------------------------------------------------------------
>   * Structures
>   */
> @@ -76,7 +78,7 @@ struct uvc_request {
>  	u8 *req_buffer;
>  	struct uvc_video *video;
>  	struct sg_table sgt;
> -	u8 header[2];
> +	u8 header[UVCG_REQUEST_HEADER_LEN];
>  };
>  
>  struct uvc_video {
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index b4a763e5f70e1..f3e97a4fc0303 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -33,7 +33,7 @@ uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
>  	if (buf->bytesused - video->queue.buf_used <= len - UVCG_REQUEST_HEADER_LEN)
>  		data[1] |= UVC_STREAM_EOF;
>  
> -	return 2;
> +	return UVCG_REQUEST_HEADER_LEN;
>  }
>  
>  static int
> @@ -302,8 +302,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
>  		list_add_tail(&video->ureq[i].req->list, &video->req_free);
>  		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
>  		sg_alloc_table(&video->ureq[i].sgt,
> -			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
> -			       GFP_KERNEL);
> +			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,
> +					    PAGE_SIZE) + 2, GFP_KERNEL);
>  	}
>  
>  	video->req_size = req_size;
> diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
> index 9bf19475f6f9a..03adeefa343b7 100644
> --- a/drivers/usb/gadget/function/uvc_video.h
> +++ b/drivers/usb/gadget/function/uvc_video.h
> @@ -12,8 +12,6 @@
>  #ifndef __UVC_VIDEO_H__
>  #define __UVC_VIDEO_H__
>  
> -#define UVCG_REQUEST_HEADER_LEN			2
> -
>  struct uvc_video;
>  
>  int uvcg_video_enable(struct uvc_video *video, int enable);

-- 
Regards,

Laurent Pinchart
