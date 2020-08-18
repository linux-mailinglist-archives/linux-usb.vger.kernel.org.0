Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEACD248CE8
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 19:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgHRRYm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 13:24:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728624AbgHRRYl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 13:24:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 011362072D;
        Tue, 18 Aug 2020 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597771480;
        bh=dyO7PGl75P/Q0p4wvKm64lS69RsGNdLh6+FcC1WH85U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QryVt/RNhGd69TKnu7l0kfclxzQasY3BnoHDgwAyyRugQf/8WT4WPVK6QOlpH2fAP
         zDmhNqUxGw1ZOJJWiFow4ehYaFRkzCnIukrlmOFQQd3TmD9qUkUqKlfgpzDhjJQ5lq
         3UIW+StU3g20jRX0yVzAyEYZSVbPDRHXWfXEXIgg=
Date:   Tue, 18 Aug 2020 19:25:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v8 3/3] USB: Fix device driver race
Message-ID: <20200818172504.GA746411@kroah.com>
References: <20200818110445.509668-1-hadess@hadess.net>
 <20200818110445.509668-3-hadess@hadess.net>
 <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 08:06:20PM +0300, Sergei Shtylyov wrote:
> On 8/18/20 2:04 PM, Bastien Nocera wrote:
> 
> > When a new device with a specialised device driver is plugged in, the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> > 
> > After that, nothing will trigger a reprobe when the modprobe()'d device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> > 
> > Trigger a reprobe ourselves when new specialised drivers get registered.
> > 
> > Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> [...]
> >  drivers/usb/core/driver.c | 40 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index f81606c6a35b..7e73e989645b 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> [...]
> > @@ -934,13 +963,20 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
> >  
> >  	retval = driver_register(&new_udriver->drvwrap.driver);
> >  
> > -	if (!retval)
> > +	if (!retval) {
> >  		pr_info("%s: registered new device driver %s\n",
> >  			usbcore_name, new_udriver->name);
> > -	else
> > +		/*
> > +		 * Check whether any device could be better served with
> > +		 * this new driver
> > +		 */
> > +		bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
> > +				 __usb_bus_reprobe_drivers);
> > +	} else {
> >  		printk(KERN_ERR "%s: error %d registering device "
> >  			"	driver %s\n",
> 
>    Unrelated but... hm, this string literal seems weird. GregKH, would it be OK if we fix it?

Please do.
