Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63E12F0614
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jan 2021 09:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbhAJIt0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 03:49:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbhAJItZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 Jan 2021 03:49:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5154239EB;
        Sun, 10 Jan 2021 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610268525;
        bh=HPZg8c3RDglmoIbyW8zUjY1l4qF1UpTWq8srfvH6kOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OjXiOr2s5c3QD60/pUROwiBqCCOVgTYfxjTMLkaOvhmC75sYrXC64LpH/EfKI+lA+
         mpSajDOTMYh5aUZDfv5695tI3U8Hnb0BK8r8DAxuvoYhibK+RC+9qTRzE1SfkOtlKs
         nCBWPVFt6sewmtS14oRp7mlvW8OD306nKbHZwk0A=
Date:   Sun, 10 Jan 2021 09:48:40 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Eugene Korenevsky <ekorenevsky@astralinux.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4] ehci: fix EHCI host controller initialization sequence
Message-ID: <X/q/aIAw4opcu8KM@kroah.com>
References: <20210110083707.GA11888@himera.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110083707.GA11888@himera.home>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 10, 2021 at 11:37:07AM +0300, Eugene Korenevsky wrote:
> According to EHCI spec, EHCI HC clears USBSTS.HCHalted whenever
> USBCMD.RS=1.
> 
> However, it is a good practice to wait some time after setting USBCMD.RS
> (approximately 100ms) until USBSTS.HCHalted become zero.
> 
> Without this waiting, VirtualBox's EHCI virtual HC accidentally hangs
> (see BugLink).
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211095 
> Signed-off-by: Eugene Korenevsky <ekorenevsky@astralinux.ru>
> ---
>  drivers/usb/host/ehci-hcd.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index e358ae17d51e..1926b328b6aa 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -574,6 +574,7 @@ static int ehci_run (struct usb_hcd *hcd)
>  	struct ehci_hcd		*ehci = hcd_to_ehci (hcd);
>  	u32			temp;
>  	u32			hcc_params;
> +	int			rc;
>  
>  	hcd->uses_new_polling = 1;
>  
> @@ -629,9 +630,20 @@ static int ehci_run (struct usb_hcd *hcd)
>  	down_write(&ehci_cf_port_reset_rwsem);
>  	ehci->rh_state = EHCI_RH_RUNNING;
>  	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
> +
> +	/* Wait until HC become operational */
>  	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
>  	msleep(5);
> +	rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT, 0, 100 * 1000);
> +
>  	up_write(&ehci_cf_port_reset_rwsem);
> +
> +	if (rc) {
> +		ehci_err(ehci, "USB %x.%x, controller refused to start: %d\n",
> +			 ((ehci->sbrn & 0xf0)>>4), (ehci->sbrn & 0x0f), rc);
> +		return rc;
> +	}
> +
>  	ehci->last_periodic_enable = ktime_get_real();
>  
>  	temp = HC_VERSION(ehci, ehci_readl(ehci, &ehci->caps->hc_capbase));
> -- 
> 2.20.1
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
