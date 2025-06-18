Return-Path: <linux-usb+bounces-24874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0BADE911
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F21C189EC56
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 10:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD05283FDF;
	Wed, 18 Jun 2025 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2If1hIL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA827E7FC;
	Wed, 18 Jun 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242813; cv=none; b=HMIaZpeVMn4Tmp6M8hk4C2qc6YVxRMsMKvpkdHhQ379Z/f+TBEGuhcTC1VlLjgvJz2ThDEKHJ15xI72CVar6iG/zSSVljl/NjxOttr7DFIlEWvRmmhNVhLYUDQWvWO14y2Q2+J+chSI9AEBoLZ3mQf6JcB79wUaKnec3EGF/Frw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242813; c=relaxed/simple;
	bh=NH1gdj2JHsPz7N0JYPEoq2KF4u27xaLK2wSxMVVbO7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3gH43wU9UjNh4ynmbLVd9LxNdg7IaRGuseZkrev/KECarv7n8nJ9AK7+1nXXD6Gc8sscp8lVjkASZQRPQMWT76114bDEgFp5rsmW0NVlNAloFsGv6YDBscnR/LH4syeds6rdqXbMaaQmZ3sv0PzuUni+pIQ5JgATf8WJfrOXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2If1hIL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565AFC4CEE7;
	Wed, 18 Jun 2025 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242811;
	bh=NH1gdj2JHsPz7N0JYPEoq2KF4u27xaLK2wSxMVVbO7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2If1hILU75Fm5Wwemre5KnEqAomySUKfRnRpvbLTPvPgsMzP0pV1XhQn9i/rpi+d
	 R0t6EYPJoRRfhrmsSycIAZnuQyodbw4B1vt02rS+mSC2u+VyjNQlHYuVE154mGX6WM
	 KhnsSNc5LmnF2kFHPmlE9p7OGcRAk3D80xuQtlJO79GslXStFAOwUNdFFuNLzS4JZJ
	 YTQR7daEDvkJjaUdiDydVNVHUQcpOIshwXl+Fxg3d8UjsRtEK0OVFutiNgEfAMmsqC
	 9yS2jK/DTtHJm0af8MBuUWjuGiw/rhaUm1Iw/+wYdh+M9QSbv1ztkg0KGKd845BF4Q
	 ReG/aqj3tfUAg==
Date: Wed, 18 Jun 2025 18:33:23 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, john.ernberg@actia.se,
	jun.li@nxp.com, linux-usb@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] usb: chipidea: udc: disconnect/reconnect from host when
 do suspend/resume
Message-ID: <20250618103323.GA34284@nchen-desktop>
References: <20250614124914.207540-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614124914.207540-1-xu.yang_2@nxp.com>

On 25-06-14 20:49:14, Xu Yang wrote:
> Shawn and John reported a hang issue during system suspend as below:
> 
>  - USB gadget is enabled as Ethernet
>  - There is data transfer over USB Ethernet (scp a big file between host
>                                              and device)
>  - Device is going in/out suspend (echo mem > /sys/power/state)
> 
> The root cause is the USB device controller is suspended but the USB bus
> is still active which caused the USB host continues to transfer data with
> device and the device continues to queue USB requests (in this case, a
> delayed TCP ACK packet trigger the issue) after controller is suspended,
> however the USB controller clock is already gated off. Then if udc driver
> access registers after that point, the system will hang.
> 
> The correct way to avoid such issue is to disconnect device from host when
> the USB bus is not at suspend state. Then the host will receive disconnect
> event and stop data transfer in time. To continue make USB gadget device
> work after system resume, this will reconnect device automatically.
> 
> To make usb wakeup work if USB bus is already at suspend state, this will
> keep connection for it only when USB device controller has enabled wakeup
> capability.
> 
> Reported-by: Shawn Guo <shawnguo@kernel.org>
> Reported-by: John Ernberg <john.ernberg@actia.se>
> Closes: https://lore.kernel.org/linux-usb/aEZxmlHmjeWcXiF3@dragon/
> Tested-by: John Ernberg <john.ernberg@actia.se> # iMX8QXP
> Fixes: 235ffc17d014 ("usb: chipidea: udc: add suspend/resume support for device controller")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/udc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 8a9b31fd5c89..1a48e6440e6c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2374,6 +2374,10 @@ static void udc_suspend(struct ci_hdrc *ci)
>  	 */
>  	if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
>  		hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> +
> +	if (ci->gadget.connected &&
> +	    (!ci->suspended || !device_may_wakeup(ci->dev)))
> +		usb_gadget_disconnect(&ci->gadget);
>  }
>  
>  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> @@ -2384,6 +2388,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>  					OTGSC_BSVIS | OTGSC_BSVIE);
>  		if (ci->vbus_active)
>  			usb_gadget_vbus_disconnect(&ci->gadget);
> +	} else if (ci->vbus_active && ci->driver &&
> +		   !ci->gadget.connected) {
> +		usb_gadget_connect(&ci->gadget);
>  	}
>  
>  	/* Restore value 0 if it was set for power lost check */
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

