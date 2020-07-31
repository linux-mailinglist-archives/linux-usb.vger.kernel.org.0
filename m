Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DAA2345C4
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 14:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732953AbgGaMZf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 08:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:40874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732860AbgGaMZe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 08:25:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 996F22087C;
        Fri, 31 Jul 2020 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596198334;
        bh=M+L97/WSjAP48C7xbhj+VJJIMChAehdr4YoVVVxzOfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=scxXn5RQWx9eXXf1HOEUCvPlQm9Fm+YU0hAqJgs8JVvGI2Q7+R1FxuUpCuERlEePV
         nSohQ3UQYNZanIE1sJdG+dVVHceLA5hUdXw71u7XTVEGyDr9DONI2PD0aoyHyXHp5F
         VH4JPGEhATR1bsVpfxtsulmedXFNbZVbKe2p/GiA=
Date:   Fri, 31 Jul 2020 14:25:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Message-ID: <20200731122520.GB1655976@kroah.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
>  
> > 
> > On Fri, Jul 31, 2020 at 05:59:35PM +0800, Peter Chen wrote:
> > > Per discussion[1], to avoid UDC driver possible freeing gadget device
> > > memory before device core finishes using it, we add wait-complete
> > > mechanism at usb_del_gadget_udc and gadget device .release callback.
> > > After that, usb_del_gadget_udc will not return back until device core
> > > finishes using gadget device.
> > 
> > Ick, no, that's a sure way for a deadlock to happen.
> > 
> 
> I tested multiple add and delete, did not trigger. What kinds of possible deadlock?

Grab a reference from somewhere else and do not give it up for a long
time.

> > Why does the gadget core care about this at all?  It shouldn't.
> > 
> 
> The UDC driver will free gadget device memory after that, the driver core
> may still reference it. [1]
> 
> > 
> > 
> > >
> > > For UDC drivers who have own .release callback, it needs to call
> > > complete(&gadget->done) by themselves, if not, the UDC core will
> > > handle it by default .release callback usb_gadget_release.
> > >
> > > [1]
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.
> > > spinics.net%2Flists%2Flinux-
> > usb%2Fmsg198790.html&amp;data=02%7C01%7Cpe
> > >
> > ter.chen%40nxp.com%7Cff1ece31761e40be0c7b08d83548ac19%7C686ea1d3bc2b
> > 4c
> > >
> > 6fa92cd99c5c301635%7C0%7C0%7C637317933526709832&amp;sdata=q7%2F1S
> > mwujv
> > > tg4DsW0iUaM2Mqf0cdkzL%2FKjJNBRfm6hc%3D&amp;reserved=0
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Alan Stern <stern@rowland.harvard.edu>
> > > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > ---
> > > If this RFC patch is ok, I will create the formal patches which will
> > > change UDC drivers who have their own .release function.
> > >
> > >  drivers/usb/gadget/udc/core.c | 14 +++++++++++---
> > >  include/linux/usb/gadget.h    |  2 ++
> > >  2 files changed, 13 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/usb/gadget/udc/core.c
> > > b/drivers/usb/gadget/udc/core.c index ee226ad802a4..ed141e1a0dcf
> > > 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -1138,9 +1138,15 @@ static void usb_udc_release(struct device *dev)
> > >
> > >  static const struct attribute_group *usb_udc_attr_groups[];
> > >
> > > -static void usb_udc_nop_release(struct device *dev)
> > > +static void usb_gadget_release(struct device *dev)
> > >  {
> > > +	struct usb_gadget *gadget;
> > > +
> > >  	dev_vdbg(dev, "%s\n", __func__);
> > > +
> > > +	gadget = container_of(dev, struct usb_gadget, dev);
> > > +	complete(&gadget->done);
> > > +	memset(dev, 0x0, sizeof(*dev));
> > 
> > No, the memory should be freed here, not memset.
> > 
>  
> This memory is allocated at UDC driver and is freed by UDC driver too.

That's wrong, the release function should be where this is released.

And this no-op function is horrid.  There used to be documentation in
the kernel where I could rant about this, but instead, I'll just say,
"why are people trying to work around warnings we put in the core kernel
to fix common problems?  Do they think we did that just because we
wanted to be mean???"

Please fix this properly.

greg k-h
