Return-Path: <linux-usb+bounces-1118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF97B9BF7
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2C9CC281B2F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 08:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B893F101CE;
	Thu,  5 Oct 2023 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0im4Jip8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248B16FDD
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 08:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E4AC116B5;
	Thu,  5 Oct 2023 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696496311;
	bh=4u7zMz1tChsNoGb+xXZPQ0U/1bfNLWD4sHDlcDoasXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0im4Jip8wJzdQjGzdd3zWfjfUf6C2ZXsEbkgIgXiLqmcrcD7+kwzLSaT4y5l6SD18
	 jeF67XMQkEmEwo7ZvecO2p8u1mTyVYFgLk7QEghv+XCuQeS9WLhHub1ecqzmQYbqYR
	 zOUnPJ53FTWFE900s3P/tTSRwfWDtkRdEYm5EO3U=
Date: Thu, 5 Oct 2023 10:58:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	dan.scally@ideasonboard.com, nicolas@ndufresne.ca,
	kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <2023100507-sponsor-guise-d459@gregkh>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
 <20231005081716.GA13853@pendragon.ideasonboard.com>
 <2023100557-crabbing-superhero-02f9@gregkh>
 <20231005084805.GB31450@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005084805.GB31450@pendragon.ideasonboard.com>

On Thu, Oct 05, 2023 at 11:48:05AM +0300, Laurent Pinchart wrote:
> On Thu, Oct 05, 2023 at 10:40:10AM +0200, Greg KH wrote:
> > On Thu, Oct 05, 2023 at 11:17:16AM +0300, Laurent Pinchart wrote:
> > > Hi Michael,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> > > > Since the uvc-video gadget driver is using the v4l2 interface,
> > > > the streamon and streamoff can be triggered at any times. To ensure
> > > > that the pump worker will be closed as soon the userspace is
> > > > calling streamoff we synchronize the state of the gadget ensuring
> > > > the pump worker to bail out.
> > > 
> > > I'm sorry but I really dislike this. Not only does the patch fail to
> > > ensure real synchronization, as the uvcg_video_pump() function still
> > > runs asynchronously, it messes up the usage of the state field that now
> > > tracks the state both from a host point of view (which it was doing so
> > > far, updating the state based on callbacks from the UDC), and from a
> > > gadget userspace point of view. This lacks clarity and is confusing.
> > > Furthermore, the commit message doesn't even explain what issue is being
> > > fixed here.
> > > 
> > > Greg, I think this series has been merged too soon :-(
> > 
> > Ok, I'll go revert them now, thanks for the review.
> 
> Or we can wait a day for Michael to reply, in case this can quickly be
> fixed on top for v6.7. I'm now reading on the loooon discussion from v1,
> and reviewing the other pending patches that try to tackle the same
> issue.

I'd rather take a patchset that everyone agrees with, reverting was easy
and now done.

thanks,

greg k-h

