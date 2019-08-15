Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7348EBFB
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731849AbfHOMxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:53:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729627AbfHOMxR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:53:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2142A206C1;
        Thu, 15 Aug 2019 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565873596;
        bh=vKIrbz4emH+oAr3HnDVdb7dhtLNcWsOasJyvv7Rbc6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oQr/kKIiyRg51nhpGXW1XiZuYf2dTRXvhSwBYrme5+EL4VjyR1cL5PqmIFBFVPJ/d
         atEt909nNmLtiC+NuUUm5VyZpUG8EFkb+oeJqY8ZA1OOelpwr6qf78kTTV70niKykO
         +ZrZ3yhIm0GnJ+FRNv/+vOpHiaueTBOiKnWEPS7E=
Date:   Thu, 15 Aug 2019 14:53:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     gavinli@thegavinli.com
Cc:     linux-usb@vger.kernel.org, Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH] usb: usbfs: only account once for mmap()'ed usb memory
 usage
Message-ID: <20190815125314.GA24270@kroah.com>
References: <20190814212924.10381-1-gavinli@thegavinli.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814212924.10381-1-gavinli@thegavinli.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 02:29:24PM -0700, gavinli@thegavinli.com wrote:
> From: Gavin Li <git@thegavinli.com>
> 
> Memory usage for USB memory allocated via mmap() is already accounted
> for at mmap() time; no need to account for it again at submiturb time.
> 
> Signed-off-by: Gavin Li <git@thegavinli.com>
> ---
>  drivers/usb/core/devio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

What commit does this fix?  What issue does this fix, is it something
that is user-visable?

> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index bbe9c2edd3e7..9681dd55473b 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1603,7 +1603,8 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
>  	if (as->usbm)
>  		num_sgs = 0;
>  
> -	u += sizeof(struct async) + sizeof(struct urb) + uurb->buffer_length +
> +	u += sizeof(struct async) + sizeof(struct urb) +
> +	     (as->usbm ? 0 : uurb->buffer_length) +
>  	     num_sgs * sizeof(struct scatterlist);

Are you sure?  Where is the buffer_length being added to the size here?
What am I missing?

thanks,

greg k-h
