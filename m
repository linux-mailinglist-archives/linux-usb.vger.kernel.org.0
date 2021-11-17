Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B0745493B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 15:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbhKQOyV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 09:54:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231788AbhKQOyT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Nov 2021 09:54:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A95A261269;
        Wed, 17 Nov 2021 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637160681;
        bh=i1S5dfPzlrj4PMpso+DzjXWy7AGUqw+lyCagScL8PSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H1GkT4nt67+KExKRsVZMzC7q79ibNqauiO5gwJowFqZVTUp5OSnuuIOjIH5+CU9Eu
         KyQpfUp6uYuRTvTllpBbctXr816UCJRk+RS1Bdo9HuIvwisOE6pypT50TmLrcaPlfu
         q0iToMu1zUr5gUc0IzhFndknCMKJLQIYbDBN9A/o=
Date:   Wed, 17 Nov 2021 15:51:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
Message-ID: <YZUW5sir9oDBDWIR@kroah.com>
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
 <e389b7e4-f8c5-1561-2fbc-e926270fc894@faberman.de>
 <YZULLVqZbILXeo45@kroah.com>
 <bfecab97-0495-3fa2-3772-20ed5568224b@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfecab97-0495-3fa2-3772-20ed5568224b@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 17, 2021 at 03:06:23PM +0100, Florian Faber wrote:
> Greg,
> 
> On 11/17/21 15:01, Greg KH wrote:
> > On Wed, Oct 13, 2021 at 04:15:13PM +0200, Florian Faber wrote:
> > > In usb_composite_setup_continue, req->complete is not set, leaving the
> > > previous value untouched. After completion of the ep0 transaction, the
> > > UDC would then call whatever complete callback was set previously with
> > > the composite cdev as context, leading to all sorts of havoc.
> > > 
> > > A typical call trace looks like this: A setup packet for mass storage,
> > > ending up in RNDIS's complete function:
> > > 
> > > ---------------------------snip---------------------------------
> > > [  183.795661] [<bf10b31c>] (rndis_response_complete [usb_f_rndis]) from [<bf0ec024>] (xgs_iproc_ep_enable+0x92c/0xd2c [xgs_iproc_udc])
> > > [  183.795666]  r5:df5d73ac r4:df767c80
> > > [  183.795682] [<bf0ebf20>] (xgs_iproc_ep_enable [xgs_iproc_udc]) from [<bf0eca8c>] (xgs_iproc_ep_queue+0x384/0x5bc [xgs_iproc_udc])
> > > [  183.795687]  r7:df767cb8 r6:df5d7380 r5:df767c80 r4:df5d73ac
> > > [  183.795706] [<bf0ec708>] (xgs_iproc_ep_queue [xgs_iproc_udc]) from [<c0384fec>] (usb_ep_queue+0x1f0/0x238)
> > > [  183.795713]  r10:43425355 r9:df767c80 r8:df767c80 r7:a00f0013 r6:df5d73ac r5:df767c80
> > > [  183.795716]  r4:df65dea8
> > > [  183.795743] [<c0384dfc>] (usb_ep_queue) from [<bf0f6910>] (usb_composite_overwrite_options+0x128/0x184 [libcomposite])
> > > [  183.795750]  r9:00055302 r8:df767c80 r7:a00f0013 r6:df65df04 r5:df767c80 r4:df65dea8
> > > [  183.795777] [<bf0f68e0>] (usb_composite_overwrite_options [libcomposite]) from [<bf0f69f4>] (usb_composite_setup_continue+0x88/0x138 [libcomposite])
> > > [  183.795782]  r7:a00f0013 r6:df65df04 r5:00000000 r4:df65dea8
> > > [  183.795812] [<bf0f696c>] (usb_composite_setup_continue [libcomposite]) from [<bf120cf8>] (fsg_alloc_inst+0xa5c/0xac8 [usb_f_mass_storage])
> > > [  183.795819]  r9:00055302 r8:00000003 r7:deca5800 r6:00000001 r5:df595a80 r4:deca5948
> > > [  183.795840] [<bf120a68>] (fsg_alloc_inst [usb_f_mass_storage]) from [<bf120e00>] (fsg_main_thread+0x9c/0x15dc [usb_f_mass_storage])
> > > [  183.795846]  r8:df770000 r7:df595a80 r6:deca1cc0 r5:df724000 r4:deca5800
> > > [  183.795864] [<bf120d64>] (fsg_main_thread [usb_f_mass_storage]) from [<c0046cd0>] (kthread+0x14c/0x154)
> > > [  183.795870]  r10:df785d14 r9:00000000 r8:deca5800 r7:df6c31b8 r6:df70f580 r5:df724000
> > > [  183.795873]  r4:df6c3180
> > > [  183.795881] [<c0046b84>] (kthread) from [<c000a67c>] (ret_from_fork+0x14/0x38)
> > > [  183.795887]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0046b84
> > > [  183.795889]  r4:df70f580
> > > --------------------------snip-------------------------------------
> > > 
> > > Fixes: 57943716ff1b ("usb: gadget: composite: set our req->context to cdev")
> > > Signed-off-by: Florian Faber <faber@faberman.de>
> > > 
> > > ---
> > > Change in v4:
> > >    - Short commit hash
> > >    - Fix line wrap
> > > 
> > > Change in v3:
> > >    - Addes changes
> > > 
> > > Change in v2:
> > >    - More verbose explanation
> > >    - Added commit hash that introduced the bug
> > > 
> > >   drivers/usb/gadget/composite.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> > > index 504c1cbc255d..8d497be4be32 100644
> > > --- a/drivers/usb/gadget/composite.c
> > > +++ b/drivers/usb/gadget/composite.c
> > > @@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
> > >   		DBG(cdev, "%s: Completing delayed status\n", __func__);
> > >   		req->length = 0;
> > >   		req->context = cdev;
> > > +		req->complete = composite_setup_complete;
> > >   		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
> > >   		if (value < 0) {
> > >   			DBG(cdev, "ep_queue --> %d\n", value);
> > > -- 
> > 
> > Does not apply to 5.16-rc1 :(
> 
> The diff against a fresh git pull is exactly the same:
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 504c1cbc255d..8d497be4be32 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
>                 DBG(cdev, "%s: Completing delayed status\n", __func__);
>                 req->length = 0;
>                 req->context = cdev;
> +               req->complete = composite_setup_complete;
>                 value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
>                 if (value < 0) {
>                         DBG(cdev, "ep_queue --> %d\n", value);
> 
> What can I do to fix this?

Something is wrong somewhere:

$ git co -b x v5.16-rc1
Switched to a new branch 'x'
$ b4 am -t https://lore.kernel.org/r/bfecab97-0495-3fa2-3772-20ed5568224b@faberman.de
Looking up https://lore.kernel.org/r/bfecab97-0495-3fa2-3772-20ed5568224b%40faberman.de
Grabbing thread from lore.kernel.org/all/bfecab97-0495-3fa2-3772-20ed5568224b%40faberman.de/t.mbox.gz
Analyzing 11 messages in the thread
Will use the latest revision: v4
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  [PATCH v4] usb: gadget: composite: req->complete not set, using wrong callback for complete
---
Total patches: 1
---
 Link: https://lore.kernel.org/r/e389b7e4-f8c5-1561-2fbc-e926270fc894@faberman.de
 Base: applies clean to current tree
       git am ./v4_20211013_faber_usb_gadget_composite_req_complete_not_set_using_wrong_callback_for_complete.mbx
$ patch -p1 < v4_20211013_faber_usb_gadget_composite_req_complete_not_set_using_wrong_callback_for_complete.mbx
checking file drivers/usb/gadget/composite.c
Hunk #1 FAILED at 2518.
1 out of 1 hunk FAILED

Are you sure your email client is working properly?

Ah, that's the problem, your email client is adding extra spaces to the
front of the patch you sent out.  Please fix that up, you can verify
this by looking at the patch on lore.kernel.org like I have showed here.

thanks,

greg k-h
