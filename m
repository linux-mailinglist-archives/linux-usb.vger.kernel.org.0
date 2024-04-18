Return-Path: <linux-usb+bounces-9450-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22E8A9AC3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 15:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26E1BB2199F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 13:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDCA14535E;
	Thu, 18 Apr 2024 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jhLAucJK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CDA145B1B
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713445246; cv=none; b=qZ+DM1ap3BMge6A/zS+Ec+2C6qO+UHxbbnymqby5DI6MYPKxtt6iBqBEg68kX0QvC6AqFpK24pZ9iRYmzxIEfFV6ubxQ1pKKYDhN5+m6Y5gUKu6mCSShdGRLewNaP7TCFIs+rNfzQfC4AX2IUYBCLUBad5H//NAfrchmsVQCqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713445246; c=relaxed/simple;
	bh=u9MzvbyCHzYQrYYVz5jIUnMpedJT50hlACBVcBBbjW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCQ6yXygakpjbsGidJVNzuFow65AlMZHx1iUpirHDdCFyf5HGNWQAj1e51M8J6RWXoKjDOYkwUVe95IHg3hOr1oS9HwHfLAxVxJkMKahWRHnZGwdSmAbKJFZhlBr8bWLqmhZn5+84zNvIhMKnX0pcPJCFmKnXC4mZ36s128GpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jhLAucJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC27C113CC;
	Thu, 18 Apr 2024 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713445245;
	bh=u9MzvbyCHzYQrYYVz5jIUnMpedJT50hlACBVcBBbjW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhLAucJKKR+Te52DQwHQZgOGlsOeTjkv2Ufs0W38vhWUcsava3BD+SNh9D+IMCO5F
	 dC2jGitD18Tq0ys0cANMVp1U/elwAoGoUpXVNX+kFLsfNW8NV7Y/exKONtdt4JyC7j
	 KqVqdmCixlbfNrlYUPDosrEvT4Lq1kd9ZC+mBGQ0=
Date: Thu, 18 Apr 2024 15:00:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@lnuxfoundation.org, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org
Subject: Re: [PATCHv2] usb: usb_parse_endpoint ignore reserved bits
Message-ID: <2024041812-slogan-thirteen-2b75@gregkh>
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

Nit, "V2" goes below the --- line.

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

Using a #define here instead of 0x0f might be good, right?

thanks,

greg k-h

