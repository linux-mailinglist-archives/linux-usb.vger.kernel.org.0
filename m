Return-Path: <linux-usb+bounces-19705-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9286A1C207
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 08:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10BA1887017
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 07:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9176D207A0E;
	Sat, 25 Jan 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fBywUHZT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BC15A8;
	Sat, 25 Jan 2025 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737789236; cv=none; b=Suujf31NWjWao4syKLfQul+Ai3mOhWNNjwKi/T3H0woI3tZTrNogLa5vwwwGhRLw5LGcpuoIrVZSOvSZQbPTYOrGOyz+YVL9+yBwXGKImhWs0iAtNVz8ZnhjFc8gV2S7jXHuPie5fZWpl3wXpSeNKjhm+NIZ4YMlLtaNAeefhHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737789236; c=relaxed/simple;
	bh=zQO/rI+Tx589OS8M0rrdAc9eToBiAckJZ3rbpXLpn1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvUWFvzPzHevWBpjihxD2LnFS9V5eMxIVz3FHIcEOlRpWzdk7a/Tq9ghzybNIBQo1ysZmcPqsEaHLiwS8ZojcGNLL+493hYsQFSwpZa1F46SJ/9umgPK8eQlAEZgKSeW0pBE64J2+FBKBtYUup1Wt+UZi4LMd9i81tMyUfBWguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fBywUHZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BB8C4CED6;
	Sat, 25 Jan 2025 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737789235;
	bh=zQO/rI+Tx589OS8M0rrdAc9eToBiAckJZ3rbpXLpn1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBywUHZTtC+wJUuhuEHCVHAipdm6rADLMPA0DWazeLQyGS8req6ZFLJ57ClkQ3VaR
	 2G83XE8HKYq9NQwLfuF7iyqNx6IiLlDadzDN7+eCFT417rawl7SiIyD9eVvMVtqhEX
	 2/x5zJINmqgGu6gvDrMutxYfnS8Zp0+T5tAexCcs=
Date: Sat, 25 Jan 2025 08:13:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: hminas@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] usb: dwc2: gadget: remove of_node reference upon udc_stop
Message-ID: <2025012543-unpaired-cartridge-c221@gregkh>
References: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>

On Fri, Jan 24, 2025 at 06:33:25PM +0100, Fabrice Gasnier wrote:
> In dwc2_hsotg_udc_start(), e.g. when binding composite driver, "of_node"
> is set to hsotg->dev->of_node.
> 
> It causes errors when binding the gadget driver several times, on
> stm32mp157c-ev1 board. Below error is seen:
> "pin PA10 already requested by 49000000.usb-otg; cannot claim for gadget.0"
> 
> The first time, no issue is seen as when registering the driver, of_node
> isn't NULL:
> -> gadget_dev_desc_UDC_store
>   -> usb_gadget_register_driver_owner
>     -> driver_register
>     ...
>       -> really_probe -> pinctrl_bind_pins (no effect)
> 
> Then dwc2_hsotg_udc_start() sets of_node.
> 
> The second time (stop the gadget, reconfigure it, then start it again),
> of_node has been set, so the probing code tries to acquire pins for the
> gadget. These pins are hold by the controller, hence the error.
> 
> So clear gadget.dev.of_node in udc_stop() routine to avoid the issue.
> 
> Fixes: 7d7b22928b90 ("usb: gadget: s3c-hsotg: Propagate devicetree to gadget drivers")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Note: I'd have been tempted to remove of_node setting from udc_start:
>  -	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
> 
> I can't find the original code that parses the device node [1] from
> composite_bind() routine, originally part of the series that introduces
> this.
> I'm not sure if setting the gadget of_node is really useful, but I chose
> safe approach to simply clear it in udc_stop().
> 
> [1] http://lore.kernel.org/lkml/1340720833-781-6-git-send-email-aletes.xgr@gmail.com/
> ---
>  drivers/usb/dwc2/gadget.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index e7bf9cc635be..bd4c788f03bc 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -4615,6 +4615,7 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  
>  	hsotg->driver = NULL;
> +	hsotg->gadget.dev.of_node = NULL;
>  	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>  	hsotg->enabled = 0;
>  
> -- 
> 2.25.1
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

