Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FD63D3D7D
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 18:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhGWPme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 11:42:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhGWPme (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Jul 2021 11:42:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C630D60F25;
        Fri, 23 Jul 2021 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627057387;
        bh=XLLuiPxpCS8xCdNEbacrws6Lwl/Mkg2EkkcYyJ6hXys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CcPUG/066KGJNOa68rPRsHXl4j+Lezmm8dnmvpB8zmRK9Lr+X0D6zi4UfxPmNWCH8
         +c42y4E2R0BoKNMYPxox9dxJlAd/X1j4C0z/p897ilMtvE6+YmvxcwDXglbWclp3vY
         wox311eGsWiY5s1OnK5AkpMxZ1crVYEgPYOtFOpg=
Date:   Fri, 23 Jul 2021 18:22:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     balbi@kernel.org, sandeen@redhat.com, linux-usb@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v2] usb: gadget: f_hid: fixed NULL pointer dereference
Message-ID: <YPrsyBwKqcxI5uO0@kroah.com>
References: <20210723155928.210019-1-mdevaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723155928.210019-1-mdevaev@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 23, 2021 at 06:59:30PM +0300, Maxim Devaev wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Disconnecting and reconnecting the USB cable can lead to crashes
> and a variety of kernel log spam.
> 
> The problem was found and reproduced on the Raspberry Pi [1]
> and the original fix was created in Raspberry's own fork [2].
> 
> Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Link: https://github.com/raspberrypi/linux/issues/3870 [1]
> Link: https://github.com/raspberrypi/linux/commit/a6e47d5f4efbd2ea6a0b6565cd2f9b7bb217ded5 [2]
> ---
>  drivers/usb/gadget/function/f_hid.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 02683ac07..08e73e812 100644
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
> @@ -358,8 +363,14 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
>  	count  = min_t(unsigned, count, hidg->report_length);
>  
>  	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
> -	status = copy_from_user(req->buf, buffer, count);
>  
> +	if (!req) {
> +		ERROR(hidg->func.config->cdev, "hidg->req is NULL\n");
> +		status = -ESHUTDOWN;
> +		goto release_write_pending;
> +	}
> +
> +	status = copy_from_user(req->buf, buffer, count);
>  	if (status != 0) {
>  		ERROR(hidg->func.config->cdev,
>  			"copy_from_user error\n");
> @@ -387,14 +398,17 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
>  
>  	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
>  
> +	if (!hidg->in_ep->enabled) {
> +		ERROR(hidg->func.config->cdev, "in_ep is disabled\n");
> +		status = -ESHUTDOWN;
> +		goto release_write_pending;

What prevents "enabled" from changing right after you test this?  You do
not have the lock held so could it change then?

> +	}
> +
>  	status = usb_ep_queue(hidg->in_ep, req, GFP_ATOMIC);
> -	if (status < 0) {
> -		ERROR(hidg->func.config->cdev,
> -			"usb_ep_queue error on int endpoint %zd\n", status);
> +	if (status < 0)
>  		goto release_write_pending;

No error message if queueing up failed?

thanks,

greg k-h
