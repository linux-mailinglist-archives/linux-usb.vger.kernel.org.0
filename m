Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2681444A16
	for <lists+linux-usb@lfdr.de>; Wed,  3 Nov 2021 22:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhKCVL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Nov 2021 17:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhKCVL2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Nov 2021 17:11:28 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EA1C061714
        for <linux-usb@vger.kernel.org>; Wed,  3 Nov 2021 14:08:51 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id y8so6050946ljm.4
        for <linux-usb@vger.kernel.org>; Wed, 03 Nov 2021 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jDnZlixB2QNF9sp6iLModcq8zC+WavsfDEpkn4lAP+8=;
        b=Gijb+qATz+cQLgSooSBs6yN3Q2NiPBE407k/xBnHyFR+cV2y1/Nq4X3HqYkO40ik86
         xOFr7Qk+bhopDcw7YANPXBzDgUTXqTakjUMxsHZ8vxSRHzhiFrD6Y5V8vJ9Xptqj8gMl
         EnaHPXudzFWphl11u/Tzot1hG3BLvICsUaSIcVNhKkQD1zh4tbZO9Z5uwZHBKD1+NKM4
         tAxXxK3mTV7LGb3MXteZ6P1jlCIHsScBcZJrokJLNPPWcVUaOL3s2kw/Sf5PH9+G5gpq
         2DvXUcVGj/es3f0f/v0FVIctP6jetEycz0iJNA8PThFbIzwrKa1DERUjQ7Tk3E46HsAc
         cRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jDnZlixB2QNF9sp6iLModcq8zC+WavsfDEpkn4lAP+8=;
        b=g4TG7ZNGNIcGkmXBQ0t2H2UIPMIw98J5edkPNcOwYSHMlJ/v107dWulLiuilmyhfqt
         19iOl+2OKjB+f7XCz2ebpFsneuD/HVnxoipseLBcwPryc0uUYp0ULJmId89lF4ZV64rn
         LaJacw23T+ZOA7DyLj3ewjrvj5+xmoXdbAp21X1kPmC30oOYIj6+S71C/b7ayTVzxXnb
         3iuIOEPulU8fUbjolaL1XkH4M6NditPlt6IvdB8xvoG1fjqBH1QQeaUWlxkD9XdVCnzu
         yhWow09rhpAR3FyAnCvWmKC2SZQY+ps8ZyDXcli6SBXD5K97gBf/ywIpzTPv1mwLSn5J
         BfIA==
X-Gm-Message-State: AOAM530EIb4gCdh++ZTrRR0Eg1FwIppgeiIY41zhcKr6XPOWR0djuIIS
        /r2QfKfvgzB2Fdx8NChizYc=
X-Google-Smtp-Source: ABdhPJzW2qrY67VvZzxEZjqjMAt7c7msMMKAN++eHFqiCUEVLLtNj5Ij2MNVZr+wmE6hVWNDaBWIjw==
X-Received: by 2002:a2e:a6a0:: with SMTP id q32mr46643573lje.344.1635973729883;
        Wed, 03 Nov 2021 14:08:49 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id i12sm272376lfb.234.2021.11.03.14.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 14:08:48 -0700 (PDT)
Date:   Wed, 3 Nov 2021 22:08:47 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/3] tools/usbip: add usb event monitor into libusbip
Message-ID: <20211103210847.GA7819@dell-precision-T3610>
References: <20211027193054.GA16215@dell-precision-T3610>
 <4ce25514-8ba1-c991-9dc9-2ff78d41249f@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ce25514-8ba1-c991-9dc9-2ff78d41249f@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the comments, below are my responses.

On Wed, Oct 27, 2021 at 05:41:33PM -0600, Shuah Khan wrote:
> On 10/27/21 1:30 PM, Lars Gunnarsson wrote:
> > This patch implements an usb monitor into libusbip to synchronously wait for usb
> > events. The api is used in coming patches to allow "usbip bind" to export
> > device and "usbip attach" to import device, based on udev evens
> 
> events?

Will fix this.

> 
> Example of
> > api usage:
> > 
> > // wait for an usb divce to be plugged in:
> > usbip_monitor_t *monitor = usbip_monitor_new();
> > usbip_monitor_set_busid(monitor, "3-3.1.2.3");
> > usbip_monitor_await_usb_bind(monitor, "usb");  // this is a blocking call
> > // usb device with busid 3-3.1.2.3 is now bound to driver "usb".
> > usbip_monitor_delete(monitor);
> > 
> 
> Whe and where should this API be used? Can you describe how this API
> fits into the usbip host and clinet sides?

Will fix this.

> 
> > Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> > ---
> > v2: Change title, fix style warnings, improve feature description, add timeout
> >     into usbip_monitor.
> > v3: Change title and description.
> > 
> > Justifications of remaining warnings from "scripts/checkpatch.pl":
> > 
> > * Exception according to Linux kernel coding style 5.a where
> >    "usbip_monitor_t" is a totally opaque object:
> > 
> >    WARNING: do not add new typedefs
> >    #199: FILE: tools/usb/usbip/libsrc/usbip_monitor.h:8:
> >    +typedef struct usbip_monitor usbip_monitor_t;
> > 
> >   tools/usb/usbip/.gitignore             |   1 +
> >   tools/usb/usbip/libsrc/Makefile.am     |   3 +-
> >   tools/usb/usbip/libsrc/usbip_common.h  |   1 +
> >   tools/usb/usbip/libsrc/usbip_monitor.c | 159 +++++++++++++++++++++++++
> >   tools/usb/usbip/libsrc/usbip_monitor.h |  36 ++++++
> >   5 files changed, 199 insertions(+), 1 deletion(-)
> >   create mode 100644 tools/usb/usbip/libsrc/usbip_monitor.c
> >   create mode 100644 tools/usb/usbip/libsrc/usbip_monitor.h
> > 
> > diff --git a/tools/usb/usbip/.gitignore b/tools/usb/usbip/.gitignore
> > index 597361a96dbb..6304adefb5e1 100644
> > --- a/tools/usb/usbip/.gitignore
> > +++ b/tools/usb/usbip/.gitignore
> > @@ -28,6 +28,7 @@ libsrc/libusbip_la-usbip_common.lo
> >   libsrc/libusbip_la-usbip_device_driver.lo
> >   libsrc/libusbip_la-usbip_host_common.lo
> >   libsrc/libusbip_la-usbip_host_driver.lo
> > +libsrc/libusbip_la-usbip_monitor.lo
> >   libsrc/libusbip_la-vhci_driver.lo
> >   src/usbip
> >   src/usbipd
> > diff --git a/tools/usb/usbip/libsrc/Makefile.am b/tools/usb/usbip/libsrc/Makefile.am
> > index dabd2c91d311..3e31e33729cf 100644
> > --- a/tools/usb/usbip/libsrc/Makefile.am
> > +++ b/tools/usb/usbip/libsrc/Makefile.am
> > @@ -8,4 +8,5 @@ libusbip_la_SOURCES := names.c names.h usbip_host_driver.c usbip_host_driver.h \
> >   		       usbip_device_driver.c usbip_device_driver.h \
> >   		       usbip_common.c usbip_common.h usbip_host_common.h \
> >   		       usbip_host_common.c vhci_driver.c vhci_driver.h \
> > -		       sysfs_utils.c sysfs_utils.h
> > +		       sysfs_utils.c sysfs_utils.h \
> > +		       usbip_monitor.c
> > diff --git a/tools/usb/usbip/libsrc/usbip_common.h b/tools/usb/usbip/libsrc/usbip_common.h
> > index 73a367a7fa10..13f1d4ca47c5 100644
> > --- a/tools/usb/usbip/libsrc/usbip_common.h
> > +++ b/tools/usb/usbip/libsrc/usbip_common.h
> > @@ -30,6 +30,7 @@
> > 
> >   /* kernel module names */
> >   #define USBIP_CORE_MOD_NAME	"usbip-core"
> > +#define USBIP_USB_DRV_NAME	"usb"
> 
> Shouldn't this be usb-monitor?

USBIP_USB_DRV_NAME is for targeting driver "usb" that was missing here.

> 
> >   #define USBIP_HOST_DRV_NAME	"usbip-host"
> >   #define USBIP_DEVICE_DRV_NAME	"usbip-vudc"
> >   #define USBIP_VHCI_DRV_NAME	"vhci_hcd"
> > diff --git a/tools/usb/usbip/libsrc/usbip_monitor.c b/tools/usb/usbip/libsrc/usbip_monitor.c
> > new file mode 100644
> > index 000000000000..ce60069d86ca
> > --- /dev/null
> > +++ b/tools/usb/usbip/libsrc/usbip_monitor.c
> > @@ -0,0 +1,159 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/**
> > + * Copyright (C) 2021 Lars Gunnarsson
> 
> Add your email as well here. This should look like the Singed-off-by

Will fix this.

> 
> > + */
> > +#include <libudev.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/poll.h>
> > +
> > +#include "usbip_monitor.h"
> > +
> > +struct usbip_monitor {
> > +	const char *busid;
> > +	int timeout_ms;
> > +	struct udev *udev;
> > +	struct udev_monitor *udev_monitor;
> > +};
> > +
> > +usbip_monitor_t *usbip_monitor_new(void)
> > +{
> > +	usbip_monitor_t *monitor = NULL;
> > +	struct udev *udev = udev_new();
> > +
> > +	if (udev) {
> > +		struct udev_monitor *udev_monitor =
> > +			udev_monitor_new_from_netlink(udev, "udev");
> > +		udev_monitor_filter_add_match_subsystem_devtype(
> 
> This looks odd and not readable. The name is very long.

This is part of udev api (libudev.h) and unfortunately out of my hands.

> 
> 
> > +			udev_monitor,
> > +			/*subsystem=*/"usb",
> > +			/*devtype=*/"usb_device");
> 
> These comments look odd.

Will remove these.

> 
> > +		udev_monitor_enable_receiving(udev_monitor);
> > +		monitor = malloc(sizeof(struct usbip_monitor));
> > +		monitor->busid = NULL;
> > +		monitor->timeout_ms = -1;
> > +		monitor->udev = udev;
> > +		monitor->udev_monitor = udev_monitor;
> > +	}
> > +	return monitor;
> > +}
> > +
> > +void usbip_monitor_delete(usbip_monitor_t *monitor)
> > +{
> > +	if (monitor) {
> > +		udev_monitor_unref(monitor->udev_monitor);
> > +		udev_unref(monitor->udev);
> > +		free(monitor);
> > +	}
> > +}
> > +
> > +void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid)
> > +{
> > +	monitor->busid = busid;
> > +}
> > +
> > +void usbip_monitor_set_timeout(usbip_monitor_t *monitor, int milliseconds)
> > +{
> > +	monitor->timeout_ms = milliseconds;
> > +}
> > +
> > +static struct udev_device *await_udev_event(const usbip_monitor_t *monitor)
> > +{
> > +	struct udev_device *dev = NULL;
> > +	int fd = udev_monitor_get_fd(monitor->udev_monitor);
> 
> Why not check if monitor is null?

Will fix this.

> 
> > +	const int nfds = 1;
> > +	struct pollfd pollfd[] = { { fd, POLLIN, 0 } };
> > +	int nfd = poll(pollfd, nfds, monitor->timeout_ms);
> > +
> > +	if (nfd)
> > +		dev = udev_monitor_receive_device(monitor->udev_monitor);
> > +	return dev;
> > +}
> > +
> > +static int optional_filter_busid(const char *busid, const char *udev_busid)
> > +{
> > +	int filter_match = 0;
> > +
> > +	if (busid) {
> > +		if (strcmp(busid, udev_busid) == 0)
> > +			filter_match = 1;
> > +	} else {
> > +		filter_match = 1;
> > +	}
> > +	return filter_match;
> > +}
> > +
> > +static bool await_usb_with_driver(const usbip_monitor_t *monitor,
> > +				  const char *driver, const char *action)
> > +{
> > +	bool event_occured = false;
> > +
> > +	while (!event_occured) {
> > +		struct udev_device *dev = await_udev_event(monitor);
> > +
> > +		if (dev) {
> > +			const char *udev_action = udev_device_get_action(dev);
> > +			const char *udev_driver = udev_device_get_driver(dev);
> > +			const char *udev_busid = udev_device_get_sysname(dev);
> > +
> > +			if (strcmp(udev_action, action) == 0 &&
> > +			    strcmp(udev_driver, driver) == 0) {
> > +				if (optional_filter_busid(monitor->busid,
> > +							  udev_busid)) {
> > +					event_occured = true;
> > +				}
> > +			}
> > +			udev_device_unref(dev);
> > +		} else {
> > +			break;
> > +		}
> > +	}
> > +	return event_occured;
> > +}
> > +
> > +bool usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
> > +				 const char *driver)
> > +{
> > +	return await_usb_with_driver(monitor, driver, "add");
> > +}
> > +
> > +bool usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
> > +				  const char *driver)
> > +{
> > +	return await_usb_with_driver(monitor, driver, "bind");
> > +}
> > +
> > +static bool await_usb(const usbip_monitor_t *monitor, const char *action)
> > +{
> > +	bool event_occured = false;
> > +
> > +	while (!event_occured) {
> > +		struct udev_device *dev = await_udev_event(monitor);
> > +
> > +		if (dev) {
> > +			const char *udev_action = udev_device_get_action(dev);
> > +			const char *udev_busid = udev_device_get_sysname(dev);
> > +
> > +			if (strcmp(udev_action, action) == 0) {
> > +				if (optional_filter_busid(monitor->busid,
> > +							  udev_busid)) {
> > +					event_occured = true;
> > +				}
> > +			}
> > +			udev_device_unref(dev);
> > +		} else {
> > +			break;
> > +		}
> > +	}
> > +	return event_occured;
> > +}
> > +
> > +bool usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor)
> > +{
> > +	return await_usb(monitor, "unbind");
> > +}
> > +
> > +bool usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor)
> > +{
> > +	return await_usb(monitor, "delete");
> > +}
> > diff --git a/tools/usb/usbip/libsrc/usbip_monitor.h b/tools/usb/usbip/libsrc/usbip_monitor.h
> > new file mode 100644
> > index 000000000000..750abb6b79e0
> > --- /dev/null
> > +++ b/tools/usb/usbip/libsrc/usbip_monitor.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/**
> > + * Copyright (C) 2021 Lars Gunnarsson
> > + */
> > +#ifndef __USBIP_MONITOR_H
> > +#define __USBIP_MONITOR_H
> > +
> > +#include <stdbool.h>
> > +
> > +typedef struct usbip_monitor usbip_monitor_t;
> > +
> > +usbip_monitor_t *usbip_monitor_new(void);
> > +void usbip_monitor_delete(usbip_monitor_t *monitor);
> > +
> > +/**
> > + * Set busid to await events on. If unset, any busid will be matched.
> > + */
> > +void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid);
> > +
> > +/**
> > + * Set timeout for await calls in milliseconds, default is no timeout (-1).
> > + */
> > +void usbip_monitor_set_timeout(usbip_monitor_t *monitor, int milliseconds);
> > +
> > +/**
> > + * Functions below is blocking. Returns true if event occurred, or false on
> > + * timeouts.
> > + */
> > +bool usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
> > +				 const char *driver);
> > +bool usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
> > +				  const char *driver);
> > +bool usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor);
> > +bool usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor);
> > +
> > +#endif /* __USBIP_MONITOR_H */
> > --
> > 2.25.1
> > 
> > 
> 
> thanks,
> -- Shuah
