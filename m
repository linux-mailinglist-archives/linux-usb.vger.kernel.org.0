Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9562438C64E
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 14:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhEUMPz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 08:15:55 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:52805 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229681AbhEUMPv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 08:15:51 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 8A30513AD;
        Fri, 21 May 2021 08:14:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 21 May 2021 08:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=8BXbmnSidmZcCLymwf4Gjr7p1/R
        IAhs+Gl/ajHIVWB8=; b=KylnsiKqbrZr9SJvyoNFgc3rJeBaDE09SlG9cFWL+XN
        HsQg8yg55mpg3TprdEPvFl1rlKZMpVPAJnbVg/nMziWY1XHGhg1FSEJsIcTC5kYF
        9dUBidHD7wmA7XJ693n4c0FIoEPVOV/+XeiUDuUtbeCtxiQOoITctcjdTn18aHGn
        fiMNMtCNhM0UF3LNaDq8YBLos6y000J2Xfc2oKpTEjY338kKl0cfyxsf4Wm9TPqa
        fi6TrysWFlmFswSogCcA5JM6jADz1DsP9FHFpe42C60RG/hsWihNurjVx3UDPK0R
        J2GccVDHcTXe6SckPCLe9DuXweE9bwy8nBZxDsfYlbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8BXbmn
        SidmZcCLymwf4Gjr7p1/RIAhs+Gl/ajHIVWB8=; b=mKiqMtBfjCe5gIUoe2G+iM
        RXTODi+yBNZYtjh03+3HNK0kMh6S/LgDaa4wKNWDGXtXsxU6O1qUAoBlx/zppFpM
        /2tOTITASbjV49RX4P7+Po5EzbFJtxsdwN0kY3x58nnQkJe9M7F2yrt9apSWNgd6
        6FKse/xD3xyhCQvRaPdvBw3eN/4rBcRHrzdOaZTA4Y6YgkLPreDgUNeMAYmu0hpy
        XvclLrWCFWsbdVoFgN6ZXYEGtx57uY+wtQTp65ngWknJzGUP5hHaMK1cy52auZTo
        jmhgDb09g2GWs9y4dyTGDd7q15WT7QI3okNMM5JzR/TqoECauS1eK6k1IipLgbBw
        ==
X-ME-Sender: <xms:IaSnYFZXyKG0zifsE4mexBQ6x3ZvUakKEQmxxfKA0qVRLnC0E0NiIw>
    <xme:IaSnYMaPAkDwY66H8GkKZXjWRzgGM4V_UjX4Eg5IfHwZlhmpHbd1H40OdNm29EE2n
    r28A3nH0rDd7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:IaSnYH9zK8TgYzPTapi1aiDb65tpxNxYdPbLBFy62AVKAQy35x942Q>
    <xmx:IaSnYDqzO3CUG6M9rdyyzthP0N1RbATE4Q0Klef1_UO35gbufo7wag>
    <xmx:IaSnYAowLS6ak-An4o1Iy5x2lztwAqyjRq8m2pyG0MYcaNtO_QwF5w>
    <xmx:IqSnYFDfU9sUtyb2gT09I7foEtWwzSB8Ztu2zdsGEglF-9RYCFbPOQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Fri, 21 May 2021 08:14:25 -0400 (EDT)
Date:   Fri, 21 May 2021 14:14:23 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKekHz6Jfz7DG0kH@kroah.com>
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

That's a good idea, this could get very noisy very quickly if one driver
got it wrong.

thanks,

greg k-h
