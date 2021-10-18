Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F8B4320BB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 16:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhJRO55 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 10:57:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232631AbhJRO5w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Oct 2021 10:57:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92C2061002;
        Mon, 18 Oct 2021 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634568941;
        bh=akaXiLEvmuhG5drvQPLpk3VXBxnzMOz6hOYRD3cPn7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zfPrIvTNvdkx8+zVp9VoDN7/9rMG213ovUW1emZc0/dpwB2LTEMENrQYcypgdU+lZ
         la2gQ5hrwExUkgX0w9YvoYkU+0hjQeOh9PSRCh//Zim5Tg9XZCUO5dzPSfa7g2Meid
         9UAsYbzsQQrpf5Vs5sZndsLvgHsUs6UJsVHiqCGo=
Date:   Mon, 18 Oct 2021 16:55:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: max-3421: Use driver data instead of maintaining a
 list of bound devices
Message-ID: <YW2K6iWveIPAQSiM@kroah.com>
References: <20211018120055.2902897-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018120055.2902897-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 18, 2021 at 02:00:55PM +0200, Uwe Kleine-König wrote:
> Instead of maintaining a single-linked list of devices that must be
> searched linearly in .remove() just use spi_set_drvdata() to remember the
> link between the spi device and the driver struct. Then the global list
> and the next member can be dropped.
> 
> This simplifies the driver, reduces the memory footprint and the time to
> search the list. Also it makes obvious that there is always a corresponding
> driver struct for a given device in .remove(), so the error path for
> !max3421_hcd can be dropped, too.
> 
> As a side effect this fixes a data inconsistency when .probe() races with
> itself for a second max3421 device in manipulating max3421_hcd_list. A
> similar race is fixed in .remove(), too.
> 
> Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/host/max3421-hcd.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 59cc1bc7f12f..3e39f62904af 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -125,8 +125,6 @@ struct max3421_hcd {
>  
>  	struct task_struct *spi_thread;
>  
> -	struct max3421_hcd *next;
> -
>  	enum max3421_rh_state rh_state;
>  	/* lower 16 bits contain port status, upper 16 bits the change mask: */
>  	u32 port_status;
> @@ -174,8 +172,6 @@ struct max3421_ep {
>  	u8 retransmit;			/* packet needs retransmission */
>  };
>  
> -static struct max3421_hcd *max3421_hcd_list;
> -
>  #define MAX3421_FIFO_SIZE	64
>  
>  #define MAX3421_SPI_DIR_RD	0	/* read register from MAX3421 */
> @@ -1881,10 +1877,8 @@ max3421_probe(struct spi_device *spi)
>  		goto error;
>  	}
>  	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> -	max3421_hcd = hcd_to_max3421(hcd);

I don't think you should have deleted this line :(

Did you test this?

thanks,

greg k-h
