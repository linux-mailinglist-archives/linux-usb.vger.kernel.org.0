Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA8F5F3271
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 17:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiJCP0e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 11:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJCP0d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 11:26:33 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0811F9FF
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com;
        s=Selector; t=1664810789; i=@motorola.com;
        bh=ZqFxfIwY8c1+PMZfykFxP1zS8Mhas301iClgVP8mC0o=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=cXs6PShBQkcjvFMlcwlvfyA+HgXBEJrAzn+VircIU4Fpok4idRAGXIdZsXdMS6tj1
         Sp30etYYkfijiqsSfeg2sPFmDGGYINfCryXQzIvP+8g9reK9w90mvI1b/1wQi6s+ya
         MLJlpajw51dtqLY7aWieRaG0h+BRR4fkcLv1qPU2D7qsV9I89rxMecmUCyP3Ncgw+4
         8Ch0zDaETSfcsFVKQk3NHQdV37M/XXaFaDp1qdPJ3CpO+WALyteq3eVvt1twOUCs/X
         KhgHwewOMvx6vJsOjDAP+DoRdfWwxAjTfY5Y4wsibFvpMYuSsDxJ25dTs80ifyEzgo
         kol0hrKRdwEhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsWS8eKJqK7Kf6t
  kg10brSyOtT1ht+hdtofNonnxejaLXTf72Cw6Jy5ht1i0rJXZ4sTkWAd2j9kdM1k9Nq3qZPNY
  2dPO6LF/7hp2j/6/Bh6fN8kFsEWxZuYl5VcksGYsfnyZueCKYMXBhwdYGxjf8nUxcnEICUxnk
  rjZsZkNwlnEJPF40gv2LkYODhYBFYkZX4y7GDk52ATUJBa8XsUMEhYR0Jf4uS0DpJxZYAGjxK
  Tpj5lBaoQFwiQeTNjEAmLzCihLrNt6CswWEnCUOLP7NDNEXFDi5MwnYHFmAS2JG/9eMoHMZBa
  Qllj+jwMkzCngJPHgy17WCYy8s5B0zELSMQuhYwEj8ypGy6SizPSMktzEzBxdQwMDXUNDE11D
  XQtDvcQq3US90mLd1MTiEl0gt7xYL7W4WK+4Mjc5J0UvL7VkEyMwuFOKGAN3MM7o+al3iFGSg
  0lJlPf+c6tkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8qz8A5QSLUtNTK9Iyc4CRBpOW4OBREu
  GteQKU5i0uSMwtzkyHSJ1i1OXo3N91gFmIJS8/L1VKnDfqL1CRAEhRRmke3AhY1F9ilJUS5mV
  kYGAQ4ilILcrNLEGVf8UozsGoJMyr9gtoCk9mXgncpldARzABHdHxBuyIkkSElFQDU9TR6PLE
  f/EXVtm3P1HgdpFQWhK322pNWt70fXVr7urz3cq0mRDlsYph62OH+69c9znPO35rE/faPWd83
  z/53F/l2lj4MCV5y9ow/xny/uuff19zQMjWKquudxqXgpNd6uJ9vssdnBW3/Su3muig9fTOx8
  dhyaLFUYuVY7Y7CEtOnrOvtmTfkcAGfl1+0Tbfg3W+Udd845Sa1La03m5ldNnuZ7iL7aTpecP
  LzAeOvTFdXeFXufdWsqFjsvOL71nPZpTVrrslo/T02tGpS8JLI07V5F++w6zy4dyZmS9Lf1X3
  yrxhzDhj5pEbfHGPx9RaxwO97y4v5/pTJrb1uFPVwk0GftmFM2fymZin+hbcU2Ipzkg01GIuK
  k4EAO3h2D11AwAA
X-Env-Sender: w36195@motorola.com
X-Msg-Ref: server-14.tower-706.messagelabs.com!1664810788!53463!1
X-Originating-IP: [104.232.228.21]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21138 invoked from network); 3 Oct 2022 15:26:28 -0000
Received: from unknown (HELO va32lpfpp01.lenovo.com) (104.232.228.21)
  by server-14.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Oct 2022 15:26:28 -0000
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by va32lpfpp01.lenovo.com (Postfix) with ESMTPS id 4Mh4S44yq2zf6mc;
        Mon,  3 Oct 2022 15:26:28 +0000 (UTC)
Received: from p1g3 (unknown [10.45.7.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: w36195)
        by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4Mh4S42tYLzf6f0;
        Mon,  3 Oct 2022 15:26:28 +0000 (UTC)
Date:   Mon, 3 Oct 2022 10:26:22 -0500
From:   Dan Vacura <w36195@motorola.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran@linuxembedded.co.uk, balbi@kernel.org,
        gregkh@linuxfoundation.org, mgr@pengutronix.de
Subject: Re: [PATCH] uvc: gadget: uvc: Defer uvcg_complete_buffer() until
 .complete()
Message-ID: <Yzr/Htmws3eGa41v@p1g3>
References: <20221003101627.144026-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003101627.144026-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Looks like I did a superset of your change here:
https://lore.kernel.org/all/20220926195307.110121-2-w36195@motorola.com/

I also included the uvc_video_encode_bulk() for consistency, even though
it seems to be unused code.

Out of curiosity, which setup did you test this on? I'm seeing issues on
my devices with the dwc3 controller with some of the recent performance
improvements (scatter/gather support and no_interrupt use). I've tried
to include all relevant changes in my setup, but the issues are still
present.

Any input is appreciated,

Dan


On Mon, Oct 03, 2022 at 11:16:27AM +0100, Daniel Scally wrote:
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
> is encoded via uvc_video_encode_isoc_sg().
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index c00ce0e91f5d..041819a655ed 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -194,6 +194,7 @@ static void
>  uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>  		struct uvc_buffer *buf)
>  {
> +	struct uvc_request *ureq = req->context;
>  	void *mem = req->buf;
>  	int len = video->req_size;
>  	int ret;
> @@ -213,7 +214,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>  		video->queue.buf_used = 0;
>  		buf->state = UVC_BUF_STATE_DONE;
>  		list_del(&buf->queue);
> -		uvcg_complete_buffer(&video->queue, buf);
> +		ureq->last_buf = buf;
>  		video->fid ^= UVC_STREAM_FID;
>  	}
>  }
> -- 
> 2.34.1
> 
