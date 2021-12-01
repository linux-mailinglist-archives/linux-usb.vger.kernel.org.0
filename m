Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8F1464F68
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 15:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239088AbhLAOQM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 09:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbhLAOQL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 09:16:11 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB06C061574
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 06:12:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0BC17CE1EDF
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 14:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8171C53FAD;
        Wed,  1 Dec 2021 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638367967;
        bh=BDJoJ+K0b8JsSNjkArPC/33kpnRlM/2S/voMGimR4tQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ExAi2BO4evKo0OhLRWUI5AEN44ph2xnZiySepxaymQb+Qir91K2rEna0xqi/tKheZ
         NfUgO64OS1nGa3Qod/tLzLPOwPavxrblSlPDuPKGPoOblH4YHzN8kKhFTAzeFwTqZg
         whqh76ieyPikwtP+KZWvhLX2lM9WcwChU3f1GvvX/QUuc0/AIweMLJwyBhcy3BKzvK
         ae4hA5rQLiai1TT1g4Xe5inRp/3GcnFCOFF3ZqZ8T9bmxBVKiv6ZSFLw2QxnD6+ocR
         mjAWWP4YUCQULzD+vVlzQfE+HckFtALdlC+TSxVXP6/TLu+990LE0kfXtcVCL0WB0v
         8seVLMQCy3Ocg==
Date:   Wed, 1 Dec 2021 22:12:40 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
Message-ID: <20211201141240.GA3720@Peter>
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
 <e389b7e4-f8c5-1561-2fbc-e926270fc894@faberman.de>
 <20211127052031.GA7285@Peter>
 <08e62c4a-a911-9d35-8427-b5fbc9e959e6@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e62c4a-a911-9d35-8427-b5fbc9e959e6@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-12-01 12:04:52, Florian Faber wrote:
> Peter,
> 
> On 11/27/21 06:20, Peter Chen wrote:
> > On 21-10-13 16:15:13, Florian Faber wrote:
> > > In usb_composite_setup_continue, req->complete is not set, leaving the
> > > previous value untouched. After completion of the ep0 transaction, the
> > > UDC would then call whatever complete callback was set previously with
> > > the composite cdev as context,
> > 
> > Would you please explain more how ep0's req has changed? EP0's req
> > should not be called by UDC driver.

Sorry, typo. I mean **changed** by UDC driver. Except for composite.c, I only see ep0's req has
changed at f_tcm.c.

> 
> I have found this bug by adding a source identifier field to struct usb_request so I could not only detect wether a correct packet was sent to a complete function, but also trace the exact origin. That way I could show that a packet with a gadget's completion callback was generated in composite.c.

Then, have you found how the ep0's req has been changed, and the
req->complete was set by other completion function?

> 
> I don't understand your question. Of course composite.c's completion function is called from the UDC driver.
> 
> > > leading to all sorts of havoc.
> > > 
> > > A typical call trace looks like this: A setup packet for mass storage,
> > > ending up in RNDIS's complete function:
> > 
> > Sorry, I could not understand your back trace well, would you mind
> > explaining more? Besides, what's your kernel version?
> 
> For some reasons, the kernel stack traces on the target are often wrong and manually looking up the addresses in gdb gives the correct location in the source. That might be the case in this trace as well.
> 
> 4.14.115.

This version kernel is old, would you have newer kernel to try this issue?

Peter
> 
> > > ---------------------------snip---------------------------------
> > > [  183.795661] [<bf10b31c>] (rndis_response_complete [usb_f_rndis]) from [<bf0ec024>] (xgs_iproc_ep_enable+0x92c/0xd2c [xgs_iproc_udc])
> > > [  183.795666]  r5:df5d73ac r4:df767c80
> > 
> > What is xgs_iproc_udc? It seems a downstream UDC driver.
> 
> Yes, embedded system with iproc SoC.
> 
> > > [  183.795682] [<bf0ebf20>] (xgs_iproc_ep_enable [xgs_iproc_udc]) from [<bf0eca8c>] (xgs_iproc_ep_queue+0x384/0x5bc [xgs_iproc_udc])
> > > [  183.795687]  r7:df767cb8 r6:df5d7380 r5:df767c80 r4:df5d73ac
> > > [  183.795706] [<bf0ec708>] (xgs_iproc_ep_queue [xgs_iproc_udc]) from [<c0384fec>] (usb_ep_queue+0x1f0/0x238)
> > > [  183.795713]  r10:43425355 r9:df767c80 r8:df767c80 r7:a00f0013 r6:df5d73ac r5:df767c80
> > > [  183.795716]  r4:df65dea8
> > > [  183.795743] [<c0384dfc>] (usb_ep_queue) from [<bf0f6910>] (usb_composite_overwrite_options+0x128/0x184 [libcomposite])
> > 
> > How could usb_ep_queue is called in usb_composite_overwrite_options?
> > > [  183.795750]  r9:00055302 r8:df767c80 r7:a00f0013 r6:df65df04 r5:df767c80 r4:df65dea8
> > > [  183.795777] [<bf0f68e0>] (usb_composite_overwrite_options [libcomposite]) from [<bf0f69f4>] (usb_composite_setup_continue+0x88/0x138 [libcomposite])
> > > [  183.795782]  r7:a00f0013 r6:df65df04 r5:00000000 r4:df65dea8
> > > [  183.795812] [<bf0f696c>] (usb_composite_setup_continue [libcomposite]) from [<bf120cf8>] (fsg_alloc_inst+0xa5c/0xac8 [usb_f_mass_storage])
> > 
> > How could usb_composite_setup_continue is called in fsg_alloc_inst? The
> > usb_composite_setup_continue is usually called at the very late of
> > enumeration.
> 
> I don't know what this has to do with this bug. The only relevant question is: Why is the callback function not set in this particular location in composite.c?
> 
> > > [  183.795819]  r9:00055302 r8:00000003 r7:deca5800 r6:00000001 r5:df595a80 r4:deca5948
> > > [  183.795840] [<bf120a68>] (fsg_alloc_inst [usb_f_mass_storage]) from [<bf120e00>] (fsg_main_thread+0x9c/0x15dc [usb_f_mass_storage])
> > 
> > How fsg_alloc_inst is called at fsg_main_thread> Peter
> > 
> > > [  183.795846]  r8:df770000 r7:df595a80 r6:deca1cc0 r5:df724000 r4:deca5800
> > > [  183.795864] [<bf120d64>] (fsg_main_thread [usb_f_mass_storage]) from [<c0046cd0>] (kthread+0x14c/0x154)
> > > [  183.795870]  r10:df785d14 r9:00000000 r8:deca5800 r7:df6c31b8 r6:df70f580 r5:df724000
> > > [  183.795873]  r4:df6c3180
> > > [  183.795881] [<c0046b84>] (kthread) from [<c000a67c>] (ret_from_fork+0x14/0x38)
> > > [  183.795887]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0046b84
> > > [  183.795889]  r4:df70f580
> > > --------------------------snip-------------------------------------
> > 
> > 
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
> 
> Flo
> -- 
> Machines can do the work, so people have time to think.

-- 

Thanks,
Peter Chen

