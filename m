Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9675F37B0C1
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 23:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEKV17 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 17:27:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41635 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229637AbhEKV16 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 17:27:58 -0400
Received: (qmail 914128 invoked by uid 1000); 11 May 2021 17:26:51 -0400
Date:   Tue, 11 May 2021 17:26:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210511212651.GA914027@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1idfzms.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 11, 2021 at 11:22:51AM +0300, Felipe Balbi wrote:
> Right, I'm arguing that, perhaps, ->udc_stop() is the one that should
> have said semantics. For starters, 'stop' has a very clear meaning and,
> considering my quick review of 3 or 4 UDC drivers, they are just masking
> or releasing interrupts which would prevent ->suspend() and
> ->disconnect() from being called. It could be, however, that if we
> change the semantics of udc_stop to fit your description above,
> ->udc_start() may have to change accordingly. Using dwc3 as an example,
> here are the relevant implementations:
> 
> > static int dwc3_gadget_start(struct usb_gadget *g,
> > 		struct usb_gadget_driver *driver)
> > {
> > 	struct dwc3		*dwc = gadget_to_dwc(g);
> > 	unsigned long		flags;
> > 	int			ret;
> > 	int			irq;
> >
> > 	irq = dwc->irq_gadget;
> > 	ret = request_threaded_irq(irq, dwc3_interrupt, dwc3_thread_interrupt,
> > 			IRQF_SHARED, "dwc3", dwc->ev_buf);
> 
> request interrupt line and enable it. Prepare the udc to call gadget ops.
> 
> > 	if (ret) {
> > 		dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
> > 				irq, ret);
> > 		return ret;
> > 	}
> >
> > 	spin_lock_irqsave(&dwc->lock, flags);
> > 	dwc->gadget_driver	= driver;
> 
> internal pointer cached for convenience
> 
> > 	spin_unlock_irqrestore(&dwc->lock, flags);
> >
> > 	return 0;
> > }
> >
> > static int dwc3_gadget_stop(struct usb_gadget *g)
> > {
> > 	struct dwc3		*dwc = gadget_to_dwc(g);
> > 	unsigned long		flags;
> >
> > 	spin_lock_irqsave(&dwc->lock, flags);
> > 	dwc->gadget_driver	= NULL;
> > 	spin_unlock_irqrestore(&dwc->lock, flags);
> >
> > 	free_irq(dwc->irq_gadget, dwc->ev_buf);
> 
> drop the interrupt line. This makes the synchronize_irq() call
> irrelevant in usb_gadget_remove_driver().

I'm not so sure about this.  It seems like this whole thing arose when 
the UDC core was created.  Before that, gadget drivers would register 
and unregister themselves by calling routines in the UDC driver (because 
there was no core to manage things overall).  Thus the UDC driver knew 
everything that was going on and could arrange to do things in the right 
order.

But now the UDC driver doesn't know about unregistrations/unbinding 
until too late.

So in dwc3, for example: At what point do you abort all outstanding 
requests with -ESHUTDOWN status?  We don't want to do this before 
invoking the gadget driver's ->unbind callback.  Or do you rely on the 
gadget driver to cancel the oustanding requests by itself?

(In dummy-hcd, the udc_stop routine first calls stop_activity, which 
nukes all outstanding requests, and afterward sets dum->driver to NULL.)

The host-side API, which I admit may not be the greatest, does cancel 
all outstanding URBs before calling the class driver's disconnect 
routine -- unless the class driver sets the "soft_unbind" flag, in which 
case we assume the driver will kill its own URBs properly.

Suppose dwc3_gadget_stop was moved before the ->unbind callback.  Then 
when the gadget driver cancelled its outstanding requests during unbind, 
how could dwc3 do the completion callbacks with dwc->gadget_driver 
already set to NULL?

> I'm not against adding new udc methods to gadget ops, but it seems
> fitting that udc_start/udc_stop would fit your description while some
> new members could be given the task of priming the default control pipe
> to receive the first SETUP packet.
> 
> What do you think?

Starting things up when a new gadget driver binds doesn't seem to be so 
much of a problem.  After all, the new driver isn't going to do anything 
before the first SETUP packet arrives, since the gadget will be 
unconfigured.  Unbinding and shutting down are the hard parts.

I guess the ideal approach would be:

	First, the UDC driver basically turns off the UDC hardware.
	This means no more IRQs will be generated.  But pending requests
	remain pending until they are explicitly cancelled.

	Second, the gadget driver's unbind callback runs.  It should
	cancel any outstanding requests and generally release resources.

	Third, the UDC driver WARNs about any requests that still exist
	and automatically releases them without doing any completion
	callbacks.  It also forgets about the gadget driver (this can't
	happen until after the gadget driver has cancelled its 
	requests).

Right now we are doing the first two steps in the opposite order.  That 
would be okay, provided we could guarantee there are no more 
asynchronous callbacks once unbind is called (sort of like what Peter 
has done for configfs).  But it would be better to do the steps in the 
order shown above.  This does correspond to calling udc_stop first, as 
you suggest.

But it also would mean splitting out the third step as something 
separate from udc_stop.  Not to mention some potentially serious 
updating of some UDC drivers.

On the other hand, there is something to be said for leaving the UDC 
operational until after the unbind callback.  If the gadget driver 
happened to be installing a new alternate setting at that time, say in a 
workqueue thread, calls to activate new endpoints wouldn't suddenly get 
unexpected errors.

As you can see, I haven't got a very firm picture of how all this should 
work.

Alan Stern
