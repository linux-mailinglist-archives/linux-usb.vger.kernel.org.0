Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32A024A04
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 10:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEUIRB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 04:17:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfEUIRA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 04:17:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 039D820863;
        Tue, 21 May 2019 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558426620;
        bh=thn2H1f9CIZ6hWQVZADteKdDowyl9OcvTM0UA5T1Cos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AXonSeynjqm7rjrNJvtMKR2Sw1dDLR0BC/RAfEMSZ3bKhjZg9cXDulpAycKaMTvyl
         AvPxuo9RTEcJoFSiiQxTOfKJozijpnIhsj+HFjIkzuVb/8aC93gzmRr1o2NleOtOSB
         tiX4abrS1L/eoX+S+0pWJCSWOVlnuQbRgv58+w5M=
Date:   Tue, 21 May 2019 10:16:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     laurentiu.tudor@nxp.com
Cc:     hch@lst.de, stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        marex@denx.de, leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de
Subject: Re: [PATCH v4 1/3] USB: use genalloc for USB HCs with local memory
Message-ID: <20190521081657.GA10639@kroah.com>
References: <20190516114721.27694-1-laurentiu.tudor@nxp.com>
 <20190516114721.27694-2-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516114721.27694-2-laurentiu.tudor@nxp.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 16, 2019 at 02:47:19PM +0300, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> For HCs that have local memory, replace the current DMA API usage
> with a genalloc generic allocator to manage the mappings for these
> devices.
> This is in preparation for dropping the existing "coherent" dma
> mem declaration APIs. Current implementation was relying on a short
> circuit in the DMA API that in the end, was acting as an allocator
> for these type of devices.
> 
> For context, see thread here: https://lkml.org/lkml/2019/4/22/357
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
>  drivers/usb/core/buffer.c   | 15 +++++++++++----
>  drivers/usb/host/ohci-hcd.c | 23 ++++++++++++++++++-----
>  include/linux/usb/hcd.h     |  3 +++
>  3 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> index f641342cdec0..22a8f3f5679b 100644
> --- a/drivers/usb/core/buffer.c
> +++ b/drivers/usb/core/buffer.c
> @@ -16,6 +16,7 @@
>  #include <linux/io.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmapool.h>
> +#include <linux/genalloc.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  
> @@ -124,10 +125,12 @@ void *hcd_buffer_alloc(
>  	if (size == 0)
>  		return NULL;
>  
> +	if (hcd->driver->flags & HCD_LOCAL_MEM)
> +		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);

Does this patch now break things?  hcd->localmem_pool at this point in
time is NULL, so this call will fail.  There's no chance for any host
controller driver to actually set up this pool in this patch, so is
bisection broken?

I think you fix this up in later patches, right?

And if so, why do we even need HCD_LOCAL_MEM anymore?  Can't we just
test for the presence of hcd->localmem_pool in order to determine which
allocation method to use?

thanks,

greg k-h
