Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F78D43D7B1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 01:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhJ0Xrp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 19:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJ0Xrn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 19:47:43 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7054CC061570
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 16:45:17 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 71-20020a9d034d000000b00553e24ce2b8so1332859otv.7
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=rT9VEEOCdCO3Go/c/4JCR+aokeCoPWZ7u0gNaqT7G+4=;
        b=dUXxWdxII7VT9qki0rtIM4j6hk58QeKaDWI63wn76TUW0i7kACQbmSV7FLIiE7a4ho
         GdGplOC//FqGuvR38Gjl3Pxlq7d+NMjtjss3VH6xdq3Mco+EDcV6bkG4PlqZZ2n4S/yR
         I3F/8f/SMS6o0N8zP9YNfYAb50JsBuyWMuN9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rT9VEEOCdCO3Go/c/4JCR+aokeCoPWZ7u0gNaqT7G+4=;
        b=TOwfUbunZptDLWUVTpLHALPD3LBpLa0uyKpUvwCVANOYNi/cckpcCU/oL3+DpwCB7X
         C9+cobe2UzxrwmIOnPwZ5ShkTKD+NgsE0T4ZRZtYI8YSy4hnMYYCxrQrIM+ylvXHlhA9
         I5sVwcdNy+hp97Ub2WEUE4ZK3hRCHN8o4nIKmYCDMQ+oVRCRefD+K5PmvhAVckops28l
         QCd5Hv51bexYU+DrATy6TjmsmJjcdf0TxTkEJbzQ0pFwQld/vh2iDeBcQA23+KGJUsZj
         YavwdOGkK86Wykp1ewy81R6nVvdbFGvAMqZ81Rl6AtnDZ+zLHritd8EEd6MWeCZZELns
         hKvg==
X-Gm-Message-State: AOAM533E4WsrGH4rwSDd38Yv/d7Jxbdcafd16AMZ3tBNM3KIT3ODYTWu
        hZRWSI5vUdnb9zRcwI914cdMtA==
X-Google-Smtp-Source: ABdhPJy8zvOZopb7pYJFnfnHkUFxBr0scAWv6wGJXV2A22wqk7Pg6saPgi0sZeNza8+P1NXuikyexA==
X-Received: by 2002:a9d:22c6:: with SMTP id y64mr670375ota.7.1635378316736;
        Wed, 27 Oct 2021 16:45:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id g15sm550700oiy.8.2021.10.27.16.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 16:45:15 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] tools/usbip: export USB devices on a given bus
 persistently
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211027193134.GA16336@dell-precision-T3610>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <023379da-d2c7-21b3-f283-917d20e56c9d@linuxfoundation.org>
Date:   Wed, 27 Oct 2021 17:45:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211027193134.GA16336@dell-precision-T3610>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/27/21 1:31 PM, Lars Gunnarsson wrote:
> This patch extends the command "usbip bind" with flag "-p|--persistent". When
> this flag is used, devices on a given busid becomes exported when plugged in,
> instead of returning an error if the device is not available. When the usb
> device is unplugged, it will start monitor the bus again.
> 
> Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> ---
> v2: Change title, fix style warnings, improve feature description, refactor
>      cmdline flag usage.
> v3: Change title and description.
> 
>   Documentation/usb/usbip_protocol.rst |   5 ++
>   tools/usb/usbip/src/usbip_bind.c     | 114 +++++++++++++++++++++------
>   2 files changed, 94 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> index 0b8541fda4d8..2ed7d97278e8 100644
> --- a/Documentation/usb/usbip_protocol.rst
> +++ b/Documentation/usb/usbip_protocol.rst
> @@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
>   USB devices and the clients import them. The device driver for the exported
>   USB device runs on the client machine.
> 
> +Initially the server may choose to export any of its available USB devices,
> +based on the busid. The device will remain exported until it's unplugged or
> +unbound from the usbip driver. It is also possible to persistently export
> +devices on a given bus by monitor when they are plugged in.
> +
>   The client may ask for the list of the exported USB devices. To get the list the
>   client opens a TCP/IP connection to the server, and sends an OP_REQ_DEVLIST
>   packet on top of the TCP/IP connection (so the actual OP_REQ_DEVLIST may be sent
> diff --git a/tools/usb/usbip/src/usbip_bind.c b/tools/usb/usbip/src/usbip_bind.c
> index f1cf9225a69c..fd4ccbfce6c6 100644
> --- a/tools/usb/usbip/src/usbip_bind.c
> +++ b/tools/usb/usbip/src/usbip_bind.c
> @@ -8,12 +8,14 @@
> 
>   #include <errno.h>
>   #include <stdio.h>
> +#include <stdbool.h>
>   #include <stdlib.h>
>   #include <string.h>
> 
>   #include <getopt.h>
> 
>   #include "usbip_common.h"
> +#include "usbip_monitor.h"
>   #include "utils.h"
>   #include "usbip.h"
>   #include "sysfs_utils.h"
> @@ -24,10 +26,17 @@ enum unbind_status {
>   	UNBIND_ST_FAILED
>   };
> 
> +struct bind_options {
> +	char *busid;
> +	bool is_persistent;
> +};
> +
>   static const char usbip_bind_usage_string[] =
>   	"usbip bind <args>\n"
> -	"    -b, --busid=<busid>    Bind " USBIP_HOST_DRV_NAME ".ko to device "
> -	"on <busid>\n";
> +	"    -b, --busid=<busid>        Bind " USBIP_HOST_DRV_NAME ".ko to device\n"
> +	"                               on <busid>\n"
> +	"    -p, --persistent           Persistently monitor the given bus and\n"
> +	"                               export USB devices plugged in\n";
> 
>   void usbip_bind_usage(void)
>   {
> @@ -127,29 +136,26 @@ static int unbind_other(char *busid)
>   	return status;
>   }
> 
> -static int bind_device(char *busid)
> +static const char *get_device_devpath(char *busid)
>   {
> -	int rc;
> -	struct udev *udev;
> -	struct udev_device *dev;
> -	const char *devpath;
> +	struct udev *udev = udev_new();
> +	const char *devpath = NULL;
> +	struct udev_device *dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
> 
> -	/* Check whether the device with this bus ID exists. */
> -	udev = udev_new();
> -	dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
> -	if (!dev) {
> -		err("device with the specified bus ID does not exist");
> -		return -1;
> -	}
> -	devpath = udev_device_get_devpath(dev);
> +	if (dev)
> +		devpath = udev_device_get_devpath(dev);
>   	udev_unref(udev);
> +	return devpath;
> +}
> 
> -	/* If the device is already attached to vhci_hcd - bail out */
> -	if (strstr(devpath, USBIP_VHCI_DRV_NAME)) {
> -		err("bind loop detected: device: %s is attached to %s\n",
> -		    devpath, USBIP_VHCI_DRV_NAME);
> -		return -1;
> -	}
> +static bool is_usb_connected(char *busid)
> +{
> +	return get_device_devpath(busid) != NULL;

Let's make this easier to read. I see what you are doing here.
Just make it easier to read.


> +}
> +
> +static int bind_available_device(char *busid)
> +{
> +	int rc;
> 
>   	rc = unbind_other(busid);
>   	if (rc == UNBIND_ST_FAILED) {
> @@ -174,36 +180,94 @@ static int bind_device(char *busid)
>   		return -1;
>   	}
> 
> -	info("bind device on busid %s: complete", busid);
> +	info("device on busid %s: bind complete", busid);
> 
>   	return 0;
>   }
> 
> +static int bind_device(char *busid)
> +{
> +	const char *devpath = get_device_devpath(busid);
> +
> +	/* Check whether the device with this bus ID exists. */
> +	if (!devpath) {
> +		err("device with the specified bus ID does not exist");
> +		return -1;
> +	}
> +
> +	/* If the device is already attached to vhci_hcd - bail out */
> +	if (strstr(devpath, USBIP_VHCI_DRV_NAME)) {
> +		err("bind loop detected: device: %s is attached to %s\n",
> +		    devpath, USBIP_VHCI_DRV_NAME);
> +		return -1;
> +	}
> +
> +	return bind_available_device(busid);
> +}
> +
> +static int bind_device_persistently(char *busid)
> +{
> +	int rc = 0;
> +	bool already_connected = is_usb_connected(busid);
> +	usbip_monitor_t *monitor = monitor = usbip_monitor_new();
> +
> +	usbip_monitor_set_busid(monitor, busid);
> +	while (rc == 0) {
> +		if (!already_connected) {
> +			info("device on busid %s: monitor connect", busid);
> +			usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
> +		}
> +		rc = bind_available_device(busid);
> +		if (rc == 0) {
> +			info("device on busid %s: monitor disconnect", busid);
> +			usbip_monitor_await_usb_bind(monitor, USBIP_HOST_DRV_NAME);
> +			usbip_monitor_await_usb_unbind(monitor);
> +		}
> +		already_connected = false;
> +	}
> +	usbip_monitor_delete(monitor);
> +	return rc;
> +}
> +
>   int usbip_bind(int argc, char *argv[])
>   {
>   	static const struct option opts[] = {
>   		{ "busid", required_argument, NULL, 'b' },
> +		{ "persistent",  no_argument, NULL, 'p' },
>   		{ NULL,    0,                 NULL,  0  }
>   	};
> 
> +	struct bind_options options = {};
>   	int opt;
>   	int ret = -1;
> 
>   	for (;;) {
> -		opt = getopt_long(argc, argv, "b:", opts, NULL);
> +		opt = getopt_long(argc, argv, "b:p", opts, NULL);
> 
>   		if (opt == -1)
>   			break;
> 
>   		switch (opt) {
>   		case 'b':
> -			ret = bind_device(optarg);
> -			goto out;
> +			options.busid = optarg;
> +			break;
> +		case 'p':
> +			options.is_persistent = true;
> +			break;
>   		default:
>   			goto err_out;
>   		}
>   	}
> 
> +	if (!options.busid)
> +		goto err_out;
> +
> +	if (options.is_persistent)
> +		ret = bind_device_persistently(options.busid);
> +	else
> +		ret = bind_device(options.busid);
> +	goto out;
> +
>   err_out:
>   	usbip_bind_usage();
>   out:
> --
> 2.25.1
> 
> 

thanks,
-- Shuah
