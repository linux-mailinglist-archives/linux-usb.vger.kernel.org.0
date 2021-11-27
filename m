Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5383945FCAF
	for <lists+linux-usb@lfdr.de>; Sat, 27 Nov 2021 06:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbhK0F0F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Nov 2021 00:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241136AbhK0FYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Nov 2021 00:24:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA66C061757
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 21:20:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C068B829A7
        for <linux-usb@vger.kernel.org>; Sat, 27 Nov 2021 05:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED7EC53FAD;
        Sat, 27 Nov 2021 05:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637990439;
        bh=KELC9bBlyQkM4IO3xUc4ck0Rm9bP0tI/1/k2m+4Wq+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DLBm5XLlf/cAM3mYLX71cxE7Ox+yBx3T5Nwngh8P8TqvGZt/a2ozpJ38Ljj3l+HlS
         YEyRLedtY1QE7SrLM7yh61+4yLCJY+kg5sQ+SY4kaBNGIkl6J2f8HM3wUHoUJNUaPq
         p6EGSJoz9+DKpmyeL0T9+afIgLwylcJZuu/T0FlxM7daUoby01tJ8jsHaThvm2xdWk
         dNGO79lvEdJlAwRb5Kw+wTDm/83jmPUOxJor6d78d+Y0/FCUZT8vxIOK5a1jfRpoj4
         cCqFEvaD1hMNjjTzE1y/AqxKF6ycERbKni/455Lf8luXCaHbG0A/HsD6fU8DL5BX24
         76dw6azOHPekg==
Date:   Sat, 27 Nov 2021 13:20:31 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
Message-ID: <20211127052031.GA7285@Peter>
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
 <e389b7e4-f8c5-1561-2fbc-e926270fc894@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e389b7e4-f8c5-1561-2fbc-e926270fc894@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-10-13 16:15:13, Florian Faber wrote:
> In usb_composite_setup_continue, req->complete is not set, leaving the
> previous value untouched. After completion of the ep0 transaction, the
> UDC would then call whatever complete callback was set previously with
> the composite cdev as context,

Would you please explain more how ep0's req has changed? EP0's req
should not be called by UDC driver.
       
> leading to all sorts of havoc.
> 
> A typical call trace looks like this: A setup packet for mass storage,
> ending up in RNDIS's complete function:

Sorry, I could not understand your back trace well, would you mind
explaining more? Besides, what's your kernel version?
> 
> ---------------------------snip---------------------------------
> [  183.795661] [<bf10b31c>] (rndis_response_complete [usb_f_rndis]) from [<bf0ec024>] (xgs_iproc_ep_enable+0x92c/0xd2c [xgs_iproc_udc])
> [  183.795666]  r5:df5d73ac r4:df767c80

What is xgs_iproc_udc? It seems a downstream UDC driver.

> [  183.795682] [<bf0ebf20>] (xgs_iproc_ep_enable [xgs_iproc_udc]) from [<bf0eca8c>] (xgs_iproc_ep_queue+0x384/0x5bc [xgs_iproc_udc])
> [  183.795687]  r7:df767cb8 r6:df5d7380 r5:df767c80 r4:df5d73ac
> [  183.795706] [<bf0ec708>] (xgs_iproc_ep_queue [xgs_iproc_udc]) from [<c0384fec>] (usb_ep_queue+0x1f0/0x238)
> [  183.795713]  r10:43425355 r9:df767c80 r8:df767c80 r7:a00f0013 r6:df5d73ac r5:df767c80
> [  183.795716]  r4:df65dea8
> [  183.795743] [<c0384dfc>] (usb_ep_queue) from [<bf0f6910>] (usb_composite_overwrite_options+0x128/0x184 [libcomposite])

How could usb_ep_queue is called in usb_composite_overwrite_options?
> [  183.795750]  r9:00055302 r8:df767c80 r7:a00f0013 r6:df65df04 r5:df767c80 r4:df65dea8
> [  183.795777] [<bf0f68e0>] (usb_composite_overwrite_options [libcomposite]) from [<bf0f69f4>] (usb_composite_setup_continue+0x88/0x138 [libcomposite])
> [  183.795782]  r7:a00f0013 r6:df65df04 r5:00000000 r4:df65dea8
> [  183.795812] [<bf0f696c>] (usb_composite_setup_continue [libcomposite]) from [<bf120cf8>] (fsg_alloc_inst+0xa5c/0xac8 [usb_f_mass_storage])

How could usb_composite_setup_continue is called in fsg_alloc_inst? The
usb_composite_setup_continue is usually called at the very late of
enumeration.

> [  183.795819]  r9:00055302 r8:00000003 r7:deca5800 r6:00000001 r5:df595a80 r4:deca5948
> [  183.795840] [<bf120a68>] (fsg_alloc_inst [usb_f_mass_storage]) from [<bf120e00>] (fsg_main_thread+0x9c/0x15dc [usb_f_mass_storage])

How fsg_alloc_inst is called at fsg_main_thread?

Peter

> [  183.795846]  r8:df770000 r7:df595a80 r6:deca1cc0 r5:df724000 r4:deca5800
> [  183.795864] [<bf120d64>] (fsg_main_thread [usb_f_mass_storage]) from [<c0046cd0>] (kthread+0x14c/0x154)
> [  183.795870]  r10:df785d14 r9:00000000 r8:deca5800 r7:df6c31b8 r6:df70f580 r5:df724000
> [  183.795873]  r4:df6c3180
> [  183.795881] [<c0046b84>] (kthread) from [<c000a67c>] (ret_from_fork+0x14/0x38)
> [  183.795887]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0046b84
> [  183.795889]  r4:df70f580
> --------------------------snip-------------------------------------


> 
> Fixes: 57943716ff1b ("usb: gadget: composite: set our req->context to cdev")
> Signed-off-by: Florian Faber <faber@faberman.de>
> 
> ---
> Change in v4:
>   - Short commit hash
>   - Fix line wrap
> 
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
> @@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
>  		DBG(cdev, "%s: Completing delayed status\n", __func__);
>  		req->length = 0;
>  		req->context = cdev;
> +		req->complete = composite_setup_complete;
>  		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
>  		if (value < 0) {
>  			DBG(cdev, "ep_queue --> %d\n", value);
> -- 

-- 

Thanks,
Peter Chen

