Return-Path: <linux-usb+bounces-1117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91A7B9BEB
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 6EB961C20973
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 08:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799F8DF41;
	Thu,  5 Oct 2023 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gaZQe4MF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA215C5
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 08:48:00 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293649037;
	Thu,  5 Oct 2023 01:47:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E161C57E;
	Thu,  5 Oct 2023 10:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1696495570;
	bh=yyZkL3J0cAG69HxOIHd2njTkV5Y3dqSsqRG6fdLy8wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaZQe4MFEjjJQ7qmyxmz2zo7ADttChrv79R8RaxrV4b1opqmiwoCk8i00TR+ZRgK7
	 ZDsIItpZ0sBpIGZa2e8d1EG7NTbEBEQ9f20EMZceotV6pEGzh5Yb8Z1vtH3sJfwmd7
	 zTJ6wjxMEfymcf3JPCnz51WuyonvLiYO17ThSAi4=
Date: Thu, 5 Oct 2023 11:48:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	dan.scally@ideasonboard.com, nicolas@ndufresne.ca,
	kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <20231005084805.GB31450@pendragon.ideasonboard.com>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
 <20231005081716.GA13853@pendragon.ideasonboard.com>
 <2023100557-crabbing-superhero-02f9@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023100557-crabbing-superhero-02f9@gregkh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 05, 2023 at 10:40:10AM +0200, Greg KH wrote:
> On Thu, Oct 05, 2023 at 11:17:16AM +0300, Laurent Pinchart wrote:
> > Hi Michael,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> > > Since the uvc-video gadget driver is using the v4l2 interface,
> > > the streamon and streamoff can be triggered at any times. To ensure
> > > that the pump worker will be closed as soon the userspace is
> > > calling streamoff we synchronize the state of the gadget ensuring
> > > the pump worker to bail out.
> > 
> > I'm sorry but I really dislike this. Not only does the patch fail to
> > ensure real synchronization, as the uvcg_video_pump() function still
> > runs asynchronously, it messes up the usage of the state field that now
> > tracks the state both from a host point of view (which it was doing so
> > far, updating the state based on callbacks from the UDC), and from a
> > gadget userspace point of view. This lacks clarity and is confusing.
> > Furthermore, the commit message doesn't even explain what issue is being
> > fixed here.
> > 
> > Greg, I think this series has been merged too soon :-(
> 
> Ok, I'll go revert them now, thanks for the review.

Or we can wait a day for Michael to reply, in case this can quickly be
fixed on top for v6.7. I'm now reading on the loooon discussion from v1,
and reviewing the other pending patches that try to tackle the same
issue.

-- 
Regards,

Laurent Pinchart

