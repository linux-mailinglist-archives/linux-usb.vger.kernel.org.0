Return-Path: <linux-usb+bounces-26873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B2B26BE4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 482D5188971A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 16:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8106A2472AB;
	Thu, 14 Aug 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kgsb991C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE87189906
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187382; cv=none; b=dj69lykc+8gHaIz+pznyhmDWOYHHtppsrJiDV8togVlcScU5aQlVfGGP8M1PmAQe7zk/VekQbE6wYa9KBzpH7IqwyI2NKMR1d4wZOhDQ9PJOqOcgOs9cYoY/XNc1K/CXb5i+QADdoK9Wz+/+OrkvTA6uHEiDfTK2LcffbCx7ZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187382; c=relaxed/simple;
	bh=Xzz4ssrrnBjOeApzaAtF5sUbuO8sENKEte8dUzsD3lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHEsjAikZAsd2OhRX/E7JFHlKUUK5+StM2naAz7s7YQs0VdD5uU9wDhX5aTQuRbVZ72aSjJZXOY60L8DkhPHuxDdUbm3N8/p18+x3VjIbCXxxilO0er7hFAIRwRrg8EAgEPZdiq4yFCi/NptFnZHt4KV2uk+ECaRxFM5cSrqDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kgsb991C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E50C4CEED;
	Thu, 14 Aug 2025 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755187381;
	bh=Xzz4ssrrnBjOeApzaAtF5sUbuO8sENKEte8dUzsD3lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kgsb991CetYF2V/ZN1t0qTab107EAPHWRiyj00o2HnYr8xTtoIX6v71JaAvt8PVP1
	 6ok2XeHUOGUX12MTelz5HRQ43GoPMjP1KT02nLqWpQEdJy8EzAdjCAC4wB47heE2iP
	 zKckBmWYV7NCPWWMbGw+Z2Opc1kmXKHv/uJn0NII=
Date: Thu, 14 Aug 2025 18:02:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: raub camaioni <raubcameo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Message-ID: <2025081445-amends-bonehead-4a3d@gregkh>
References: <20250814155051.621614-1-raubcameo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814155051.621614-1-raubcameo@gmail.com>

On Thu, Aug 14, 2025 at 11:50:51AM -0400, raub camaioni wrote:
> This fix is already present in f_ecm.c and was never
> propagated to f_ncm.c
> 
> When creating multiple NCM ethernet devices
> on a composite usb gadget device
> each MAC address on the HOST side will be identical.
> Having the same MAC on different network interfaces is bad.
> 
> This fix updates the MAC address inside the
> ncm_strings_defs global during the ncm_bind call.
> This ensures each device has a unique MAC.
> In f_ecm.c ecm_string_defs is updated in the same way.
> 
> The defunct MAC assignment in ncm_alloc has been removed.
> 
> Signed-off-by: raub camaioni <raubcameo@gmail.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 58b0dd575af3..186fbb9d0a3d 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1463,6 +1463,8 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>  
>  	ncm_opts->bound = true;
>  
> +	ncm_string_defs[1].s = ecm->ethaddr;
> +
>  	us = usb_gstrings_attach(cdev, ncm_strings,
>  				 ARRAY_SIZE(ncm_string_defs));
>  	if (IS_ERR(us)) {
> @@ -1771,7 +1773,6 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
>  		mutex_unlock(&opts->lock);
>  		return ERR_PTR(-EINVAL);
>  	}
> -	ncm_string_defs[STRING_MAC_IDX].s = ncm->ethaddr;
>  
>  	spin_lock_init(&ncm->lock);
>  	ncm_reset_values(ncm);
> -- 
> 2.34.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

