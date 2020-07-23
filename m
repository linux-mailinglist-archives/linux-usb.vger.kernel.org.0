Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71CC22B909
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 23:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgGWV6b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 17:58:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56693 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726390AbgGWV6a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 17:58:30 -0400
Received: (qmail 1371133 invoked by uid 1000); 23 Jul 2020 17:58:30 -0400
Date:   Thu, 23 Jul 2020 17:58:30 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] USB: Fix device driver race
Message-ID: <20200723215830.GB1370343@rowland.harvard.edu>
References: <a3cd9c51f215be37ac9bb44083ab8b3280f9359f.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3cd9c51f215be37ac9bb44083ab8b3280f9359f.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 23, 2020 at 11:30:39PM +0200, Bastien Nocera wrote:
> When a new device with a specialised device driver is plugged in, the
> new driver will be modprobe()'d but the driver core will attach the
> "generic" driver to the device.
> 
> After that, nothing will trigger a reprobe when the modprobe()'d device
> driver has finished initialising, as the device has the "generic"
> driver attached to it.
> 
> Trigger a reprobe ourselves when new specialised drivers get registered.
> 
> Fixes: 88b7381a939d
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

Better than before, but there are still some things to improve.

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f81606c6a35b..44531910637c 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -905,6 +905,25 @@ static int usb_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	return 0;
>  }
>  
> +static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
> +{
> +	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);

This variable isn't used (it gets shadowed below).

> +	struct usb_device *udev = to_usb_device(dev);

And this one doesn't get used unless both tests below succeed, so the 
declaration should be moved down to the inner block.

> +
> +	if (dev->driver) {
> +		struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
> +
> +		if (udriver == NULL || udriver == &usb_generic_driver) {

Since dev->driver is not NULL, udriver cannot possibly be NULL.  No need 
to test for it.

> +			udev->use_generic_driver = false;

Are you sure you want to do that?  If udev->use_generic_driver was set, 
it means that a specialized driver has already been probed and failed.  
We assume only one specialized driver will match a particular device, so 
there's no point in reprobing -- the same driver will match and it will 
just fail the probe again.

> +			device_reprobe(dev);

We shouldn't do this unless we have a good reason for believing the new 
driver will bind to the device.  Otherwise you're messing up a perfectly 
good existing binding for no reason.

You should first test whether the device matches the new driver (pass 
the new driver as the iterator parameter).

> +		}
> +	} else {
> +		device_reprobe(dev);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * usb_register_device_driver - register a USB device (not interface) driver
>   * @new_udriver: USB operations for the device driver
> @@ -934,13 +953,19 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
>  
>  	retval = driver_register(&new_udriver->drvwrap.driver);
>  
> -	if (!retval)
> +	if (!retval) {
> +		/* Check whether any device could be better served with
> +		 * this new driver
> +		 */
> +		bus_for_each_dev(&usb_bus_type, NULL, NULL,
> +				 __usb_bus_reprobe_drivers);
>  		pr_info("%s: registered new device driver %s\n",
>  			usbcore_name, new_udriver->name);

The new iterator should be added after the pr_info(), not before, 
because we want the new driver's registration to show up in the kernel 
log before any notices about it being bound to devices.

Alan Stern

> -	else
> +	} else {
>  		printk(KERN_ERR "%s: error %d registering device "
>  			"	driver %s\n",
>  			usbcore_name, retval, new_udriver->name);
> +	}
>  
>  	return retval;
>  }
> 
