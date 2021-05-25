Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF3B39011E
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 14:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbhEYMlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 08:41:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232222AbhEYMlv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 08:41:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 522826141B;
        Tue, 25 May 2021 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621946421;
        bh=UOdyjFtUm8eL4eJlwgMr/JA/KMoTzh4gCT1XxGLZDJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SRseUMoFsbSU6JmlB70yMwnPvEuUSWNngT2sclX19Q8JMb9yiuTdClCZUzkxU9NLq
         vHt8k1g6jtiqrgSzraykGn3WaCpiFakCXXYYdx2lB48eiYQmjezTbLjk47Oy7NXIW/
         Pp709gb2wPzHZ4TA/5aujpf0B6mypCQa3GSVketBw0VETMSggFDIVy7HGMae93M/lT
         rXlRiVJjEJoMX8YNLlgexUC/J8R/K7/sGrEPPQt0HsQ8eZLWpS5mRstydnAziRg5St
         YuZsz//Z401maY/bylorYkkOHw0GUWjeROYD4lKuaWgBlMhD4slwIEWJkp2v7WQDC7
         iPMe6/eKgVvzA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1llWM5-0006Ln-6P; Tue, 25 May 2021 14:40:17 +0200
Date:   Tue, 25 May 2021 14:40:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKzwMVxgaVycl+Yi@hovoldconsulting.com>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
 <20210522021623.GB1260282@rowland.harvard.edu>
 <YKuQgPd+JFNnNcfd@hovoldconsulting.com>
 <20210524144736.GB1320815@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524144736.GB1320815@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 24, 2021 at 10:47:36AM -0400, Alan Stern wrote:
> On Mon, May 24, 2021 at 01:39:44PM +0200, Johan Hovold wrote:
> > On Fri, May 21, 2021 at 10:16:23PM -0400, Alan Stern wrote:
> > > When a control URB is submitted, the direction indicated by URB's pipe
> > > member is supposed to match the direction indicated by the setup
> > > packet's bRequestType member.  A mismatch could lead to trouble,
> > > depending on which field the host controller drivers use for
> > > determining the actual direction.
> > > 
> > > This shouldn't ever happen; it would represent a careless bug in a
> > > kernel driver somewhere.  This patch adds a dev_WARN_ONCE to let
> > > people know about the potential problem.
> > > 
> > > Suggested-by: "Geoffrey D. Bennett" <g@b4.vu>
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > 
> > > ---
> > > 
> > > v2: Use dev_WARN_ONCE instead of dev_WARN
> > > 
> > > 
> > > [as1960b]
> > > 
> > > 
> > >  drivers/usb/core/urb.c |    3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > Index: usb-devel/drivers/usb/core/urb.c
> > > ===================================================================
> > > --- usb-devel.orig/drivers/usb/core/urb.c
> > > +++ usb-devel/drivers/usb/core/urb.c
> > > @@ -407,6 +407,9 @@ int usb_submit_urb(struct urb *urb, gfp_
> > >  			return -ENOEXEC;
> > >  		is_out = !(setup->bRequestType & USB_DIR_IN) ||
> > >  				!setup->wLength;
> > > +		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
> > > +				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> > > +				urb->pipe, setup->bRequestType);
> > 
> > Note that the above will trigger for requests without a data stage also
> > when the pipe and request type agree in case the direction is IN (due to
> > the !wLength check).
> 
> Yes.  How nitpicky the checking needs to be for control transfers with 
> no data stage is an open question.  (And it is unfortunate that the 
> warning message is somewhat misleading for this case.)
> 
> > According to the spec the direction bit should just be ignored for such
> > requests, but we now mandate that usb_sndpipectrl() is always used (i.e.
> > even when USB_DIR_IN is set).
> 
> There actually is a reason for this.  If a host controller driver 
> determines the transfer's direction from the pipe value, we want it to 
> get the correct value.  The spec says that transfers with no data stage 
> should be treated like OUT transfers (that is, the handshake stage 
> consists of a zero-length IN transaction), so usb_sndpipectrl() is what 
> should be used always.

Right, and that's partly why I think it seems reasonable to always use
usb_sndctrlpipe() for these transfers. But see below.

> > Requiring this seems reasonable, but I did find a couple of media
> > drivers (and syszbot reported another) that did "zero-length" reads.
> 
> Do you think the check should be weakened for this case (i.e., ignore 
> the direction bit in bRequestType when wLength is 0)?  So far it seems 
> that the number of places getting this wrong isn't prohibitively large.

In a sense the request-type direction bit is already ignored when
wLength is zero. The question is if we should ignore the direction bit
of the pipe argument, or rather allow it to be IN, when wLength is
zero.

With the above check now merged, the following transfer triggers the
warning:

	usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
			0, USB_DIR_IN | USB_TYPE_VENDOR,
			0x0020, CMD_I2C_DA_RD,
			NULL, 0, 1000);

This request was used by a media driver to determine if a certain i2c
register was accessible by attempting to read it without really caring
about its value.

I changed the above to actually read the value, but this is an example
where allowing usb_rcvctrlpipe() might otherwise make sense was it not
for the possibility that some HCD could get confused.

Changing the above to use usb_sndctrlpipe() while either keeping
USB_DIR_IN or dropping USB_DIR_IN (for an I2C read request) does not
seem right. The latter could potentially even confuse some firmware even
if the direction bit is supposed to be ignored.

So far this is the only example I've found where changing to
usb_sndctrlpipe() and USB_DIR_OUT isn't obviously correct, but on the
other hand just reading the register in question is straight-forward
enough and does not require any exceptions in usb_submit_urb().

We could perhaps even go the other way and strengthen the check to warn
if USB_DIR_IN is set when wLength is zero...

> PS: Another check we could add is to make sure that the 
> transfer_buffer_length value agrees with wLength.  Should I add such a 
> check?

That sounds sensible as some of the HCDs only appears to check
transfer_buffer_length when handling the data stage and a mismatch could
amount to undefined behaviour (OUT) or perhaps even buffer overruns
(IN).

Judging from a quick check we don't seem to have any such cases
currently so this could be implemented as a submission failure rather
than another warning.

Johan
