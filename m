Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A906CBAE52
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 09:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404706AbfIWHLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 03:11:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbfIWHLs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 03:11:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 009B42064A;
        Mon, 23 Sep 2019 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569222707;
        bh=51PbSCtllaiBVbks7f9DSDFVXRP6jswAVhXJ7Yj+6tQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hbmNr34GcgayM35xm6AZuaxcc+CSUujtFEyI5x10+DO8/FHpipAQ0P3nXHNRu66nE
         ej03D3BRr2gqp/N1+HoA3gu/hcXtDa3KEXDl3yXKCFuUMIpLqNwHW5R8rzUB6KiN8N
         oT9ors06IRGfy5QkcgXIzuOIkqK1nPbVg8GR2d0k=
Date:   Mon, 23 Sep 2019 09:11:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Austin Kim <austindh.kim@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
        Thinh.Nguyen@synopsys.com, nsaenzjulienne@suse.de,
        jflat@chromium.org, malat@debian.org, dianders@chromium.org
Subject: Re: [PATCH] usb: hub: Minor refactoring in usb_hub_init()
Message-ID: <20190923071145.GB2746429@kroah.com>
References: <20190923061921.GA96726@LGEARND20B15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923061921.GA96726@LGEARND20B15>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 03:19:21PM +0900, Austin Kim wrote:
> Normally when creation of workqueue fails, exception handling takes place
> after the call to alloc_workqueue() is made.
> 
> But looking into usb_hub_init() function, 'return 0' statement is executed,
> when alloc_workqueue() returns valid workqueue pointer.
>        if (hub_wq)
>                return 0;
> 
> This might make other Linux driver developers get confused 
> because they could deduce that this is exceptional handling routine.
> 
> So perform minor refactoring by adding NULL pointer dereference check
> routine right after the call to alloc_workqueue() is made.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  drivers/usb/core/hub.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index e8ebacc..0ddbfe6 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5530,9 +5530,12 @@ int usb_hub_init(void)
>  	 * over to the companion full-speed controller.
>  	 */
>  	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE, 0);
> -	if (hub_wq)
> -		return 0;
> +	if (unlikely(!hub_wq))

Only ever use likely/unlikely if you can measure the difference without
it.  Otherwise the compiler and cpu will almost always do this better
than you.

So please remove this.

> +		goto err_workqueue;
> +
> +	return 0;
>  
> +err_workqueue:
>  	/* Fall through if kernel_thread failed */

This comment is now incorrect.

But really, there is nothing wrong with the original code here.  It
works properly, and while it is not identical to normal code "style"
here, there's nothing wrong with it that I can see.

thanks,

greg k-h
