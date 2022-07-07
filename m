Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA5756A93B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 19:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236028AbiGGRQX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 13:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236179AbiGGRQV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 13:16:21 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E8A685A2FA
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 10:16:16 -0700 (PDT)
Received: (qmail 432797 invoked by uid 1000); 7 Jul 2022 13:16:15 -0400
Date:   Thu, 7 Jul 2022 13:16:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Jozo M." <jomajm@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: gadgetfs inode.c - possible memory corruption ?
Message-ID: <YscU353BnKDhZ5I5@rowland.harvard.edu>
References: <CA+BOZ0uBvKHc3idN+Pn_g4Z4e5ObYPZ4WY4f78fzj_B=8c5qJw@mail.gmail.com>
 <YscFzAAkhbPojMVL@rowland.harvard.edu>
 <CA+BOZ0tVe11y6aVqns7mLM+eJWSZtgHWB3kCaKbyeYmPu8ELDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+BOZ0tVe11y6aVqns7mLM+eJWSZtgHWB3kCaKbyeYmPu8ELDA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 07, 2022 at 06:47:09PM +0200, Jozo M. wrote:
> But can't be this a deadlock ?
> What if IRQ which calls complete(...) will be executed sooner than
> wait_for_completion()

It's okay.  If complete() gets called first then wait_for_completion() 
will return immediately.

Alan Stern

> 
> št 7. 7. 2022 o 18:11 Alan Stern <stern@rowland.harvard.edu> napísal(a):
> >
> > On Thu, Jul 07, 2022 at 11:43:09AM +0200, Jozo M. wrote:
> > > Hello,
> > >
> > > my kernel running on imx6 was crashing on USB gadgetfs because my
> > > kernel was using wait_event API instead of completion (I was convinced
> > > it is due to wrong HW setup).
> > > During research gadgetfs inode.c function ep_io was not clear for me:
> > >
> > > we are submiting USB request here
> > >       value = usb_ep_queue (epdata->ep, req, GFP_ATOMIC);
> > > then we are waiting for completion here:
> > >       value = wait_for_completion_interruptible(&done);
> > > but if completion is interrupted we end up here:
> > >       spin_unlock_irq (&epdata->dev->lock);
> > >       DBG (epdata->dev, "endpoint gone\n");
> > >       epdata->status = -ENODEV;
> >
> > You left out part of the code.  We end up at this code in the case where
> > epdata->ep == NULL, and the only way that can happen is if the endpoint
> > was removed while we were waiting for the completion.
> >
> > > At this point ep_io is terminated and stack is not valid. Later on
> > > epio_complete might be called from IRQ and it calls complete ((struct
> > > completion *)req->context) but stack is no longer valid;
> > > Shouldn't we put req->context = NULL;  before spin_unlock_irq
> > > (&epdata->dev->lock); ?
> > >       req->context = NULL;
> > >       spin_unlock_irq (&epdata->dev->lock);
> > >       DBG (epdata->dev, "endpoint gone\n");
> > >       epdata->status = -ENODEV;
> >
> > You're right that this is a bug, but your solution is not correct.
> > There is a race: epio_complete can run at the same time as this code if
> > the endpoint is removed concurrently with the interrupt, and your
> > approach is still subject to this race.
> >
> > The right way to fix the problem is to call wait_for_completion(&done)
> > between the DBG and the assignment to epdata->status.  That way the
> > stack will still be valid when epio_complete runs.
> >
> > Please feel free to submit a patch doing this.
> >
> > Alan Stern
