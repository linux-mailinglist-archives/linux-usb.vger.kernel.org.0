Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8889B248C77
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 19:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgHRRGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 13:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgHRRGY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 13:06:24 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE190C061342
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 10:06:23 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x24so10580137lfe.11
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gR0Om1LVNUHUKlE3twAktw2nu5wC7Ku9azAmUhrJAB4=;
        b=JueO5pNjg2BJ5MupjkE7Fx4aN9IgnJKfvugDtG8nwLJgygbajwZZrHiHtV5VuVlF9T
         VNZ5dQ4RnTzDvApBVpc93XRW6GlA/UKhki90tLRI0aVhIoWr/F4M03yYl9OLknc/S1F2
         TcUs/WepddmQ3W5CicA4/3iC6T5p1Wonc3C393gVfgoOm/7OT4+Kwj0TRq4oY+ahCtaL
         9tx56ib7TfwNKZtMLNLw8LG4hAzFhtIqTZuA3nzVTFyu3l4zdEbdANZdKHEskhGVGnA0
         MUROE9tDVnh1X1QSWpDfRi+lRTZdZKuaR+O3n/XLGhzczqmKQS1D+xKNk66Ci/SVCb8/
         aQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gR0Om1LVNUHUKlE3twAktw2nu5wC7Ku9azAmUhrJAB4=;
        b=pohLeqiC9Mr2BEGbquVbcWntaudJqN+7r7ACoA/nwxHxwS2PTh+v5qoNDCsbzoIf52
         3Bx9ecRV14bdlltld2JRMWWiAB3zGC7Lh8CkcQ89SSiqSiuSiZMTCeq5mBxvfQhpOp8M
         /QAz18XXNDP2s+GIOX4eMvfCuQC5z/4XkZUGPZ6vw9Y/d62nilKCoIz0sWxuh76Leudr
         9vMWkgv1QRcGV5+lj3ZZFxvUthPKzrihoyrwT7lG9koAaRcur8HBhhvH9wls+0+BH4eu
         B1+nxaCugcmlg/16l3h7wnw31MPyrdXziaTT62b6zOvCSgMv7okoSsyR5QqvFD01kh4e
         TQZQ==
X-Gm-Message-State: AOAM533TPpfcdnS5OpsCQRCsw+LB7DFS6Q5FXIBbkm0gdhYcULpI8XL0
        ydYJNL5KEmdY+sL9l7SAtZge7z0DgEbw5A==
X-Google-Smtp-Source: ABdhPJxLY+S5PW9d61NQt7gtZZ4D2MKIHL8n88G3SyuAw6NzvPQcPhTyn98E22t+hRheET7A37oKZQ==
X-Received: by 2002:a19:bcc:: with SMTP id 195mr10285162lfl.160.1597770382369;
        Tue, 18 Aug 2020 10:06:22 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:424f:ab22:7b8d:b6f2:b3c2:e0c1])
        by smtp.gmail.com with ESMTPSA id f20sm4348627lfc.82.2020.08.18.10.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 10:06:21 -0700 (PDT)
Subject: Re: [PATCH v8 3/3] USB: Fix device driver race
To:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <20200818110445.509668-1-hadess@hadess.net>
 <20200818110445.509668-3-hadess@hadess.net>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
Date:   Tue, 18 Aug 2020 20:06:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818110445.509668-3-hadess@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/18/20 2:04 PM, Bastien Nocera wrote:

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
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
[...]
>  drivers/usb/core/driver.c | 40 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f81606c6a35b..7e73e989645b 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
[...]
> @@ -934,13 +963,20 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
>  
>  	retval = driver_register(&new_udriver->drvwrap.driver);
>  
> -	if (!retval)
> +	if (!retval) {
>  		pr_info("%s: registered new device driver %s\n",
>  			usbcore_name, new_udriver->name);
> -	else
> +		/*
> +		 * Check whether any device could be better served with
> +		 * this new driver
> +		 */
> +		bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
> +				 __usb_bus_reprobe_drivers);
> +	} else {
>  		printk(KERN_ERR "%s: error %d registering device "
>  			"	driver %s\n",

   Unrelated but... hm, this string literal seems weird. GregKH, would it be OK if we fix it?

>  			usbcore_name, retval, new_udriver->name);
> +	}
>  
>  	return retval;
>  }
> 

MBR, Sergei
