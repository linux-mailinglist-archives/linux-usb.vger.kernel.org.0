Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593184690DB
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 08:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238477AbhLFHhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 02:37:53 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:43067 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229652AbhLFHhw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 02:37:52 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id D44622B003E0;
        Mon,  6 Dec 2021 02:34:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 06 Dec 2021 02:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=ahVbRPtgK6zyE1CRjavNA8Lh+DG
        /eli+vLgP5Zg/460=; b=A5rjyKZqxudfeUu4zvNpprGYDDuMqfCZW6HelU52vpr
        beCEG6u+dxklGFeSFYf6LIYouUNLU5v71DEGk0EaTpJj6Weahbubn4WZG3cTWuaV
        yZOZRdgkVrpRlNVejypSyuLxBCe6zzWy3F9mvRJ5c0to61/QPJF/h+9bESnhzwlp
        4A19cLdZZ8Qbk/HxcxU4tB1V5uapMrfWM+Vw7b1ip9kBYecksnBEfYWIIBLOD7g9
        DG0CNZ+ttkFr10nEtVTvj1Rf1t6wvuljynMgsme8KDqGuldm2nKZ9vrxcOUofr9C
        t7ik0HPSOSZJ6jRsrG2BLjO0ZPIZbLZr3GBteOCHEjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ahVbRP
        tgK6zyE1CRjavNA8Lh+DG/eli+vLgP5Zg/460=; b=TlbtEzaYC0Q0ToGCUZI5ou
        bR5yQpGmi1lbeNYvQaS1sdD3ukxr3netwbQ0u1kKHJop0Sno/j/DUbDJZcP695QN
        3c7jw7T2Kb6MXPMsTX2vjRvwMYYSnnte//lLBw2lkabnscqUnSfSvGq7+9e7Wy6A
        H9/mZaUTfagMckdz+so0FqSo4pBbLIrN14T2HTaKH6pEG2A2QsFh/yO5wvbbFNIg
        GSTjWvur0QXbDKNXSvD2/1cII4Xpmjq1syXj72mF/6Y8cYvXM+6ewFZ8j2U+AWyR
        ONxc7yLkIh5vx41xrPYqT/xHNAYClA062RnrjZP2VMN3IWUfMBDdW3bOHkDXNl3g
        ==
X-ME-Sender: <xms:_rytYfzlPd0xqg4x7pA8oV6XFHLqzjBQxGiYYt3jvsSNPLnIexiNAw>
    <xme:_rytYXRwQaSNfl3xbp7fwwPqhJqEaTNyTlDje6xUEY_P3FjDS9UF54GfumL3VATBu
    J1R7MCljt4g6g>
X-ME-Received: <xmr:_rytYZVxNfWiYqZBI-Q14HQl5Cztj9D8HqnL5_9HYJpkZWMJpcGILKU61QrGzxrmR54ierl1H26k0MW2L9wLhdlbvL7IEzDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjedvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:_rytYZimDJyyUssVFPOidy6ZMU4IQRbM3I2tNdXXR4Sq6liWjkeeWQ>
    <xmx:_rytYRBDc28DA9d1_46gkBlnLmXCykLayE6cipNAALPTRd86tQ56fg>
    <xmx:_rytYSKK-jXqKE1wLyoKv7fajqjyPb9Ou-cAnqk37jWKhHVPaG3HKQ>
    <xmx:_rytYV65cCaCG2GrS8zuy_4TyORnEB8jb8X5RiKh9Wij066aOjI-sn36Ieg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 02:34:21 -0500 (EST)
Date:   Mon, 6 Dec 2021 08:34:17 +0100
From:   Greg KH <greg@kroah.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: use pump call conditionally
Message-ID: <Ya28+RJGvqT8s8nw@kroah.com>
References: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
 <YaoTpQ0nNa+sUQ/y@kroah.com>
 <20211205214958.GB31430@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205214958.GB31430@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 05, 2021 at 10:49:58PM +0100, Michael Grzeschik wrote:
> On Fri, Dec 03, 2021 at 01:55:01PM +0100, Greg KH wrote:
> > On Thu, Dec 02, 2021 at 01:58:52AM +0100, Michael Grzeschik wrote:
> > > Preparing the usb request is not very expensive, when using
> > > scatter gather. In that case we can even remove the overhead
> > > of the extra pump worker and call the pump function directly.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > ---
> > >  drivers/usb/gadget/function/uvc_v4l2.c  |  8 +++++--
> > >  drivers/usb/gadget/function/uvc_video.c | 28 +++++++++++++++++++------
> > >  drivers/usb/gadget/function/uvc_video.h |  2 ++
> > >  3 files changed, 30 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > > index a2c78690c5c288..020b4adc7840e0 100644
> > > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > > @@ -169,8 +169,12 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
> > >  	if (ret < 0)
> > >  		return ret;
> > > 
> > > -	if (uvc->state == UVC_STATE_STREAMING)
> > > -		schedule_work(&video->pump);
> > > +	if (uvc->state == UVC_STATE_STREAMING) {
> > > +		if (!video->queue.use_sg)
> > > +			schedule_work(&video->pump);
> > > +		else
> > > +			uvcg_video_pump(video);
> > 
> > Wouldn't it be easier to understand this if you flip the if test around:
> > 		if (video->queue.use_sg)
> > 			uvcg_video_pump(video);
> > 		else
> > 			schedule_work(&video->pump);
> > ?
> > 
> > Negagive logic is never fun to read...
> 
> Yes, you are not wrong.
> 
> > Also, are you sure that sg really is not expensive on all systems?  What
> > did you test this on, and what was the results?
> 
> I tested it on an zynqmp arm64 machine. I tried to test the sg case on
> an 32 bit IMX with chipidea, but the driver was complaining a lot about
> "not page aligned sg buffers". So if needed, I would first need to find
> a working machine to compare this with.
> 
> However I would think that assigning some pointers on a scatterlist
> instead of doing memcpy of 1024 bytes should be less expensive.

Not true on many systems, memcpy can be _very_ fast, especially for
small amounts like 1024 bytes.  So please, measure this to be sure.

thanks,

greg k-h
