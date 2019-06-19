Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E584BC2E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 16:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfFSO73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 10:59:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:54262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfFSO73 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 10:59:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C1782183F;
        Wed, 19 Jun 2019 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560956368;
        bh=fcfAj5P6unSRhKIOsI+pivToyX2jS9tb5MRk1HOXv1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KaNeMreMTPiqZblG7wJXKnlszSuO0YRSoiSYgc1fq9Ux28OcagMIVZpJ27Cvbvr/v
         81EnbqYGgOJarEk5N9OJ5S9YbcKoOEAp0qUr0Wuvaqo9fGqfTJTjcZC/4kJ+V7x1Av
         undnPvUoIc4OCN/HA8Jn0bGnIL3p92mvih4Vii14=
Date:   Wed, 19 Jun 2019 16:59:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     kvaradarajan <Kiruthika.Varadarajan@harman.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH]  USB/Gadget: Fix race between gether_disconnect and
 rx_submit
Message-ID: <20190619145926.GA18985@kroah.com>
References: <1560926470-15092-1-git-send-email-Kiruthika.Varadarajan@harman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560926470-15092-1-git-send-email-Kiruthika.Varadarajan@harman.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 19, 2019 at 06:41:10AM +0000, kvaradarajan wrote:
>   On spin lock release in rx_submit, gether_disconnect get
>   a chance to run, it makes port_usb NULL, rx_submit access
>   NULL port USB, hence null pointer crash.
> 
>   Fixed by releasing the lock in rx_submit after port_usb
>   is used.

Meta-comments about the patch information...

Why is this indented?  Please keep comments all the way to the left and
wrap the columns at 72.

> Signed-off-by: KVaradarajan <Kiruthika.Varadarajan@harman.com>

I need a "legal name" here, I don't think you sign documents that way.
It also needs to match the From: line of your email.

> ---
>  drivers/usb/gadget/function/u_ether.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 737bd77..76cf1e4 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -186,11 +186,11 @@ static void defer_kevent(struct eth_dev *dev, int flag)
>  		out = dev->port_usb->out_ep;
>  	else
>  		out = NULL;
> -	spin_unlock_irqrestore(&dev->lock, flags);
>  
> -	if (!out)
> +	if (!out) {
> +		spin_unlock_irqrestore(&dev->lock, flags);
>  		return -ENOTCONN;
> -
> +	}
>  
>  	/* Padding up to RX_EXTRA handles minor disagreements with host.
>  	 * Normally we use the USB "terminate on short read" convention;
> @@ -215,6 +215,7 @@ static void defer_kevent(struct eth_dev *dev, int flag)
>  	if (dev->port_usb->is_fixed)
>  		size = max_t(size_t, size, dev->port_usb->fixed_out_len);
>  
> +	spin_unlock_irqrestore(&dev->lock, flags);

Patch looks sane to me.  I'll let Felipe do the real review after you
resend based on the information above.

thanks,

greg k-h
