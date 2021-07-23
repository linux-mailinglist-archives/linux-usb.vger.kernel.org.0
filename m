Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279053D386C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 12:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhGWJdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 05:33:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhGWJdo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Jul 2021 05:33:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 069F260E73;
        Fri, 23 Jul 2021 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627035258;
        bh=0kRPpCgdrzywZ+mLG1fDDXdFkuCYSh/3tKoC7MJ6ZjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P2hpBDKOP6vdZHSlJNk+Ejst63TeGSVIM8HWUT+feQjHcnlodziBXogxNW2emyrpI
         anZg0Hi3sQrP2fzequ68kOGvoq84gLl5dfn84nWTx4ZvKF5+yPU33/uTG4mxWpsoFO
         vJylVoFAg5lQgHcABnTL8xjYc/KR2B8/FaXbNBLg=
Date:   Fri, 23 Jul 2021 12:14:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     balbi@kernel.org, sandeen@redhat.com, linux-usb@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference
Message-ID: <YPqWeCwFQJXLA1ey@kroah.com>
References: <20210723095323.205593-1-mdevaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723095323.205593-1-mdevaev@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 23, 2021 at 12:53:23PM +0300, Maxim Devaev wrote:
> Disconnecting and reconnecting the USB cable can lead to crashes
> and a variety of kernel log spam.
> 
> The problem was found and reproduced on the Raspberry Pi. The patch
> was created in Raspberry's own fork [1]. Since I was one of those
> who discovered and diagnosed the problem [2], I propose this patch
> for adoption to the kernel upstream with the consent of the author.
> It has been tested since January 2021 and is guaranteed to fix
> the described problem without breaking anything.
> 
> Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Link: https://github.com/raspberrypi/linux/commit/a6e47d5f4efbd2ea6a0b6565cd2f9b7bb217ded5 [1]
> Link: https://github.com/raspberrypi/linux/issues/3870 [2]

Who is the original author here?  Please put their name as the "From:"
line in the changelog so we can give proper credit if it was not you.

> ---
>  drivers/usb/gadget/function/f_hid.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 02683ac07..4975bbf02 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -338,6 +338,11 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
>  
>  	spin_lock_irqsave(&hidg->write_spinlock, flags);
>  
> +	if (!hidg->req) {
> +		spin_unlock_irqrestore(&hidg->write_spinlock, flags);
> +		return -ESHUTDOWN;
> +	}
> +
>  #define WRITE_COND (!hidg->write_pending)
>  try_again:
>  	/* write queue */
> @@ -358,7 +363,13 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
>  	count  = min_t(unsigned, count, hidg->report_length);
>  
>  	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
> -	status = copy_from_user(req->buf, buffer, count);
> +	if (req) {

Test for !req and then abort, and then continue on.  No need for moving
the copy_from_user line in, right?  Should make the change smaller
overall.

> +		status = copy_from_user(req->buf, buffer, count);
> +	} else {
> +		ERROR(hidg->func.config->cdev, "hidg->req is NULL\n");
> +		status = -ESHUTDOWN;
> +		goto release_write_pending;
> +	}
>  
>  	if (status != 0) {
>  		ERROR(hidg->func.config->cdev,
> @@ -387,10 +398,13 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
>  
>  	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
>  
> +	if (!hidg->in_ep->enabled) {
> +		ERROR(hidg->func.config->cdev, "in_ep is disabled\n");
> +		status = -ESHUTDOWN;
> +		goto release_write_pending;
> +	}

Blank line after this please.


>  	status = usb_ep_queue(hidg->in_ep, req, GFP_ATOMIC);
>  	if (status < 0) {
> -		ERROR(hidg->func.config->cdev,
> -			"usb_ep_queue error on int endpoint %zd\n", status);
>  		goto release_write_pending;

Are the braces still needed here?

thanks,

greg k-h
