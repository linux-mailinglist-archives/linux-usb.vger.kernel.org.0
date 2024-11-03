Return-Path: <linux-usb+bounces-16998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 546099BAC2C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 06:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F30511F22EC0
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 05:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963FF18C932;
	Mon,  4 Nov 2024 05:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o6ld0c+w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22418DF92
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 05:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699206; cv=none; b=dO3N+mDGNza9fhGc42/Qi1xS7GT1k0RXVg24J2CaFYg7p0rif3nfVf8l65do5hyGSgoFGCBEENAaAwFpHFaWTJF+UuDnfzPSWggp/BGodWXQOfoJMWKrWSd9BWftt3Z/LgaWqvfaqS/e/7A1iAY4ZN3+X20ScdD0ubi7oW2xtL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699206; c=relaxed/simple;
	bh=BHfe4KAKnlLe5qgCchrVbPtB+QVZOmdpwIElcIPMCYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uit7CncC5P8qKKDanN3MrH0DSnlwoLmqaNyF6rbN1BGBRq0/my7uq5e5SghYnhaTiQgWQiPu1qEx2L1gf9blkA3ELZ1T7cQCnglx9wen88pq+8XUXP5mCnJrNNN9yIIUf3GSxs81xWFHLx/2mR1O1asKUhM6Ljt5M9IB/2MqlfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o6ld0c+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D57BC4CED0;
	Mon,  4 Nov 2024 05:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730699205;
	bh=BHfe4KAKnlLe5qgCchrVbPtB+QVZOmdpwIElcIPMCYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6ld0c+w7y2v3UVbf2YCCM8qq8m/XSLcElrJrxiVRJWFkCQB0oFKliwbTOKz3VeB/
	 wDYqrPjDa9PN9RW4Qf8K4WczHmV7ViE33jGHOjlEhUdo4qYz2zX59tNqejASoCEoQR
	 6prKIpgaOd4MQa0IodFZd/0vZ3QDQSEWEV3dTQcA=
Date: Mon, 4 Nov 2024 00:19:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Drop reference to a fwnode
Message-ID: <2024110441-census-harbor-4905@gregkh>
References: <20241102022914.208634-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102022914.208634-1-joe@pf.is.s.u-tokyo.ac.jp>

On Sat, Nov 02, 2024 at 11:29:14AM +0900, Joe Hattori wrote:
> In typec_port_register_altmodes(), the fwnode reference obtained by
> device_get_named_child_node() is not dropped. This commit adds a call to
> fwnode_handle_put() to fix the possible reference leak.
> 
> Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/usb/typec/class.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index d61b4c74648d..1eb240604cf6 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2341,6 +2341,7 @@ void typec_port_register_altmodes(struct typec_port *port,
>  		altmodes[index] = alt;
>  		index++;
>  	}
> +	fwnode_handle_put(altmodes_node);
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
>  
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

