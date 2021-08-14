Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027E73EBF68
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 03:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbhHNBqQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 21:46:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49537 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236200AbhHNBqP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 21:46:15 -0400
Received: (qmail 56522 invoked by uid 1000); 13 Aug 2021 21:45:47 -0400
Date:   Fri, 13 Aug 2021 21:45:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v3 1/2] usb: host: ohci-tmio: add IRQ check
Message-ID: <20210814014547.GB56183@rowland.harvard.edu>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
 <402e1a45-a0a4-0e08-566a-7ca1331506b1@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <402e1a45-a0a4-0e08-566a-7ca1331506b1@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 13, 2021 at 11:30:18PM +0300, Sergey Shtylyov wrote:
> The driver neglects to check the  result of platform_get_irq()'s call and
> blithely passes the negative error codes to usb_add_hcd() (which takes
> *unsigned* IRQ #), causing request_irq() that it calls to fail with
> -EINVAL, overriding an original error code. Stop calling usb_add_hcd()
> with the invalid IRQ #s.
> 
> Fixes: 78c73414f4f6 ("USB: ohci: add support for tmio-ohci cell")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in version 3:
> - move the IRQ check higher in ohci_hcd_tmio_drv_probe(), to be closer to
>   platfrom_get_irq()'s call.
> 
>  drivers/usb/host/ohci-tmio.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> Index: usb/drivers/usb/host/ohci-tmio.c
> ===================================================================
> --- usb.orig/drivers/usb/host/ohci-tmio.c
> +++ usb/drivers/usb/host/ohci-tmio.c
> @@ -202,6 +202,9 @@ static int ohci_hcd_tmio_drv_probe(struc
>  	if (!cell)
>  		return -EINVAL;
>  
> +	if (irq < 0)
> +		return irq;
> +
>  	hcd = usb_create_hcd(&ohci_tmio_hc_driver, &dev->dev, dev_name(&dev->dev));
>  	if (!hcd) {
>  		ret = -ENOMEM;
