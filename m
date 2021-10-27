Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBB743D7AA
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 01:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhJ0XoC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 19:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ0XoB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 19:44:01 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37B8C061570
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 16:41:35 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id b188so5795312iof.8
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 16:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=JWdurPVFH+SCNA7swqYIBtIloE6u1PsY588s1tmfUfI=;
        b=Z+q0SvSB2wpsSbaydhDUR7I2R9wNeV58szo52QQrveAQNPIhdTPRCth4K4Pb2fPwTI
         D8H6z+vqO0mBi+iXLt75jFJ1NJ/DgPDPzYeZPFgqOQFjJpordoiXQbJdzZIIsV/1AEwf
         XEJUBqur5QXnEajVu6JAST704KfQGpOiVcYyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JWdurPVFH+SCNA7swqYIBtIloE6u1PsY588s1tmfUfI=;
        b=H/iEmZGNrthPrRExVUyE8HOGX9up8uhfLb0otHv9+dJLBQJUIdI4e7/y97TwiYXjfz
         fFNchrgnwrDLOz9UC329Hlq5SM4dsDx0/5N4ShIPFctWhA23pmGCEIIptCaAU9ShLnIW
         eCa0i5PstMhKXgpHpPvdGdXV0G4WY2PanWPZexePKhrHuXP/GFV2Reeq7++Ph1263/H2
         Y8XdTIVcwO9ucLriiogjeK/aZqK8KbSyJz099QQaCbBPBG5VEeVXsg8wR6ArThvRLNvp
         wkWQ3y7abSg81s7s2QU8Ga9XyjmS5nvL8U3fZpO/f+r3M0RnriRIrhKIK+NZxyjXm7SS
         KGyw==
X-Gm-Message-State: AOAM530KEm7xJnBeEzGRJ8mJAghRBSdflVmoVwLxwSEGAr+3pOF3MCSL
        tVpms9ClyiGaEjtiW4YF5a00Ew==
X-Google-Smtp-Source: ABdhPJw+xfrIbgOBP2Shlh+6KJsWSzTG249Tr58Zv3CfJu/hU5ptinbdkx6JenMuarDvqJnB2Di2Ig==
X-Received: by 2002:a5d:8056:: with SMTP id b22mr452259ior.68.1635378095086;
        Wed, 27 Oct 2021 16:41:35 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o10sm638515ilc.56.2021.10.27.16.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 16:41:34 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] tools/usbip: add usb event monitor into libusbip
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211027193054.GA16215@dell-precision-T3610>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4ce25514-8ba1-c991-9dc9-2ff78d41249f@linuxfoundation.org>
Date:   Wed, 27 Oct 2021 17:41:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211027193054.GA16215@dell-precision-T3610>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/27/21 1:30 PM, Lars Gunnarsson wrote:
> This patch implements an usb monitor into libusbip to synchronously wait for usb
> events. The api is used in coming patches to allow "usbip bind" to export
> device and "usbip attach" to import device, based on udev evens

events?

Example of
> api usage:
> 
> // wait for an usb divce to be plugged in:
> usbip_monitor_t *monitor = usbip_monitor_new();
> usbip_monitor_set_busid(monitor, "3-3.1.2.3");
> usbip_monitor_await_usb_bind(monitor, "usb");  // this is a blocking call
> // usb device with busid 3-3.1.2.3 is now bound to driver "usb".
> usbip_monitor_delete(monitor);
> 

Whe and where should this API be used? Can you describe how this API
fits into the usbip host and clinet sides?

> Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> ---
> v2: Change title, fix style warnings, improve feature description, add timeout
>     into usbip_monitor.
> v3: Change title and description.
> 
> Justifications of remaining warnings from "scripts/checkpatch.pl":
> 
> * Exception according to Linux kernel coding style 5.a where
>    "usbip_monitor_t" is a totally opaque object:
> 
>    WARNING: do not add new typedefs
>    #199: FILE: tools/usb/usbip/libsrc/usbip_monitor.h:8:
>    +typedef struct usbip_monitor usbip_monitor_t;
> 
>   tools/usb/usbip/.gitignore             |   1 +
>   tools/usb/usbip/libsrc/Makefile.am     |   3 +-
>   tools/usb/usbip/libsrc/usbip_common.h  |   1 +
>   tools/usb/usbip/libsrc/usbip_monitor.c | 159 +++++++++++++++++++++++++
>   tools/usb/usbip/libsrc/usbip_monitor.h |  36 ++++++
>   5 files changed, 199 insertions(+), 1 deletion(-)
>   create mode 100644 tools/usb/usbip/libsrc/usbip_monitor.c
>   create mode 100644 tools/usb/usbip/libsrc/usbip_monitor.h
> 
> diff --git a/tools/usb/usbip/.gitignore b/tools/usb/usbip/.gitignore
> index 597361a96dbb..6304adefb5e1 100644
> --- a/tools/usb/usbip/.gitignore
> +++ b/tools/usb/usbip/.gitignore
> @@ -28,6 +28,7 @@ libsrc/libusbip_la-usbip_common.lo
>   libsrc/libusbip_la-usbip_device_driver.lo
>   libsrc/libusbip_la-usbip_host_common.lo
>   libsrc/libusbip_la-usbip_host_driver.lo
> +libsrc/libusbip_la-usbip_monitor.lo
>   libsrc/libusbip_la-vhci_driver.lo
>   src/usbip
>   src/usbipd
> diff --git a/tools/usb/usbip/libsrc/Makefile.am b/tools/usb/usbip/libsrc/Makefile.am
> index dabd2c91d311..3e31e33729cf 100644
> --- a/tools/usb/usbip/libsrc/Makefile.am
> +++ b/tools/usb/usbip/libsrc/Makefile.am
> @@ -8,4 +8,5 @@ libusbip_la_SOURCES := names.c names.h usbip_host_driver.c usbip_host_driver.h \
>   		       usbip_device_driver.c usbip_device_driver.h \
>   		       usbip_common.c usbip_common.h usbip_host_common.h \
>   		       usbip_host_common.c vhci_driver.c vhci_driver.h \
> -		       sysfs_utils.c sysfs_utils.h
> +		       sysfs_utils.c sysfs_utils.h \
> +		       usbip_monitor.c
> diff --git a/tools/usb/usbip/libsrc/usbip_common.h b/tools/usb/usbip/libsrc/usbip_common.h
> index 73a367a7fa10..13f1d4ca47c5 100644
> --- a/tools/usb/usbip/libsrc/usbip_common.h
> +++ b/tools/usb/usbip/libsrc/usbip_common.h
> @@ -30,6 +30,7 @@
> 
>   /* kernel module names */
>   #define USBIP_CORE_MOD_NAME	"usbip-core"
> +#define USBIP_USB_DRV_NAME	"usb"

Shouldn't this be usb-monitor?

>   #define USBIP_HOST_DRV_NAME	"usbip-host"
>   #define USBIP_DEVICE_DRV_NAME	"usbip-vudc"
>   #define USBIP_VHCI_DRV_NAME	"vhci_hcd"
> diff --git a/tools/usb/usbip/libsrc/usbip_monitor.c b/tools/usb/usbip/libsrc/usbip_monitor.c
> new file mode 100644
> index 000000000000..ce60069d86ca
> --- /dev/null
> +++ b/tools/usb/usbip/libsrc/usbip_monitor.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * Copyright (C) 2021 Lars Gunnarsson

Add your email as well here. This should look like the Singed-off-by

> + */
> +#include <libudev.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/poll.h>
> +
> +#include "usbip_monitor.h"
> +
> +struct usbip_monitor {
> +	const char *busid;
> +	int timeout_ms;
> +	struct udev *udev;
> +	struct udev_monitor *udev_monitor;
> +};
> +
> +usbip_monitor_t *usbip_monitor_new(void)
> +{
> +	usbip_monitor_t *monitor = NULL;
> +	struct udev *udev = udev_new();
> +
> +	if (udev) {
> +		struct udev_monitor *udev_monitor =
> +			udev_monitor_new_from_netlink(udev, "udev");
> +		udev_monitor_filter_add_match_subsystem_devtype(

This looks odd and not readable. The name is very long.


> +			udev_monitor,
> +			/*subsystem=*/"usb",
> +			/*devtype=*/"usb_device");

These comments look odd.

> +		udev_monitor_enable_receiving(udev_monitor);
> +		monitor = malloc(sizeof(struct usbip_monitor));
> +		monitor->busid = NULL;
> +		monitor->timeout_ms = -1;
> +		monitor->udev = udev;
> +		monitor->udev_monitor = udev_monitor;
> +	}
> +	return monitor;
> +}
> +
> +void usbip_monitor_delete(usbip_monitor_t *monitor)
> +{
> +	if (monitor) {
> +		udev_monitor_unref(monitor->udev_monitor);
> +		udev_unref(monitor->udev);
> +		free(monitor);
> +	}
> +}
> +
> +void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid)
> +{
> +	monitor->busid = busid;
> +}
> +
> +void usbip_monitor_set_timeout(usbip_monitor_t *monitor, int milliseconds)
> +{
> +	monitor->timeout_ms = milliseconds;
> +}
> +
> +static struct udev_device *await_udev_event(const usbip_monitor_t *monitor)
> +{
> +	struct udev_device *dev = NULL;
> +	int fd = udev_monitor_get_fd(monitor->udev_monitor);

Why not check if monitor is null?

> +	const int nfds = 1;
> +	struct pollfd pollfd[] = { { fd, POLLIN, 0 } };
> +	int nfd = poll(pollfd, nfds, monitor->timeout_ms);
> +
> +	if (nfd)
> +		dev = udev_monitor_receive_device(monitor->udev_monitor);
> +	return dev;
> +}
> +
> +static int optional_filter_busid(const char *busid, const char *udev_busid)
> +{
> +	int filter_match = 0;
> +
> +	if (busid) {
> +		if (strcmp(busid, udev_busid) == 0)
> +			filter_match = 1;
> +	} else {
> +		filter_match = 1;
> +	}
> +	return filter_match;
> +}
> +
> +static bool await_usb_with_driver(const usbip_monitor_t *monitor,
> +				  const char *driver, const char *action)
> +{
> +	bool event_occured = false;
> +
> +	while (!event_occured) {
> +		struct udev_device *dev = await_udev_event(monitor);
> +
> +		if (dev) {
> +			const char *udev_action = udev_device_get_action(dev);
> +			const char *udev_driver = udev_device_get_driver(dev);
> +			const char *udev_busid = udev_device_get_sysname(dev);
> +
> +			if (strcmp(udev_action, action) == 0 &&
> +			    strcmp(udev_driver, driver) == 0) {
> +				if (optional_filter_busid(monitor->busid,
> +							  udev_busid)) {
> +					event_occured = true;
> +				}
> +			}
> +			udev_device_unref(dev);
> +		} else {
> +			break;
> +		}
> +	}
> +	return event_occured;
> +}
> +
> +bool usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
> +				 const char *driver)
> +{
> +	return await_usb_with_driver(monitor, driver, "add");
> +}
> +
> +bool usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
> +				  const char *driver)
> +{
> +	return await_usb_with_driver(monitor, driver, "bind");
> +}
> +
> +static bool await_usb(const usbip_monitor_t *monitor, const char *action)
> +{
> +	bool event_occured = false;
> +
> +	while (!event_occured) {
> +		struct udev_device *dev = await_udev_event(monitor);
> +
> +		if (dev) {
> +			const char *udev_action = udev_device_get_action(dev);
> +			const char *udev_busid = udev_device_get_sysname(dev);
> +
> +			if (strcmp(udev_action, action) == 0) {
> +				if (optional_filter_busid(monitor->busid,
> +							  udev_busid)) {
> +					event_occured = true;
> +				}
> +			}
> +			udev_device_unref(dev);
> +		} else {
> +			break;
> +		}
> +	}
> +	return event_occured;
> +}
> +
> +bool usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor)
> +{
> +	return await_usb(monitor, "unbind");
> +}
> +
> +bool usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor)
> +{
> +	return await_usb(monitor, "delete");
> +}
> diff --git a/tools/usb/usbip/libsrc/usbip_monitor.h b/tools/usb/usbip/libsrc/usbip_monitor.h
> new file mode 100644
> index 000000000000..750abb6b79e0
> --- /dev/null
> +++ b/tools/usb/usbip/libsrc/usbip_monitor.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/**
> + * Copyright (C) 2021 Lars Gunnarsson
> + */
> +#ifndef __USBIP_MONITOR_H
> +#define __USBIP_MONITOR_H
> +
> +#include <stdbool.h>
> +
> +typedef struct usbip_monitor usbip_monitor_t;
> +
> +usbip_monitor_t *usbip_monitor_new(void);
> +void usbip_monitor_delete(usbip_monitor_t *monitor);
> +
> +/**
> + * Set busid to await events on. If unset, any busid will be matched.
> + */
> +void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid);
> +
> +/**
> + * Set timeout for await calls in milliseconds, default is no timeout (-1).
> + */
> +void usbip_monitor_set_timeout(usbip_monitor_t *monitor, int milliseconds);
> +
> +/**
> + * Functions below is blocking. Returns true if event occurred, or false on
> + * timeouts.
> + */
> +bool usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
> +				 const char *driver);
> +bool usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
> +				  const char *driver);
> +bool usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor);
> +bool usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor);
> +
> +#endif /* __USBIP_MONITOR_H */
> --
> 2.25.1
> 
> 

thanks,
-- Shuah
