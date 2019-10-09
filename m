Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51CF8D115D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 16:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbfJIOen (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 10:34:43 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51004 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730490AbfJIOen (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 10:34:43 -0400
Received: (qmail 2376 invoked by uid 2102); 9 Oct 2019 10:34:41 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Oct 2019 10:34:41 -0400
Date:   Wed, 9 Oct 2019 10:34:41 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 2/5] USB: Make it possible to "subclass" usb_device_driver
In-Reply-To: <20191009134342.6476-3-hadess@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910091025500.1603-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 9 Oct 2019, Bastien Nocera wrote:

> The kernel currenly has only 2 usb_device_drivers, one generic one, one
> that completely replaces the generic one to make USB devices usable over
> a network.

Presumably your first driver is in generic.c.  Where is the second one?

> Use the newly exported generic driver functions when a driver declares
> to want them run, in addition to its own code. This makes it possible to
> write drivers that extend the generic USB driver.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

This has a few problems.  The biggest one is that the device core does 
not guarantee any order of driver probing.  If generic.c is probed 
first, the subclass driver will never get probed -- which is a pretty 
fatal flaw.

> ---
>  drivers/usb/core/driver.c | 36 ++++++++++++++++++++++++++++++------
>  include/linux/usb.h       |  1 +
>  2 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 2b27d232d7a7..863e380a272b 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -261,10 +261,17 @@ static int usb_probe_device(struct device *dev)
>  	 */
>  	if (!udriver->supports_autosuspend)
>  		error = usb_autoresume_device(udev);
> +	if (error)
> +		return error;
>  
> -	if (!error)
> -		error = udriver->probe(udev);
> -	return error;
> +	if (udriver->generic_init)
> +		error = usb_generic_driver_probe(udev);
> +	if (error)
> +		return error;
> +
> +	if (udriver->probe)
> +		return udriver->probe(udev);
> +	return 0;
>  }
>  
>  /* called from driver core with dev locked */
> @@ -273,7 +280,10 @@ static int usb_unbind_device(struct device *dev)
>  	struct usb_device *udev = to_usb_device(dev);
>  	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
>  
> -	udriver->disconnect(udev);
> +	if (udriver->generic_init)
> +		usb_generic_driver_disconnect(udev);
> +	if (udriver->disconnect)
> +		udriver->disconnect(udev);

The order is wrong.  The disconnects should always be done in reverse 
order of probing.  This is true whenever you have a destructor for a 
subclass; the subclasses destructor runs before the superclass's 
destructor.

>  	if (!udriver->supports_autosuspend)
>  		usb_autosuspend_device(udev);
>  	return 0;
> @@ -886,6 +896,14 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> +	if (new_udriver->probe == NULL &&
> +	    !new_udriver->generic_init) {

There's no point adding this extra test.  Even subclass drivers should 
have a probe function.

> +		printk(KERN_ERR "%s: error %d registering device "
> +		       "	driver %s, no probe() function\n",

Don't split character strings.  They are an exception to the 80-column 
limit.

> +		       usbcore_name, retval, new_udriver->name);
> +		return -EINVAL;
> +	}
> +
>  	new_udriver->drvwrap.for_devices = 1;
>  	new_udriver->drvwrap.driver.name = new_udriver->name;
>  	new_udriver->drvwrap.driver.bus = &usb_bus_type;
> @@ -1149,7 +1167,10 @@ static int usb_suspend_device(struct usb_device *udev, pm_message_t msg)
>  		udev->do_remote_wakeup = 0;
>  		udriver = &usb_generic_driver;
>  	}
> -	status = udriver->suspend(udev, msg);
> +	if (udriver->generic_init)
> +		status = usb_generic_driver_suspend (udev, msg);
> +	if (status == 0 && udriver->suspend)
> +		status = udriver->suspend(udev, msg);

Again, the order is wrong.  Suspend the subclass driver first.

>   done:
>  	dev_vdbg(&udev->dev, "%s: status %d\n", __func__, status);
> @@ -1181,7 +1202,10 @@ static int usb_resume_device(struct usb_device *udev, pm_message_t msg)
>  		udev->reset_resume = 1;
>  
>  	udriver = to_usb_device_driver(udev->dev.driver);
> -	status = udriver->resume(udev, msg);
> +	if (udriver->generic_init)
> +		status = usb_generic_driver_resume (udev, msg);
> +	if (status == 0 && udriver->resume)
> +		status = udriver->resume(udev, msg);
>  
>   done:
>  	dev_vdbg(&udev->dev, "%s: status %d\n", __func__, status);
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index e656e7b4b1e4..fb9ad3511e55 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1242,6 +1242,7 @@ struct usb_device_driver {
>  	const struct attribute_group **dev_groups;
>  	struct usbdrv_wrap drvwrap;
>  	unsigned int supports_autosuspend:1;
> +	unsigned int generic_init:1;

How about using a name that actually says something about the driver?  
Such as generic_subclass?  Or subclass_of_generic?

"init" has nothing to do with anything.

>  };
>  #define	to_usb_device_driver(d) container_of(d, struct usb_device_driver, \
>  		drvwrap.driver)

Alan Stern

