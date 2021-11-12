Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98D44EA66
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 16:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhKLPjq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 10:39:46 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41505 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235304AbhKLPjI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 10:39:08 -0500
Received: (qmail 33489 invoked by uid 1000); 12 Nov 2021 10:36:15 -0500
Date:   Fri, 12 Nov 2021 10:36:15 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Haimin Zhang <tcs.kernel@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        TCS Robot <tcs_robot@tencent.com>
Subject: Re: [PATCH v3] USB: ehci_brcm_hub_control: improve port index
 sanitizing
Message-ID: <20211112153615.GA32928@rowland.harvard.edu>
References: <20211112094921.90496-1-tcs.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112094921.90496-1-tcs.kernel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 05:49:21PM +0800, Haimin Zhang wrote:
> Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
> can cause array index to be out of bounds since the size of array
> port_status is 0xf. Using macro function HCS_N_PORTS() can return
> a valid index less than 15. Macro function HCS_N_PORTS() is used
> to obtain a valid port index by logical AND 0xf.
> 
> Reported-by: TCS Robot <tcs_robot@tencent.com>
> Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
> ---
>  drivers/usb/host/ehci-brcm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
> index d3626bfa966b..d2bf7768349c 100644
> --- a/drivers/usb/host/ehci-brcm.c
> +++ b/drivers/usb/host/ehci-brcm.c
> @@ -62,8 +62,11 @@ static int ehci_brcm_hub_control(
>  	u32 __iomem	*status_reg;
>  	unsigned long flags;
>  	int retval, irq_disabled = 0;
> +	u32 temp;
>  
> -	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
> +	temp = (wIndex & 0xff) - 1;
> +	temp = HCS_N_PORTS(temp);

This is a misuse of the HCS_N_PORTS macro; the fact that it works out 
okay is just a coincidence.  That macro was intended for extracting the 
number of ports from the hcs_params word in the EHCI register space.  It 
should not be used for any other purpose (including forcing a value to 
be in the range of valid port numbers).

If you want to do this correctly, do something like:

	temp = min_t(u32, temp, HCS_N_PORTS_MAX - 1);

Or even:

	if (temp >= HCS_N_PORTS_MAX)	/* Force valid port number */
		temp = 0;

Alan Stern

> +	status_reg = &ehci->regs->port_status[temp];
>  
>  	/*
>  	 * RESUME is cleared when GetPortStatus() is called 20ms after start
> -- 
> 2.30.1 (Apple Git-130)
