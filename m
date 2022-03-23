Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360224E52DE
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 14:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244194AbiCWNQa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 09:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238027AbiCWNQ3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 09:16:29 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2D36A5FF14
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 06:14:58 -0700 (PDT)
Received: (qmail 156469 invoked by uid 1000); 23 Mar 2022 09:14:57 -0400
Date:   Wed, 23 Mar 2022 09:14:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 4/4] USB: gadget: Add a new bus for gadgets
Message-ID: <YjsdUTQsuWwYT0AX@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YjeEwspj0V3JaV1L@rowland.harvard.edu>
 <YjeFImy6hY+2MHe2@rowland.harvard.edu>
 <YjeFaCijdcfw5fdc@rowland.harvard.edu>
 <YjeFqK+ZrcHx9HZh@rowland.harvard.edu>
 <20220323065528.GA32029@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323065528.GA32029@hu-pkondeti-hyd.qualcomm.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 23, 2022 at 12:25:28PM +0530, Pavan Kondeti wrote:
> Hi Alan,
> 
> On Sun, Mar 20, 2022 at 03:51:04PM -0400, Alan Stern wrote:
> > This patch adds a "gadget" bus and uses it for registering gadgets and
> > their drivers.  From now on, bindings will be managed by the driver
> > core rather than through ad-hoc manipulations in the UDC core.
> > 
> > As part of this change, the driver_pending_list is removed.  The UDC
> > core won't need to keep track of unbound drivers for later binding,
> > because the driver core handles all of that for us.
> > 
> > However, we do need one new feature: a way to prevent gadget drivers
> > from being bound to more than one gadget at a time.  The existing code
> > does this automatically, but the driver core doesn't -- it's perfectly
> > happy to bind a single driver to all the matching devices on the bus.
> > The patch adds a new bitflag to the usb_gadget_driver structure for
> > this purpose.
> > 
> > A nice side effect of this change is a reduction in the total lines of
> > code, since now the driver core will do part of the work that the UDC
> > used to do.
> > 
> > A possible future patch could add udc devices to the gadget bus, say
> > as a separate device type.
> 
> Can you please elaborate on this? This UDC device will be added to gadget bus
> but not bound to any driver, correct?

The UDC/gadget subsystem is designed a little strangely.  For each UDC 
hardware device, the UDC core creates _two_ software representations: a 
struct usb_udc and a struct usb_gadget.  Both of these contain an 
embedded struct device, so the physical UDC hardware corresponds to two 
software "devices".

Currently neither of these devices gets registered on any bus.  There is 
a driver associated with the usb_gadget device, but not in the usual way 
(that is, it doesn't use the normal driver-core binding mechanism).

My patch keeps both of these device structures, but it registers the 
usb_gadget device on the new gadget bus and uses the driver core to do 
normal binding.  The usb_udc device still is not registered on any bus 
and does not have a driver.

> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > ---
> > 
> >  drivers/usb/gadget/udc/core.c |  248 +++++++++++++++++++-----------------------
> >  include/linux/usb/gadget.h    |   26 ++--
> >  2 files changed, 135 insertions(+), 139 deletions(-)
> > 
> 
> <snip>
> 
> >  
> >  /* ------------------------------------------------------------------------- */
> >  
> > -static int udc_bind_to_driver(struct usb_udc *udc, struct usb_gadget_driver *driver)
> > +static int gadget_match_driver(struct device *dev, struct device_driver *drv)
> >  {
> > -	int ret;
> > +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> > +	struct usb_udc *udc = gadget->udc;
> > +	struct usb_gadget_driver *driver = container_of(drv,
> > +			struct usb_gadget_driver, driver);
> >  
> > -	dev_dbg(&udc->dev, "registering UDC driver [%s]\n",
> > -			driver->function);
> > +	/* If the driver specifies a udc_name, it must match the UDC's name */
> > +	if (driver->udc_name &&
> > +			strcmp(driver->udc_name, dev_name(&udc->dev)) != 0)
> > +		return 0;
> >  
> > +	/* Otherwise any gadget driver matches any UDC */
> > +	return 1;
> > +}
> > +
> 
> Would it be better if we add the driver->is_bound check here so that probe is
> not invoked? your patch checks it later at the probe.

Yes, you're right; the check could be moved here.  But this is only 
because the driver core holds the device lock the whole time while it 
does matching and probing.  If the lock were held during probing but not 
matching, it would then be possible for two processes to concurrently 
bind the same driver to two gadgets.

As far as I know, the driver core does not promise to hold the device 
lock during both matching and probing, so it may not be safe to depend 
on this behavior.  Maybe I'm wrong about this...

On the other hand, it wouldn't hurt to do the is_bound check in both 
places; it's a very cheap operation.  Thanks for the suggestion.

Alan Stern
