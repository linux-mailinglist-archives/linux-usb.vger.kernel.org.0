Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB14380E83
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 18:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbhENQ7s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 12:59:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46919 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230488AbhENQ7n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 May 2021 12:59:43 -0400
Received: (qmail 1012336 invoked by uid 1000); 14 May 2021 12:58:30 -0400
Date:   Fri, 14 May 2021 12:58:30 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210514165830.GA1010288@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org>
 <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org>
 <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bl9d7oo0.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 14, 2021 at 10:35:59AM +0300, Felipe Balbi wrote:
> Alan Stern <stern@rowland.harvard.edu> writes:
> > On Wed, May 12, 2021 at 10:00:41AM +0300, Felipe Balbi wrote:
> >> Hmm, IIRC only the storage gadget defers work to another thread.
> >
> > Well, the composite core is built into almost every gadget, and doesn't 
> > it handle Set-Configuration and Set-Interface requests in a separate 
> > thread?  Or doesn't it expect function drivers to do so?
> 
> composite.c doesn't defer anything to a separate thread by itself. The
> gadget driver, if it finds it necessary, should handle it
> internally. Most gadget drivers handle all of this in interrupt context.
> 
> > After all, the gadget first learns about config or altsetting changes 
> > when it receives a Set-Configuration or Set-Interface request, which 
> > happens in interrupt context.  But changing configs or altsettings 
> > requires disabling/enabling endpoints, which needs a process context 
> > (see the kerneldoc for usb_ep_enable and usb_ep_disable).
> 
> Ouch, I don't think any driver is guaranteeing that other than the
> storage gadget.

A quick search shows that USB_GADGET_DELAYED_STATUS is used in f_fs.c, 
f_tcm.c, and f_uvc.c in addition to f_mass_storage.c.  So the situation 
isn't as bad as you thought, although it should be better.

Anyway, getting back to the main point...

To minimize disruption, suppose we add a new callback to usb_gadget_ops:

	void	(*udc_async_callbacks)(struct usb_gadget *, int enable);

The UDC core can call this at the appropriate times, if it is not NULL.  
It allows the core to tell a UDC driver whether or not to issue 
callbacks for setup, disconnect, reset, suspend, and resume.  It doesn't 
affect request completion callbacks.

So for removing a driver, the proper sequence will be:

	usb_gadget_disconnect()
	if (gadget->ops->udc_async_callbacks)
		gadget->ops->udc_async_callbacks(gadget, 0);
	synchronize_irq()
	udc->driver->unbind()
	usb_gadget_udc_stop()

Or maybe the last two steps should be reversed.  In udc_bind_to_driver, 
the opposite sequence is:

	bind
	udc_start
	enable async callbacks
	connect (turn on pull-up)

How does this sound?

Alan Stern
