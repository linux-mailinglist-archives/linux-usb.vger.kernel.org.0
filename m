Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC99D22C8DE
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGXPTj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:19:39 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:42523 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXPTi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:19:38 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D0F35C0002;
        Fri, 24 Jul 2020 15:19:35 +0000 (UTC)
Message-ID: <71c5e58d880122ff2f22d79f9d3c8625a6bbd232.camel@hadess.net>
Subject: Re: [PATCH v4] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Fri, 24 Jul 2020 17:19:35 +0200
In-Reply-To: <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
         <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2020-07-24 at 13:32 +0300, Andy Shevchenko wrote:
> On Fri, Jul 24, 2020 at 12:03 PM Bastien Nocera <hadess@hadess.net>
> wrote:
> > When a new device with a specialised device driver is plugged in,
> > the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> > 
> > After that, nothing will trigger a reprobe when the modprobe()'d
> > device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> > 
> > Trigger a reprobe ourselves when new specialised drivers get
> > registered.
> 
> ...
> 
> > +static int __usb_bus_reprobe_drivers(struct device *dev, void
> > *data)
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

Great, done locally.

> > +       udev = to_usb_device(dev);
> > +       if (usb_device_match_id(udev, new_udriver->id_table) !=
> > NULL ||
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
> 
>   if (new_udriver->match && new_udriver->match(udev) == 0))
>                device_reprobe(dev);
>     return 0;

That's not the same conditionals. If there's ->match but no matching
->id_table, you're not going to reprobe, when we'd want to.

> > +}
> 
> ...
> 
> > +               /* Check whether any device could be better served
> > with
> > +                * this new driver
> > +                */
> 
> Comment style?

Fixed locally.

> ...
> 
> > +               if (new_udriver->match || new_udriver->id_table)
> 
> But match check is incorporated in the loop function.

It's ->match || ->id_table, not simply ->match. Drivers can have
either, and we need to reprobe if either of those are present (and
we're also checking in the function to avoid calling a NULL pointer ;)

> > +                       bus_for_each_dev(&usb_bus_type, NULL,
> > new_udriver,
> > +                                        __usb_bus_reprobe_drivers)
> > ;

