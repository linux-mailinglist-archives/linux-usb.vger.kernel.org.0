Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCB6229BE7
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 17:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbgGVPx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 11:53:29 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58787 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgGVPx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 11:53:28 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4297A24000E;
        Wed, 22 Jul 2020 15:53:25 +0000 (UTC)
Message-ID: <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Wed, 22 Jul 2020 17:53:25 +0200
In-Reply-To: <20200722152640.GC1310843@rowland.harvard.edu>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722152640.GC1310843@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-07-22 at 11:26 -0400, Alan Stern wrote:
> On Wed, Jul 22, 2020 at 11:46:27AM +0200, Bastien Nocera wrote:
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
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/usb/core/driver.c | 31 +++++++++++++++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index f81606c6a35b..a6187dd2186c 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> > @@ -905,6 +905,30 @@ static int usb_uevent(struct device *dev,
> > struct kobj_uevent_env *env)
> >  	return 0;
> >  }
> >  
> > +static int __usb_bus_reprobe_drivers(struct device *dev, void
> > *data)
> > +{
> > +	struct usb_device_driver *udriver = to_usb_device_driver(dev-
> > >driver);
> > +	struct usb_device *udev = to_usb_device(dev);
> > +
> > +	if (udriver == &usb_generic_driver &&
> > +	    !udev->use_generic_driver)
> > +		return device_reprobe(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __usb_device_driver_added(struct device_driver *drv,
> > void *data)
> > +{
> > +	struct usb_device_driver *udrv = to_usb_device_driver(drv);
> > +
> > +	if (udrv->match) {
> > +		bus_for_each_dev(&usb_bus_type, NULL, udrv,
> > +				 __usb_bus_reprobe_drivers);
> 
> What does udrv get used for here?
> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * usb_register_device_driver - register a USB device (not
> > interface) driver
> >   * @new_udriver: USB operations for the device driver
> > @@ -934,13 +958,16 @@ int usb_register_device_driver(struct
> > usb_device_driver *new_udriver,
> >  
> >  	retval = driver_register(&new_udriver->drvwrap.driver);
> >  
> > -	if (!retval)
> > +	if (!retval) {
> > +		bus_for_each_drv(&usb_bus_type, NULL, NULL,
> > +				 __usb_device_driver_added);
> 
> This looks funny.  You're calling both bus_for_each_drv() and 
> bus_for_each_dev().  Can't you skip this iterator and just call 
> bus_for_each_dev() directly?

You're right, looks like this could be simplified somewhat. I'm
building and testing a smaller patch.

Thanks

