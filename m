Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC13474CF0
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 22:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237757AbhLNVEZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 16:04:25 -0500
Received: from netrider.rowland.org ([192.131.102.5]:57371 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231416AbhLNVEY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 16:04:24 -0500
Received: (qmail 760635 invoked by uid 1000); 14 Dec 2021 16:04:23 -0500
Date:   Tue, 14 Dec 2021 16:04:23 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/4] usb: host: ehci-sh: propagate errors from
 platform_get_irq()
Message-ID: <YbkG1yshjHAqwOAw@rowland.harvard.edu>
References: <20211214204247.7172-1-s.shtylyov@omp.ru>
 <20211214204247.7172-4-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214204247.7172-4-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 14, 2021 at 11:42:46PM +0300, Sergey Shtylyov wrote:
> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
> to -ENODEV.  Switch to propagating the error codes upstream.  IRQ0 is no
> longer returned by platform_get_irq(), so we now can safely ignore it...
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-sh.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
> index c25c51d26f26..882231b5c382 100644
> --- a/drivers/usb/host/ehci-sh.c
> +++ b/drivers/usb/host/ehci-sh.c
> @@ -82,8 +82,8 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		ret = -ENODEV;
> +	if (irq < 0) {
> +		ret = irq;
>  		goto fail_create_hcd;
>  	}
>  
> -- 
> 2.26.3
> 
