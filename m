Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F114444F404
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 16:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbhKMPnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Nov 2021 10:43:43 -0500
Received: from netrider.rowland.org ([192.131.102.5]:48987 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231880AbhKMPnm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Nov 2021 10:43:42 -0500
Received: (qmail 58693 invoked by uid 1000); 13 Nov 2021 10:40:49 -0500
Date:   Sat, 13 Nov 2021 10:40:49 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Haimin Zhang <tcs.kernel@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        TCS Robot <tcs_robot@tencent.com>
Subject: Re: [PATCH v4] USB: ehci_brcm_hub_control: improve port index
 sanitizing
Message-ID: <20211113154049.GA58521@rowland.harvard.edu>
References: <20211113045714.46373-1-tcs.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113045714.46373-1-tcs.kernel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 13, 2021 at 12:57:14PM +0800, Haimin Zhang wrote:
> Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
> can cause array index to be out of bounds since the size of array
> port_status is 0xf. This change prevents a possible out-of-bounds
> pointer computation by forcing the use of a valid port number.

I would write 15 instead of 0xf.  The size of the array is 15; see the 
definition of HCS_N_PORTS_MAX.  (Yes, I realize the 0xf is equal to 15, 
but why force people to go out of their way to translate a hex number 
into decimal?)

> 
> Reported-by: TCS Robot <tcs_robot@tencent.com>
> Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
> ---

You did not include the version change information here.

>  drivers/usb/host/ehci-brcm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
> index d3626bfa966b..2e92918a14dd 100644
> --- a/drivers/usb/host/ehci-brcm.c
> +++ b/drivers/usb/host/ehci-brcm.c
> @@ -62,8 +62,12 @@ static int ehci_brcm_hub_control(
>  	u32 __iomem	*status_reg;
>  	unsigned long flags;
>  	int retval, irq_disabled = 0;
> +	u32 temp;
>  
> -	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
> +	temp = (wIndex & 0xff) - 1;
> +	if (temp >= HCS_N_PORTS_MAX)
> +		temp = 0;

There ought to be a comment explaining why you are doing this (namely, 
to avoid an "index out of bounds" warning).  The reason isn't 
automatically obvious.

Alan Stern

> +	status_reg = &ehci->regs->port_status[temp];
>  
>  	/*
>  	 * RESUME is cleared when GetPortStatus() is called 20ms after start
> -- 
> 2.30.1 (Apple Git-130)
> 
