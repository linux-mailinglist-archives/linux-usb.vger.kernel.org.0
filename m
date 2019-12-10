Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B83C11861C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 12:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfLJLWN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 06:22:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:50020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbfLJLWM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 06:22:12 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5FB720663;
        Tue, 10 Dec 2019 11:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575976932;
        bh=QHr+uL0T6qiOS7s8N41BSDV6EaJzmVm5fgYxNamuEzw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nolqByYl/o+OHGg/psxI255kdbnUUW7fzak8nuy57zR6xnle4yWqgSkXFto8KK3rq
         DO+BLpBA13E8NpDBSxLYWu4wiZRmDlsyTOBsa4pNOx614pkZU1IFLiAWgt8mLCBuUo
         KCFzUWATODQDIvCVSSagEEjuMOjFPYG3TM1n1YX0=
Date:   Tue, 10 Dec 2019 12:22:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Fredrik Noring <noring@nocrew.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191210112210.GA3774386@kroah.com>
References: <20191130165055.GA46622@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191130165055.GA46622@sx9>
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
> 
> Fixes: 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/usb/core/hcd.c         | 42 +++++++++++++++++-----------------
>  drivers/usb/storage/scsiglue.c |  3 ++-
>  2 files changed, 23 insertions(+), 22 deletions(-)

This patch doesn't apply against 5.5-rc1, can you refresh it and resend?

thanks,

greg k-h
