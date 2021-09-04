Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C944F400C05
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 18:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236852AbhIDQNb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 12:13:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59481 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236830AbhIDQNa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Sep 2021 12:13:30 -0400
Received: (qmail 493726 invoked by uid 1000); 4 Sep 2021 12:12:28 -0400
Date:   Sat, 4 Sep 2021 12:12:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Florian Faber <faber@faberman.de>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: Fix possible memleak in usb_add_gadget
Message-ID: <20210904161228.GB493355@rowland.harvard.edu>
References: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 04, 2021 at 05:34:29PM +0200, Florian Faber wrote:
> The memory for the udc structure allocated via kzalloc in line 1295 is not
> freed in the error handling code, leading to a memory leak in case of an
> error.
> 
> Singed-off-by: Florian Faber <faber@faberman.de>
> 
> ---
>  drivers/usb/gadget/udc/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 14fdf918ecfe..a1270a44855a 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1346,6 +1346,8 @@ int usb_add_gadget(struct usb_gadget *gadget)
> 
>   err_put_udc:
>  	put_device(&udc->dev);
> +	kfree(udc);
> +	gadget->udc = NULL;

This is wrong.  The udc structure is deallocated by usb_udc_release() (which 
is called by put_device()); doing it here too would cause a double-free.

Alan Stern
