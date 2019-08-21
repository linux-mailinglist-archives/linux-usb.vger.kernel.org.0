Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A4D97D00
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 16:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbfHUOaL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 10:30:11 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53346 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729001AbfHUOaK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 10:30:10 -0400
Received: (qmail 2849 invoked by uid 2102); 21 Aug 2019 10:30:10 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Aug 2019 10:30:10 -0400
Date:   Wed, 21 Aug 2019 10:30:10 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Roger Quadros <rogerq@ti.com>
cc:     balbi@kernel.org, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: udc: core: Fix error case while binding
 pending gadget drivers
In-Reply-To: <20190821101201.5377-1-rogerq@ti.com>
Message-ID: <Pine.LNX.4.44L0.1908211027430.1816-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 21 Aug 2019, Roger Quadros wrote:

> If binding a pending gadget driver fails we should not
> remove it from the pending driver list, otherwise it
> will cause a segmentation fault later when the gadget driver is
> unloaded.

> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  drivers/usb/gadget/udc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 7cf34beb50df..c272c8014772 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1142,7 +1142,7 @@ static int check_pending_gadget_drivers(struct usb_udc *udc)
>  		if (!driver->udc_name || strcmp(driver->udc_name,
>  						dev_name(&udc->dev)) == 0) {
>  			ret = udc_bind_to_driver(udc, driver);
> -			if (ret != -EPROBE_DEFER)
> +			if (!ret)
>  				list_del(&driver->pending);
>  			break;
>  		}

This is kind of a policy question.  If binding a pending gadget driver 
fails, should the driver remain pending?

Depending on the answer to this question, you might want to change the 
list_del to list_del_init.  That should fix the segmentation fault 
just as well.

Alan Stern

