Return-Path: <linux-usb+bounces-1115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2727B9BCC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A64C7281850
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 08:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725636AA5;
	Thu,  5 Oct 2023 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GWJ2Eq5R"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F15569D
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 08:23:24 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F56A8A4A;
	Thu,  5 Oct 2023 01:23:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D07157E;
	Thu,  5 Oct 2023 10:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1696494092;
	bh=L+1WGRSocrytZbiGepdy/EO1KrLwfUAlc91OgrtnmIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWJ2Eq5RwYjp6Be8vXGAue9Zn6VujGKZ0hwFZa/y5QGSBcqSI09LXFUmUJJyP4DEf
	 IcKRkvq2u9gCRetKynRRBXB7ZYty9p2Bv8coeRiAIcTCod1gTRv33d5Y1lmae065/C
	 wW5M6bcVMQMYVoN9K2D7GTp9B/WR/PE+OiHp9XUU=
Date: Thu, 5 Oct 2023 11:23:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Avichal Rakesh <arakesh@google.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	jchowdhary@google.com, etalvala@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
Message-ID: <20231005082327.GC13853@pendragon.ideasonboard.com>
References: <20230930184821.310143-1-arakesh@google.com>
 <ZRv2UnKztgyqk2pt@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZRv2UnKztgyqk2pt@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 01:09:06PM +0200, Michael Grzeschik wrote:
> On Sat, Sep 30, 2023 at 11:48:18AM -0700, Avichal Rakesh wrote:
> > We have been seeing two main stability issues that uvc gadget driver
> > runs into when stopping streams:
> >  1. Attempting to queue usb_requests to a disabled usb_ep
> >  2. use-after-free issue for inflight usb_requests
> >
> > The three patches below fix the two issues above. Patch 1/3 fixes the
> > first issue, and Patch 2/3 and 3/3 fix the second issue.
> >
> > Avichal Rakesh (3):
> >   usb: gadget: uvc: prevent use of disabled endpoint
> >   usb: gadget: uvc: Allocate uvc_requests one at a time
> >   usb: gadget: uvc: Fix use-after-free for inflight usb_requests
> >
> > drivers/usb/gadget/function/f_uvc.c     |  11 +-
> > drivers/usb/gadget/function/f_uvc.h     |   2 +-
> > drivers/usb/gadget/function/uvc.h       |   6 +-
> > drivers/usb/gadget/function/uvc_v4l2.c  |  21 ++-
> > drivers/usb/gadget/function/uvc_video.c | 189 +++++++++++++++++-------
> > 5 files changed, 164 insertions(+), 65 deletions(-)
> 
> These patches are not applying on gregkh/usb-testing since
> Greg did take my patches first. I have already rebased them.

I think they got merged too soon :-( We could fix things on top, but
there's very little time to do so for v6.7.

> In the updated version I the stack runs into the
> following error, when enabling lockdep. Could you
> try your version with lockdep enabled?
> 
> [   41.278520] configfs-gadget.vz gadget.0: uvc: reset UVC
> [   47.156261] configfs-gadget.vz gadget.0: uvc: uvc_function_set_alt(2, 0)
> [   47.169177]
> [   47.170903] ============================================
> [   47.176857] WARNING: possible recursive locking detected
> [   47.182798] 6.5.0-20230919-1+ #19 Tainted: G         C
> [   47.189323] --------------------------------------------
> [   47.195256] vzuvcd/412 is trying to acquire lock:
> [   47.200511] ffffff8009560928 (&video->req_lock){....}-{3:3}, at: uvc_video_complete+0x44/0x2e0
> [   47.210172]
> [   47.210172] but task is already holding lock:
> [   47.216687] ffffff8009560928 (&video->req_lock){....}-{3:3}, at: uvcg_video_enable+0x2d0/0x5c0
> [   47.226333]
> [   47.226333] other info that might help us debug this:
> [   47.233625]  Possible unsafe locking scenario:
> [   47.233625]
> [   47.240242]        CPU0
> [   47.242974]        ----
> [   47.245709]   lock(&video->req_lock);
> [   47.249802]   lock(&video->req_lock);
> [   47.253897]
> [   47.253897]  *** DEADLOCK ***
> [   47.253897]
> [   47.260511]  May be due to missing lock nesting notation
> [   47.260511]

-- 
Regards,

Laurent Pinchart

