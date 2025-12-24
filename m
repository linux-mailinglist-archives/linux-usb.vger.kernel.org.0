Return-Path: <linux-usb+bounces-31744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8FCDBAFF
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 09:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24FDE3020680
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 08:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C64932ED2D;
	Wed, 24 Dec 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DhztULb1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D94E2C1580;
	Wed, 24 Dec 2025 08:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565579; cv=none; b=ER+l0m+AAXwsyVOwyDScQWsOiyZF724goPI5s7MCG5nitwjLF0ZDpqHKuYwSABiaLcO2t94JaIkGqIjQmNl7Etv7bj3oKNa7zjAaudn8AQoUyLOSt6gvr1Z34RBBbcvLoh/bwBIYvPtYfmcSLqmXVYmWr771kMVU9b4v4HjS0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565579; c=relaxed/simple;
	bh=72eGFqiAc1s5S1TLRqNdwP7zwRyrmoPZ5J+pXHrvxik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8hs/V07+mEh7s95I1UekWnkpQ8s6oA6UTkjHGxc2652zO3YREyi7N7jtSH1B/m3Qfkt6x5OMcQhcdICbNJVaTPSkkhVRRqjE1e5X1E++kSY84FNkWY4apvt8aIbE0VaZUqx4XTzRfnjxwYwdXF0wSrq2GKIcTWqwAsvn5MS08w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DhztULb1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08118C116B1;
	Wed, 24 Dec 2025 08:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766565578;
	bh=72eGFqiAc1s5S1TLRqNdwP7zwRyrmoPZ5J+pXHrvxik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhztULb1UEzZCP1pZ+29ILj0933fpt8/IEVAWhycsecBpIvZ5R8ZooHMXMZv7HJXa
	 lOcvBs6L788T449OCFYEToXgOHtVXBF6cLhJ6dVIdor2/gNQR+fQqMcVDCj0j42liX
	 XVp2YdsLdh/Ff6q3UwoQnVpPv7/Okou7NizyIR80=
Date: Wed, 24 Dec 2025 09:39:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Sun <jason.sun689@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sunqian@senarytech.com
Subject: Re: [PATCH v2] dwc2: Delay resume until device connection is stable
Message-ID: <2025122420-smolder-shrank-5ac3@gregkh>
References: <20251215125317.85624-1-sunqian@senarytech.com>
 <20251224082013.87100-1-jason.sun689@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224082013.87100-1-jason.sun689@gmail.com>

On Wed, Dec 24, 2025 at 04:20:13PM +0800, Jason Sun wrote:
> When DWC2 is used as a host with a dynamically controlled VBUS supply,
> VBUS may be turned off during system suspend and enabled again during
> resume. Some USB devices (e.g. USB mass storage) require additional time
> after VBUS is restored to power up and for the D+/D- line state to settle.
> 
> The resume sequence may proceed too early, observe HPRT0.CONNSTS as 0,
> and treat an already-connected device as disconnected. This can lead to
> a spurious USB disconnect followed by re-enumeration, making an
> already-mounted filesystem unusable after resume. Even if the device
> reconnects later, the resume does not behave like a true restoration of
> the pre-suspend device state.
> 
> Poll HPRT0.CONNSTS for a short, bounded period after enabling the
> external VBUS supply, allowing the controller to report a stable
> connection state and prevent spurious disconnects during resume.
> 
> Without this change, resume often results in a disconnect and a new
> device enumeration:
> 
>     dwc2_enable_host_interrupts()
>     ClearPortFeature USB_PORT_FEAT_C_SUSPEND
>     ClearPortFeature USB_PORT_FEAT_ENABLE
>     usb 1-1: USB disconnect, device number 3
>     ...
>     usb 1-1: new high-speed USB device number 4 using dwc2
> 
> With this change applied, the controller reliably detects the device
> after resume and restores the link without triggering a full disconnect
> and re-enumeration cycle:
> 
>     dwc2_enable_host_interrupts()
>     gintsts=05000021  gintmsk=f3000806
>     Device connected after 9 retries
>     ClearPortFeature USB_PORT_FEAT_C_CONNECTION
>     ClearPortFeature USB_PORT_FEAT_C_SUSPEND
>     ...
>     usb 1-1: reset high-speed USB device number 4 using dwc2
> 
> As a side effect, when an OTG host adapter is connected but no USB
> device is present, HPRT0.CONNSTS remains deasserted and the polling
> reaches the timeout. In this case, system resume latency may increase
> by the duration of the bounded wait, which is considered an acceptable
> tradeoff to avoid spurious disconnects and filesystem corruption.
> 
> Tested on:
>   - Kernel: v5.15.140
>   - Suspend mode: suspend-to-RAM (STR)
>   - dr_mode: OTG (dual-role), host mode via OTG adapter
>   - Devices:
>       * USB mass storage (Aigo, Kingston, SanDisk)
>       * USB HID (mouse, keyboard)
> 
> Signed-off-by: Jason Sun <jason.sun689@gmail.com>
> ---
>  drivers/usb/dwc2/hcd.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 60ef8092259a..96345eeb9e2f 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -4404,11 +4404,15 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
>  	return ret;
>  }
>  
> +#define CONNSTS_POLL_RETRIES       80
> +#define CONNSTS_POLL_DELAY_US_MIN  3000
> +#define CONNSTS_POLL_DELAY_US_MAX  5000
>  static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>  {
>  	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
>  	unsigned long flags;
>  	u32 hprt0;
> +	int retry;
>  	int ret = 0;
>  
>  	spin_lock_irqsave(&hsotg->lock, flags);
> @@ -4501,8 +4505,26 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
>  	dwc2_vbus_supply_init(hsotg);
>  
> -	/* Wait for controller to correctly update D+/D- level */
> -	usleep_range(3000, 5000);
> +	/*
> +	 * Wait for device connection to stabilize after VBUS is restored.
> +	 * Some externally powered devices may need time for D+/D- lines to settle.
> +	 * This runs in the resume path where sleeping is allowed.
> +	 */
> +	for (retry = 0; retry < CONNSTS_POLL_RETRIES; retry++) {
> +		spin_lock_irqsave(&hsotg->lock, flags);
> +		hprt0 = dwc2_read_hprt0(hsotg);
> +		spin_unlock_irqrestore(&hsotg->lock, flags);
> +
> +		if (hprt0 & HPRT0_CONNSTS) {
> +			dev_dbg(hsotg->dev,
> +				"Device connected after %d retries\n", retry);
> +			break;
> +		}
> +
> +		usleep_range(CONNSTS_POLL_DELAY_US_MIN,
> +			     CONNSTS_POLL_DELAY_US_MAX);
> +	}
> +
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  
>  	/*
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

