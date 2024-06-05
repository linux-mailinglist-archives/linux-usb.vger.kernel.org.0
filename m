Return-Path: <linux-usb+bounces-10863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F07458FC89F
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 12:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A86B247E0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C655190051;
	Wed,  5 Jun 2024 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Daq/rWsh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702C18FDAD
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717581939; cv=none; b=QwUDJDOevU42B5vO12CwfHGzcOxG7vRZQpKzvpJvqxIba5Prxcq7TKS+SHtv5KBKql7oBi6MbwPtKHsPoLagCN0aomBcQ0G41cnb9u0mONaDhUQjYx+fGX8He6eltvAjQB4zGOf6OT1UGqyE0e8NmO70ajAdW8H1W7iqjAGp6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717581939; c=relaxed/simple;
	bh=n4FgBuLC5ilaiBYdZnmVnwaMqxbCBH0R8+4xHJfTXF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcroIiAqrIY8QJGiCeczM+FFdp58b7aS+n0T5FO9M9PUPRjkReZ0RK3igEadfEj6CkGnHpb5VYnpbQo3uLAvlQFoImhtaoYl1q6CawD4HguDRHhG8gBQCDJWNMtjp/hcJcftd0rwX7W1tULZ2dN7YkkL5c6kdQXpzOOj0pyGbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Daq/rWsh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B59C3277B;
	Wed,  5 Jun 2024 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717581939;
	bh=n4FgBuLC5ilaiBYdZnmVnwaMqxbCBH0R8+4xHJfTXF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Daq/rWshwUigvvFBsZZDlUNfxo+bgmWZXdingy8kT7kj0eZO27uDhdza2o3tZctlH
	 rK4FyANI/xJzKHBt/8ABDa37xm3DCmdq6rRKkmj+BeJqUG6R0qOaR1bWWjJDu9tadn
	 ECh9bOA26YaBqkcDvl6aIvHWAGfe640U8nbFT9Pw=
Date: Wed, 5 Jun 2024 12:03:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry <d.smirnov@inbox.lv>
Cc: linux-usb@vger.kernel.org, Dmitry <dimonija@gmail.com>
Subject: Re: [PATCH 1/1] usb: serial: Fix mos7840 resume from standby
Message-ID: <2024060539-satchel-unisexual-fde9@gregkh>
References: <20240604225507.6801-1-d.smirnov@inbox.lv>
 <20240604225507.6801-2-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604225507.6801-2-d.smirnov@inbox.lv>

On Wed, Jun 05, 2024 at 01:55:07AM +0300, Dmitry wrote:
> From: Dmitry <dimonija@gmail.com>
> 
> ---
>  drivers/usb/serial/mos7840.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 8b0308d84270..7443d2f018b4 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -770,6 +770,7 @@ static void mos7840_close(struct usb_serial_port *port)
>  		if (mos7840_port->write_urb_pool[j]) {
>  			kfree(mos7840_port->write_urb_pool[j]->transfer_buffer);
>  			usb_free_urb(mos7840_port->write_urb_pool[j]);
> +			mos7840_port->write_urb_pool[j] = NULL;
>  		}
>  	}
>  
> @@ -1737,6 +1738,37 @@ static void mos7840_port_remove(struct usb_serial_port *port)
>  	kfree(mos7840_port);
>  }
>  
> +static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
> +{
> +    dev_dbg(&serial->interface->dev, "mos7840_suspend\n");
> +
> +    return 0;
> +}
> +
> +static int mos7840_resume(struct usb_serial *serial)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int i;
> +	dev_dbg(&serial->interface->dev, "mos7840_resume\n");
> +
> +	for (i = 0; i < serial->num_ports; ++i) {
> +		port = serial->port[i];
> +		if (!tty_port_initialized(&port->port))
> +			continue;
> +
> +		mos7840_port = usb_get_serial_port_data(port);
> +
> +		if (port->bulk_in_size)
> +			usb_submit_urb(mos7840_port->read_urb, GFP_NOIO);
> +
> +		/*if (port->bulk_out_size)
> +			usb_submit_urb(mos7840_port->read_urb, GFP_ATOMIC);*/
> +	}
> +
> +    return 0;
> +}
> +
>  static struct usb_serial_driver moschip7840_4port_device = {
>  	.driver = {
>  		   .owner = THIS_MODULE,
> @@ -1764,6 +1796,8 @@ static struct usb_serial_driver moschip7840_4port_device = {
>  	.port_probe = mos7840_port_probe,
>  	.port_remove = mos7840_port_remove,
>  	.read_bulk_callback = mos7840_bulk_in_callback,
> +	.suspend = mos7840_suspend,
> +	.resume = mos7840_resume,
>  };
>  
>  static struct usb_serial_driver * const serial_drivers[] = {
> -- 
> 2.45.1
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

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

