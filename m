Return-Path: <linux-usb+bounces-1199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164677BBA1B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 16:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BA4E1C20A4B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98916266A6;
	Fri,  6 Oct 2023 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FdWZmuPP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD272376B
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A08C433C7;
	Fri,  6 Oct 2023 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696602078;
	bh=2Grp6Qh6qeNuh49mj8YjpgGdvSj5dFC4iUiXZ5AqqSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdWZmuPPmt/PM3EzsBffE6Dhf7B3EJmmPf60vBYWZal9yf9ON/z+QETHTIf8NrnfQ
	 8GCGiqXzqiXSxZq0kajOYf2UpC5dyiSgKvl0rW/3TKTZ21xD+53BmShz6fwpQDA0zg
	 VIals/MScQD0okxkGaInq9o3/yAgHrEb/esZFrwo=
Date: Fri, 6 Oct 2023 16:21:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: s.hauer@pengutronix.de, jonathanh@nvidia.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_linyyuan@quicinc.com,
	paul@crapouillou.net, quic_eserrao@quicinc.com,
	erosca@de.adit-jv.com, gah2hi <external.Hardik.Gajjar@de.bosch.com>
Subject: Re: [PATCH] usb: gadget: u_ether: Replace netif_stop_queue with
 netif_device_detach
Message-ID: <2023100656-swagger-anagram-a381@gregkh>
References: <20231006141231.7220-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006141231.7220-1-hgajjar@de.adit-jv.com>

On Fri, Oct 06, 2023 at 04:12:31PM +0200, Hardik Gajjar wrote:
> From: gah2hi <external.Hardik.Gajjar@de.bosch.com>
> 
> This patch replaces the usage of netif_stop_queue with netif_device_detach
> in the u_ether driver. The netif_device_detach function not only stops all
> tx queues by calling netif_tx_stop_all_queues but also marks the device as
> removed by clearing the __LINK_STATE_PRESENT bit.
> 
> This change helps notify user space about the disconnection of the device
> more effectively, compared to netif_stop_queue, which only stops a single
> transmit queue.
> 
> Signed-off-by: gah2hi <external.Hardik.Gajjar@de.bosch.com>
> ---
>  drivers/usb/gadget/function/u_ether.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 4bb0553da658..9d1c40c152d8 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -1200,7 +1200,7 @@ void gether_disconnect(struct gether *link)
>  
>  	DBG(dev, "%s\n", __func__);
>  
> -	netif_stop_queue(dev->net);
> +	netif_device_detach(dev->net);
>  	netif_carrier_off(dev->net);
>  
>  	/* disable endpoints, forcing (synchronous) completion
> -- 
> 2.17.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

