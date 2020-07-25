Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3C822D838
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 16:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgGYOvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 10:51:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38997 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726904AbgGYOvo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 10:51:44 -0400
Received: (qmail 1421399 invoked by uid 1000); 25 Jul 2020 10:51:43 -0400
Date:   Sat, 25 Jul 2020 10:51:43 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/3] USB: Also check for ->match
Message-ID: <20200725145143.GB1421097@rowland.harvard.edu>
References: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 11:14:07AM +0200, Bastien Nocera wrote:
> We only ever used a the ID table matching before, but we should probably
> also support an open-coded match function.
> 
> Fixes: 88b7381a939de ("USB: Select better matching USB drivers when available")
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/generic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index b6f2d4b44754..2b2f1ab6e36a 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -205,8 +205,9 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
>  	udrv = to_usb_device_driver(drv);
>  	if (udrv == &usb_generic_driver)
>  		return 0;
> -
> -	return usb_device_match_id(udev, udrv->id_table) != NULL;
> +	if (usb_device_match_id(udev, udrv->id_table) != NULL)
> +		return 1;
> +	return (udrv->match && udrv->match(udev));
>  }
>  
>  static bool usb_generic_driver_match(struct usb_device *udev)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

You know, at some point it would be nice to change the name of this 
function.  __check_usb_generic doesn't explain very well what the 
function actually does: It checks to see whether the driver is 
non-generic and matches the device.  Something like 
check_for_non_generic_match would be a lot better.

Alan Stern
