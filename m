Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3097C61F4ED
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 15:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbiKGOEA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 09:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiKGOEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 09:04:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD58E1A055
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 06:03:58 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB85B4DA;
        Mon,  7 Nov 2022 15:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667829836;
        bh=u6Y6XK16Xaq3GsE3mq/gsPfffsihmp24BNjTQ5rFU1w=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=NNQj/voUE3qV0PvlxEF/oL6VBQJsCq9io2vskVTy7vPfclKz7ksyYsrDGBuCTJBgk
         qQoc7X4MPsJes/+mgufh+pVWFr1LYggidkUNMlosu1XX7uGUGx6gooiJHpE22L+jWD
         whUFE40AO3Bjta1lyZcb3yflHlFqLU1+0ZeliSAQ=
Message-ID: <ce49ea6a-52f8-c0ba-2bb7-9131244e7a98@ideasonboard.com>
Date:   Mon, 7 Nov 2022 14:03:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran@linuxembedded.co.uk,
        balbi@kernel.org, gregkh@linuxfoundation.org, mgr@pengutronix.de,
        w36195@motorola.com
References: <20221019124535.2712902-1-dan.scally@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
In-Reply-To: <20221019124535.2712902-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All


I forgot to add a Fixes tag to this at the time, but I think that this 
patch:


Fixes: cdda479f15cd ("USB gadget: video class function driver")


The problem it's fixing has as far as I can tell been around since then, 
though Michael did patch the uvc_video_encode_isoc_sg() function much 
more recently in 9b969f93bcef ("usb: gadget: uvc: giveback vb2 buffer on 
req complete"), and this patch relies on the change in Michael's.



On 19/10/2022 13:45, Daniel Scally wrote:
> Calling uvcg_complete_buffer() from uvc_video_encode_isoc() sometimes
> causes the final isoc packet for a video frame to be delayed long
> enough to cause the USB controller to drop it. The first isoc packet
> of the next video frame is then received by the host, which interprets
> the toggled FID bit correctly such that the stream continues without
> interruption, but the first frame will be missing the last isoc
> packet's worth of bytes.
>
> To fix the issue delay the call to uvcg_complete_buffer() until the
> usb_request's .complete() callback, as already happens when the data
> is encoded via uvc_video_encode_isoc_sg(). For consistency's sake the
> same change is applied to uvc_video_encode_bulk().
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>
> Changes in v2:
>
> 	- Applied the same change to uvc_video_encode_bulk() for consistency
>
> @Dan - In the end I thought this is probably worth separating from your "usb:
> gadget: uvc: fix sg handling in error case" patch, since it fixes a separate
> issue by itself. I _think_ they're separable but I wasn't experiencing the
> problem you were so I can't test that - let me know if I'm wrong.
>
> @Michael - I dropped your R-b since I made the change to uvc_video_encode_bulk()
> too, didn't want to jump the gun :)
>
>   drivers/usb/gadget/function/uvc_video.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index c00ce0e91f5d..42bd4dd1d4a9 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -87,6 +87,7 @@ static void
>   uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
>   		struct uvc_buffer *buf)
>   {
> +	struct uvc_request *ureq = req->context;
>   	void *mem = req->buf;
>   	int len = video->req_size;
>   	int ret;
> @@ -113,7 +114,7 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
>   		video->queue.buf_used = 0;
>   		buf->state = UVC_BUF_STATE_DONE;
>   		list_del(&buf->queue);
> -		uvcg_complete_buffer(&video->queue, buf);
> +		ureq->last_buf = buf;
>   		video->fid ^= UVC_STREAM_FID;
>   
>   		video->payload_size = 0;
> @@ -194,6 +195,7 @@ static void
>   uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>   		struct uvc_buffer *buf)
>   {
> +	struct uvc_request *ureq = req->context;
>   	void *mem = req->buf;
>   	int len = video->req_size;
>   	int ret;
> @@ -213,7 +215,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>   		video->queue.buf_used = 0;
>   		buf->state = UVC_BUF_STATE_DONE;
>   		list_del(&buf->queue);
> -		uvcg_complete_buffer(&video->queue, buf);
> +		ureq->last_buf = buf;
>   		video->fid ^= UVC_STREAM_FID;
>   	}
>   }
