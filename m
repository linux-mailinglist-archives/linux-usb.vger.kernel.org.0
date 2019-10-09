Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A0AD1632
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 19:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732512AbfJIR2M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 13:28:12 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51560 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732250AbfJIR2L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 13:28:11 -0400
Received: (qmail 5508 invoked by uid 2102); 9 Oct 2019 13:28:10 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Oct 2019 13:28:10 -0400
Date:   Wed, 9 Oct 2019 13:28:10 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 4/5] USB: Select better matching USB drivers when available
In-Reply-To: <7b3877fa575212e06b12136c4646e8a220f65cdb.camel@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910091324300.1603-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 9 Oct 2019, Bastien Nocera wrote:

> On Wed, 2019-10-09 at 10:43 -0400, Alan Stern wrote:
> > On Wed, 9 Oct 2019, Bastien Nocera wrote:
> > 
> > > Now that USB device drivers can reuse code from the generic USB
> > device
> > > driver, we need to make sure that they get selected rather than the
> > > generic driver. Add an id_table and match vfunc to the
> > usb_device_driver
> > > struct, which will get used to select a better matching driver at
> > > ->probe time.
> > > 
> > > This is a similar mechanism to that used in the HID drivers, with
> > the
> > > generic driver being selected unless there's a better matching one
> > found
> > > in the registered drivers (see hid_generic_match() in
> > > drivers/hid/hid-generic.c).
> > > 
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > ---
> > >  drivers/usb/core/driver.c  | 15 +++++++++++++--
> > >  drivers/usb/core/generic.c | 29 +++++++++++++++++++++++++++++
> > >  include/linux/usb.h        |  2 ++
> > >  3 files changed, 44 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > > index 50f92da8afcf..27ce63ed902d 100644
> > > --- a/drivers/usb/core/driver.c
> > > +++ b/drivers/usb/core/driver.c
> > > @@ -819,13 +819,24 @@ static int usb_device_match(struct device
> > *dev, struct device_driver *drv)
> > >  {
> > >       /* devices and interfaces are handled separately */
> > >       if (is_usb_device(dev)) {
> > > +             struct usb_device *udev;
> > > +             struct usb_device_driver *udrv;
> > >  
> > >               /* interface drivers never match devices */
> > >               if (!is_usb_device_driver(drv))
> > >                       return 0;
> > >  
> > > -             /* TODO: Add real matching code */
> > > -             return 1;
> > > +             udev = to_usb_device(dev);
> > > +             udrv = to_usb_device_driver(drv);
> > > +
> > > +             if (udrv->id_table &&
> > > +                 usb_device_match_id(udev, udrv->id_table) !=
> > NULL) {
> > > +                     return 1;
> > > +             }
> > > +
> > > +             if (udrv->match)
> > > +                     return udrv->match(udev);
> > > +             return 0;
> > 
> > What happens if the subclass driver's probe routine returns an
> > error?  
> > Don't you still want the device to be bound to the generic driver?
> 
> I don't know whether that's what you'd want to do. But if we did,
> that'd only be for devices which have "generic_init" set.
> 
> We'd need to remember the result of the ->probe() call at the end of
> usb_probe_device() (as modified in patch 2), and only call the generic
> driver (not the specific device driver)'s functions in later usage.
> 
> Is that what you would expect?

No, that's not quite it.

Here's what should happen when the subclass driver is being probed:
First, call the generic_probe routine, and return immediately if that
fails.  Then call the subclass driver's probe routine.  If that gets an
error, fail the probe call but tell the device core that the device is
now bound to the generic driver, not to the subclass driver.

Alan Stern

