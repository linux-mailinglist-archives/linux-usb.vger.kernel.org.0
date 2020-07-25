Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD81222D834
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 16:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgGYOq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 10:46:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47425 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726652AbgGYOq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 10:46:59 -0400
Received: (qmail 1421312 invoked by uid 1000); 25 Jul 2020 10:46:58 -0400
Date:   Sat, 25 Jul 2020 10:46:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] USB: Simplify USB ID table match
Message-ID: <20200725144658.GA1421097@rowland.harvard.edu>
References: <616e0a918957ce9936478574a4856df742c20ad7.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616e0a918957ce9936478574a4856df742c20ad7.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 11:13:12AM +0200, Bastien Nocera wrote:
> usb_device_match_id() supports being passed NULL tables, so no need to
> check for it.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/generic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index 4626227a6dd2..b6f2d4b44754 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -205,8 +205,6 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
>  	udrv = to_usb_device_driver(drv);
>  	if (udrv == &usb_generic_driver)
>  		return 0;
> -	if (!udrv->id_table)
> -		return 0;
>  
>  	return usb_device_match_id(udev, udrv->id_table) != NULL;
>  }

Acked-by: Alan Stern <stern@rowland.harvard.edu>
