Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B137040106D
	for <lists+linux-usb@lfdr.de>; Sun,  5 Sep 2021 16:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhIEO5M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Sep 2021 10:57:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:58886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhIEO5M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Sep 2021 10:57:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5ADFA60BD3;
        Sun,  5 Sep 2021 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630853768;
        bh=X82/UKLFvLFR4SUBoXrVQDn2mO2ptHBl3CSl097dKw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KMbdhUGf/po7tjKXX7n4XE8Ca5a3ZLMYYzpQ7XjG0OJNKdI+DupyIX5uPYnb5C6Sd
         eLotoI2JGMaJhnjiMBcCpOnLPTDi0h929ojovHMngxUhwMu45fGvVM7+dRHxpQj6Hx
         4Y6ILZJ++C9hoW4Tx8opWNELv3Gb3mSXc+6NehXs=
Date:   Sun, 5 Sep 2021 16:56:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: Fix possible memleak in usb_add_gadget
Message-ID: <YTTahtscWqQyY0CU@kroah.com>
References: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 04, 2021 at 05:34:29PM +0200, Florian Faber wrote:
> The memory for the udc structure allocated via kzalloc in line 1295 is not
> freed in the error handling code, leading to a memory leak in case of an
> error.
> 
> Singed-off-by: Florian Faber <faber@faberman.de>
> 
> ---
>  drivers/usb/gadget/udc/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 14fdf918ecfe..a1270a44855a 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1346,6 +1346,8 @@ int usb_add_gadget(struct usb_gadget *gadget)
> 
>   err_put_udc:
>  	put_device(&udc->dev);
> +	kfree(udc);
> +	gadget->udc = NULL;
> 
>   error:
>  	return ret;
> -- 
> 2.33.0
> 
> Flo
> -- 
> Machines can do the work, so people have time to think.

Did you test this?  I think you will find that you just caused a
use-after-free :(

Please read the documentation for device_initialize() for why this is
not the correct thing to do here.

thanks,

greg k-h
