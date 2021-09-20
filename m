Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9FA410F24
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 06:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhITFAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 01:00:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229695AbhITFAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 01:00:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A67660F48;
        Mon, 20 Sep 2021 04:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632113937;
        bh=Dl/reHZpPda+d3n11Cq6vql01m+syQi/PJqYv45ApVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yRc294O1ewSlzPbrTU4gDqOAP3nb0Sbxb18e+dYAs12nj7fyoZ+jh0sdQ1+6heyEz
         O6X1reIbVq5eqJiF0Q1hcR2BgUEOj0NLOMKAnOnhLxBPmzceEnGOkOtjeZJcyeM5RT
         JzHdCQ/WgT59iLIaucTyHAmMj/7rXj0JD0w81E58=
Date:   Mon, 20 Sep 2021 06:58:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
Message-ID: <YUgVD6opx4MwGsJz@kroah.com>
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 19, 2021 at 09:41:27PM +0200, Florian Faber wrote:
> In usb_composite_setup_continue, req->complete is not set, leaving the
> previous value untouched. After completion of the ep0 transaction, the UDC
> would then call whatever complete callback is set with the composite cdev as
> context, leading to all sorts of havoc.
> 
> Signed-off-by: Florian Faber <faber@faberman.de>
> 
> ---
>  drivers/usb/gadget/composite.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 504c1cbc255d..8d497be4be32 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct
> usb_composite_dev *cdev)
>  		DBG(cdev, "%s: Completing delayed status\n", __func__);
>  		req->length = 0;
>  		req->context = cdev;
> +		req->complete = composite_setup_complete;
>  		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
>  		if (value < 0) {
>  			DBG(cdev, "ep_queue --> %d\n", value);
> -- 

Is this a bugfix?  If so, what commit does this fix?

How can you trigger this issue?

And your patch is line-wrapped and can not be applied :(

thanks,

greg k-h
