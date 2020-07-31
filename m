Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E5A234796
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 16:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgGaOQq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 10:16:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgGaOQq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 10:16:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E994F206DA;
        Fri, 31 Jul 2020 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596205005;
        bh=5iQzshATlAp7fuUetrFCB169TtyWBBZhRlxLtl78oi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cV9qMDpz7EZR7+4PM0JCStLIcYgmUbL06rMZxgD5ZGmGxNWHTk4Ci747Jdt/FvhUv
         8Mv1vuyhNgfw9AjZqGezRk9ygiBjagloI/2f7VcQmlKkKD/uXXFWs9gggNmiyPb7AJ
         uQ9r+dUTRLu9aSjDXMOSSvCXjgk5JzAkfFRUneTg=
Date:   Fri, 31 Jul 2020 16:16:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Message-ID: <20200731141632.GB1717752@kroah.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
 <20200731140553.GA8013@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731140553.GA8013@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
> On 20-07-31 14:25:20, Greg Kroah-Hartman wrote:
> > On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
> > 
> > Grab a reference from somewhere else and do not give it up for a long
> > time.
> > 
> 
> So wait_for_completion_timeout is suitable?

NO!!!

> The similar use case is when
> we open the file at the USB Drive at Windows, and we click "Eject", it
> will say "The device is currently in use", and refuse our "Eject"
> operation.
> 
> When we try to remove the gadget, if the gadget is in use, we could
> refuse the remove operation, reasonable?

Nope.  Remove it please.

> > > > > -static void usb_udc_nop_release(struct device *dev)
> > > > > +static void usb_gadget_release(struct device *dev)
> > > > >  {
> > > > > +	struct usb_gadget *gadget;
> > > > > +
> > > > >  	dev_vdbg(dev, "%s\n", __func__);
> > > > > +
> > > > > +	gadget = container_of(dev, struct usb_gadget, dev);
> > > > > +	complete(&gadget->done);
> > > > > +	memset(dev, 0x0, sizeof(*dev));
> > > > 
> > > > No, the memory should be freed here, not memset.
> > > > 
> > >  
> > > This memory is allocated at UDC driver and is freed by UDC driver too.
> > 
> > That's wrong, the release function should be where this is released.
> 
> So, the release function should be at individual UDC driver, a common
> release function is improper, right?

Depends on how this all works, but again, the release function needs to
free the memory, otherwise this is broken.

> > And this no-op function is horrid.  There used to be documentation in
> > the kernel where I could rant about this, but instead, I'll just say,
> > "why are people trying to work around warnings we put in the core kernel
> > to fix common problems?  Do they think we did that just because we
> > wanted to be mean???"
> > 
> 
> So, like kernel doc for device_initialize said, a proper fix for dwc3
> should be zeroed gadget device memory at its own driver before the 
> gadget device register to driver core, right?

It should get a totally different, dynamically allocated structure.
NEVER recycle them.

thanks,

greg k-h
