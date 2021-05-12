Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB2737C592
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 17:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhELPlb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 11:41:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54255 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235011AbhELPfH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 11:35:07 -0400
Received: (qmail 936598 invoked by uid 1000); 12 May 2021 11:33:58 -0400
Date:   Wed, 12 May 2021 11:33:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210512153358.GC934575@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org>
 <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf8kfnc6.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 12, 2021 at 10:00:41AM +0300, Felipe Balbi wrote:
> 
> > So in dwc3, for example: At what point do you abort all outstanding 
> > requests with -ESHUTDOWN status?  We don't want to do this before 
> 
> we do this as part of dwc3_remove_requests(). So, it's done either when
> the relevant endpoint is disabled or as part of
> dwc3_stop_active_transfers() which in turn is called from a (bus) reset
> interrupt or when disconnecting pullups.

I wish these sorts of questions had been answered in the original design 
of the gadget subsystem.  For example, does it even make sense for the 
UDC driver to disable endpoints on its own initiative?  Oh well, too 
late now...

> > invoking the gadget driver's ->unbind callback.  Or do you rely on the 
> > gadget driver to cancel the oustanding requests by itself?
> >
> > (In dummy-hcd, the udc_stop routine first calls stop_activity, which 
> > nukes all outstanding requests, and afterward sets dum->driver to NULL.)
> 
> I see.
> 
> > The host-side API, which I admit may not be the greatest, does cancel 
> > all outstanding URBs before calling the class driver's disconnect 
> > routine -- unless the class driver sets the "soft_unbind" flag, in which 
> > case we assume the driver will kill its own URBs properly.
> >
> > Suppose dwc3_gadget_stop was moved before the ->unbind callback.  Then 
> > when the gadget driver cancelled its outstanding requests during unbind, 
> > how could dwc3 do the completion callbacks with dwc->gadget_driver 
> > already set to NULL?
> 
> That's fair :-)
> 
> >> I'm not against adding new udc methods to gadget ops, but it seems
> >> fitting that udc_start/udc_stop would fit your description while some
> >> new members could be given the task of priming the default control pipe
> >> to receive the first SETUP packet.
> >> 
> >> What do you think?
> >
> > Starting things up when a new gadget driver binds doesn't seem to be so 
> > much of a problem.  After all, the new driver isn't going to do anything 
> > before the first SETUP packet arrives, since the gadget will be 
> 
> it could be an impact in power consumption, albeit minimal

All right.  But at least it isn't an issue of correctness.

> > unconfigured.  Unbinding and shutting down are the hard parts.
> >
> > I guess the ideal approach would be:
> >
> > 	First, the UDC driver basically turns off the UDC hardware.
> > 	This means no more IRQs will be generated.  But pending requests
> > 	remain pending until they are explicitly cancelled.
> 
> right, that, I argue, is the responsibility of ->udc_stop()
> 
> > 	Second, the gadget driver's unbind callback runs.  It should
> > 	cancel any outstanding requests and generally release resources.
> 
> correct. But that means we would require the gadget driver to initiate
> cancelling of outstanding requests

Or even better, disabling all endpoints.  That's a reasonable 
requirement.  Function drivers are expected to do that anyway whenever 
the composite core switches to a different configuration, aren't they?

In some ways, unbinding is similar to switching to configuration 0 (not 
configured).

> > 	Third, the UDC driver WARNs about any requests that still exist
> > 	and automatically releases them without doing any completion
> > 	callbacks.  It also forgets about the gadget driver (this can't
> > 	happen until after the gadget driver has cancelled its 
> > 	requests).
> >
> > Right now we are doing the first two steps in the opposite order.  That 
> > would be okay, provided we could guarantee there are no more 
> > asynchronous callbacks once unbind is called (sort of like what Peter 
> > has done for configfs).  But it would be better to do the steps in the 
> > order shown above.  This does correspond to calling udc_stop first, as 
> > you suggest.
> 
> right
> 
> > But it also would mean splitting out the third step as something 
> > separate from udc_stop.  Not to mention some potentially serious 
> > updating of some UDC drivers.
> 
> yeah, it would take quite a bit of effort.
> 
> > On the other hand, there is something to be said for leaving the UDC 
> > operational until after the unbind callback.  If the gadget driver 
> > happened to be installing a new alternate setting at that time, say in a 
> > workqueue thread, calls to activate new endpoints wouldn't suddenly get 
> > unexpected errors.
> 
> Hmm, IIRC only the storage gadget defers work to another thread.

Well, the composite core is built into almost every gadget, and doesn't 
it handle Set-Configuration and Set-Interface requests in a separate 
thread?  Or doesn't it expect function drivers to do so?

After all, the gadget first learns about config or altsetting changes 
when it receives a Set-Configuration or Set-Interface request, which 
happens in interrupt context.  But changing configs or altsettings 
requires disabling/enabling endpoints, which needs a process context 
(see the kerneldoc for usb_ep_enable and usb_ep_disable).

> What
> you describe can also happen today depending on how far into the future
> the kthread is scheduled, no? So, how does storage gadget behave with
> that today?

I'm not clear on the details any more, but in essence the unbind routine 
takes great care to wait until any queued worker threads have completed 
or been successfully cancelled before it returns.

Alan Stern
