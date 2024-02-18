Return-Path: <linux-usb+bounces-6686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3197859429
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 03:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 988691F21C55
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 02:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4955D15C9;
	Sun, 18 Feb 2024 02:48:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3A04B81F
	for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 02:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708224520; cv=none; b=ePWxZ95jL3TCl3RJjIzSPqxXUCCRaNGVHW1V1bKTAWWYypVF+gKZPYZfhX9t5Xi5xuFDg5OPODeovV/vXK2XVlESCivlMqKXyy3ruW3UVyEjjL3O/fbrAe7E+81RckIcQRGyjlGxLtnRBffDrpfTccK7sSKfhVm+ph17qoy1N/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708224520; c=relaxed/simple;
	bh=p7yfenp4jrtkOfhrylYDBYxttX8XMU9ZoTnmwH9IARM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzYcbYHk/aueqdBMkxHJ298VZ+rOIhUfoL6Qsp2z7GJ9yTwQsKb6p8B8bQbCXun79+Ytz0Mg07WihW7oBq6eg9DHtlKq6wbFtyzJxL80adQPcHvt0m9EF3gjBwghSl89rjNxnblOgKEYARJtyEgP8qRr80pBMPl56Uhs+iWPb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 505356 invoked by uid 1000); 17 Feb 2024 21:48:35 -0500
Date: Sat, 17 Feb 2024 21:48:35 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: document requirements of usb_set_interface on
 disconnection
Message-ID: <e6aa4666-1f39-4fa6-9d10-569e4c3f90e9@rowland.harvard.edu>
References: <20240218005436.46a4ddca@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240218005436.46a4ddca@foxbook>

On Sun, Feb 18, 2024 at 12:54:36AM +0100, Michal Pecio wrote:
> A call to usb_set_interface() crashes if the device is deallocated
> concurrently, such as due to physical removal or serious IO error.
> It could also interfere with other drivers using the device if the
> current driver is unbound before the call is done.
> 
> Document the need to delay driver unbinding until this call returns,
> which solves both issues.
> 
> Explicitly mention finishing pending operations in the documentation
> of the driver disconnect callback.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  Documentation/driver-api/usb/callbacks.rst | 4 +++-
>  drivers/usb/core/message.c                 | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/callbacks.rst b/Documentation/driver-api/usb/callbacks.rst
> index 2b80cf54bcc3..c7fa55375e9a 100644
> --- a/Documentation/driver-api/usb/callbacks.rst
> +++ b/Documentation/driver-api/usb/callbacks.rst
> @@ -100,7 +100,9 @@ This callback is a signal to break any connection with an interface.
>  You are not allowed any IO to a device after returning from this
>  callback. You also may not do any other operation that may interfere
>  with another driver bound the interface, eg. a power management
> -operation.
> +operation. Outstanding operations on the device must complete or be
> +aborted before this callback returns.
> +
>  If you are called due to a physical disconnection, all your URBs will be
>  killed by usbcore. Note that in this case disconnect will be called some
>  time after the physical disconnection. Thus your driver must be prepared
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 077dfe48d01c..08acebd51823 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1516,7 +1516,8 @@ void usb_enable_interface(struct usb_device *dev,
>   * This call is synchronous, and may not be used in an interrupt context.
>   * Also, drivers must not change altsettings while urbs are scheduled for
>   * endpoints in that interface; all such urbs must first be completed
> - * (perhaps forced by unlinking).
> + * (perhaps forced by unlinking). If a thread in your driver uses this call,
> + * make sure your disconnect() method can wait for it to complete.
>   *
>   * Return: Zero on success, or else the status code returned by the
>   * underlying usb_control_msg() call.
> -- 
> 2.43.0

