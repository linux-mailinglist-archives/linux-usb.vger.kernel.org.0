Return-Path: <linux-usb+bounces-1114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1AC7B9BC8
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8CD32281AA3
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 08:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5CC63D1;
	Thu,  5 Oct 2023 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cvJ7jATC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8320E3
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 08:21:07 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEAA86B4;
	Thu,  5 Oct 2023 01:21:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3C9057E;
	Thu,  5 Oct 2023 10:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1696493957;
	bh=XF8bFPeMeK8tLS+nC9+H/kwvYZEjOXb1bIm95W1ITok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvJ7jATC8WTFhXws2jZNTYfs9H2Jh5bzmmxzztOcUHDZEL1OovJvjzLaVNWCkpFE7
	 /vgy9ZH7A/M0ikYU0ScpYGBbQx7FAezDh/qXAYtgeZjS1d6vKJ5w318VX0sa+tocE3
	 08BzJH8BoohVFGiPp+X9MuEHlJ6gI57dlVMdKaoU=
Date: Thu, 5 Oct 2023 11:21:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
	nicolas@ndufresne.ca, kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] usb: gadget: uvc: cleanup request when not in
 correct state
Message-ID: <20231005082111.GB13853@pendragon.ideasonboard.com>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-3-m.grzeschik@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911140530.2995138-3-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Michael,

Thank you for the patch.

On Mon, Sep 11, 2023 at 04:05:29PM +0200, Michael Grzeschik wrote:
> The uvc_video_enable function of the uvc-gadget driver is dequeing and
> immediately deallocs all requests on its disable codepath. This is not
> save since the dequeue function is async and does not ensure that the
> requests are left unlinked in the controller driver.
> 
> By adding the ep_free_request into the completion path of the requests
> we ensure that the request will be properly deallocated.

You're swapping one race condition for a different one. With this patch,
request can now be double-freed.

I'll reply to the long discussion on v1 to try and find a proper
solution. As for 1/3, I think this got merged too soon :-(

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v1 == v2
> 
>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 4b68a3a9815d73..c48c904f500fff 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	struct uvc_device *uvc = video->uvc;
>  	unsigned long flags;
>  
> +	if (uvc->state == UVC_STATE_CONNECTED) {
> +		usb_ep_free_request(video->ep, ureq->req);
> +		ureq->req = NULL;
> +		return;
> +	}
> +
>  	switch (req->status) {
>  	case 0:
>  		break;

-- 
Regards,

Laurent Pinchart

