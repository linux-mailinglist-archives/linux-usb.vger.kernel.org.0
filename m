Return-Path: <linux-usb+bounces-23499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE7A9DF43
	for <lists+linux-usb@lfdr.de>; Sun, 27 Apr 2025 08:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA0017E376
	for <lists+linux-usb@lfdr.de>; Sun, 27 Apr 2025 06:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E97C2356BC;
	Sun, 27 Apr 2025 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ML8jofGX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D51C6FFA
	for <linux-usb@vger.kernel.org>; Sun, 27 Apr 2025 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734289; cv=none; b=EaTSj8fCB/K0T2CPod1deODRYcpD+LP9IDNzx542INg8PHcsE4iOkcoHW08NmOzBi9cRljeb4xybVzHxf+Zt0VPpu5QG0sJsp5H5RPAJ2ffnnTCREitbw8OlRnUR63hMUnhAt1Cy15UBFRODAiK3XK0t4iXCxPpsNWiaVdqp1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734289; c=relaxed/simple;
	bh=/dP4JS9m9c4o1yiFe6osQ2zZbeWpOYcVATC4T/6YvIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvC7DyjV9LslVWUDafCl+hAGbKqDm480mgsPx7b3AJxPbWWXh1M3KZR1E/1J56Vn67f4pQbp3cu8RpYrJydCsHrRYaJVFkPfzG1LWzABSOb8+THj/TzDijGf7vrXIxiio4hCzeCD38FSmuojDTOI9nybdTvOW1HxyxosmBR5wtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ML8jofGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26D4C4CEE3;
	Sun, 27 Apr 2025 06:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745734289;
	bh=/dP4JS9m9c4o1yiFe6osQ2zZbeWpOYcVATC4T/6YvIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML8jofGXsd71i0IW/4FPvcnP63cxv74ZMzSzBQHaUSdcH9rWeSibPa5fgiSRWOlP8
	 zbymwo9hCz9hc1BfHtCEOoxCM10djdJ+snTU2v26goYtuqyCR0jK+OPNs5fGlhG00L
	 rT+TxhFiHqhuA9qgYlzJLdRbUqYHRoO47UZ83lcs=
Date: Sun, 27 Apr 2025 08:09:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com,
	Michael Katzmann <vk2bea@gmail.com>
Subject: Re: [PATCH 1/3] usb: usbtmc: Fix erroneous get_stb ioctl error
 returns
Message-ID: <2025042738-aspirin-hypnotist-b264@gregkh>
References: <20250426191222.13727-1-dpenkler@gmail.com>
 <20250426191222.13727-2-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426191222.13727-2-dpenkler@gmail.com>

On Sat, Apr 26, 2025 at 09:12:20PM +0200, Dave Penkler wrote:
> wait_event_interruptible_timeout returns a long
> The return was being assigned to an int causing an integer overflow when
> the remaining jiffies > INT_MAX resulting in random error returns.
> 
> Use a long return value and convert to int ioctl return only on error.
> 
> On success the ioctl was returning the transfer length of the
> usb_control_msg which has no meaning for the user.
> Return 0 on success.
> 
> Reported-by: Michael Katzmann <vk2bea@gmail.com>
> Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
>  drivers/usb/class/usbtmc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> index 34e46ef308ab..e24277fef54a 100644
> --- a/drivers/usb/class/usbtmc.c
> +++ b/drivers/usb/class/usbtmc.c
> @@ -482,6 +482,7 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
>  	u8 *buffer;
>  	u8 tag;
>  	int rv;
> +	long wait_rv;
>  
>  	dev_dbg(dev, "Enter ioctl_read_stb iin_ep_present: %d\n",
>  		data->iin_ep_present);
> @@ -511,16 +512,17 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
>  	}
>  
>  	if (data->iin_ep_present) {
> -		rv = wait_event_interruptible_timeout(
> +		wait_rv = wait_event_interruptible_timeout(
>  			data->waitq,
>  			atomic_read(&data->iin_data_valid) != 0,
>  			file_data->timeout);
> -		if (rv < 0) {
> -			dev_dbg(dev, "wait interrupted %d\n", rv);
> +		if (wait_rv < 0) {
> +			dev_dbg(dev, "wait interrupted %ld\n", wait_rv);
> +			rv = wait_rv;
>  			goto exit;
>  		}
>  
> -		if (rv == 0) {
> +		if (wait_rv == 0) {
>  			dev_dbg(dev, "wait timed out\n");
>  			rv = -ETIMEDOUT;
>  			goto exit;
> @@ -539,6 +541,8 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
>  
>  	dev_dbg(dev, "stb:0x%02x received %d\n", (unsigned int)*stb, rv);
>  
> +	rv = 0;
> +
>   exit:
>  	/* bump interrupt bTag */
>  	data->iin_bTag += 1;
> -- 
> 2.49.0
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

