Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B02222CB76
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 18:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgGXQwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 12:52:35 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51359 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgGXQwe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 12:52:34 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1693C200004;
        Fri, 24 Jul 2020 16:52:31 +0000 (UTC)
Message-ID: <e46ee6070263cd6672a42050040dbe1503036702.camel@hadess.net>
Subject: Re: [PATCH v4] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Fri, 24 Jul 2020 18:52:31 +0200
In-Reply-To: <20200724152707.GB1388675@rowland.harvard.edu>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
         <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
         <20200724152707.GB1388675@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2020-07-24 at 11:27 -0400, Alan Stern wrote:
> On Fri, Jul 24, 2020 at 01:32:40PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 24, 2020 at 12:03 PM Bastien Nocera <hadess@hadess.net>
> > wrote:
> > > When a new device with a specialised device driver is plugged in,
> > > the
> > > new driver will be modprobe()'d but the driver core will attach
> > > the
> > > "generic" driver to the device.
> > > 
> > > After that, nothing will trigger a reprobe when the modprobe()'d
> > > device
> > > driver has finished initialising, as the device has the "generic"
> > > driver attached to it.
> > > 
> > > Trigger a reprobe ourselves when new specialised drivers get
> > > registered.
> > 
> > ...
> > 
> > > +static int __usb_bus_reprobe_drivers(struct device *dev, void
> > > *data)
> > > +{
> > > +       struct usb_device_driver *new_udriver = data;
> > > +       struct usb_device_driver *udriver;
> > > +       struct usb_device *udev;
> > > +
> > > +       if (!dev->driver)
> > > +               return 0;
> > > +
> > > +       udriver = to_usb_device_driver(dev->driver);
> > > +       if (udriver != &usb_generic_driver)
> > > +               return 0;
> > 
> > What about
> > 
> > static bool is_dev_usb_generic_driver(dev)
> > {
> >       struct usb_device_driver *udd = dev->driver ?
> > to_usb_device_driver(dev->driver) : NULL;
> > 
> >       return udd == &usb_generic_driver;
> > }
> > 
> >   if (!is_dev_usb_generic_driver)
> >     return 0;
> > 
> > ?
> 
> Why would you want to add more lines of code to do the same thing?  
> Abstraction is fine up to point, but excessive abstraction only
> makes 
> things more difficult.

I actually like that one, it made the code clearer IMO.

> > > +       udev = to_usb_device(dev);
> > > +       if (usb_device_match_id(udev, new_udriver->id_table) !=
> > > NULL ||
> > > +           (new_udriver->match && new_udriver->match(udev) ==
> > > 0))
> > > +               device_reprobe(dev);
> > > +
> > > +       return 0;
> > 
> > What about
> > 
> >      udev = to_usb_device(dev);
> >      if (usb_device_match_id(udev, new_udriver->id_table) == NULL)
> >        return 0;
> > ?
> 
> The logic is wrong.  If usb_device_match_id() returns NULL then we
> want 
> to go ahead with the second test, not give up right away.  But this 
> could be written as:
> 
> 	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
> 			(!new_udriver->match || new_udriver-
> >match(udev) != 0))
> 		return 0;
> 
> 	device_reprobe(dev);
> 
> This would make the overall flow of the routine more uniform.

Adopted.

> > > +               /* Check whether any device could be better
> > > served with
> > > +                * this new driver
> > > +                */
> > 
> > Comment style?
> 
> Right:
> 
> 	/*
> 	 * Multiline comments
> 	 * should look like this.
> 	 */
> 
> > ...
> > 
> > > +               if (new_udriver->match || new_udriver->id_table)
> > 
> > But match check is incorporated in the loop function.
> 
> Agreed, this test is redundant.  However, we should test that 
> new_udriver != &usb_generic_driver.

Do you really want to loop over every USB device when you know for a
fact that not a single one will match?

I guess it's unlikely, the generic driver would be loaded before any
device, and the specialised drivers need to be able to selected, so
I've done that locally.

> Alan Stern
> 
> > > +                       bus_for_each_dev(&usb_bus_type, NULL,
> > > new_udriver,
> > > +                                        __usb_bus_reprobe_driver
> > > s);
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko

