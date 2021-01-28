Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D02307340
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 10:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhA1J4a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 04:56:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:57536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231441AbhA1J43 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 04:56:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DB2764DBD;
        Thu, 28 Jan 2021 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611827748;
        bh=mBgQ7BhQNLfTDvEM329uswkizG5yDnT7aHC+WNziWyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJgaEzPj1+N/vtnW7UVX8WHu133K49njFU0hMSmm5RNhpyZTenrP2GGmI1mUXvQWu
         jL8iN5aqlOx88qXl2VAtJliVFaFBd89b1/8InYwlkToE6xnqtSEvzQ3W2yBrS63H7r
         odrNrMMe0sGzJSZRkYidG6T8feWsfStE5Z6hO+cjRC0eqK6A//n9CM/poZy739Nkm2
         aiU/mzd6Ydgrj4nscCaA4q+yu2xamY3iO4LC8d2jU718/AyuxmB97QFGMFAXr2HO2T
         ke9c9CcXNISfS+Z6eej7xHFEMPMiaPvya7wFzS5JRkWLYfJuMW6vwIez3/NCKaWYEN
         aNOujcvd7zTqg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l541w-0003LY-Ji; Thu, 28 Jan 2021 10:56:00 +0100
Date:   Thu, 28 Jan 2021 10:56:00 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mos7720: Fix error code in mos7720_write()
Message-ID: <YBKKMK9UfRjB52sW@hovoldconsulting.com>
References: <YBKFW60qMJbtjvum@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBKFW60qMJbtjvum@mwanda>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 28, 2021 at 12:35:23PM +0300, Dan Carpenter wrote:
> This code should return -ENOMEM if the kmalloc() fails but instead
> it returns success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The first error path is probably wrong as well?
> 
> drivers/usb/serial/mos7720.c
>   1077          /* try to find a free urb in the list */
>   1078          urb = NULL;
>   1079  
>   1080          for (i = 0; i < NUM_URBS; ++i) {
>   1081                  if (mos7720_port->write_urb_pool[i] &&
>   1082                      mos7720_port->write_urb_pool[i]->status != -EINPROGRESS) {
>   1083                          urb = mos7720_port->write_urb_pool[i];
>   1084                          dev_dbg(&port->dev, "URB:%d\n", i);
>   1085                          break;
>   1086                  }
>   1087          }
>   1088  
>   1089          if (urb == NULL) {
>   1090                  dev_dbg(&port->dev, "%s - no more free urbs\n", __func__);
>   1091                  goto exit;
> 
> Should return -ENODEV?

No, this bit is correct (modulo the missing locking and reliance on the
URB status). When there are no free URBs we want the tty layer to
retry later.

>   1092          }
> 
>  drivers/usb/serial/mos7720.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
> index ed347a6d50ba..aa55169796a3 100644
> --- a/drivers/usb/serial/mos7720.c
> +++ b/drivers/usb/serial/mos7720.c
> @@ -1094,8 +1094,10 @@ static int mos7720_write(struct tty_struct *tty, struct usb_serial_port *port,
>  	if (urb->transfer_buffer == NULL) {
>  		urb->transfer_buffer = kmalloc(URB_TRANSFER_BUFFER_SIZE,
>  					       GFP_ATOMIC);
> -		if (!urb->transfer_buffer)
> +		if (!urb->transfer_buffer) {
> +			bytes_sent = -ENOMEM;
>  			goto exit;
> +		}
>  	}
>  	transfer_size = min(count, URB_TRANSFER_BUFFER_SIZE);

Now applied, thanks.

Johan
