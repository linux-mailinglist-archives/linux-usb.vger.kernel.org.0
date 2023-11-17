Return-Path: <linux-usb+bounces-2962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F37EF3E2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 14:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08B9428141C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 13:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADE931A92;
	Fri, 17 Nov 2023 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LxAEQO1u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC734541
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 13:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A35C433C8;
	Fri, 17 Nov 2023 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700229200;
	bh=K/JjWna5WH0BIy6eoXxUf5f8W17a1PwItdoPzNiEMcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxAEQO1uVK5dvP4fuKInNcZIi88TLaCoVVDVRJccvUd0P6VN76Yr/5vczr24lAcjY
	 Pdp/ZsmUHDAK4FNuN61EC6unlf0BkRibSczsUzWlzq9zWNfVLBySQXh5Bq4QoFYPg6
	 FLcaC8OgLl+Gee+D48+S1yA7RJLvYQ7XoMJvXmKQ=
Date: Fri, 17 Nov 2023 08:53:18 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: fix null pointer deref for xhci_urb_enqueue
Message-ID: <2023111705-showroom-consonant-7a7b@gregkh>
References: <20231117072131.2886406-1-khtsai@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117072131.2886406-1-khtsai@google.com>

On Fri, Nov 17, 2023 at 03:21:28PM +0800, Kuen-Han Tsai wrote:
> The null pointer dereference happens when xhci_free_dev() frees the
> xhci->devs[slot_id] virtual device while xhci_urb_enqueue() is
> processing a urb and checking the max packet size.
> 
> [106913.850735][ T2068] usb 2-1: USB disconnect, device number 2
> [106913.856999][ T4618] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [106913.857488][ T4618] Call trace:
> [106913.857491][ T4618]  xhci_check_maxpacket+0x30/0x2dc
> [106913.857494][ T4618]  xhci_urb_enqueue+0x24c/0x47c
> [106913.857498][ T4618]  usb_hcd_submit_urb+0x1f4/0xf34
> [106913.857501][ T4618]  usb_submit_urb+0x4b8/0x4fc
> [106913.857503][ T4618]  usb_control_msg+0x144/0x238
> [106913.857507][ T4618]  do_proc_control+0x1f0/0x5bc
> [106913.857509][ T4618]  usbdev_ioctl+0xdd8/0x15a8
> 
> This patch adds a spinlock to the xhci_urb_enqueue function to make sure
> xhci_free_dev() and xhci_urb_enqueue() do not race and cause null
> pointer dereference.

I thought we had a lock for this already, what changed to cause this to
start triggering now, all these years later?

> 
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>

What commit id does this fix?


> ---
>  drivers/usb/host/xhci.c | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 884b0898d9c9..e0766ebeff0e 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1522,23 +1522,32 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  	struct urb_priv	*urb_priv;
>  	int num_tds;
>  
> -	if (!urb)
> -		return -EINVAL;
> -	ret = xhci_check_args(hcd, urb->dev, urb->ep,
> -					true, true, __func__);
> -	if (ret <= 0)
> -		return ret ? ret : -EINVAL;
> +	spin_lock_irqsave(&xhci->lock, flags);
> +
> +	if (!urb) {
> +		ret = -EINVAL;
> +		goto done;
> +	}

Why does this have to be inside the lock?  The urb can't change here,
can it?

> +
> +	ret = xhci_check_args(hcd, urb->dev, urb->ep, true, true, __func__);
> +	if (ret <= 0) {
> +		ret = ret ? ret : -EINVAL;
> +		goto done;
> +	}
>  
>  	slot_id = urb->dev->slot_id;
>  	ep_index = xhci_get_endpoint_index(&urb->ep->desc);
>  	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
>  
> -	if (!HCD_HW_ACCESSIBLE(hcd))
> -		return -ESHUTDOWN;
> +	if (!HCD_HW_ACCESSIBLE(hcd)) {
> +		ret = -ESHUTDOWN;
> +		goto done;

Note, we now have completions, so all of this "goto done" doesn't need
to happen anymore.  Not a complaint, just a suggestion for future
changes or this one, your choice.

thanks,

greg k-h

