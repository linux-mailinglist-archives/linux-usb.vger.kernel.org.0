Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D48B2F0864
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jan 2021 17:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbhAJQ3A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 11:29:00 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34049 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726228AbhAJQ3A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Jan 2021 11:29:00 -0500
Received: (qmail 1161744 invoked by uid 1000); 10 Jan 2021 11:28:18 -0500
Date:   Sun, 10 Jan 2021 11:28:18 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eugene Korenevsky <ekorenevsky@astralinux.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5] ehci: fix EHCI host controller initialization sequence
Message-ID: <20210110162818.GA1161376@rowland.harvard.edu>
References: <20210110092146.GA12790@himera.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110092146.GA12790@himera.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 10, 2021 at 12:21:47PM +0300, Eugene Korenevsky wrote:
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

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> v1: initial patch
> v2: add BugLink tag
> v3: add Revieved-By tags (incorrect), restore `msleep(5)`
> v4: remove Reviewed-By tags, restore reading from USBCMD prior to msleep,
> adjust description
> v5: add `patch changelog`
> 
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
