Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660A2607BA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 16:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfGEOUo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 10:20:44 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46840 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725497AbfGEOUo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 10:20:44 -0400
Received: (qmail 1791 invoked by uid 2102); 5 Jul 2019 10:20:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Jul 2019 10:20:43 -0400
Date:   Fri, 5 Jul 2019 10:20:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Subject: Re: Virtual hub, resets etc...
In-Reply-To: <cd91ee110c9fa39756e34d020ef284540a30feb2.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1907051008580.1606-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:

> On Thu, 2019-07-04 at 21:37 -0400, Alan Stern wrote:
> > > 
> > > Talking of which... do we need this ?
> > > 
> > > --- a/drivers/usb/gadget/composite.c
> > > +++ b/drivers/usb/gadget/composite.c
> > > @@ -1976,6 +1976,7 @@ void composite_disconnect(struct usb_gadget *gadget)
> > >         * disconnect callbacks?
> > >         */
> > >        spin_lock_irqsave(&cdev->lock, flags);
> > > +     cdev->suspended = 0;
> > >        if (cdev->config)
> > >                reset_config(cdev);
> > >        if (cdev->driver->disconnect)
> > > 
> > > Otherwise with my vhub or with dummy_hcd, a suspend followed by a reset
> > > will keep that stale suspended flag to 1 (which has no effect at the moment
> > > but still...)
> > > 
> > > If yes, I'll submit a patch accordingly...
> > 
> > According to the USB spec, a host is not supposed to reset a suspended 
> > port (it's supposed to resume the port and then do the reset).  But of 
> > course this can happen anyway, so we should handle it properly.
> 
> Right. I do see the resume coming in, but I don't forward it to the
> gadget because here's what happens in that order:
> 
>  1- Host gets shutdown (or cable disconnected)
> 
>  2- Upstream bus suspend: I call ->suspend on the gadgets on all
> enabled ports that don't have USB_PORT_STAT_SUSPEND already set. I
> don't change the port status, I don't set USB_PORT_STAT_SUSPEND

Hmmm.  Does the descriptor for your hub say that it is self-powered?  A 
bus-powered hub would turn off completely when its upstream cable was 
unplugged, thereby sending a disconnect signal to all its child 
devices.

I don't recall what the USB spec says a self-powered hub should do.  
Maybe it doesn't say anything about it.

>  3- Machine gets turned back on (or cable reconnected)
>  
>  4- Upstream bus resume: I call ->resume on the gadgets on all
> enabled ports that don't have USB_PORT_STAT_SUSPEND set.

No, the upstream bus doesn't resume upon cable reconnect.  A resume
would require packets to be received over the cable, but the host won't
send any packets to the hub until the upstream port has been reset and
enabled.  So you should eliminate this step.

>  5- Upstream bus reset: I call ->suspend on all enabled ports after
> clearing their status (I preserve only USB_PORT_STAT_SUSPEND and
> USB_PORT_STAT_POWER which is always set for me). Note: I currently do
> this even if the port had USB_PORT_STAT_SUSPEND set, so such as port
> will get a double suspend ... maybe I shouldn't.

I believe the upstream reset should cause the hub to clear all the 
downstream port statuses.  Even if the reset doesn't do this, the 
Set-Config request which follows the reset should.

Whether you tell the gadget drivers they are no longer suspended is up 
to you.  I suspect it doesn't matter much.

>  6- Hosts sets port reset: I reset the gadget since it's already
> bound/enabled. It's still "suspended".
> 
> So we do have a legitimate case of "reset while suspended".

Ah, but it doesn't contradict what I wrote earlier.  There's a
difference between resuming a suspended _device_ and resuming a
suspended _port_.

Nevertheless, in practice the difference doesn't matter and the 
composite core should do the right thing.

> I'll tidy up the patch and submit it.

Good.

Alan Stern

