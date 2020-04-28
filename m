Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C151BBF73
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 15:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgD1N1J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 09:27:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38767 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726798AbgD1N1J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 09:27:09 -0400
Received: (qmail 7353 invoked by uid 500); 28 Apr 2020 09:27:07 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Apr 2020 09:27:07 -0400
Date:   Tue, 28 Apr 2020 09:27:07 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+z=z=e2pYQy3vtJO4rm+=Rb=av+4RidLCyp7Ae3shggqA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004280920510.4958-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Better late than never...

On Tue, 28 Apr 2020, Andrey Konovalov wrote:

> On Tue, Apr 28, 2020 at 2:50 AM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Mon, Apr 27, 2020 at 10:47 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Mon, Apr 27, 2020 at 9:51 PM Andrey Konovalov <andreyknvl@google.com> wrote:

> > > > Another question, which actually seems to be a major problem.
> > > >
> > > > It looks like automatic endpoint selection based on required features
> > > > doesn't work in raw-gadget. The way it tries to do that is iterating
> > > > over the list of available endpoints and finding one that has the
> > > > right direction and transfer type. But it seems that the right way to
> > > > do that (like it's done in usb_ep_autoconfig()) is to also patch the
> > > > bEndpointAddress field of the endpoint descriptor.
> > > >
> > > > Currently with raw-gadget the endpoints are supposed to be enabled
> > > > after a set_configuration/set_interface request from the host, so it's
> > > > too late to patch the endpoint descriptor (the one that was sent to
> > > > the host during enumeration). I'm guessing that sending one endpoint
> > > > descriptor during enumeration and then using a different one (with
> > > > patched bEndpointAddress) to set ep->desc before doing usb_ep_enable()
> > > > won't work (as there's going to be mismatch in endpoint addresses
> > > > between the host and the UDC), right?

It certainly won't work.

> > > > I wonder what we can do about that. It seems that we actually need to
> > > > parse the descriptors and figure out the right endpoints before the
> > > > enumeration starts.

That's right.  In the case of raw-gadget, this would be done around the 
time the user tells the driver what the config descriptors are.

> > > Or maybe somehow expose all endpoints and their features (like
> > > GadgetFS) and let userspace put proper addresses into endpoint
> > > descriptors before enumeration starts.

And if the user messes up the assignment, his driver won't work.

> > I think this is the way to go, giving the userspace maximum control
> > over what's going on. Seems not too hard to implement too. The only
> > part that is not clear to me is how to figure out the endpoint address
> > that a particular UDC endpoint expects to have.
> >
> > Most of the time endpoints are named as something like "ep1in" or
> > "ep2out", and AFAIU the number in the endpoint name is the address.
> > However net2280 seems to have weird endpoint names "ep-a", "ep-b",
> > etc. Looking at usb_ep_autoconfig_ss(), those endpoints supposedly
> > have sequential addresses starting from 1 (for each in/out type). But
> > then in the GadgetFS example [1] e.g. "ep-a" corresponds to address 7,
> > which I don't understand. My guess is that this is done to handle both
> > dummy_udc and net2280 in a single if case, but I'm not sure.
> >
> > [1] http://www.linux-usb.org/gadget/usb.c
> 
> Oh, there's actually a comment that explains this [1] in dummy_hcd.c
> (exactly the place where one would look for it :). So "ep-a" and
> others are fully configurable and accept any endpoint address. OK, I
> think I've figured out what to do here, will send a patch.
> 
> [1] https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/usb/gadget/udc/dummy_hcd.c#L113

I know you want to provide maximum flexibility in terms of what the
user can do.  Still, there has to be some way for the kernel driver to
know what endpoints the user wants to expose and what their
characteristics should be.  You can't get this information just by
snooping Get-Descriptor responses because in theory the host doesn't
have to send any such requests.

Alan Stern

