Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2981842BF81
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 14:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhJMMHI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 08:07:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhJMMHH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 08:07:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FDCF60273;
        Wed, 13 Oct 2021 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634126704;
        bh=7xBx3CBBB+UJBS/HM4tiBugK3pEo465TEI5Rd2huiqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jbEEezoO8p0OGU1blRW6OGdc6hrothVzTIGzrWeNhsGFn46lX75nT16nWmyXyxDh9
         Pz19Q8vyiPnugNJ0R0vgQirI2eP9E038bD4Evinvxu2lGWVolKEE9c3PDBffcdmAV2
         hcC8KK5fb+ZN1rKj1wCtOSHkDphUeIZf8hh6jcMk=
Date:   Wed, 13 Oct 2021 14:05:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
Message-ID: <YWbLbutZto1IRuUA@kroah.com>
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
 <2eef54eb-4830-555b-1a13-85644c4e65a5@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eef54eb-4830-555b-1a13-85644c4e65a5@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 13, 2021 at 10:54:47AM +0200, Florian Faber wrote:
> In usb_composite_setup_continue, req->complete is not set, leaving the
> previous value untouched. After completion of the ep0 transaction, the
> UDC would then call whatever complete callback was set previously with
> the composite cdev as context, leading to all sorts of havoc.
> 
> A typical call trace looks like this: A setup packet for mass storage,
> ending up in RNDIS's complete function:
> 
> ---------------------------snip---------------------------------
> [  183.795661] [<bf10b31c>] (rndis_response_complete [usb_f_rndis]) from [<bf0ec024>] (xgs_iproc_ep_enable+0x92c/0xd2c [xgs_iproc_udc])
> [  183.795666]  r5:df5d73ac r4:df767c80
> [  183.795682] [<bf0ebf20>] (xgs_iproc_ep_enable [xgs_iproc_udc]) from [<bf0eca8c>] (xgs_iproc_ep_queue+0x384/0x5bc [xgs_iproc_udc])
> [  183.795687]  r7:df767cb8 r6:df5d7380 r5:df767c80 r4:df5d73ac
> [  183.795706] [<bf0ec708>] (xgs_iproc_ep_queue [xgs_iproc_udc]) from [<c0384fec>] (usb_ep_queue+0x1f0/0x238)
> [  183.795713]  r10:43425355 r9:df767c80 r8:df767c80 r7:a00f0013 r6:df5d73ac r5:df767c80
> [  183.795716]  r4:df65dea8
> [  183.795743] [<c0384dfc>] (usb_ep_queue) from [<bf0f6910>] (usb_composite_overwrite_options+0x128/0x184 [libcomposite])
> [  183.795750]  r9:00055302 r8:df767c80 r7:a00f0013 r6:df65df04 r5:df767c80 r4:df65dea8
> [  183.795777] [<bf0f68e0>] (usb_composite_overwrite_options [libcomposite]) from [<bf0f69f4>] (usb_composite_setup_continue+0x88/0x138 [libcomposite])
> [  183.795782]  r7:a00f0013 r6:df65df04 r5:00000000 r4:df65dea8
> [  183.795812] [<bf0f696c>] (usb_composite_setup_continue [libcomposite]) from [<bf120cf8>] (fsg_alloc_inst+0xa5c/0xac8 [usb_f_mass_storage])
> [  183.795819]  r9:00055302 r8:00000003 r7:deca5800 r6:00000001 r5:df595a80 r4:deca5948
> [  183.795840] [<bf120a68>] (fsg_alloc_inst [usb_f_mass_storage]) from [<bf120e00>] (fsg_main_thread+0x9c/0x15dc [usb_f_mass_storage])
> [  183.795846]  r8:df770000 r7:df595a80 r6:deca1cc0 r5:df724000 r4:deca5800
> [  183.795864] [<bf120d64>] (fsg_main_thread [usb_f_mass_storage]) from [<c0046cd0>] (kthread+0x14c/0x154)
> [  183.795870]  r10:df785d14 r9:00000000 r8:deca5800 r7:df6c31b8 r6:df70f580 r5:df724000
> [  183.795873]  r4:df6c3180
> [  183.795881] [<c0046b84>] (kthread) from [<c000a67c>] (ret_from_fork+0x14/0x38)
> [  183.795887]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0046b84
> [  183.795889]  r4:df70f580
> --------------------------snip-------------------------------------
> 
> Fixes: 57943716ff1b0733ab0d9879e572bad04166660a ("usb: gadget: composite: set our req->context to cdev")

No need for the full sha1, look at the documentation for the needed line
here:
	Fixes: 57943716ff1b ("usb: gadget: composite: set our req->context to cdev")

> Signed-off-by: Florian Faber <faber@faberman.de>
> 
> ---
> Change in v3:
>   - Addes changes
> 
> Change in v2:
>   - More verbose explanation
>   - Added commit hash that introduced the bug
> 
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

Patch is linewrapped :(

thanks,

greg k-h
