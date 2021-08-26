Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D71E3F8690
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 13:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242100AbhHZLdz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 07:33:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234382AbhHZLdy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 07:33:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 680316108D;
        Thu, 26 Aug 2021 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629977587;
        bh=pcAPLPwzI2Dzho8VL6L5TZTd6COx2o0bz9oVA8ZASVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0Yw8y5R3eJVuNd15C8zfc4emnejm57AEbaHabni05kgzsg/+aN2Zc68u/5S9OhuP6
         9FXE24h6NFC4yoD5yv12MnHr2duV8tKUla/uLA/aRcQJ+ksoTtqaB34MCIdpLpNjlm
         Bx9wpSoV5pUHZ6B94YPH2XZrgdmLPJgWgBTZsphY=
Date:   Thu, 26 Aug 2021 13:32:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: hcd: merge repetitive strings in
 usb_hcd_request_irqs()
Message-ID: <YSd76/cyZo6xLq7A@kroah.com>
References: <f6ee0fdf-097b-797f-3f8c-beea7c73496e@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6ee0fdf-097b-797f-3f8c-beea7c73496e@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 21, 2021 at 11:48:38PM +0300, Sergey Shtylyov wrote:
> Two dev_info() calls in usb_hcd_request_irqs() have the same "io " strings
> needlessly repeated. Merge these strings into the format strings of those
> dev_info() calls...
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> The patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...
> 
>  drivers/usb/core/hcd.c |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Index: usb/drivers/usb/core/hcd.c
> ===================================================================
> --- usb.orig/drivers/usb/core/hcd.c
> +++ usb/drivers/usb/core/hcd.c
> @@ -2730,16 +2730,16 @@ static int usb_hcd_request_irqs(struct u
>  			return retval;
>  		}
>  		hcd->irq = irqnum;
> -		dev_info(hcd->self.controller, "irq %d, %s 0x%08llx\n", irqnum,
> -				(hcd->driver->flags & HCD_MEMORY) ?
> -					"io mem" : "io base",
> -					(unsigned long long)hcd->rsrc_start);
> +		dev_info(hcd->self.controller, "irq %d, io %s 0x%08llx\n",
> +				irqnum, (hcd->driver->flags & HCD_MEMORY) ?
> +					"mem" : "base",
> +				(unsigned long long)hcd->rsrc_start);

This now makes it harder to grep for messages in the kernel source :(

As this saves almost no memory, I'll just ignore this patch.

thanks,

greg k-h
