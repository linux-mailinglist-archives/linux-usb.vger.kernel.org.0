Return-Path: <linux-usb+bounces-14371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C99966069
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 13:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A93F31F29EDF
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 11:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C39317B4F5;
	Fri, 30 Aug 2024 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bdsaj6N5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BD1D131D
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725016625; cv=none; b=tr5cvPvpZIleDYhrAeU5cEPojGSjzSGSF/sknxh21jcr/p4PwIjdHjw34iE6SKUaVh//GobNNczprVuSR1pf+ylFgxhwMJs5+/VLL7IIrWBHR28XN3Ri8/xqXDG+s3/HEVYxtEgRWpuLjYPn0xNYf/IAnyhWO2c3t0pzX9nrRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725016625; c=relaxed/simple;
	bh=uft4kwpGB8VhlhPSjzHxmlAFJ0qRStcw7GGp/q7Nn/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0/eOsUT2CGOZcdyB7M/fQTKwt5+0i1CklSSGfRVkTfEpjRco3tzo0BkxbQ/CZhTOMUDgrAKA3Dka3mCAfY12IquawJ4ov4INs8yc8/ttSyXTISGME54rusg/KN6ArzEsMnhdNdYhfFIWaM0tBVxghenuaKNjj8IhzRhr7wl7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bdsaj6N5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E881C4CEC2;
	Fri, 30 Aug 2024 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725016625;
	bh=uft4kwpGB8VhlhPSjzHxmlAFJ0qRStcw7GGp/q7Nn/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdsaj6N5UnQJQrH+KauJ4tUF9N3TuvFrHwFxARleZZzLpgnSRzGPFmAmDrKnS0OmZ
	 xojbfFNMdXHc9jQ6V7mLIArDV+H4wcy+ICxvP2GVUuHfJ+VR37BfLM2nNbvjehL1Pq
	 lbZPCXvT8HSZsQc51IzSSxzc8eSa7Rl1rWlgl6G0=
Date: Fri, 30 Aug 2024 13:17:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Amil Sanan <amilsananak@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dan.scally@ideasonboard.com, linux-usb@vger.kernel.org
Subject: Re: adding a new device in uvc_driver
Message-ID: <2024083035-recovery-babble-df48@gregkh>
References: <CABprV6ReozmBsi5Db-MQw2iHt1mXXjy735yfHwQdeC6RX92RLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABprV6ReozmBsi5Db-MQw2iHt1mXXjy735yfHwQdeC6RX92RLw@mail.gmail.com>

On Fri, Aug 30, 2024 at 04:37:29PM +0530, Amil Sanan wrote:
> adding the webcam of new acer aspire7
> 
> output of lsusb: "Bus 001 Device 002: ID 0408:4033 Quanta Computer, Inc.
> ACER HD User Facing
> 
> "

> From d18ad3bf9bbc93da3eeb0ca4ea6598955ac05a99 Mon Sep 17 00:00:00 2001
> From: amilsanan <amilsananak@gmail.com>
> Date: Thu, 29 Aug 2024 17:38:25 +0530
> Subject: [PATCH] add a device in uvc_driver
> 
> Signed-off-by: amilsanan <amilsananak@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..1a3229ab6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2441,6 +2441,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
>  		.uvc_version = 0x010a,
>  	  } },
> +	  { .match_flags 	= USB_DEVICE_ID_MATCH_DEVICE
> +			| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor = 0x0408,
> +	  .idProduct = 0x4033,
> +	  .bInterfaceClass = USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass = 1,
> +	  .bInterfaceProtocol =	UVC_PC_PROTOCOL_15,
> +	  .driver_info = (kernel_ulong_t) &(const struct uvc_device_info ) 
> +		{.uvc_version = 0x010a, } },
>  	/* LogiLink Wireless Webcam */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> -- 
> 2.43.0
> 


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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

