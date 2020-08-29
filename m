Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CDB2569BB
	for <lists+linux-usb@lfdr.de>; Sat, 29 Aug 2020 20:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgH2SYt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Aug 2020 14:24:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40287 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728265AbgH2SYs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Aug 2020 14:24:48 -0400
Received: (qmail 502162 invoked by uid 1000); 29 Aug 2020 14:24:46 -0400
Date:   Sat, 29 Aug 2020 14:24:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: driver: fix stray tabs in error messages
Message-ID: <20200829182446.GA501978@rowland.harvard.edu>
References: <4beb55c4-eb34-7744-155f-033b8f527e23@omprussia.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4beb55c4-eb34-7744-155f-033b8f527e23@omprussia.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 29, 2020 at 08:30:42PM +0300, Sergey Shtylyov wrote:
> Commit 8bb54ab573ec ("usbcore: add usb_device_driver definition") added
> the printk() calls with the error massages spoilt due to the stray tabs
> in the middle. Remove these tabs and convert printk() calls to pr_err()
> for consistency with the other code, while at it.
> 
> Fixes: 8bb54ab573ec ("usbcore: add usb_device_driver definition")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
> 
> ---
> The patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...
> 
>  drivers/usb/core/driver.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> Index: usb/drivers/usb/core/driver.c
> ===================================================================
> --- usb.orig/drivers/usb/core/driver.c
> +++ usb/drivers/usb/core/driver.c
> @@ -973,8 +973,7 @@ int usb_register_device_driver(struct us
>  		bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
>  				 __usb_bus_reprobe_drivers);
>  	} else {
> -		printk(KERN_ERR "%s: error %d registering device "
> -			"	driver %s\n",
> +		pr_err("%s: error %d registering device driver %s\n",
>  			usbcore_name, retval, new_udriver->name);
>  	}
>  
> @@ -1050,9 +1049,8 @@ out:
>  out_newid:
>  	driver_unregister(&new_driver->drvwrap.driver);
>  
> -	printk(KERN_ERR "%s: error %d registering interface "
> -			"	driver %s\n",
> -			usbcore_name, retval, new_driver->name);
> +	pr_err("%s: error %d registering interface driver %s\n",
> +		usbcore_name, retval, new_driver->name);
>  	goto out;
>  }
>  EXPORT_SYMBOL_GPL(usb_register_driver);

Acked-by: Alan Stern <stern@rowland.harvard.edu>
