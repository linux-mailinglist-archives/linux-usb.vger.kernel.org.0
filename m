Return-Path: <linux-usb+bounces-9463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6F8A9F11
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 17:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01741B217CA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B049016EBF9;
	Thu, 18 Apr 2024 15:51:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 141FE11CA0
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713455485; cv=none; b=LSfR+cdUVc24s3AA+TP0t8BCb6zLKjiwEZQ4D6OVBvodjnZuqp1DTvJYj3yBiesMm02/VBaRx/mum9Ee7NL7e/qn5ZRyw4JmGwkgpKmES103sAiYE39MzYK6jpUNydt7FPVRYJceKAmT4pCFrNRCYF/WO8tEiKcZvG8R2z9OA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713455485; c=relaxed/simple;
	bh=X4cSSktro2UsdFn7G72wUgQxPeTBoCTELR/ThA0A7NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flMc8zvKYy1TaDZb9oRf8ZVIjnsngFDIbuB01yR8NCHHHwSVmM2ehMY6LnhiQTrTX42AGIzmHZ1Ju5Ij73HXu8NBaXGJHNfwO9weofhGAy0BKa5u4+rRpE9/XKsCGUbhgbkyEa9E19GMIRnPxjvAzYf+zhjAkwiet98Q1AmXH08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 244285 invoked by uid 1000); 18 Apr 2024 11:51:21 -0400
Date: Thu, 18 Apr 2024 11:51:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@lnuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCHv2] usb: usb_parse_endpoint ignore reserved bits
Message-ID: <27b5e66d-b2d7-45dd-85f2-3d06757493de@rowland.harvard.edu>
References: <20240418110249.10643-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418110249.10643-1-oneukum@suse.com>

On Thu, Apr 18, 2024 at 01:02:21PM +0200, Oliver Neukum wrote:
> Reading bEndpointAddress the spec tells is
> that
> 
> b7 is direction, which must be ignored
> b6:4 are reserved which are to be set to zero
> b3:0 are the endpoint address
> 
> In order to be backwards compatible with possible
> future versions of USB we have to be ready with
> devices using those bits. That means that we
> also have to ignore them like we do with the direction
> bit.
> In consequence the only illegal address you can
> encoding in four bits is endpoint zero, for which
> no descriptor must exist. Hence the check for exceeding
> the upper limit on endpoint addresses is removed.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 
> V2: Improved commit log
> ---
>  drivers/usb/core/config.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 8fd4208d17db..43c5ed256e6e 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -285,11 +285,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
> -	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
> -	if (i >= 16 || i == 0) {
> +	i = d->bEndpointAddress & 0x0f;

See my earlier reply.  The 0x0f here should be USB_ENDPOINT_NUMBER_MASK.  
Or even better, you could use the usb_endpoint_num() inline routine.

> +	if (i == 0) {
>  		dev_notice(ddev, "config %d interface %d altsetting %d has an "
> -		    "invalid endpoint with address 0x%X, skipping\n",
> -		    cfgno, inum, asnum, d->bEndpointAddress);
> +		    "invalid descriptor for the common control endpoint, skipping\n",

"endpoint 0" would be simpler than "the common control endpoint".

Alan Stern

> +		    cfgno, inum, asnum);
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
> -- 
> 2.44.0
> 

