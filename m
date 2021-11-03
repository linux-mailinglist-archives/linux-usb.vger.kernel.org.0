Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A644444A22
	for <lists+linux-usb@lfdr.de>; Wed,  3 Nov 2021 22:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhKCVUD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Nov 2021 17:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhKCVUC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Nov 2021 17:20:02 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5188EC061714
        for <linux-usb@vger.kernel.org>; Wed,  3 Nov 2021 14:17:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 17so6152442ljq.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Nov 2021 14:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jz/th2uhIvxbvCpHSrZ235rzMozukJtGA9t7jHvTTFI=;
        b=lGD8Z3rvNfFQTyoinwAxFPxpf52zNbTpI2uc/wQG9h6zfi9GVY5prWQmV00x+DUqpy
         4oFX+UPCLO86/CclrYZvuPdGbXbOCNv8QlVE+PWxmsanDH4N/f3KGo6hZ2lt8RBMyx4o
         pUHbS0RoLa3zkVkR2bmgKLcHHc7u1mXTJq9vjq7f7CNRAPv2qIuRF2oluAAOQz4q21YK
         EJ17F8e0lYM982L1WlJev1AqfatTFsajUeuhup7vs5GGv4BND5QSsxFFzoa3nDVHZog5
         5Gu0MWA2wWSDWeYS0wDzanCiBkHlYTj+MNXfuAaEwAi7qUcu6F5AC2aJcmp7USqbfXoO
         R4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jz/th2uhIvxbvCpHSrZ235rzMozukJtGA9t7jHvTTFI=;
        b=zDCOrRrgGVu2V7wPuKOSWoEPauVYFjOzBL2Y066kRIU0jURxXOIST0uKdc0bD7azvH
         7h76cMKYYgbh+a54cZ4d1uISv544zdXostWF0FZi1GsoEUqIOEFrQQ1/21Y7CoWsk13F
         aS4V+IdFDOqDZUT3Qt3jbD6OTh4SHadiaFcIgBtte5UfyM7Adg5E1a9bxNFOXmC6Yulv
         YtlKHzB/TNOIhXoGm5EAfbweRHwdflomnR/K15lJHFCVzNG1fzBebrsHtDxaAp8qvSld
         gyQjrrx97xa72GzK9l+EocBb3SpNu6Gwj+L0ZrZw40/DMDJO91DvjMTPvPyjQ8FJkelV
         vuvw==
X-Gm-Message-State: AOAM533fA6vbkvVlnVQznfYH0T14KJt0R6HcM+vZihkm4SRawbztwE5P
        0MVLUuLtvZp09mjp4Jh9YYY=
X-Google-Smtp-Source: ABdhPJz2Z5kasra20pkKurCjyyfwkIey3rZ/bmBzB1KTxATWOKuLXN3cnDfqAX/4IFlzoTgRilMvWw==
X-Received: by 2002:a05:651c:1503:: with SMTP id e3mr50154718ljf.182.1635974243633;
        Wed, 03 Nov 2021 14:17:23 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id k16sm274723lfm.292.2021.11.03.14.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 14:17:23 -0700 (PDT)
Date:   Wed, 3 Nov 2021 22:17:21 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/3] tools/usbip: export USB devices on a given bus
 persistently
Message-ID: <20211103211721.GB7819@dell-precision-T3610>
References: <20211027193134.GA16336@dell-precision-T3610>
 <023379da-d2c7-21b3-f283-917d20e56c9d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023379da-d2c7-21b3-f283-917d20e56c9d@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the comments, below are my responses.

On Wed, Oct 27, 2021 at 05:45:14PM -0600, Shuah Khan wrote:
> On 10/27/21 1:31 PM, Lars Gunnarsson wrote:
> > This patch extends the command "usbip bind" with flag "-p|--persistent". When
> > this flag is used, devices on a given busid becomes exported when plugged in,
> > instead of returning an error if the device is not available. When the usb
> > device is unplugged, it will start monitor the bus again.
> > 
> > Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> > ---
> > v2: Change title, fix style warnings, improve feature description, refactor
> >      cmdline flag usage.
> > v3: Change title and description.
> > 
> >   Documentation/usb/usbip_protocol.rst |   5 ++
> >   tools/usb/usbip/src/usbip_bind.c     | 114 +++++++++++++++++++++------
> >   2 files changed, 94 insertions(+), 25 deletions(-)
> > 
> > diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> > index 0b8541fda4d8..2ed7d97278e8 100644
> > --- a/Documentation/usb/usbip_protocol.rst
> > +++ b/Documentation/usb/usbip_protocol.rst
> > @@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
> >   USB devices and the clients import them. The device driver for the exported
> >   USB device runs on the client machine.
> > 
> > +Initially the server may choose to export any of its available USB devices,
> > +based on the busid. The device will remain exported until it's unplugged or
> > +unbound from the usbip driver. It is also possible to persistently export
> > +devices on a given bus by monitor when they are plugged in.
> > +
> >   The client may ask for the list of the exported USB devices. To get the list the
> >   client opens a TCP/IP connection to the server, and sends an OP_REQ_DEVLIST
> >   packet on top of the TCP/IP connection (so the actual OP_REQ_DEVLIST may be sent
> > diff --git a/tools/usb/usbip/src/usbip_bind.c b/tools/usb/usbip/src/usbip_bind.c
> > index f1cf9225a69c..fd4ccbfce6c6 100644
> > --- a/tools/usb/usbip/src/usbip_bind.c
> > +++ b/tools/usb/usbip/src/usbip_bind.c
> > @@ -8,12 +8,14 @@
> > 
> >   #include <errno.h>
> >   #include <stdio.h>
> > +#include <stdbool.h>
> >   #include <stdlib.h>
> >   #include <string.h>
> > 
> >   #include <getopt.h>
> > 
> >   #include "usbip_common.h"
> > +#include "usbip_monitor.h"
> >   #include "utils.h"
> >   #include "usbip.h"
> >   #include "sysfs_utils.h"
> > @@ -24,10 +26,17 @@ enum unbind_status {
> >   	UNBIND_ST_FAILED
> >   };
> > 
> > +struct bind_options {
> > +	char *busid;
> > +	bool is_persistent;
> > +};
> > +
> >   static const char usbip_bind_usage_string[] =
> >   	"usbip bind <args>\n"
> > -	"    -b, --busid=<busid>    Bind " USBIP_HOST_DRV_NAME ".ko to device "
> > -	"on <busid>\n";
> > +	"    -b, --busid=<busid>        Bind " USBIP_HOST_DRV_NAME ".ko to device\n"
> > +	"                               on <busid>\n"
> > +	"    -p, --persistent           Persistently monitor the given bus and\n"
> > +	"                               export USB devices plugged in\n";
> > 
> >   void usbip_bind_usage(void)
> >   {
> > @@ -127,29 +136,26 @@ static int unbind_other(char *busid)
> >   	return status;
> >   }
> > 
> > -static int bind_device(char *busid)
> > +static const char *get_device_devpath(char *busid)
> >   {
> > -	int rc;
> > -	struct udev *udev;
> > -	struct udev_device *dev;
> > -	const char *devpath;
> > +	struct udev *udev = udev_new();
> > +	const char *devpath = NULL;
> > +	struct udev_device *dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
> > 
> > -	/* Check whether the device with this bus ID exists. */
> > -	udev = udev_new();
> > -	dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
> > -	if (!dev) {
> > -		err("device with the specified bus ID does not exist");
> > -		return -1;
> > -	}
> > -	devpath = udev_device_get_devpath(dev);
> > +	if (dev)
> > +		devpath = udev_device_get_devpath(dev);
> >   	udev_unref(udev);
> > +	return devpath;
> > +}
> > 
> > -	/* If the device is already attached to vhci_hcd - bail out */
> > -	if (strstr(devpath, USBIP_VHCI_DRV_NAME)) {
> > -		err("bind loop detected: device: %s is attached to %s\n",
> > -		    devpath, USBIP_VHCI_DRV_NAME);
> > -		return -1;
> > -	}
> > +static bool is_usb_connected(char *busid)
> > +{
> > +	return get_device_devpath(busid) != NULL;
> 
> Let's make this easier to read. I see what you are doing here.
> Just make it easier to read.

Does this make it more readable?

if (get_device_devpath(busid))
  return true;
else
  return false;

> 
> 
> > +}
> > +
> > +static int bind_available_device(char *busid)
> > +{
> > +	int rc;
> > 
> >   	rc = unbind_other(busid);
> >   	if (rc == UNBIND_ST_FAILED) {
> > @@ -174,36 +180,94 @@ static int bind_device(char *busid)
> >   		return -1;
> >   	}
> > 
> > -	info("bind device on busid %s: complete", busid);
> > +	info("device on busid %s: bind complete", busid);
> > 
> >   	return 0;
> >   }
> > 
> > +static int bind_device(char *busid)
> > +{
> > +	const char *devpath = get_device_devpath(busid);
> > +
> > +	/* Check whether the device with this bus ID exists. */
> > +	if (!devpath) {
> > +		err("device with the specified bus ID does not exist");
> > +		return -1;
> > +	}
> > +
> > +	/* If the device is already attached to vhci_hcd - bail out */
> > +	if (strstr(devpath, USBIP_VHCI_DRV_NAME)) {
> > +		err("bind loop detected: device: %s is attached to %s\n",
> > +		    devpath, USBIP_VHCI_DRV_NAME);
> > +		return -1;
> > +	}
> > +
> > +	return bind_available_device(busid);
> > +}
> > +
> > +static int bind_device_persistently(char *busid)
> > +{
> > +	int rc = 0;
> > +	bool already_connected = is_usb_connected(busid);
> > +	usbip_monitor_t *monitor = monitor = usbip_monitor_new();
> > +
> > +	usbip_monitor_set_busid(monitor, busid);
> > +	while (rc == 0) {
> > +		if (!already_connected) {
> > +			info("device on busid %s: monitor connect", busid);
> > +			usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
> > +		}
> > +		rc = bind_available_device(busid);
> > +		if (rc == 0) {
> > +			info("device on busid %s: monitor disconnect", busid);
> > +			usbip_monitor_await_usb_bind(monitor, USBIP_HOST_DRV_NAME);
> > +			usbip_monitor_await_usb_unbind(monitor);
> > +		}
> > +		already_connected = false;
> > +	}
> > +	usbip_monitor_delete(monitor);
> > +	return rc;
> > +}
> > +
> >   int usbip_bind(int argc, char *argv[])
> >   {
> >   	static const struct option opts[] = {
> >   		{ "busid", required_argument, NULL, 'b' },
> > +		{ "persistent",  no_argument, NULL, 'p' },
> >   		{ NULL,    0,                 NULL,  0  }
> >   	};
> > 
> > +	struct bind_options options = {};
> >   	int opt;
> >   	int ret = -1;
> > 
> >   	for (;;) {
> > -		opt = getopt_long(argc, argv, "b:", opts, NULL);
> > +		opt = getopt_long(argc, argv, "b:p", opts, NULL);
> > 
> >   		if (opt == -1)
> >   			break;
> > 
> >   		switch (opt) {
> >   		case 'b':
> > -			ret = bind_device(optarg);
> > -			goto out;
> > +			options.busid = optarg;
> > +			break;
> > +		case 'p':
> > +			options.is_persistent = true;
> > +			break;
> >   		default:
> >   			goto err_out;
> >   		}
> >   	}
> > 
> > +	if (!options.busid)
> > +		goto err_out;
> > +
> > +	if (options.is_persistent)
> > +		ret = bind_device_persistently(options.busid);
> > +	else
> > +		ret = bind_device(options.busid);
> > +	goto out;
> > +
> >   err_out:
> >   	usbip_bind_usage();
> >   out:
> > --
> > 2.25.1
> > 
> > 
> 
> thanks,
> -- Shuah
