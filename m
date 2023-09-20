Return-Path: <linux-usb+bounces-407-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B27A73F2
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 09:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 244FD1C20AA7
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 07:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74A58830;
	Wed, 20 Sep 2023 07:24:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498771C26
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 07:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89382C433C7;
	Wed, 20 Sep 2023 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695194646;
	bh=WJGZQke9HDC2xBjSxowARs+R7cWy3tpanlmLcL8xNuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+41xrY2Bu3boiNQxkGy9HATMh5m/oxDZIvdWWh5ooshveb0ScBLR83ZPBQmU4Exc
	 bnVgIfMbllffWUoLgusmI5Zz9lvkvsfi7RYgumU2bOH1XIgwn5T7fqJgGqPN6xaAR3
	 UE61d1FUPF8rg6IeX76j1hkqVaw09yB32AGgdXwY=
Date: Wed, 20 Sep 2023 09:24:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: host: xhci: Avoid XHCI resume delay if SSUSB
 device is not present
Message-ID: <2023092049-debating-matted-7276@gregkh>
References: <20230919224327.29974-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919224327.29974-1-quic_wcheng@quicinc.com>

On Tue, Sep 19, 2023 at 03:43:27PM -0700, Wesley Cheng wrote:
> There is a 120ms delay implemented for allowing the XHCI host controller to
> detect a U3 wakeup pulse.  The intention is to wait for the device to retry
> the wakeup event if the USB3 PORTSC doesn't reflect the RESUME link status
> by the time it is checked.  As per the USB3 specification:
> 
>   tU3WakeupRetryDelay ("Table 7-12. LTSSM State Transition Timeouts")
> 
> This would allow the XHCI resume sequence to determine if the root hub
> needs to be also resumed.  However, in case there is no device connected,
> or if there is only a HSUSB device connected, this delay would still affect
> the overall resume timing.
> 
> Since this delay is solely for detecting U3 wake events (USB3 specific)
> then ignore this delay for the disconnected case and the HSUSB connected
> only case.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
> Depends-on:
> https://lore.kernel.org/linux-usb/20230915143108.1532163-3-mathias.nyman@linux.intel.com/
> 
>  drivers/usb/host/xhci.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index e1b1b64a0723..1855cab1be56 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -805,6 +805,18 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
>  	spin_unlock_irqrestore(&xhci->lock, flags);
>  }
>  
> +/*
> + * Utilize suspended_ports and bus_suspended to determine if USB3 device is
> + * connected.  The bus state bits are set by XHCI hub when root hub udev is
> + * suspended.  Used to determine if USB3 remote wakeup considerations need to
> + * be accounted for during XHCI resume.
> + */
> +static bool xhci_usb3_dev_connected(struct xhci_hcd *xhci)
> +{
> +	return !!xhci->usb3_rhub.bus_state.suspended_ports ||
> +		!!xhci->usb3_rhub.bus_state.bus_suspended;
> +}
> +
>  static bool xhci_pending_portevent(struct xhci_hcd *xhci)
>  {
>  	struct xhci_port	**ports;
> @@ -968,6 +980,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
>  	int			retval = 0;
>  	bool			comp_timer_running = false;
>  	bool			pending_portevent = false;
> +	bool			usb3_connected = false;
>  	bool			reinit_xhc = false;
>  
>  	if (!hcd->state)
> @@ -1116,9 +1129,14 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
>  		 * Resume roothubs only if there are pending events.
>  		 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
>  		 * the first wake signalling failed, give it that chance.
> +		 * Avoid this check if there are no devices connected to
> +		 * the SS root hub. (i.e. HS device connected or no device
> +		 * connected)
>  		 */
>  		pending_portevent = xhci_pending_portevent(xhci);
> -		if (!pending_portevent && msg.event == PM_EVENT_AUTO_RESUME) {
> +		usb3_connected = xhci_usb3_dev_connected(xhci);
> +		if (!pending_portevent && usb3_connected &&
> +		     msg.event == PM_EVENT_AUTO_RESUME) {
>  			msleep(120);
>  			pending_portevent = xhci_pending_portevent(xhci);
>  		}
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

