Return-Path: <linux-usb+bounces-1116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757CA7B9BDA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2DE4D281D70
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 08:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174AF6ABA;
	Thu,  5 Oct 2023 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z8VVPNJz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1BE63C9
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 08:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901E2C116AD;
	Thu,  5 Oct 2023 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696495212;
	bh=mwYaaJbWlAoopqVEUrMRNTuhiIF9DxtU8jT69JwJkzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z8VVPNJzgmmhxQaQ6f2FwT4nIhXH1wTWASWD0bnxEc5r1uDnsWbi9tfLqgkvwIp9y
	 GxDNIJLkIuki8KJM6nBPy0cvtIkDZiYqNSKIIM4H+vYPR5C7Qbf1FYZS0mPC3VCgNG
	 xSjLYqyHhp3UK3By74Zf5YWH7ekeO82TTIbAxnww=
Date: Thu, 5 Oct 2023 10:40:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	dan.scally@ideasonboard.com, nicolas@ndufresne.ca,
	kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <2023100557-crabbing-superhero-02f9@gregkh>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
 <20231005081716.GA13853@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005081716.GA13853@pendragon.ideasonboard.com>

On Thu, Oct 05, 2023 at 11:17:16AM +0300, Laurent Pinchart wrote:
> Hi Michael,
> 
> Thank you for the patch.
> 
> On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> > Since the uvc-video gadget driver is using the v4l2 interface,
> > the streamon and streamoff can be triggered at any times. To ensure
> > that the pump worker will be closed as soon the userspace is
> > calling streamoff we synchronize the state of the gadget ensuring
> > the pump worker to bail out.
> 
> I'm sorry but I really dislike this. Not only does the patch fail to
> ensure real synchronization, as the uvcg_video_pump() function still
> runs asynchronously, it messes up the usage of the state field that now
> tracks the state both from a host point of view (which it was doing so
> far, updating the state based on callbacks from the UDC), and from a
> gadget userspace point of view. This lacks clarity and is confusing.
> Furthermore, the commit message doesn't even explain what issue is being
> fixed here.
> 
> Greg, I think this series has been merged too soon :-(

Ok, I'll go revert them now, thanks for the review.

greg k-h

