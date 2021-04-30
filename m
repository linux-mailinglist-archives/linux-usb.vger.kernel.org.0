Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E46936FCE0
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 16:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhD3Otw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 10:49:52 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60485 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232992AbhD3Otw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 10:49:52 -0400
Received: (qmail 528009 invoked by uid 1000); 30 Apr 2021 10:49:03 -0400
Date:   Fri, 30 Apr 2021 10:49:03 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        peter.chen@kernel.org, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 3/3] usb: core: hcd: use map_urb_for_dma for single
 step set feature urb
Message-ID: <20210430144903.GC526617@rowland.harvard.edu>
References: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
 <1619763393-20029-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619763393-20029-3-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 30, 2021 at 02:16:33PM +0800, Li Jun wrote:
> Use map_urb_for_dma() to improve the dma map code for single step
> set feature request urb in test mode.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> change for v2:
> - Add this new patch to use map_urb_for_dma API to
>   replace both of dma_map_single() calls, suggested by
>   Jack Pham.
> 
>  drivers/usb/core/hcd.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index d7eb9f179ca6..0b89a3dc99a3 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2159,16 +2159,8 @@ static struct urb *request_single_step_set_feature_urb(
>  	usb_get_urb(urb);
>  	atomic_inc(&urb->use_count);
>  	atomic_inc(&urb->dev->urbnum);
> -	urb->setup_dma = dma_map_single(
> -			hcd->self.sysdev,
> -			urb->setup_packet,
> -			sizeof(struct usb_ctrlrequest),
> -			DMA_TO_DEVICE);
> -	urb->transfer_dma = dma_map_single(
> -			hcd->self.sysdev,
> -			urb->transfer_buffer,
> -			urb->transfer_buffer_length,
> -			DMA_FROM_DEVICE);
> +	if (map_urb_for_dma(hcd, urb, GFP_KERNEL))
> +		unmap_urb_for_dma(hcd, urb);

That looks awfully weird.  Are you sure about it?

Alan Stern

>  	urb->context = done;
>  	return urb;
>  }
> -- 
> 2.25.1
> 
