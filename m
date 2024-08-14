Return-Path: <linux-usb+bounces-13448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D0951A58
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 13:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A50285118
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 11:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903EA19EEAF;
	Wed, 14 Aug 2024 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B+XoyeEI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A0394;
	Wed, 14 Aug 2024 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723636047; cv=none; b=cuSVSVE3MGfRDiHcgj6uV6eZBBASZYjsyBABxVw2eU0Q1KLny3VuMLw+36fXIOJ9eiVHkrxfsEefi8PSZZvDpKmr58ztSP+uunvRROkmfIWFM/BqWAi2A8QgP6zNOQS8bOra/CwuJ3dFru4vTOTBqcDaZVsL2KJewQ9YFRNiUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723636047; c=relaxed/simple;
	bh=SlbaO7cGhC489C08ilwx/k5CfKjHGqCg8gh/JnSnH44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlHJI1GaTrRVtTQ61AgMkdy9LlpA+VU7rkZHiuYVJBF+rtSKZhanBO3gG8gUgBf4TfYc1Z5/UhkZk6qkmbQXZrVd575f1kr/4ksDEiPLt2K5o1b6YB2udRiIJ5gDFQxETmK9BWsjfapbmcOxTvtjlDp7SRByz+N/x6+gWND/t2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B+XoyeEI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F8DC32786;
	Wed, 14 Aug 2024 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723636046;
	bh=SlbaO7cGhC489C08ilwx/k5CfKjHGqCg8gh/JnSnH44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+XoyeEI8zkO+RyL01fQRQxnbOsF5ajFV+XUGehT6s6JRqVyUoC6coqrbIiTuVCFw
	 BM/ikCQg+kvNvBS4zanlq+KP0Z+vWii2imQQ4FV/WBN6FTCeeP4U7+Hme8JtWWdDg9
	 ng+TWPnbOM0FeMkT6wDrGoJRMcf24n3WGoSpqx28=
Date: Wed, 14 Aug 2024 13:47:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	m.grzeschik@pengutronix.de, jun.li@nxp.com, imx@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [RESEND] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Message-ID: <2024081405-sample-duckbill-ffec@gregkh>
References: <20240814112537.2608949-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814112537.2608949-1-xu.yang_2@nxp.com>

On Wed, Aug 14, 2024 at 07:25:37PM +0800, Xu Yang wrote:
> Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
> isoc usb requests", pump work could only be queued in uvc_video_complete()
> and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
> we can only depend on uvc_video_complete() to queue pump work. However,
> this requires some free requests in req_ready list. If req_ready list is
> empty all the time, pump work will never be queued and video datas will
> never be pumped to usb controller. Actually, this situation could happen
> when run uvc-gadget with static image:
> 
> $ ./uvc-gadget -i 1080p.jpg uvc.0
> 
> When capture image from this device, the user app will always block there.
> 
> The issue is uvc driver has queued video buffer before streamon, but the
> req_ready list is empty all the time after streamon. This will queue pump
> work in uvcg_video_enable() to fill some request to req_ready list so the
> uvc device could work properly.
> 
> Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 1 +
>  1 file changed, 1 insertion(+)

Why is this a RESEND?  What happened to the first one to require this?

thanks,

greg k-h


