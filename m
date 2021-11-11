Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079F144D8A4
	for <lists+linux-usb@lfdr.de>; Thu, 11 Nov 2021 15:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbhKKO4G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Nov 2021 09:56:06 -0500
Received: from netrider.rowland.org ([192.131.102.5]:32795 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232033AbhKKO4G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Nov 2021 09:56:06 -0500
Received: (qmail 1760830 invoked by uid 1000); 11 Nov 2021 09:53:16 -0500
Date:   Thu, 11 Nov 2021 09:53:16 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Haimin Zhang <tcs.kernel@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        TCS Robot <tcs_robot@tencent.com>
Subject: Re: [PATCH v2] USB: ehci_brcm_hub_control: filter out invalid port
 index
Message-ID: <20211111145316.GA1760710@rowland.harvard.edu>
References: <20211111121037.34713-1-tcs.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111121037.34713-1-tcs.kernel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 11, 2021 at 08:10:37PM +0800, Haimin Zhang wrote:
> Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
> can cause array index to be out of bounds since the size of array
> port_status is 0xf. Remove cases greater than 0xf, because such cases
> are meaningless. It is reasonable to return -EPIPE, the caller
> rh_call_control will check the return value and handle it properly.
> The callee ehci_hub_control also doesn't need to deal with situations
> greater than 0xf. The size of the array port_status determines that
> such situations should not be handled.
> 
> Reported-by: TCS Robot <tcs_robot@tencent.com>
> Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
> ---
>  drivers/usb/host/ehci-brcm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
> index d3626bfa966b..07e6df336a08 100644
> --- a/drivers/usb/host/ehci-brcm.c
> +++ b/drivers/usb/host/ehci-brcm.c
> @@ -63,6 +63,9 @@ static int ehci_brcm_hub_control(
>  	unsigned long flags;
>  	int retval, irq_disabled = 0;
>  
> +	if (!wIndex || wIndex > ports)
> +		return -EPIPE;

This is just like your original version of the patch.  It won't work 
right if wIndex is equal to 0x0101, for instance.

Alan Stern

> +
>  	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
>  
>  	/*
> @@ -70,7 +73,6 @@ static int ehci_brcm_hub_control(
>  	 * of RESUME
>  	 */
>  	if ((typeReq == GetPortStatus) &&
> -	    (wIndex && wIndex <= ports) &&
>  	    ehci->reset_done[wIndex-1] &&
>  	    time_after_eq(jiffies, ehci->reset_done[wIndex-1]) &&
>  	    (ehci_readl(ehci, status_reg) & PORT_RESUME)) {
> -- 
> 2.30.1 (Apple Git-130)
> 
