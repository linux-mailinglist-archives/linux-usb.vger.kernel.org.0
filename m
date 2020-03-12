Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93982182B68
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 09:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgCLIia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 04:38:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:34238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgCLIia (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 04:38:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32B52206B7;
        Thu, 12 Mar 2020 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584002309;
        bh=TvHiGwGWurgZI4HBsFz8pMvqF9U/hb0Mngs6Rrzd0Yw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zKoxiAKAKTCPplcpVK1o1C4vmN+1clen7KXyFIDA9rH6Y8azesemubnwsuw4diBeh
         40RyXpaihlEIjcfIgWzabMHIolFqrCxzU+QaEce6VEPqXR2hMHNY41i6yHE68bDwYp
         iLApSy5cCxt6rDgajJOx+V7frpFGbCZHl7jaFd58=
Date:   Thu, 12 Mar 2020 09:38:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
Message-ID: <20200312083827.GA102663@kroah.com>
References: <20200310101027.32152-1-anthony.mallet@laas.fr>
 <20200310101027.32152-2-anthony.mallet@laas.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310101027.32152-2-anthony.mallet@laas.fr>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 10, 2020 at 11:10:27AM +0100, Anthony Mallet wrote:
> Quoting the bug reporter:
> 
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
> Fixes: ba2d8ce9db0a6 ("cdc-acm: implement TIOCSSERIAL to avoid blocking close(2)")
> Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
> Cc: stable <stable@vger.kernel.org>
> ---
> Changed in v2: fix typo (extra closing brace)
> Changed in v3: version this patch series
> ---
>  drivers/usb/class/cdc-acm.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index da619176deca..a41a3d27016c 100644
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
> @@ -914,19 +915,24 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
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
> +		if (!capable(CAP_SYS_ADMIN))
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
> -- 
> 2.17.1
> 

This patch doesn't apply to my usb-linus branch at all.  What
tree/branch did you make it against?

thanks,

greg k-h
