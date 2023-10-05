Return-Path: <linux-usb+bounces-1109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242B7B9B3F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 09:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3FC2E281B74
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 07:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED185259;
	Thu,  5 Oct 2023 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W4X+yrl3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043520E3
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D04C433B9;
	Thu,  5 Oct 2023 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696489877;
	bh=waTn81+t3Huf4bgZ5kUKfol0AEwKgZ3Oiqv9It1QBkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4X+yrl3VNwQBRtwJ6EnCHhSp5KYbsNS7UxKXHyRxC3eMeHSU0/9k7++LMd5FilsS
	 zmktcYtPQID4HTz0F/X+ck/MGIGvN3fL4eXHguq6R6vKmyLyn3UH0reAowW53HXVqF
	 8cFUS3YAxruk578mRI53eE2SRSqWkcMvhvM6ROBg=
Date: Thu, 5 Oct 2023 09:11:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Avichal Rakesh <arakesh@google.com>
Cc: Michael Grzeschik <mgr@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>, jchowdhary@google.com,
	etalvala@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
Message-ID: <2023100518-everyday-graves-7404@gregkh>
References: <20230930184821.310143-1-arakesh@google.com>
 <ZRv2UnKztgyqk2pt@pengutronix.de>
 <0ccb2c13-438d-4715-af79-d5cf536930cc@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ccb2c13-438d-4715-af79-d5cf536930cc@google.com>

On Tue, Oct 03, 2023 at 04:16:00PM -0700, Avichal Rakesh wrote:
> Thank you for testing the patch, Michael!
> 
> On 10/3/23 04:09, Michael Grzeschik wrote:
> > Hi
> > 
> > On Sat, Sep 30, 2023 at 11:48:18AM -0700, Avichal Rakesh wrote:
> >> We have been seeing two main stability issues that uvc gadget driver
> >> runs into when stopping streams:
> >> 1. Attempting to queue usb_requests to a disabled usb_ep
> >> 2. use-after-free issue for inflight usb_requests
> >>
> >> The three patches below fix the two issues above. Patch 1/3 fixes the
> >> first issue, and Patch 2/3 and 3/3 fix the second issue.
> >>
> >> Avichal Rakesh (3):
> >>  usb: gadget: uvc: prevent use of disabled endpoint
> >>  usb: gadget: uvc: Allocate uvc_requests one at a time
> >>  usb: gadget: uvc: Fix use-after-free for inflight usb_requests
> >>
> >> drivers/usb/gadget/function/f_uvc.c     |  11 +-
> >> drivers/usb/gadget/function/f_uvc.h     |   2 +-
> >> drivers/usb/gadget/function/uvc.h       |   6 +-
> >> drivers/usb/gadget/function/uvc_v4l2.c  |  21 ++-
> >> drivers/usb/gadget/function/uvc_video.c | 189 +++++++++++++++++-------
> >> 5 files changed, 164 insertions(+), 65 deletions(-)
> > 
> > These patches are not applying on gregkh/usb-testing since
> > Greg did take my patches first. I have already rebased them.
> 
> Ah, I didn't realize Greg had picked up your changes in his tree.
> Rebased the patches in V2.

The "v2" series here is almost impossible to follow, sorry.

Please send it as a new thread, not as responses to the individual
commits, how am I supposed to pick them up that way?

And make it v3 please.

thanks,

greg k-h

