Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19E7240841
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 17:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgHJPR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 11:17:26 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46727 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726284AbgHJPRZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 11:17:25 -0400
Received: (qmail 302545 invoked by uid 1000); 10 Aug 2020 11:17:23 -0400
Date:   Mon, 10 Aug 2020 11:17:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Eli Billauer <eli.billauer@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [RFC]mooring API
Message-ID: <20200810151723.GE299045@rowland.harvard.edu>
References: <1596722827.2488.8.camel@suse.com>
 <20200806152039.GC197575@rowland.harvard.edu>
 <1597070118.2515.3.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597070118.2515.3.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 04:35:18PM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 06.08.2020, 11:20 -0400 schrieb Alan Stern:

> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -1640,7 +1640,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
> > >  	unmap_urb_for_dma(hcd, urb);
> > >  	usbmon_urb_complete(&hcd->self, urb, status);
> > >  	usb_anchor_suspend_wakeups(anchor);
> > > -	usb_unanchor_urb(urb);
> > > +	smp_rmb(); /* against usb_(un)moor_urb() */
> > 
> > What is the race you want to protect against?
> 
> It looks to me like I need to be sure that the URB could have
> been moored on another CPU.

You mean, the URB could have been anchored already, but another CPU 
could moor it just as this CPU is unachoring it?

For one thing, I doubt that a single smp_rmb() will provide any real 
protection.  For another, it would be best to just avoid races in the 
first place.  Can you think of any use case where it makes sense to moor 
an URB just as it is completing (or indeed at any time while it is 
active)?

> > Wouldn't it be better to require drivers that want to moor an URB to do 
> > so before submitting it?  And to unmoor an URB only in the completion 
> > handler?  Then there wouldn't be any race.
> 
> I am afraid we cannot do that, as it must be possible to unmoor an
> URb that needs to be unmoored before it is submitted, even on
> another CPU.

I should have said: require drivers that want to unmoor an URB to do so 
either before it is submitted or in (or after) the completion handler.  
In other words, don't moor or unmoor an URB while it is active.  How 
about that?

> What do you think of the API itself?

It looks fine as far as I can tell.  But I haven't worked on any drivers 
that use anchors.

Alan Stern
