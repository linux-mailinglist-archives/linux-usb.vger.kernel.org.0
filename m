Return-Path: <linux-usb+bounces-9451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFDF8A9D42
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 16:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758E9286DFD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF12B15AD88;
	Thu, 18 Apr 2024 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AG7C9QIr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB2C1DFD8
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713451125; cv=none; b=VFJ2rUGtmvaWGvW1C4NOmiDoICILsVMiIZMDxDVG9j/ap3JFx+I+EegvmqodbTeoL9Q8yt9gZaNqs7XpSm97JsaZw/JEkqLVn7o8IOcbQHGi55cX68bglEnx8g1AlppGIdqiwdKNQR47Sh7+biS6/LOaGqBNT0j1uCjykF+LCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713451125; c=relaxed/simple;
	bh=hL3F+GbMPAEKWbN2pY0tOY6P6kO3l2EZN/FAO4IidYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBUho7otts2VeTfB7CsEKpIkeK+qzeqzAO07EtjkvbTXN4A34nT1DstqsRogjvsDmGBEpZZ2Wo9dk1B7Y4T9RYWXS3LmHHLjaOxPYTuCH3u/Ey1sGyACp5ZWniPMKacBj9TA1Ui4EtoN8JI3PG4MJ6ellWJ2IkuQG8QeJJIbJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AG7C9QIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF35C113CC;
	Thu, 18 Apr 2024 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713451124;
	bh=hL3F+GbMPAEKWbN2pY0tOY6P6kO3l2EZN/FAO4IidYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AG7C9QIrgEmxvxulqWSTcitLoZ5SX2fCjo9qMX0laLNFGkBOEYKdAUlpe38kOg2Pk
	 kBvyEvqXZuyNYjwsfW993Ln0Z08f4NOxiOCw4CyFvqBjhPmb8dneSATGwcOIgKNayX
	 rNTlbXS3GIdkiFT16OnXUgw3nEsrt7Yeh7R6ETWU=
Date: Thu, 18 Apr 2024 16:38:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix a race condition when processing
 setup packets.
Message-ID: <2024041824-frigidly-barrack-ca97@gregkh>
References: <CO1PR17MB54192FDB6988F5C4F5C4E41DE1082@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB54192FDB6988F5C4F5C4E41DE1082@CO1PR17MB5419.namprd17.prod.outlook.com>

On Tue, Apr 16, 2024 at 07:28:27PM +0000, Chris Wulff wrote:
> 
> If the USB driver passes a pointer into the TRB buffer for creq, this
> buffer can be overwritten with the status response as soon as the event
> is queued. This can make the final check return USB_GADGET_DELAYED_STATUS
> when it shouldn't. Instead use the stored wLength.
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index bffbc1dc651f..8d72acf9a760 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3803,7 +3803,7 @@ static int ffs_func_setup(struct usb_function *f,
>  	__ffs_event_add(ffs, FUNCTIONFS_SETUP);
>  	spin_unlock_irqrestore(&ffs->ev.waitq.lock, flags);
>  
> -	return creq->wLength == 0 ? USB_GADGET_DELAYED_STATUS : 0;
> +	return ffs->ev.setup.wLength == 0 ? USB_GADGET_DELAYED_STATUS : 0;
>  }
>  
>  static bool ffs_func_req_match(struct usb_function *f,
> -- 
> 2.34.1
> 
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

