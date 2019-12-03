Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A56310F901
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 08:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLCHjX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 02:39:23 -0500
Received: from verein.lst.de ([213.95.11.211]:42262 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727386AbfLCHjX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Dec 2019 02:39:23 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6BCE068BFE; Tue,  3 Dec 2019 08:39:20 +0100 (CET)
Date:   Tue, 3 Dec 2019 08:39:20 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Fredrik Noring <noring@nocrew.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: Fix incorrect DMA allocations for local memory
 pool drivers
Message-ID: <20191203073920.GB23881@lst.de>
References: <20191130165055.GA46622@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191130165055.GA46622@sx9>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 30, 2019 at 05:50:55PM +0100, Fredrik Noring wrote:
> Fix commit 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of
> guestimating DMA capabilities") where local memory USB drivers
> erroneously allocate DMA memory instead of pool memory, causing
> 
> 	OHCI Unrecoverable Error, disabled
> 	HC died; cleaning up
> 
> The order between hcd_uses_dma() and hcd->localmem_pool is now
> arranged as in hcd_buffer_alloc() and hcd_buffer_free(), with the
> test for hcd->localmem_pool placed first.
> 
> As an alternative, one might consider adjusting hcd_uses_dma() with
> 
>  static inline bool hcd_uses_dma(struct usb_hcd *hcd)
>  {
> -	return IS_ENABLED(CONFIG_HAS_DMA) && (hcd->driver->flags & HCD_DMA);
> +	return IS_ENABLED(CONFIG_HAS_DMA) &&
> +		(hcd->driver->flags & HCD_DMA) &&
> +		(hcd->localmem_pool == NULL);
>  }
> 
> One can also consider unsetting HCD_DMA for local memory pool drivers.

That seems like a good idea to me, as the "local DMA pool" really isn't
DMA in the traditional sense.  The host has to copy data into it by MMIO,
and it then is accessed by the device.

But if the usb maintainers prefer your current variant that is ok with
me as well:

Reviewed-by: Christoph Hellwig <hch@lst.de>
