Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A566F9223
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 14:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjEFMxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 08:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbjEFMxO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 08:53:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F226815EFF
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 05:53:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42F8A5AA;
        Sat,  6 May 2023 14:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683377582;
        bh=xgxkIRshCqOOrMdIVNWEZFfOwQX7f5bnxblMNeYOf3o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fPR3dH6MSD5MbuEXBC8c/p0OwNMrsOZcuNJDdWzVxkyaOjdRnLLdG+ggJO6zJCGWW
         7Z7U/CxUOYtB7ZjvbNLf0OByk7yopVjPjcRS8NFhjvO8sL7mGV3W9psS6do/u8vloJ
         5hrzwGgdzeyUvMXIWUYkhShL1G1XARjYY2ZV9DEk=
Date:   Sat, 6 May 2023 15:53:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Message-ID: <20230506125317.GD17474@pendragon.ideasonboard.com>
References: <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Avichal,

(with a question for Dan below)

On Fri, May 05, 2023 at 03:39:41PM -0700, Avichal Rakesh wrote:
> On 4/20/23 10:20, Laurent Pinchart wrote:
> > 
> > As far as I understand, we have two ways forward here to avoid running
> > out of requests to send: sending data as quickly as possible (maximizing
> > the number of bytes sent in each packet) and filling up with 0-length
> > requests in-between, and spreading the data across packets. I'll call
> > the first one burst mode for lack of a better term.
> 
> Hey all,
> 
> Apologies for the late reply. My not-so-long work took longer than expected.

No worries, I know how it feels :-)

> I tried the 2 (technically 3, but I'll go over it in a bit) approaches we had
> discussed above and the "burst" approach works pretty well. I'll attach that
> to this email, and send another email out with the other patch.
> 
> The first thing I tried was to split one video frame over 266 frames, without
> changing the number of requests allocated. And it works! However, as Laurent
> mentioned, it does add a fair amount of bookkeeping to split a video frame into
> the required number of requests. I also hardcoded the number 266 from our
> discussion, but I am not sure how to figure out that number dynamically. 266
> also didn't work if the host started sending frames at more than 30fps :/, so
> our dynamic calculation would need to take camera's real output fps into
> account, which as far as I can tell is not known to the UVC driver.

It would probably need to monitor how full the request queue is, and
adapt the number of bytes it queues in each request accordingly. That's
indeed quite a bit of work, for little gain compared to the option you
describe below.

> With those issues I tried what Laurent called the "burst" approach
> (attached below), i.e. send the video frames in as few packets as possible,
> and then queue up 0 length packets to keep the ISOC queue happy. This approach
> works perfectly as far as I can tell. Locally I tried with a Linux, Window,
> and MacOS host with no frame drops or ISOC failures on any of them!
> 
> In the current patch, UVC gadget driver keeps the ISOC cadence by effectively
> maintaining a back-pressure on the USB controller (at least to the best of its
> capabilities). Any usb_request available to the UVC gadget gets immediately
> queued back to the USB controller. If a video frame is available, the frame is
> encoded, if not, the length is set to 0. The idea being that the host's polling
> and the controller's 'complete' callback will result in a somewhat consistent
> cadence for the uvc driver after the initial burst of packets.
> 
> However this does mean that at worst, the new video frames are up to 63
> usb_requests behind, but assuming a 125us per usb_request, that amounts to ~8ms
> latency at the worst, which seems acceptable?

There's a trade off between latency and the risk of underruns. We could
decrease the number of queued requests to lower the latency, as long as
we ensure the margin is high enough to avoid underruns in higher load
conditions. We could also do so only when queuing 0-size requests, and
queue the data in burst mode with a higher number of requests.

> Another concern I had was about how the back-pressure might affect other USB
> controllers. DWC3 doesn't seem to be sweating and in local testing I saw no
> EXDEVs or frame drops other than when the stream was being transitioned from
> one configuration to another, but I don't know how this interaction might go for
> other USB controllers. Would you have any insights into non-DWC3 controllers,
> and if they might be negatively affected by having up to 64 requests queued at 
> once?

Dan, do I recall correctly you have tested uvc-gadget with dwc2 too ?
Could you test the patch below ? Testing with musb would be nice too.

> Here's the patch, it doesn't currently handle bulk transfers, but I can upload a
> formal patch with it if this approach seems acceptable!
> 
> ---
>  drivers/usb/gadget/function/uvc_video.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index dd1c6b2ca7c6..d7ad278709d4 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -386,6 +386,7 @@ static void uvcg_video_pump(struct work_struct *work)
>  	struct uvc_buffer *buf;
>  	unsigned long flags;
>  	int ret;
> +	bool buf_int;
> 
>  	while (video->ep->enabled) {
>  		/*
> @@ -408,20 +409,29 @@ static void uvcg_video_pump(struct work_struct *work)
>  		 */
>  		spin_lock_irqsave(&queue->irqlock, flags);
>  		buf = uvcg_queue_head(queue);
> -		if (buf == NULL) {
> +
> +		if (buf != NULL) {
> +			// Encode video frame if we have one.

C-style comments please.

> +			video->encode(req, video, buf);
> +			// Always interrupt for the last usb_request of a video frame
> +			buf_int = buf->state == UVC_BUF_STATE_DONE;
> +		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED)) {
> +			// No video frame, but the queue is still connected
> +			// Send an empty USB request to keep ISOC contract...
> +			req->length = 0;
> +			buf_int = false;
> +		} else {
> +			// queue no longer connected. Stop processing further.
>  			spin_unlock_irqrestore(&queue->irqlock, flags);
>  			break;
>  		}
> 
> -		video->encode(req, video, buf);
> -
>  		/*
>  		 * With usb3 we have more requests. This will decrease the
>  		 * interrupt load to a quarter but also catches the corner
>  		 * cases, which needs to be handled.
>  		 */
> -		if (list_empty(&video->req_free) ||
> -		    buf->state == UVC_BUF_STATE_DONE ||
> +		if (list_empty(&video->req_free) || buf_int ||
>  		    !(video->req_int_count %
>  		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
>  			video->req_int_count = 0;
> @@ -441,8 +451,7 @@ static void uvcg_video_pump(struct work_struct *work)
> 
>  		/* Endpoint now owns the request */
>  		req = NULL;
> -		if (buf->state != UVC_BUF_STATE_DONE)
> -			video->req_int_count++;
> +		video->req_int_count++;
>  	}
> 
>  	if (!req)
> @@ -527,4 +536,3 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
>  	return 0;
>  }
> -

-- 
Regards,

Laurent Pinchart
