Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C48C1D12DC
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 17:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbfJIPf3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 11:35:29 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47923 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfJIPf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 11:35:29 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id AD58320000A;
        Wed,  9 Oct 2019 15:35:26 +0000 (UTC)
Message-ID: <7b3877fa575212e06b12136c4646e8a220f65cdb.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: Select better matching USB drivers when
 available
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 09 Oct 2019 17:35:26 +0200
In-Reply-To: <Pine.LNX.4.44L0.1910091041390.1603-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1910091041390.1603-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-10-09 at 10:43 -0400, Alan Stern wrote:
> On Wed, 9 Oct 2019, Bastien Nocera wrote:
> 
> > Now that USB device drivers can reuse code from the generic USB
> device
> > driver, we need to make sure that they get selected rather than the
> > generic driver. Add an id_table and match vfunc to the
> usb_device_driver
> > struct, which will get used to select a better matching driver at
> > ->probe time.
> > 
> > This is a similar mechanism to that used in the HID drivers, with
> the
> > generic driver being selected unless there's a better matching one
> found
> > in the registered drivers (see hid_generic_match() in
> > drivers/hid/hid-generic.c).
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/usb/core/driver.c  | 15 +++++++++++++--
> >  drivers/usb/core/generic.c | 29 +++++++++++++++++++++++++++++
> >  include/linux/usb.h        |  2 ++
> >  3 files changed, 44 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index 50f92da8afcf..27ce63ed902d 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> > @@ -819,13 +819,24 @@ static int usb_device_match(struct device
> *dev, struct device_driver *drv)
> >  {
> >       /* devices and interfaces are handled separately */
> >       if (is_usb_device(dev)) {
> > +             struct usb_device *udev;
> > +             struct usb_device_driver *udrv;
> >  
> >               /* interface drivers never match devices */
> >               if (!is_usb_device_driver(drv))
> >                       return 0;
> >  
> > -             /* TODO: Add real matching code */
> > -             return 1;
> > +             udev = to_usb_device(dev);
> > +             udrv = to_usb_device_driver(drv);
> > +
> > +             if (udrv->id_table &&
> > +                 usb_device_match_id(udev, udrv->id_table) !=
> NULL) {
> > +                     return 1;
> > +             }
> > +
> > +             if (udrv->match)
> > +                     return udrv->match(udev);
> > +             return 0;
> 
> What happens if the subclass driver's probe routine returns an
> error?  
> Don't you still want the device to be bound to the generic driver?

I don't know whether that's what you'd want to do. But if we did,
that'd only be for devices which have "generic_init" set.

We'd need to remember the result of the ->probe() call at the end of
usb_probe_device() (as modified in patch 2), and only call the generic
driver (not the specific device driver)'s functions in later usage.

Is that what you would expect?

