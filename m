Return-Path: <linux-usb+bounces-11182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D56904FBE
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 11:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA2C1C20FBF
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 09:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8B816DEC8;
	Wed, 12 Jun 2024 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DeV/MilL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D956DA34
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186161; cv=none; b=uTYG6DttbRrWMsnJnYMqDoBCBuyuKbwqx05a3SR8qGlpiVQof1DXsHhn5H82iXEv89OYXK9iVulMXmv39JpHBaFzfQy6T/a6NEp40Q5WXk6yGyeXmJyqMkGz/kG2oJeNXj7WJUob6zF8xzH1fjzOPweV5eOHUCXiRVMDHbYUtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186161; c=relaxed/simple;
	bh=LwJkXaLVhYCVQKqiemtVs0NsZrTtn1ccRAqqjW6RZjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iamDgM5N7eM+von1M9qI7J5mMu+AHTUdWT8oXiZx0E+boikhbpvn+VJRA3KztjWGALxBoTv/tXXl3kxxcpgNi+NwOX1vY6ALXXAKBAuzGiQ6q5p21ujS+keN1m1ioMIdKF2U6z47vOcfZR4UVv1pZGmuv6a5OA+H4Jl2gD5LQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DeV/MilL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A23C32789;
	Wed, 12 Jun 2024 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718186161;
	bh=LwJkXaLVhYCVQKqiemtVs0NsZrTtn1ccRAqqjW6RZjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DeV/MilLSUGwbVjp8jZFtvrXtVp/HrvQy0XVV7f2jk+u+sg8zPkdehfl8u777EfqM
	 t9lou+oSuhPHrzAhUcx6gJMzRRZUmfaAPdaOavGNLcy7p2mDvEGIwtPN+AqFkKIpoF
	 oAnYwAPxTgmvfqJ0s0LlPv+3IGezTIaRhJNYCkgQ=
Date: Wed, 12 Jun 2024 11:55:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: USB Denial Of Service
Message-ID: <2024061228-cameo-mosaic-cea7@gregkh>
References: <40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu>
 <a09c0dfc-1cdc-445b-a524-305c3f5f3d79@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09c0dfc-1cdc-445b-a524-305c3f5f3d79@rowland.harvard.edu>

On Tue, Jun 11, 2024 at 03:09:32PM -0400, Alan Stern wrote:
> On Tue, Jun 11, 2024 at 10:35:12AM -0400, Alan Stern wrote:
> > Greg, Oliver, or anyone else:
> > 
> > Questions:
> > 
> > If a broken or malicious device causes a USB class driver to add a 
> > thousand (or more) error messages per second to the kernel log, 
> > indefinitely, would that be considered a form of DOS?
> > 
> > Should the driver be fixed?
> > 
> > What is an acceptable rate for an unending stream of error messages?  
> > Once a second?  Once a minute?
> > 
> > At what point should the driver give up and stop trying to communicate 
> > with the device?
> > 
> > (These are not moot questions.  There are indeed drivers, and probably 
> > not just in the USB subsystem, subject to this sort of behavior.)
> 
> Along those lines, what do you think of the following patch for handling 
> -EPROTO, -EILSEQ, or -ETIME status values for the interrupt URB in the 
> cdc-wdm driver?  After one of those errors, the URB is immediately 
> resubmitted, so the error is likely to occur again no more than a 
> millisecond later.  Changing dev_err() to dev_dbg() prevents log 
> spamming.
> 
> Alternatively, the driver could avoid resubmitting the URB when one of 
> those errors occurs.  This is perhaps less appropriate, because these 
> kinds of errors can be transient (although that is normally rare).
> 
> Alan Stern
> 
> 
> 
> Index: usb-devel/drivers/usb/class/cdc-wdm.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/class/cdc-wdm.c
> +++ usb-devel/drivers/usb/class/cdc-wdm.c
> @@ -266,14 +266,14 @@ static void wdm_int_callback(struct urb
>  			dev_err(&desc->intf->dev, "Stall on int endpoint\n");
>  			goto sw; /* halt is cleared in work */
>  		default:
> -			dev_err(&desc->intf->dev,
> +			dev_dbg(&desc->intf->dev,
>  				"nonzero urb status received: %d\n", status);

dev_err_ratelimited() maybe instead?


>  			break;
>  		}
>  	}
>  
>  	if (urb->actual_length < sizeof(struct usb_cdc_notification)) {
> -		dev_err(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
> +		dev_dbg(&desc->intf->dev, "wdm_int_callback - %d bytes\n",

Same here?

thanks,

greg k-h

