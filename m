Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0544E22AD13
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 12:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgGWK5V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 06:57:21 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34903 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgGWK5V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 06:57:21 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A64A8240007;
        Thu, 23 Jul 2020 10:57:18 +0000 (UTC)
Message-ID: <ee58286dd0f6e62c6ca95f094292893cf921fe21.camel@hadess.net>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu, 23 Jul 2020 12:57:18 +0200
In-Reply-To: <AM7PR04MB71570D838FDDB467A302423E8B760@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722152640.GC1310843@rowland.harvard.edu>
         <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
         <20200723021904.GA5798@b29397-desktop>
         <bbc6bd03507d8ec3462f671f06587317f3fcbfca.camel@hadess.net>
         <AM7PR04MB71570D838FDDB467A302423E8B760@AM7PR04MB7157.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-07-23 at 10:35 +0000, Peter Chen wrote:
>  
> > > > > > After that, nothing will trigger a reprobe when the
> > > > > > modprobe()'d
> > > > > > device driver has finished initialising, as the device has
> > > > > > the
> > > > > > "generic"
> > > > > > driver attached to it.
> > > > > > 
> > > > > > Trigger a reprobe ourselves when new specialised drivers
> > > > > > get
> > > > > > registered.
> > > > > > 
> > > > > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > > > > ---
> > > > > >  drivers/usb/core/driver.c | 31
> > > > > > +++++++++++++++++++++++++++++--
> > > > > >  1 file changed, 29 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/usb/core/driver.c
> > > > > > b/drivers/usb/core/driver.c index
> > > > > > f81606c6a35b..a6187dd2186c
> > > > > > 100644
> > > > > > --- a/drivers/usb/core/driver.c
> > > > > > +++ b/drivers/usb/core/driver.c
> > > > > > @@ -905,6 +905,30 @@ static int usb_uevent(struct device
> > > > > > *dev,
> > > > > > struct kobj_uevent_env *env)
> > > > > >  	return 0;
> > > > > >  }
> > > > > > 
> > > > > > +static int __usb_bus_reprobe_drivers(struct device *dev,
> > > > > > void
> > > > > > *data)
> > > > > > +{
> > > > > > +	struct usb_device_driver *udriver =
> > > > > > to_usb_device_driver(dev-
> > > > > > > driver);
> > > > > > +	struct usb_device *udev = to_usb_device(dev);
> > > > > > +
> > > > > > +	if (udriver == &usb_generic_driver &&
> > > > > > +	    !udev->use_generic_driver)
> > > > > > +		return device_reprobe(dev);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int __usb_device_driver_added(struct device_driver
> > > > > > *drv,
> > > > > > void *data)
> > > > > > +{
> > > > > > +	struct usb_device_driver *udrv =
> > > > > > to_usb_device_driver(drv);
> > > > > > +
> > > > > > +	if (udrv->match) {
> > > > > > +		bus_for_each_dev(&usb_bus_type, NULL, udrv,
> > > > > > +				 __usb_bus_reprobe_drivers);
> > > > > 
> > > > > What does udrv get used for here?
> > > > > 
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * usb_register_device_driver - register a USB device (not
> > > > > > interface) driver
> > > > > >   * @new_udriver: USB operations for the device driver @@
> > > > > > -934,13 +958,16 @@ int usb_register_device_driver(struct
> > > > > > usb_device_driver *new_udriver,
> > > > > > 
> > > > > >  	retval = driver_register(&new_udriver->drvwrap.driver);
> > > > > > 
> > > > > > -	if (!retval)
> > > > > > +	if (!retval) {
> > > > > > +		bus_for_each_drv(&usb_bus_type, NULL, NULL,
> > > > > > +				 __usb_device_driver_added);
> > > > > 
> > > > > This looks funny.  You're calling both bus_for_each_drv() and
> > > > > bus_for_each_dev().  Can't you skip this iterator and just
> > > > > call
> > > > > bus_for_each_dev() directly?
> > > > 
> > > > You're right, looks like this could be simplified somewhat. I'm
> > > > building and testing a smaller patch.
> > > > 
> > > 
> > > What do you mean "reprobe" for your device? Do you mean the
> > > mfi_fc_probe is not called? If it is, Would you please check why
> > > usb_device_match at drivers/usb/core/driver.c does not return
> > > true for
> > > your device?
> > 
> > mfi_fc_probe() isn't called because the device already has the
> > generic driver
> > attached by the time the apple-mfi-fastcharge driver is loaded.
> 
> Would you please explain more, why only this driver has this issue?
> Seem you
> create a struct usb_device_driver, but not struct usb_driver, few
> drivers do like
> that. You may see drivers/usb/misc/ehset.c and
> drivers/usb/misc/appledisplay.c
> as an example.

It's a _device_ driver, not an interface driver. It's the only driver
that has the problem because it's the only non-generic device driver :)

