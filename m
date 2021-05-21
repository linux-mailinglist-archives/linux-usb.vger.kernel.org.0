Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980C038C7A8
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 15:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhEUNTY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 09:19:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233693AbhEUNTI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 09:19:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE0A0613DD;
        Fri, 21 May 2021 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621603065;
        bh=Jq3myk+DHk290zuO8zHLSajXVfyWJUdhIvkxUR3XJ0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ECrQhZA6vouxKFAP+NBqopZYKSMyRiY8TZyhUI7V24RmYfyHveA6f5odBYzAUNMp7
         eA7m+QvB2TmkQ3lIffBWyTIOTzG7/79jNJ4zX3AUbuZhK4UEp2NEruzzPnPad50d2S
         Z1XIpMKgcatQ3yC298ZY6omajPS5CpzWNIuY44xC2zEXuo1agaTaUjabOPeNKnYGGa
         6g4IvMEiWJNjC3Bas/D62w5Gqy6AwB0lTl8WBmFLFsGvVl1utty3ILS+uR4J33QTMN
         xmNH3AI3gBsvmel7jjXr6HpolXFU9us0YGKrmaqFse2mdvDmXXb2L4AcLBmTJLzREz
         A88Xpfn0OPb5w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lk52A-0004GZ-QY; Fri, 21 May 2021 15:17:46 +0200
Date:   Fri, 21 May 2021 15:17:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKdpThmE1xenUjhI@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:03:26AM +0200, Johan Hovold wrote:
> On Thu, May 20, 2021 at 04:20:56PM -0400, Alan Stern wrote:
> > When a control URB is submitted, the direction indicated by URB's pipe
> > member is supposed to match the direction indicated by the setup
> > packet's bRequestType member.  A mismatch could lead to trouble,
> > depending on which field the host controller drivers use for
> > determining the actual direction.
> > 
> > This shouldn't ever happen; it would represent a careless bug in a
> > kernel driver somewhere.  This patch adds a dev_WARN to let people
> > know about the potential problem.
> > 
> > Suggested-by: "Geoffrey D. Bennett" <g@b4.vu>
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > ---
> > 
> > 
> > [as1960]
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
> > +		if (usb_pipeout(urb->pipe) != is_out)
> > +			dev_WARN(&dev->dev, "BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> > +					urb->pipe, setup->bRequestType);
> >  	} else {
> >  		is_out = usb_endpoint_dir_out(&ep->desc);
> >  	}
> 
> While I agree with intention here, I'm worried that this will start
> flooding the logs of users.
> 
> So first, this should probably be rate limited.

This could actually be done using WARN_ON_ONCE() as we don't have to
worry about syzbot fuzzing descriptors here (all control endpoints are
bidirectional).

> Second, did you try to estimate how many call sites that get this wrong?
> I always felt a bit pedantic when pointing out that the pipe direction
> should match the request type to driver author's during review when (in
> almost all cases?) this hasn't really mattered. I fear we may have
> accumulated a fairly large number of these mismatches over the years but
> I haven't verified that.

I did a quick review of all ctrlpipe-macro uses in usb/misc and
usb/serial and found two instances.

A simple grep pattern looking for explicit USB_DIR/ctrlpipe mismatches
caught another five tree wide (not including the
sound/usb/mixer_scarlett_gen2.c which Geoffrey reported), but there are
likely more of those out there as the request type is often not that
explicit.

I've prepared patches for the above, excluding the sound driver Geoffrey
said he was fixing.

Johan
