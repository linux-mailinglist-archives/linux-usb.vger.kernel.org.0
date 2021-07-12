Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827693C6342
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 21:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236213AbhGLTLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 15:11:47 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56413 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236104AbhGLTLq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 15:11:46 -0400
Received: (qmail 327622 invoked by uid 1000); 12 Jul 2021 15:08:57 -0400
Date:   Mon, 12 Jul 2021 15:08:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ohci-spear: simplify calling usb_add_hcd()
Message-ID: <20210712190857.GC326369@rowland.harvard.edu>
References: <3e4ad969-f2ae-32f7-53fd-ea369f140703@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e4ad969-f2ae-32f7-53fd-ea369f140703@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 12, 2021 at 09:16:07PM +0300, Sergey Shtylyov wrote:
> There is no need to call platform_get_irq() when the driver's probe()
> method calls usb_add_hcd() -- the platform_get_irq()'s result will have
> been stored already in the 'irq' local variable...
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> The patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-spear.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: usb/drivers/usb/host/ohci-spear.c
> ===================================================================
> --- usb.orig/drivers/usb/host/ohci-spear.c
> +++ usb/drivers/usb/host/ohci-spear.c
> @@ -84,7 +84,7 @@ static int spear_ohci_hcd_drv_probe(stru
>  
>  	clk_prepare_enable(sohci_p->clk);
>  
> -	retval = usb_add_hcd(hcd, platform_get_irq(pdev, 0), 0);
> +	retval = usb_add_hcd(hcd, irq, 0);
>  	if (retval == 0) {
>  		device_wakeup_enable(hcd->self.controller);
>  		return retval;
