Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9650D379D2F
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 04:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhEKCyi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 22:54:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:46586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhEKCye (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 22:54:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6E5C61400;
        Tue, 11 May 2021 02:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620701606;
        bh=xhfV7IAKKVq2APNWSdwTFPsmuERcdY+f+udB1pKZllo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sgdf6xYY71QBYLp6w5r1gggZu9hPSlMqiXC4eSm8mLEiVr+VpMQyzPuc5SjgsRDMq
         x8L6IPAQoMXI04wwmsK4Cos3Z2bN4MUOfEuZ2VcoGj/5clb1ApCshq4SceMkV+W6sV
         w5saOaBaWPlX3uiks0ET+ogste9xt3MmOlzmH4/AS8kXRQeJPz6RC0pSbdh4yBK79l
         bB3QWOyPoE3Jh87Nu7zpzYPr5SxnewvWzf/QAThaZS6hod/IdkEPUv7SLeQKqsOGMK
         DTZEPUBHkbZdQe/B4lOhwwZFrcUXE5q7v7Jy7Q+4HBRDxoZ0t5K65fQP3lD5Hrsk/a
         aGAa+b9W5sqUw==
Date:   Tue, 11 May 2021 10:53:22 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210511025322.GA23868@nchen>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510193849.GB873147@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-05-10 15:38:49, Alan Stern wrote:
> On Mon, May 10, 2021 at 07:43:00PM +0300, Felipe Balbi wrote:
> > 
> > Hi Alan,
> > 
> > Alan Stern <stern@rowland.harvard.edu> writes:
> > > I just noticed this potential race in the Gadget core, specifically, in 
> > > usb_gadget_remove_driver.  Here's the relevant code:
> > >
> > > 	usb_gadget_disconnect(udc->gadget);
> > > 	if (udc->gadget->irq)
> > > 		synchronize_irq(udc->gadget->irq);
> > > 	udc->driver->unbind(udc->gadget);
> > > 	usb_gadget_udc_stop(udc);
> > >
> > > usb_gadget_disconnect will turn off the D+ pull-up, telling the host (or 
> > > upstream hub) that the gadget is no longer connected to the bus.  The 
> > > udc->driver->unbind call then tells the gadget driver that it will no 
> > > longer receive any callbacks from the UDC driver or the gadget core.
> > >
> > > Now suppose that at just this moment, the user unplugs the USB cable.  
> > > The UDC driver will notice that the Vbus voltage has gone away and will 
> > > invoke the gadget driver's ->disconnect callback.  After all, it doesn't 
> > > realize it should avoid making these callbacks until usb_gadget_udc_stop 
> > > has run.
> > >
> > > As a result, the gadget driver's disconnect callback may be invoked 
> > > _after_ the driver has been unbound from the gadget.
> > 
> > argh, nice catch!
> > 
> > > How should we fix this potential problem?
> > 
> > I think we can just move usb_gadget_udc_stop(). Looking at a few udcs,
> > they're just either freeing or masking UDC's interrupts which should
> > prevent the race you describe while also making sure that no further
> > interrupts will trigger.
> > 
> > Perhaps we could move udc_stop() before synchronize_irq(). Do you
> > foresee any issues with that for net2272 or dummy?
> 
> I don't think it will be that easy.  As you may remember, there have 
> been a number of commits over the years fiddling with the order of 
> operations during gadget driver unbinding (although I don't think any of 
> them moved udc_stop from its position at the end).  Still, it's a 
> delicate matter.
> 
> The purpose of synchronize_irq is to wait until any currently running 
> IRQ handlers have finished.  Obviously this doesn't do any good unless 
> the software has arranged beforehand that no new interrupt requests will 
> be generated.  In this case, turning off the pull-up is currently not 
> sufficient.  But waiting until after udc_stop has returned isn't the 
> answer; it wouldn't prevent callbacks from being issued between the 
> unbind and the udc_stop.
> 
> And I'm quite sure that calling udc_stop before unbind would be wrong.  
> The gadget driver would then get various errors (like requests 
> completing with -ESHUTDOWN status) it's not prepared to handle.
> 
> So what we need is a way to tell the UDC driver to stop issuing 
> callbacks.  The ones defined in struct usb_gadget_driver are:
> 
> 	bind and unbind,
> 	bus suspend and bus resume,
> 	setup,
> 	bus reset,
> 	disconnect.
> 
> Bind and unbind aren't relevant for this discussion because they are 
> synchronous, not invoked in response to interrupts.
> 
> In theory there shouldn't be any bus-resume, setup, or bus-reset 
> interrupts once the pull-up is turned off, but it would be good to 
> protect against bad hardware which may produce them.
> 
> Bus suspend is a real possibility.  It occurs when the UDC hasn't 
> received any packets for a few milliseconds, which certainly will be the 
> case when the pull-up is off.  UDC hardware and drivers may or may not 
> be smart enough to realize that under this circumstance, lack of packets 
> shouldn't be reported as a bus suspend.
> 
> And of course, a cable disconnect can occur at any time -- nothing we 
> can do about that.
> 
> Putting it all together, we need to tell the UDC driver, somewhere 
> between turning the pull-up off and doing the synchronize_irq, to stop 
> issuing disconnect (and possibly also setup and suspend) callbacks.  I 
> don't think we can use the pull-up call for this purpose; a gadget 
> driver may want for some reason to disconnect logically from the bus 
> while still knowing whether Vbus is present.  (You may disagree about 
> that, but otherwise what's the point of having a disconnect callback in 
> the first place?)
> 
> Which means in the end that struct usb_gadget_ops needs either to have a 
> new callback for this purpose or to have an existing callback augmented 
> (for example, the ->pullup callback could get an additional argument 
> saying whether to continue issuing callbacks).  Or another possibility 
> is to make UDC drivers call a core routine to do disconnect callbacks 
> instead of issuing those callbacks themselves, and have the core filter 
> out callbacks that come at the wrong time.  Either way, every UDC driver 
> would need to be modified.
> 
> What do you think?  Is this reasoning accurate, or have I missed 
> something?
> 

Hi Alan,

I fixed a similar issue for configfs, see 1a1c851bbd70
("usb: gadget: configfs: fix concurrent issue between composite APIs")
It doesn't prevent disconnect callback, the disconnect callback will check
if unbind has called. The same for .setup and .suspend. Did you see
issues using configfs or legacy gadget? For legacy gadget, just like you said
it is the second disconnect callback is called during the removal process,
the first is called at usb_gadget_disconnect. It is not easy to prevent disconnect
occurring, we could add some logic at composite_disconnect, and let it quit if it is
called the second time.

It is hard to avoid usb_gadget_driver callback until usb_gadget_udc_stop has called,
no matter bad hardware or threaded interrupts, my former solution is avoid
dereferenced pointer issue, most of callbacks handling are useless if the gadget has already
unbind, the only meaningful callback is disconnect, and we have already called it
at usb_gadget_disconnect

-- 

Thanks,
Peter Chen

