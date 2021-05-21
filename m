Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143F838C956
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 16:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbhEUOk4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 10:40:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46723 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230239AbhEUOkx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 10:40:53 -0400
Received: (qmail 1241031 invoked by uid 1000); 21 May 2021 10:39:29 -0400
Date:   Fri, 21 May 2021 10:39:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Geoffrey D. Bennett" <g@b4.vu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbfs: remove double evaluation of usb_sndctrlpipe()
Message-ID: <20210521143929.GC1239965@rowland.harvard.edu>
References: <20210521125856.116349-1-g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521125856.116349-1-g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:28:56PM +0930, Geoffrey D. Bennett wrote:
> usb_sndctrlpipe() is evaluated in do_proc_control(), saved in a
> variable, then evaluated again. Use the saved variable instead, to
> match the use of usb_rcvctrlpipe().
> 
> Fixes: 4c6e8971cbe0 ("USB: make the "usbfs_snoop" log more pertinent")
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> ---
>  drivers/usb/core/devio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 533236366a03..4a8ec136460c 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1162,7 +1162,7 @@ static int do_proc_control(struct usb_dev_state *ps,
>  			tbuf, ctrl->wLength);
>  
>  		usb_unlock_device(dev);
> -		i = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), ctrl->bRequest,
> +		i = usb_control_msg(dev, pipe, ctrl->bRequest,
>  				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
>  				    tbuf, ctrl->wLength, tmo);
>  		usb_lock_device(dev);

When you resubmit without the Fixes: tag, you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
