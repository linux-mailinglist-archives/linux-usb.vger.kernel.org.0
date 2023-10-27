Return-Path: <linux-usb+bounces-2265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271797D95C5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3C3B213CE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D920217992;
	Fri, 27 Oct 2023 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X0Xb4YoQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF48489
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23800C433C8;
	Fri, 27 Oct 2023 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698404262;
	bh=zv/La0mUs2Yvzl+422m0YZfDq5Hu9ggQDrjNpIG5mjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0Xb4YoQKF+z7a8mwmuNFo00ZaPOVW6qF2Vc+NdOX5oDuf8aNsitRTMCrIvlUhc68
	 RLaPmlWxBkk9jN3rmQKbCc6tKAho2DsDZM7mlk4bm2rymGYBWIShOEJk6of1uGsHRf
	 2xb31D0Xuhmhp30l1fV5qx7liOoE38D2OuVEntHw=
Date: Fri, 27 Oct 2023 12:57:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shuzhen Wang <shuzhenwang@google.com>
Cc: laurent.pinchart@ideasonboard.com, balbi@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Add missing initialization of ssp
 config descriptor
Message-ID: <2023102712-diagnoses-crouton-7fb2@gregkh>
References: <14ceb63f-1769-4025-ad90-c38112dfec79@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14ceb63f-1769-4025-ad90-c38112dfec79@google.com>

On Thu, Oct 26, 2023 at 12:29:02PM -0700, Shuzhen Wang wrote:
> In case the uvc gadget is super speed plus, the corresponding config
> descriptor wasn't initialized. As a result, the host will not recognize
> the devices when using super speed plus connection.
> 
> This patch initializes them to super speed descriptors.
> 
> Signed-off-by: Shuzhen Wang <shuzhenwang@google.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

