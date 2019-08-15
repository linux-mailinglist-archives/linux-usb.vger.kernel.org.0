Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C04C8F43C
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 21:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731796AbfHOTQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 15:16:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:38396 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730852AbfHOTQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 15:16:48 -0400
Received: (qmail 6525 invoked by uid 2102); 15 Aug 2019 15:16:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Aug 2019 15:16:47 -0400
Date:   Thu, 15 Aug 2019 15:16:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     gavinli@thegavinli.com
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH] usb: usbfs: only account once for mmap()'ed usb memory
 usage
In-Reply-To: <20190814212924.10381-1-gavinli@thegavinli.com>
Message-ID: <Pine.LNX.4.44L0.1908151513490.1343-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 14 Aug 2019 gavinli@thegavinli.com wrote:

> From: Gavin Li <git@thegavinli.com>
> 
> Memory usage for USB memory allocated via mmap() is already accounted
> for at mmap() time; no need to account for it again at submiturb time.
> 
> Signed-off-by: Gavin Li <git@thegavinli.com>
> ---
>  drivers/usb/core/devio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index bbe9c2edd3e7..9681dd55473b 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1603,7 +1603,8 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
>  	if (as->usbm)
>  		num_sgs = 0;
>  
> -	u += sizeof(struct async) + sizeof(struct urb) + uurb->buffer_length +
> +	u += sizeof(struct async) + sizeof(struct urb) +
> +	     (as->usbm ? 0 : uurb->buffer_length) +
>  	     num_sgs * sizeof(struct scatterlist);
>  	ret = usbfs_increase_memory_usage(u);
>  	if (ret)
> 

Acked-by: Alan Stern <stern@rowland.harvard.edu>

