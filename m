Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9130811D15D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 16:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbfLLPtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 10:49:41 -0500
Received: from netrider.rowland.org ([192.131.102.5]:50159 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729152AbfLLPtl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 10:49:41 -0500
Received: (qmail 16616 invoked by uid 500); 12 Dec 2019 10:49:40 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Dec 2019 10:49:40 -0500
Date:   Thu, 12 Dec 2019 10:49:40 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Felipe Balbi <balbi@kernel.org>
cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>, Roger Quadros <rogerq@ti.com>,
        zhengbin <zhengbin13@huawei.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and
 transfer rate
In-Reply-To: <874ky6x9eh.fsf@kernel.org>
Message-ID: <Pine.LNX.4.44L0.1912121047120.14053-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 12 Dec 2019, Felipe Balbi wrote:

> Hi,
> 
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> > Introduce gadget opts udc_set_sublink_speed callback to set the lane
> > count and transfer rate (in lane speed mantissa of Gbps) for SuperSpeed
> > Plus capable gadgets. In the same way udc_set_speed, this function can
> > control the gadget's sublink attributes for SuperSpeed Plus.
> >
> > Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> > ---
> >  drivers/usb/gadget/composite.c           |  2 ++
> >  drivers/usb/gadget/legacy/mass_storage.c |  2 ++
> 
> I would rather not add new features to the legacy gadgets and focus on
> our configfs interface for anything new. Moreover, using the feature
> you introduced could, arguably, be done as a separate patch.
> 
> > diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> > index 3b4f67000315..a4de5a8c0f19 100644
> > --- a/drivers/usb/gadget/composite.c
> > +++ b/drivers/usb/gadget/composite.c
> > @@ -2353,6 +2353,8 @@ int usb_composite_probe(struct usb_composite_driver *driver)
> >  	gadget_driver->function =  (char *) driver->name;
> >  	gadget_driver->driver.name = driver->name;
> >  	gadget_driver->max_speed = driver->max_speed;
> > +	gadget_driver->max_lane_count = driver->max_lane_count;
> > +	gadget_driver->max_lsm = driver->max_lsm;
> >  
> >  	return usb_gadget_probe_driver(gadget_driver);
> >  }
> > diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
> > index f18f77584fc2..a0912c5afffc 100644
> > --- a/drivers/usb/gadget/legacy/mass_storage.c
> > +++ b/drivers/usb/gadget/legacy/mass_storage.c
> > @@ -223,6 +223,8 @@ static struct usb_composite_driver msg_driver = {
> >  	.name		= "g_mass_storage",
> >  	.dev		= &msg_device_desc,
> >  	.max_speed	= USB_SPEED_SUPER_PLUS,
> > +	.max_lane_count	= 2,
> > +	.max_lsm	= 10,
> 
> Right, as mentioned, I'd prefer not touch the legacy gadgets. But in any
> case, why is it so that the gadget is telling you about max lane count
> and lsm? That should be abstracted away from the gadget driver. Gadget
> driver shouldn't have knowledge of number of lanes because, at the end
> of the day, that doesn't really change anything in practice. Unlike HS
> vs SS which changes a bunch of things.

I agree completely.  Furthermore, it isn't at all clear where those two 
numbers came from.  Why would g-mass-storage care that lane_count <= 2 
and lsm <= 10?

Alan Stern

