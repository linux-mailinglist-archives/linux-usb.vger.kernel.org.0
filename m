Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4570E23E217
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 21:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgHFTZS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 15:25:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46699 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725272AbgHFTZS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 15:25:18 -0400
Received: (qmail 207466 invoked by uid 1000); 6 Aug 2020 15:18:36 -0400
Date:   Thu, 6 Aug 2020 15:18:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] usb: dwc3: allocate gadget structure dynamically
Message-ID: <20200806191836.GA207178@rowland.harvard.edu>
References: <20200806090717.18657-1-peter.chen@nxp.com>
 <20200806145414.GA197575@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200806145414.GA197575@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 06, 2020 at 10:54:14AM -0400, Alan Stern wrote:
> On Thu, Aug 06, 2020 at 05:07:16PM +0800, Peter Chen wrote:
> > The current code uses commit fac323471df6 ("usb: udc: allow adding
> > and removing the same gadget device") as the workaround to let
> > the gadget device is re-used, but it is not allowed from driver
> > core point. In this commit, we allocate gadget structure dynamically,
> > and free it at its release function. Since the gadget device's
> > driver_data has already occupied by usb_composite_dev structure, we have
> > to use gadget device's platform data to store dwc3 structure.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> 
> There's one problem with this patch...
> 
> > @@ -3670,21 +3685,22 @@ int dwc3_gadget_init(struct dwc3 *dwc)
> >  
> >  	ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps);
> >  	if (ret)
> > -		goto err3;
> > +		goto err4;
> >  
> > -	ret = usb_add_gadget_udc(dwc->dev, &dwc->gadget);
> > +	ret = usb_add_gadget_udc_release(dwc->dev, dwc->gadget, dwc_gadget_release);
> >  	if (ret) {
> >  		dev_err(dwc->dev, "failed to register udc\n");
> > -		goto err4;
> > +		goto err5;
> >  	}
> >  
> > -	dwc3_gadget_set_speed(&dwc->gadget, dwc->maximum_speed);
> > +	dwc3_gadget_set_speed(dwc->gadget, dwc->maximum_speed);
> >  
> >  	return 0;
> >  
> > -err4:
> > +err5:
> >  	dwc3_gadget_free_endpoints(dwc);
> > -
> > +err4:
> > +	kfree(dwc->gadget);
> 
> Once you call usb_add_gadget_udc_release() -- even if the call fails --
> you must not call kfree() directly.  Instead you have to do
> put_device(&dwc->gadget.dev).  That's a little awkward given the code
> arrangement here.

Sorry, I got that wrong.  If usb_add_gadget_udc_release() succeeds then 
you must call put_device() in order to destroy the gadget.  But if it 
fails then it calls put_device() for you, so that dwc->gadget is a stale 
pointer.  In this case you must not call either kfree() or put_device().

Alan Stern
