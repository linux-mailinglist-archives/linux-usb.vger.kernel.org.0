Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13BE017AE5E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 19:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgCESoQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 13:44:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:45546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgCESoP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 13:44:15 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6A9B2072D;
        Thu,  5 Mar 2020 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583433855;
        bh=M65Bw8vTfUeiRXfq4/UfyErlckIvJExOcmcF/dVAmrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sdi5/hkU2o8ks8dghvIZj1cadatWBN3GWqSqPxp7GT+OzCgPZjkQcUAVzQ4xw32WK
         U+bxTYIYH0KL5KIPdpxlWvs8VKAqEI4uk6IhM0ftYoaNRV9IiactMVCW7naRZKrZ5D
         Dkvg0A0nlY7Kx9HKaB0ZbkzfMuJ5e20BOyTZ0u+Q=
Date:   Thu, 5 Mar 2020 19:44:12 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
Message-ID: <20200305184412.GA2133118@kroah.com>
References: <24160.54137.563763.50884@beetle.laas.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24160.54137.563763.50884@beetle.laas.fr>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 05, 2020 at 11:24:57AM +0100, Anthony Mallet wrote:
> By default, tty_port_init() initializes those parameters to a multiple
> of HZ. For instance in line 69 of tty_port.c:
>    port->close_delay = (50 * HZ) / 100;
> https://github.com/torvalds/linux/blob/master/drivers/tty/tty_port.c#L69
> 
> With e.g. CONFIG_HZ = 250 (as this is the case for Ubuntu 18.04
> linux-image-4.15.0-37-generic), the default setting for close_delay is
> thus 125.
> 
> When ioctl(fd, TIOCGSERIAL, &s) is executed, the setting returned in
> user space is '12' (125/10). When ioctl(fd, TIOCSSERIAL, &s) is then
> executed with the same setting '12', the value is interpreted as '120'
> which is different from the current setting and a EPERM error may be
> raised by set_serial_info() if !CAP_SYS_ADMIN.
> https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L919
> 
> Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
> Fixes: ba2d8ce9db0a6 ("cdc-acm: implement TIOCSSERIAL to avoid blocking close(2)")
> Cc: stable <stable@vger.kernel.org>
> Acked-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/class/cdc-acm.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index da619176d..b43820fb2 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -907,6 +907,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
>  {
>  	struct acm *acm = tty->driver_data;
>  	unsigned int closing_wait, close_delay;
> +	unsigned int old_closing_wait, old_close_delay;
>  	int retval = 0;
>  
>  	close_delay = msecs_to_jiffies(ss->close_delay * 10);
> @@ -914,18 +915,24 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
>  			ASYNC_CLOSING_WAIT_NONE :
>  			msecs_to_jiffies(ss->closing_wait * 10);
>  
> +	/* we must redo the rounding here, so that the values match */
> +	old_close_delay	= jiffies_to_msecs(acm->port.close_delay) / 10;
> +	old_closing_wait = acm->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
> +				ASYNC_CLOSING_WAIT_NONE :
> +				jiffies_to_msecs(acm->port.closing_wait) / 10;
> +
>  	mutex_lock(&acm->port.mutex);
>  
> -	if (!capable(CAP_SYS_ADMIN)) {
> -		if ((close_delay != acm->port.close_delay) ||
> -		    (closing_wait != acm->port.closing_wait))
> +	if ((ss->close_delay != old_close_delay) ||
> +            (ss->closing_wait != old_closing_wait)) {
> +		if (!capable(CAP_SYS_ADMIN)) {
>  			retval = -EPERM;
> -		else
> -			retval = -EOPNOTSUPP;
> -	} else {
> -		acm->port.close_delay  = close_delay;
> -		acm->port.closing_wait = closing_wait;
> -	}
> +		else {
> +			acm->port.close_delay  = close_delay;
> +			acm->port.closing_wait = closing_wait;
> +		}
> +	} else
> +		retval = -EOPNOTSUPP;
>  
>  	mutex_unlock(&acm->port.mutex);
>  	return retval;
> @@ -969,7 +976,7 @@ static int wait_serial_change(struct acm *acm, unsigned long arg)
>  		}
>  	} while (!rv);
>  
> -	
> +
>  

Was this patch even build tested?

drivers/usb/class/cdc-acm.c: In function ‘set_serial_info’:
drivers/usb/class/cdc-acm.c:930:3: error: expected ‘}’ before ‘else’
  930 |   else {
      |   ^~~~


Please fix up, properly test, and resend both of these.

And yes, this is the correct format for these patches, nice work there.

thanks,

greg k-h
