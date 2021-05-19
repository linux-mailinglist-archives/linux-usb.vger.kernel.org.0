Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CD1388EB3
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 15:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353552AbhESNNi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 09:13:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346578AbhESNNf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 09:13:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89E3A61355;
        Wed, 19 May 2021 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621429936;
        bh=0MV3p9GwMXsSm60yeeeyPlPknmCq/WU5oNFHBuWy9s4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c8Y8Lp1PWIwQPA/JbKyiQdAw1qraj7sfYgMkY/hiKnPH7+72wZBFrsIga+Cap2xJb
         skBEV5dv6FogtptQoiPW1GLWTqM5b9ph16rOT5Wy1zgYkZO8d2Hf5vShHqONSyDVMq
         Ld10hEmso4nlusgTDAGWeK1w2iiJ8WC0HQW4WUa8=
Date:   Wed, 19 May 2021 15:12:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: xhci: remove unused variable 'len' in
 xhci_unmap_temp_buf()
Message-ID: <YKUOra3I+c+xeO+s@kroah.com>
References: <20210519123304.7885-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519123304.7885-1-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 08:33:04PM +0800, Zhen Lei wrote:
> GCC reports the following warning with W=1:
> 
> drivers/usb/host/xhci.c:1349:15: warning:
>  variable 'len' set but not used [-Wunused-but-set-variable]
>  1349 |  unsigned int len;
>       |               ^~~
> 
> This variable is not used, remove it to fix the warning.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/usb/host/xhci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 27283654ca08..a75ed4a00997 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1346,7 +1346,6 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
>  
>  static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>  {
> -	unsigned int len;
>  	unsigned int buf_len;
>  	enum dma_data_direction dir;
>  
> @@ -1362,7 +1361,7 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>  				 dir);
>  
>  	if (usb_urb_dir_in(urb))
> -		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> +		(void)sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
>  					   urb->transfer_buffer,
>  					   buf_len,
>  					   0);
> -- 
> 2.25.1
> 
> 

Wow, no.  I keep telling you that this is not ok.  Why keep sending
this?

greg k-h
