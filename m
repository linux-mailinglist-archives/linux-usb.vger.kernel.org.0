Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 300C05FF6D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 04:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfGECPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 22:15:53 -0400
Received: from gate.crashing.org ([63.228.1.57]:40041 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfGECPx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 22:15:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x652FivE005015;
        Thu, 4 Jul 2019 21:15:45 -0500
Message-ID: <cd91ee110c9fa39756e34d020ef284540a30feb2.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Fri, 05 Jul 2019 12:15:44 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907042135090.840-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.1907042135090.840-100000@netrider.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-07-04 at 21:37 -0400, Alan Stern wrote:
> > 
> > Talking of which... do we need this ?
> > 
> > --- a/drivers/usb/gadget/composite.c
> > +++ b/drivers/usb/gadget/composite.c
> > @@ -1976,6 +1976,7 @@ void composite_disconnect(struct usb_gadget *gadget)
> >         * disconnect callbacks?
> >         */
> >        spin_lock_irqsave(&cdev->lock, flags);
> > +     cdev->suspended = 0;
> >        if (cdev->config)
> >                reset_config(cdev);
> >        if (cdev->driver->disconnect)
> > 
> > Otherwise with my vhub or with dummy_hcd, a suspend followed by a reset
> > will keep that stale suspended flag to 1 (which has no effect at the moment
> > but still...)
> > 
> > If yes, I'll submit a patch accordingly...
> 
> According to the USB spec, a host is not supposed to reset a suspended 
> port (it's supposed to resume the port and then do the reset).  But of 
> course this can happen anyway, so we should handle it properly.

Right. I do see the resume coming in, but I don't forward it to the
gadget because here's what happens in that order:

 1- Host gets shutdown (or cable disconnected)

 2- Upstream bus suspend: I call ->suspend on the gadgets on all
enabled ports that don't have USB_PORT_STAT_SUSPEND already set. I
don't change the port status, I don't set USB_PORT_STAT_SUSPEND

 3- Machine gets turned back on (or cable reconnected)
 
 4- Upstream bus resume: I call ->resume on the gadgets on all
enabled ports that don't have USB_PORT_STAT_SUSPEND set.

 5- Upstream bus reset: I call ->suspend on all enabled ports after
clearing their status (I preserve only USB_PORT_STAT_SUSPEND and
USB_PORT_STAT_POWER which is always set for me). Note: I currently do
this even if the port had USB_PORT_STAT_SUSPEND set, so such as port
will get a double suspend ... maybe I shouldn't.

 6- Hosts sets port reset: I reset the gadget since it's already
bound/enabled. It's still "suspended".

So we do have a legitimate case of "reset while suspended".

I'll tidy up the patch and submit it.

Cheers,
Ben.


