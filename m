Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9E153F3DC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 04:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbiFGCRj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 22:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbiFGCRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 22:17:38 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4762459F
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 19:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com;
        s=Selector; t=1654568255; i=@motorola.com;
        bh=W8Xut5B2ldLtyMHJnZ+NRrhUWRnktVN3iU33lneyMzA=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=Yiq/goH8gsvp7oHXw4N3eb4eU8Iy2bYVuXOG37BWvn19EXEgmH7CnQOAE6jpes4e+
         sJ19olJkEQmc7WAVbPFpeMzRA7qHVlQv34pdhXGRxchqpmanzIH4XB2pcnDEQsTULE
         SBLLSh9Flfpi3UEkYRisSwmMMk5W5CvI9RbYUGYqYPIaXBGKoPgO3/rk0lvUJbB2/q
         DRqcVApPJAV6dwId154QLKBZKJqsEC+tlwQJWpKMmIMk5eScV3yWan9MhumnwPR9Zh
         yFcIzHmrlJO6b6p+vLRDOfgHW0JjPl73zX6nI5KJI4tlzB3kjdgmoHZg/23EghIraH
         vnbVuLa7G/SOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsWS8eKJqK7d1nl
  JBo33dS2OtT1ht1g1dSeLxbbTv1ktOicuYbdYtKyV2WJL2xUmi0+ndjJb/PjTx+zA4TG7Yyar
  x6ZVnWwem190M3v0/zXw+LxJLoA1ijUzLym/IoE1o/HzEuaCuSIVn440sjQw7hboYuTiEBKYz
  iRx/8AvFghnMZPExs8bgBxODhYBFYn/i3cwg9hsAmoSC16vArNFBIwkJn+cDlbDLHCAUeLXx4
  AuRg4OYYFUiQsT0kHCvALKEtc+nQUrERIok+jr/cYOEReUODnzCVSrlsSNfy+ZQFqZBaQllv/
  jAAlzCjhKPH18i3UCI+8sJB2zkHTMQuhYwMi8itEmqSgzPaMkNzEzR9fQwEDX0NAEQhsb6iVW
  6SbqlRbrlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBAZ5SlFK8w7GJf0/9Q4xSnIwKYny3
  nGblyTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrd9M1BOsCg1PbUiLTMHGHEwaQkOHiURXk2QNG
  9xQWJucWY6ROoUozHH+Z379zJzdO7vOsAsxJKXn5cqJc4btQSoVACkNKM0D24QLBFcYpSVEuZ
  lZGBgEOIpSC3KzSxBlX/FKM7BqCTMq74FaApPZl4J3L5XQKcwAZ3i82AOyCkliQgpqQam9ID2
  R6uWJEcrVH0TNPz6Mex4p2PE1cnNPwprZ7pWf8952HnlyP57DPu9yv29jx0XY5p+cWbA799L/
  npYbGF+IL/gcOi2KgvXdrWUSO6Dnw8yJ/bd2/hzor9CoWdTwobHH09ozLhY8vbswt+R21/OMe
  Y6eejXTUeX9hbuG0/mFG9QMnfL4PjOf1X6QURU6f2yRe5WK7iFc25P3F95IVl25X6vTXUnJZe
  riC+SbvN/6BM9Z+fWXo41zxxTTt7b2yUVP2uS9cfXN57VbFqs2LrzrN7iQ3MevHFwERW9wb4m
  pN3lk8bPZtZax62mVvk7+95VLM2Me5+py7m44+uVZItXZZqpd/6ui9tmHr0w6v75HiWW4oxEQ
  y3mouJEAJmp2UB/AwAA
X-Env-Sender: w36195@motorola.com
X-Msg-Ref: server-4.tower-636.messagelabs.com!1654568253!78417!1
X-Originating-IP: [104.232.228.21]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31532 invoked from network); 7 Jun 2022 02:17:34 -0000
Received: from unknown (HELO va32lpfpp01.lenovo.com) (104.232.228.21)
  by server-4.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jun 2022 02:17:34 -0000
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by va32lpfpp01.lenovo.com (Postfix) with ESMTPS id 4LHDXF5KbCzhSZf;
        Tue,  7 Jun 2022 02:17:33 +0000 (UTC)
Received: from p1g3 (unknown [10.45.5.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: w36195)
        by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4LHDXF2hNHzf6f0;
        Tue,  7 Jun 2022 02:17:33 +0000 (UTC)
Date:   Mon, 6 Jun 2022 21:17:21 -0500
From:   Dan Vacura <w36195@motorola.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: calculate the number of request
 depending on framesize
Message-ID: <Yp61Me25lBbyGsc8@p1g3>
References: <20220529223848.105914-1-m.grzeschik@pengutronix.de>
 <20220529223848.105914-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220529223848.105914-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Mon, May 30, 2022 at 12:38:46AM +0200, Michael Grzeschik wrote:
> The current limitation of possible number of requests being handled is
> dependent on the gadget speed. It makes more sense to depend on the
> typical frame size when calculating the number of requests. This patch
> is changing this and is using the previous limits as boundaries for
> reasonable minimum and maximum number of requests.
> 
> For a 1080p jpeg encoded video stream with a maximum imagesize of
> e.g. 800kB with a maxburst of 8 and an multiplier of 1 the resulting
> number of requests is calculated to 49.
> 
>         800768         1
> nreqs = ------ * -------------- ~= 49
>           2      (1024 * 8 * 1)
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Thanks for the patch. This improves the usb2 performance on our
android 5.10 kernel with dwc3 controller. Any reason to not cc stable
lines? This does help older releases as well.

Tested-by: Dan Vacura <w36195@motorola.com>

> 
> ---
> v1 -> v2: - using clamp instead of min/max
>           - added calculation example to description
> 	  - commented the additional division by two in the code
> 
>  drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index d25edc3d2174e1..eb9bd9d32cd056 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -44,7 +44,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> -	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
> +	unsigned int req_size;
> +	unsigned int nreq;
>  
>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>  		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
> @@ -53,10 +54,16 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = video->imagesize;
>  
> -	if (cdev->gadget->speed < USB_SPEED_SUPER)
> -		video->uvc_num_requests = 4;
> -	else
> -		video->uvc_num_requests = 64;
> +	req_size = video->ep->maxpacket
> +		 * max_t(unsigned int, video->ep->maxburst, 1)
> +		 * (video->ep->mult);
> +
> +	/* We divide by two, to increase the chance to run
> +	 * into fewer requests for smaller framesizes.
> +	 */
> +	nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
> +	nreq = clamp(nreq, 4U, 64U);
> +	video->uvc_num_requests = nreq;
>  
>  	return 0;
>  }
> -- 
> 2.30.2
> 

