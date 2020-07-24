Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FC722C8ED
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXP1I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:27:08 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39129 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726326AbgGXP1I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:27:08 -0400
Received: (qmail 1391934 invoked by uid 1000); 24 Jul 2020 11:27:07 -0400
Date:   Fri, 24 Jul 2020 11:27:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] USB: Fix device driver race
Message-ID: <20200724152707.GB1388675@rowland.harvard.edu>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
 <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 01:32:40PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 24, 2020 at 12:03 PM Bastien Nocera <hadess@hadess.net> wrote:
> >
> > When a new device with a specialised device driver is plugged in, the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> >
> > After that, nothing will trigger a reprobe when the modprobe()'d device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> >
> > Trigger a reprobe ourselves when new specialised drivers get registered.
> 
> ...
> 
> > +static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
> > +{
> > +       struct usb_device_driver *new_udriver = data;
> > +       struct usb_device_driver *udriver;
> > +       struct usb_device *udev;
> > +
> > +       if (!dev->driver)
> > +               return 0;
> > +
> > +       udriver = to_usb_device_driver(dev->driver);
> > +       if (udriver != &usb_generic_driver)
> > +               return 0;
> 
> What about
> 
> static bool is_dev_usb_generic_driver(dev)
> {
>       struct usb_device_driver *udd = dev->driver ?
> to_usb_device_driver(dev->driver) : NULL;
> 
>       return udd == &usb_generic_driver;
> }
> 
>   if (!is_dev_usb_generic_driver)
>     return 0;
> 
> ?

Why would you want to add more lines of code to do the same thing?  
Abstraction is fine up to point, but excessive abstraction only makes 
things more difficult.

> 
> > +       udev = to_usb_device(dev);
> > +       if (usb_device_match_id(udev, new_udriver->id_table) != NULL ||
> > +           (new_udriver->match && new_udriver->match(udev) == 0))
> > +               device_reprobe(dev);
> > +
> > +       return 0;
> 
> What about
> 
>      udev = to_usb_device(dev);
>      if (usb_device_match_id(udev, new_udriver->id_table) == NULL)
>        return 0;
> ?

The logic is wrong.  If usb_device_match_id() returns NULL then we want 
to go ahead with the second test, not give up right away.  But this 
could be written as:

	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
			(!new_udriver->match || new_udriver->match(udev) != 0))
		return 0;

	device_reprobe(dev);

This would make the overall flow of the routine more uniform.

> > +               /* Check whether any device could be better served with
> > +                * this new driver
> > +                */
> 
> Comment style?

Right:

	/*
	 * Multiline comments
	 * should look like this.
	 */

> ...
> 
> > +               if (new_udriver->match || new_udriver->id_table)
> 
> But match check is incorporated in the loop function.

Agreed, this test is redundant.  However, we should test that 
new_udriver != &usb_generic_driver.

Alan Stern

> 
> > +                       bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
> > +                                        __usb_bus_reprobe_drivers);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
