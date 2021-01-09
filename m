Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19FC2F03B2
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jan 2021 22:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbhAIVFd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Jan 2021 16:05:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49201 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726005AbhAIVFd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Jan 2021 16:05:33 -0500
Received: (qmail 1136841 invoked by uid 1000); 9 Jan 2021 16:04:52 -0500
Date:   Sat, 9 Jan 2021 16:04:52 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eugene Korenevsky <ekorenevsky@astralinux.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] ehci: fix EHCI host controller initialization sequence
Message-ID: <20210109210452.GA1136657@rowland.harvard.edu>
References: <20210109181828.GA7585@himera.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109181828.GA7585@himera.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 09, 2021 at 09:18:28PM +0300, Eugene Korenevsky wrote:
> According to EHCI spec, EHCI HC clears USBSTS.HCHalted whenever USBCMD.RS=1.
> However, it is a good practice to wait some time after setting USBCMD.RS
> (approximately 100ms) until USBSTS.HCHalted become zero.
> 
> Instead, previous version of ehci_run() wrote 1 to USBCMD.RS, issued read to
> USBCMD and waited for 5 ms.
> That worked incorrectly at least for VirtualBox's EHCI virtual HC and caused
> accidental hangs.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211095 
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This is a big no-no!  You must not add other people's Reviewed-by or 
Acked-by tags to a patch unless they give you explicit permission to do 
so.

> Signed-off-by: Eugene Korenevsky <ekorenevsky@astralinux.ru>
> ---
>  drivers/usb/host/ehci-hcd.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index e358ae17d51e..f3b73b5ab6e3 100644
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
> @@ -629,9 +630,19 @@ static int ehci_run (struct usb_hcd *hcd)
>  	down_write(&ehci_cf_port_reset_rwsem);
>  	ehci->rh_state = EHCI_RH_RUNNING;
>  	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
> -	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
> +
> +	/* Wait until HC become operational */
>  	msleep(5);
> +	rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT, 0, 100 * 1000);

You should not remove the ehci_readl call above.  With that line gone, 
the PCI bus might not send the new value of configured_flag to the 
controller until after the 5-ms sleep has ended, which makes the msleep 
useless.

Alan Stern

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
