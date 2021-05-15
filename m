Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596FB381991
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhEOPcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 11:32:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33047 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232479AbhEOPc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 11:32:27 -0400
Received: (qmail 1037316 invoked by uid 1000); 15 May 2021 11:31:13 -0400
Date:   Sat, 15 May 2021 11:31:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210515153113.GB1036273@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org>
 <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org>
 <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org>
 <20210514165830.GA1010288@rowland.harvard.edu>
 <875yzk7b2y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yzk7b2y.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 15, 2021 at 09:41:41AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Alan Stern <stern@rowland.harvard.edu> writes:
> > On Fri, May 14, 2021 at 10:35:59AM +0300, Felipe Balbi wrote:
> >> Alan Stern <stern@rowland.harvard.edu> writes:
> >> > On Wed, May 12, 2021 at 10:00:41AM +0300, Felipe Balbi wrote:
> >> >> Hmm, IIRC only the storage gadget defers work to another thread.
> >> >
> >> > Well, the composite core is built into almost every gadget, and doesn't 
> >> > it handle Set-Configuration and Set-Interface requests in a separate 
> >> > thread?  Or doesn't it expect function drivers to do so?
> >> 
> >> composite.c doesn't defer anything to a separate thread by itself. The
> >> gadget driver, if it finds it necessary, should handle it
> >> internally. Most gadget drivers handle all of this in interrupt context.
> >> 
> >> > After all, the gadget first learns about config or altsetting changes 
> >> > when it receives a Set-Configuration or Set-Interface request, which 
> >> > happens in interrupt context.  But changing configs or altsettings 
> >> > requires disabling/enabling endpoints, which needs a process context 
> >> > (see the kerneldoc for usb_ep_enable and usb_ep_disable).
> >> 
> >> Ouch, I don't think any driver is guaranteeing that other than the
> >> storage gadget.
> >
> > A quick search shows that USB_GADGET_DELAYED_STATUS is used in f_fs.c, 
> > f_tcm.c, and f_uvc.c in addition to f_mass_storage.c.  So the situation 
> > isn't as bad as you thought, although it should be better.
> 
> right, that's not what the documentation means, though. We're still
> enabling/disabling endpoints in interrupt context, just delaying the
> status stage until a later time.
> 
> It looks like delaying status like this is enough for the current UDC
> drivers so, perhaps, we should make delayed_status mandatory and update
> the documentation accordingly.

If it's okay to call those functions in interrupt context then the 
kerneldoc definitely should be updated.  However, I don't see why you 
would want to make DELAYED_STATUS mandatory.  If all the necessary work 
can be done in the set_alt handler, why not return the status 
immediately?

BTW, does it seem odd to you that these function drivers defer some of 
the set_alt activities into a work thread but do the ep_enable/disable 
parts right away, in interrupt context?  I should think the drivers 
would want to minimize the amount of processing that happens 
in_interrupt.

> > Anyway, getting back to the main point...
> >
> > To minimize disruption, suppose we add a new callback to usb_gadget_ops:
> >
> > 	void	(*udc_async_callbacks)(struct usb_gadget *, int enable);
> >
> > The UDC core can call this at the appropriate times, if it is not NULL.  
> > It allows the core to tell a UDC driver whether or not to issue 
> > callbacks for setup, disconnect, reset, suspend, and resume.  It doesn't 
> > affect request completion callbacks.
> >
> > So for removing a driver, the proper sequence will be:
> >
> > 	usb_gadget_disconnect()
> > 	if (gadget->ops->udc_async_callbacks)
> > 		gadget->ops->udc_async_callbacks(gadget, 0);
> > 	synchronize_irq()
> > 	udc->driver->unbind()
> > 	usb_gadget_udc_stop()
> >
> > Or maybe the last two steps should be reversed.  In udc_bind_to_driver, 

After some more thought, I decided the last two steps are in the right 
order now.  When udc_stop runs, it causes the UDC driver to forget about 
the gadget driver, so there wouldn't be any way to issue the completion 
callbacks when the unbind handler cancels the outstanding requests and 
disables the endpoints.

> > the opposite sequence is:
> >
> > 	bind
> > 	udc_start

Then by analogy, these two steps should be reversed.  But it doesn't 
really matter, because the gadget driver won't try to enable endpoints 
or do anything else until the host has enumerated the gadget.  (And if 
there are any gadget devices which don't allow software to control the 
pull-up separately, then they clearly will want bind to precede 
udc_start.)

> > 	enable async callbacks
> > 	connect (turn on pull-up)
> >
> > How does this sound?
> 
> Sounds reasonable and, probably, minimizes the amount of code that needs
> to be changed. This will also enable us to fix each UDC in isolation.

Right.  Okay, I'll work on a patch series.

Alan Stern
