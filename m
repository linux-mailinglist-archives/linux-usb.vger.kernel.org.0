Return-Path: <linux-usb+bounces-4739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A7824391
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 15:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D9BE1F21023
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 14:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204522EE4;
	Thu,  4 Jan 2024 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y+wgYxLh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE90225AF;
	Thu,  4 Jan 2024 14:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947D2C433C7;
	Thu,  4 Jan 2024 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704377968;
	bh=jfnWO+JhZ4QPmax+cqjet6QLqg4coqHv8g8OKRTw41c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y+wgYxLhjaiAbtjS6xuSM71IeKT3NCQicLyvnoOM+xrlFNibRaqT7s4YbegOyW2Ej
	 FKTLxvCvlBnvwpmPz3JZmU6/iTV5OdlYnfpSdXlotw64cCws0Uq58Celyr+q06UjYM
	 ldx7wgtn9/lQR/VHRmpt05aLJ2rHfau2rMCAi/s0=
Date: Thu, 4 Jan 2024 15:19:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Avichal Rakesh <arakesh@google.com>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	etalvala@google.com, jchowdhary@google.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: uvc: Remove nested locking
Message-ID: <2024010416-stilt-magical-d711@gregkh>
References: <20231215210746.821494-1-arakesh@google.com>
 <20231215210746.821494-2-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215210746.821494-2-arakesh@google.com>

On Fri, Dec 15, 2023 at 01:07:45PM -0800, Avichal Rakesh wrote:
> When handling error status from uvcg_video_usb_req_queue,
> uvc_video_complete currently calls uvcg_queue_cancel with
> video->req_lock held. uvcg_queue_cancel internally locks
> queue->irqlock, which nests queue->irqlock inside
> video->req_lock. This isn't a functional bug at the
> moment, but does open up possibilities for ABBA
> deadlocks in the future.
> 
> This patch fixes the accidental nesting by dropping
> video->req_lock before calling uvcg_queue_cancel.
> 
> Signed-off-by: Avichal Rakesh <arakesh@google.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Again, what commit does this fix?

thanks,

greg k-h

