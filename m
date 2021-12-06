Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2FA46957E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 13:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242954AbhLFMTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 07:19:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53226 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242106AbhLFMTA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 07:19:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336A5EE;
        Mon,  6 Dec 2021 13:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638792930;
        bh=4V2NSN18xq4J6EcBKjyUiD749DmCC6TWMh9wjRNnG74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mgX35wLW6Bx9V1f7DA1K+kWid/QLp+CsYaE+3w+G7wIhHiVks0PlglsybNHEG3cCL
         1ypsvINz0XTaEO5eSEK9uTG0O1TJkIValrUHIL4toRHEXRxY3lW4Cg+Uwe+7Hk5qXJ
         w8CB4S/q4thX19Gz2xvv+ngtoDDq975aOovsi38Q=
Date:   Mon, 6 Dec 2021 14:15:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg KH <greg@kroah.com>
Cc:     Michael Grzeschik <mgr@pengutronix.de>, linux-usb@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: use pump call conditionally
Message-ID: <Ya3+xr8Z4P25l5My@pendragon.ideasonboard.com>
References: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
 <YaoTpQ0nNa+sUQ/y@kroah.com>
 <20211205214958.GB31430@pengutronix.de>
 <Ya28+RJGvqT8s8nw@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ya28+RJGvqT8s8nw@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Mon, Dec 06, 2021 at 08:34:17AM +0100, Greg KH wrote:
> On Sun, Dec 05, 2021 at 10:49:58PM +0100, Michael Grzeschik wrote:
> > On Fri, Dec 03, 2021 at 01:55:01PM +0100, Greg KH wrote:
> > > On Thu, Dec 02, 2021 at 01:58:52AM +0100, Michael Grzeschik wrote:
> > > > Preparing the usb request is not very expensive, when using
> > > > scatter gather. In that case we can even remove the overhead
> > > > of the extra pump worker and call the pump function directly.
> > > > 
> > > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > > ---
> > > >  drivers/usb/gadget/function/uvc_v4l2.c  |  8 +++++--
> > > >  drivers/usb/gadget/function/uvc_video.c | 28 +++++++++++++++++++------
> > > >  drivers/usb/gadget/function/uvc_video.h |  2 ++
> > > >  3 files changed, 30 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > > > index a2c78690c5c288..020b4adc7840e0 100644
> > > > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > > > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > > > @@ -169,8 +169,12 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > > 
> > > > -	if (uvc->state == UVC_STATE_STREAMING)
> > > > -		schedule_work(&video->pump);
> > > > +	if (uvc->state == UVC_STATE_STREAMING) {
> > > > +		if (!video->queue.use_sg)
> > > > +			schedule_work(&video->pump);
> > > > +		else
> > > > +			uvcg_video_pump(video);
> > > 
> > > Wouldn't it be easier to understand this if you flip the if test around:
> > > 		if (video->queue.use_sg)
> > > 			uvcg_video_pump(video);
> > > 		else
> > > 			schedule_work(&video->pump);
> > > ?
> > > 
> > > Negagive logic is never fun to read...
> > 
> > Yes, you are not wrong.
> > 
> > > Also, are you sure that sg really is not expensive on all systems?  What
> > > did you test this on, and what was the results?
> > 
> > I tested it on an zynqmp arm64 machine. I tried to test the sg case on
> > an 32 bit IMX with chipidea, but the driver was complaining a lot about
> > "not page aligned sg buffers". So if needed, I would first need to find
> > a working machine to compare this with.
> > 
> > However I would think that assigning some pointers on a scatterlist
> > instead of doing memcpy of 1024 bytes should be less expensive.
> 
> Not true on many systems, memcpy can be _very_ fast, especially for
> small amounts like 1024 bytes.  So please, measure this to be sure.

We've moved memcpy()s to a work queue in the host UVC driver for
high-bandwidth devices, which brough massive performance improvements
(if I recall correctly, at least partly due to the parallelization of
memcpy operations). I'm not sure we have measured performances in the
gadget driver with the same level of accuracy and care though.

Michael, do you plan to make measurements ?

-- 
Regards,

Laurent Pinchart
