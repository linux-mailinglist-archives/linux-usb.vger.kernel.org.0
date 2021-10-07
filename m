Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83888425E68
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 23:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbhJGVGD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 17:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhJGVGC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Oct 2021 17:06:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F4BC061570
        for <linux-usb@vger.kernel.org>; Thu,  7 Oct 2021 14:04:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y15so30358286lfk.7
        for <linux-usb@vger.kernel.org>; Thu, 07 Oct 2021 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oGYvm3xhNdNortsl5NWQ+JLbnaeeRWwYjjejsg70jt8=;
        b=Rbtq726D/kV6VqUuwMv49SsdRPV8uqHMP9pDBHU5TO2+Cp+UbkCYRXH+hL+zjIwVqR
         RNNMkJmGlhWQpWjDKlcbQWUIX2rzETvvkazMjEcqCXmqExzxjU/4IUlDhoS6zMyBAdZo
         XWtBDd38McvynyGvvJZC7BgSpLs2QFuh5ny0HPu0Dq+dFylXvyAImP+YBJVecdGWrRQU
         6/FLQwk7/YWqkWx+JwwUg0r62Ywfu6RwyuXHkQNQMWhUvvPRBZT/kiQgoCWNhNlvwLIw
         r2dmdLD1+08QKTo/pGcMJY++hdjHfl7770Sd+YiQ11OmwpWzSBC4CmPdXxErGdoVIfrH
         7m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oGYvm3xhNdNortsl5NWQ+JLbnaeeRWwYjjejsg70jt8=;
        b=teIwjKwEcs9vfvUWH6vrYPhMokckRICSCfFMXVIJw5Yf4023mK9qqYxpuhHoin8zmU
         gnaNMSMRzDWpDZ9tsGLZpp0HTyqkGPYQwB9cmHhHrnsSYsntIaMaDD4c2B+1Tn3U+r3K
         pMO/InsQ8JlB0I+uz/fOAY5XpCYcHT2JB/qtOowjiMa9e/SKv2SG/BUAHFb+KORWKSZz
         RVH1eOtBQMKBsD5GvvRKg0Xu46c+Pdx/TfK63x+bcmodaP6t2wIdOFO1US3iipdCcSaZ
         z0CC7/aM4dGIHr2ldbM4zPo4xXbZXjEO96qoZfxQNujrrZaaHEbqHtJSu3SdbyPn5J7y
         YYXw==
X-Gm-Message-State: AOAM532AANTJUUWtir9l8L47+sUhg2NkdaWqk+bH9Bnj7643J2ixG/YY
        fZabl452H04Y8MJUTdNfVD0=
X-Google-Smtp-Source: ABdhPJzfIIhQtlf/2lbidW/K3MFOKfGbyEoo6VqmPY+5K9RL8rIfjY51txf/v0oo9cKaA6ykf7Xr4w==
X-Received: by 2002:a05:651c:17a5:: with SMTP id bn37mr6973656ljb.514.1633640646565;
        Thu, 07 Oct 2021 14:04:06 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id m23sm43104lji.132.2021.10.07.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 14:04:06 -0700 (PDT)
Date:   Thu, 7 Oct 2021 23:04:04 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 1/3] tools/usbip: support use case reconnect: prepare
Message-ID: <20211007210404.GA4607@dell-precision-T3610>
References: <20211006204817.GA43927@dell-precision-T3610>
 <74efa67e-2b2e-3a6e-3bc0-dbbb25197eef@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74efa67e-2b2e-3a6e-3bc0-dbbb25197eef@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Shuah,

Thanks for the comments and for quick response. I'll send a new
patch set from the comments.

Best regards, Lars

On Wed, Oct 06, 2021 at 05:37:15PM -0600, Shuah Khan wrote:
> On 10/6/21 2:48 PM, Lars Gunnarsson wrote:
> > This patch implements an usb monitor into libusbip to await usb events,
> > example connect and disconnect.
> > 
> 
> Please describe the use-case adding more details. When and how user
> would use this?
> 
> This will also require doc and man page changes.
> 
> > Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> > ---
> >   tools/usb/usbip/.gitignore             |   1 +
> >   tools/usb/usbip/libsrc/Makefile.am     |   3 +-
> >   tools/usb/usbip/libsrc/usbip_common.h  |   1 +
> >   tools/usb/usbip/libsrc/usbip_monitor.c | 147 +++++++++++++++++++++++++
> >   tools/usb/usbip/libsrc/usbip_monitor.h |  21 ++++
> >   5 files changed, 172 insertions(+), 1 deletion(-)
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
> > +++ b/tools/usb/usbip/libsrc/usbip_common.hudev_driver
> > @@ -30,6 +30,7 @@
> >   /* kernel module names */
> >   #define USBIP_CORE_MOD_NAME	"usbip-core"
> > +#define USBIP_USB_DRV_NAME	"usb"
> >   #define USBIP_HOST_DRV_NAME	"usbip-host"
> >   #define USBIP_DEVICE_DRV_NAME	"usbip-vudc"
> >   #define USBIP_VHCI_DRV_NAME	"vhci_hcd"
> > diff --git a/tools/usb/usbip/libsrc/usbip_monitor.c b/tools/usb/usbip/libsrc/usbip_monitor.c
> > new file mode 100644
> > index 000000000000..731d344f2965
> > --- /dev/null
> > +++ b/tools/usb/usbip/libsrc/usbip_monitor.c
> > @@ -0,0 +1,147 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> I am seeing several coding style problems in these patches.
> inclduing Improper SPDX comment style
> 
> > +/**
> > + * Copyright (C) 2021 Lars Gunnarsson
> > + */
> > +#include <libudev.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/poll.h>
> > +
> > +#include "usbip_monitor.h"
> > +
> > +static const size_t MAX_STRLEN = 32;
> 
> Let's not add new constants. Take a look at how existing code
> is checking return values for udev_device_get_action(),
> udev_device_get_driver() and udev_device_get_sysname() and match
> it.
> 
> > +
> > +struct usbip_monitor {
> > +	const char *busid;
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
> > +			udev_monitor,
> > +			/*subsystem=*/"usb",
> > +			/*devtype=*/"usb_device");
> > +		udev_monitor_enable_receiving(udev_monitor);
> > +		monitor = malloc(sizeof(struct usbip_monitor));
> > +		monitor->busid = NULL;
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
> > +static struct udev_device *await_udev_event(const usbip_monitor_t *monitor)
> > +{
> > +	struct udev_device *dev = NULL;
> > +	int fd = udev_monitor_get_fd(monitor->udev_monitor);
> > +	const int timeout = -1;
> > +	const int nfds = 1; // number of file descriptors
> > +	struct pollfd pollfd[] = { { fd, POLLIN, 0 } };
> > +	int nfd = poll(pollfd, nfds, timeout);
> > +
> > +	if (nfd) {
> > +		dev = udev_monitor_receive_device(monitor->udev_monitor);
> > +	}
> > +	return dev;
> > +}
> > +
> > +static int optional_filter_busid(const char *busid, const char *udev_busid)
> > +{
> > +	int filter_match = 0;
> > +
> > +	if (busid) {
> > +		if (strncmp(busid, udev_busid, MAX_STRLEN) == 0) {
> > +			filter_match = 1;
> > +		}
> > +	} else {
> > +		filter_match = 1;
> > +	}
> > +	return filter_match;
> > +}
> > +
> > +static void await_usb_with_driver(const usbip_monitor_t *monitor,
> > +				  const char *driver, const char *action)
> > +{
> > +	while (1) {
> > +		struct udev_device *dev = await_udev_event(monitor);
> > +
> > +		if (dev) {
> > +			const char *udev_action = udev_device_get_action(dev);
> > +			const char *udev_driver = udev_device_get_driver(dev);
> > +			const char *udev_busid = udev_device_get_sysname(dev);
> > +
> > +			if (strncmp(udev_action, action, MAX_STRLEN) == 0 &&
> > +			    strncmp(udev_driver, driver, MAX_STRLEN) == 0) {
> 
> Braces {} are not necessary for single statement blocks
> 
> > +				if (optional_filter_busid(monitor->busid,
> > +							  udev_busid)) {
> > +					break;
> > +				}
> > +			}
> > +			udev_device_unref(dev);
> > +		}
> > +	}
> > +}
> > +
> > +void usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
> > +				 const char *driver)
> > +{
> > +	await_usb_with_driver(monitor, driver, "add");
> > +}
> > +
> > +void usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
> > +				  const char *driver)
> > +{
> > +	await_usb_with_driver(monitor, driver, "bind");
> > +}
> > +
> > +static void await_usb(const usbip_monitor_t *monitor, const char *action)
> > +{
> > +	while (1) {
> > +		struct udev_device *dev = await_udev_event(monitor);
> > +
> > +		if (dev) {
> > +			const char *udev_action = udev_device_get_action(dev);
> > +			const char *udev_busid = udev_device_get_sysname(dev);
> > +
> > +			if (strncmp(udev_action, action, MAX_STRLEN) == 0) {
> > +				if (optional_filter_busid(monitor->busid,
> > +							  udev_busid)) {
> > +					break;
> > +				}
> > +			}
> > +			udev_device_unref(dev);
> > +		}
> > +	}
> > +}
> > +
> > +void usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor)
> > +{
> > +	await_usb(monitor, "unbind");
> > +}
> > +
> > +void usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor)
> > +{
> > +	await_usb(monitor, "delete");
> > +}
> > diff --git a/tools/usb/usbip/libsrc/usbip_monitor.h b/tools/usb/usbip/libsrc/usbip_monitor.h
> > new file mode 100644
> > index 000000000000..474b95c80452
> > --- /dev/null
> > +++ b/tools/usb/usbip/libsrc/usbip_monitor.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/**
> > + * Copyright (C) 2021 Lars Gunnarsson
> > + */
> > +#ifndef __USBIP_MONITOR_H
> > +#define __USBIP_MONITOR_H
> > +
> > +typedef struct usbip_monitor usbip_monitor_t;
> 
> Let's not add a new typedef
> > +
> > +usbip_monitor_t *usbip_monitor_new(void);
> > +void usbip_monitor_delete(usbip_monitor_t *monitor);
> > +
> > +void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid);
> > +void usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
> > +				 const char *driver);
> > +void usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
> > +				  const char *driver);
> > +void usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor);
> > +void usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor);
> > +
> > +#endif /* __USBIP_MONITOR_H */
> > 
> 
> Please run checkpatch on all of these 3 patches and fix the problems.
> Also add doc and man pages describing the feature you are adding more
> clearly.
> 
> thanks,
> -- Shuah
