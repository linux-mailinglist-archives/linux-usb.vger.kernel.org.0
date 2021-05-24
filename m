Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EC938E9C5
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 16:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhEXOuw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 10:50:52 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40885 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233590AbhEXOtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 10:49:05 -0400
Received: (qmail 1322328 invoked by uid 1000); 24 May 2021 10:47:36 -0400
Date:   Mon, 24 May 2021 10:47:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <20210524144736.GB1320815@rowland.harvard.edu>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
 <20210522021623.GB1260282@rowland.harvard.edu>
 <YKuQgPd+JFNnNcfd@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKuQgPd+JFNnNcfd@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 24, 2021 at 01:39:44PM +0200, Johan Hovold wrote:
> On Fri, May 21, 2021 at 10:16:23PM -0400, Alan Stern wrote:
> > When a control URB is submitted, the direction indicated by URB's pipe
> > member is supposed to match the direction indicated by the setup
> > packet's bRequestType member.  A mismatch could lead to trouble,
> > depending on which field the host controller drivers use for
> > determining the actual direction.
> > 
> > This shouldn't ever happen; it would represent a careless bug in a
> > kernel driver somewhere.  This patch adds a dev_WARN_ONCE to let
> > people know about the potential problem.
> > 
> > Suggested-by: "Geoffrey D. Bennett" <g@b4.vu>
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > ---
> > 
> > v2: Use dev_WARN_ONCE instead of dev_WARN
> > 
> > 
> > [as1960b]
> > 
> > 
> >  drivers/usb/core/urb.c |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > Index: usb-devel/drivers/usb/core/urb.c
> > ===================================================================
> > --- usb-devel.orig/drivers/usb/core/urb.c
> > +++ usb-devel/drivers/usb/core/urb.c
> > @@ -407,6 +407,9 @@ int usb_submit_urb(struct urb *urb, gfp_
> >  			return -ENOEXEC;
> >  		is_out = !(setup->bRequestType & USB_DIR_IN) ||
> >  				!setup->wLength;
> > +		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
> > +				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> > +				urb->pipe, setup->bRequestType);
> 
> Note that the above will trigger for requests without a data stage also
> when the pipe and request type agree in case the direction is IN (due to
> the !wLength check).

Yes.  How nitpicky the checking needs to be for control transfers with 
no data stage is an open question.  (And it is unfortunate that the 
warning message is somewhat misleading for this case.)

> According to the spec the direction bit should just be ignored for such
> requests, but we now mandate that usb_sndpipectrl() is always used (i.e.
> even when USB_DIR_IN is set).

There actually is a reason for this.  If a host controller driver 
determines the transfer's direction from the pipe value, we want it to 
get the correct value.  The spec says that transfers with no data stage 
should be treated like OUT transfers (that is, the handshake stage 
consists of a zero-length IN transaction), so usb_sndpipectrl() is what 
should be used always.

> Requiring this seems reasonable, but I did find a couple of media
> drivers (and syszbot reported another) that did "zero-length" reads.

Do you think the check should be weakened for this case (i.e., ignore 
the direction bit in bRequestType when wLength is 0)?  So far it seems 
that the number of places getting this wrong isn't prohibitively large.

Alan Stern

PS: Another check we could add is to make sure that the 
transfer_buffer_length value agrees with wLength.  Should I add such a 
check?
