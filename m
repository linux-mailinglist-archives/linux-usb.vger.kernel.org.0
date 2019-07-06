Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EC66133D
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jul 2019 01:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfGFXo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Jul 2019 19:44:56 -0400
Received: from gate.crashing.org ([63.228.1.57]:44944 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbfGFXo4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Jul 2019 19:44:56 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x66NiZR3021900;
        Sat, 6 Jul 2019 18:44:36 -0500
Message-ID: <e105c23c31526e00e45eea21ad647e7902ab5386.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Sun, 07 Jul 2019 09:44:34 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907061436180.406-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.1907061436180.406-100000@netrider.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2019-07-06 at 14:37 -0400, Alan Stern wrote:
> On Sat, 6 Jul 2019, Benjamin Herrenschmidt wrote:
> 
> > On Fri, 2019-07-05 at 10:08 -0400, Alan Stern wrote:
> > > On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:
> 
> > > > Sure but it would be nice if the mass storage dealt with
> -ESHUTDOWN
> > > > properly and stopped :-) Or other errors... if the UDC HW for
> example
> > > > dies for some reason, mass storage will lockup.
> > > 
> > > I suppose we could add code to check for this case and handle
> it, 
> > > although I'm not sure what would be the right thing to do.  Delay
> for 
> > > one second and try again?  Disable the gadget until the host does
> a 
> > > reset?
> > 
> > I think just stop it until the next reset yes.
> 
> Can you test this patch?

Not for a few days, I'm away from the machine and that test requires me
being physically present, but I will when I'm back.

Thanks !

Cheers,
Ben.

> Alan Stern
> 
> 
> 
> Index: usb-devel/drivers/usb/gadget/function/f_mass_storage.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/function/f_mass_storage.c
> +++ usb-devel/drivers/usb/gadget/function/f_mass_storage.c
> @@ -552,13 +552,14 @@ static int start_transfer(struct fsg_dev
>  
>                 /* We can't do much more than wait for a reset */
>                 req->status = rc;
> +               if (rc == -ESHUTDOWN)
> +                       fsg->common->running = 0;
>  
>                 /*
>                  * Note: currently the net2280 driver fails zero-
> length
>                  * submissions if DMA is enabled.
>                  */
> -               if (rc != -ESHUTDOWN &&
> -                               !(rc == -EOPNOTSUPP && req->length ==
> 0))
> +               else if (!(rc == -EOPNOTSUPP && req->length == 0))
>                         WARNING(fsg, "error in submission: %s -->
> %d\n",
>                                         ep->name, rc);
>         }

