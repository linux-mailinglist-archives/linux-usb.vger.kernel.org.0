Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE613AFA69
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jun 2021 03:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhFVBFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Jun 2021 21:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhFVBFm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Jun 2021 21:05:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C50F86124B;
        Tue, 22 Jun 2021 01:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624323807;
        bh=szQ9rQRR2dRc3Raw5rlFvxlD3Q9zUtbnwjsqDsYkmLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YmrOP+02BqbhetMgKjy33tdY8Yi2S8PMZ7fEmmfB5z2YPezdAwiZ4AnoWY9I0aUGL
         oYy+QM0kHI8XA40hPf3NapoCI4lQ40br5CTlgtaNNnBwOrRNmJ2myaKJmMcMI3kbf3
         Q+cKx7JnGfzezCmnRzZbuIFRrbfbi1InnlccZfbR/V7g5U+TO/vnvYEVqCrbs3DaQY
         cq++jCzy5tDmgaeH5SZGPdU1pz1CVTpDRdz/rWwLqpZe7v7PyezARcaVodU++nlU5B
         x0fkj4gGqDKHy8Uoivs3t5YOcKIsRmyfTSACjzIRqQrDDo5Za00Yx7k6DipJs5FfYW
         yTJ2N+md71uNQ==
Date:   Tue, 22 Jun 2021 09:03:22 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        zhipeng.wang_1@nxp.com
Subject: Re: [PATCH v3] usb: chipidea: host: fix port index underflow and
 UBSAN complains
Message-ID: <20210622010322.GA14023@nchen>
References: <1624004938-2399-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624004938-2399-1-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-06-18 16:28:58, Li Jun wrote:
> If wIndex is 0 (and it often is), these calculations underflow and
> UBSAN complains, here resolve this by not decrementing the index when
> it is equal to 0, this copies the solution from commit 85e3990bea49
> ("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")
> 
> Reported-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Applied, thanks.

Peter
> ---
> Change for v3:
> -  Correct the bug's reporter's user name format.
> 
> Change for v2:
> -  Add wIndex range check to ensure a correct port index value.
> 
>  drivers/usb/chipidea/host.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index e86d13c04bdb..bdc3885c0d49 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -240,15 +240,18 @@ static int ci_ehci_hub_control(
>  )
>  {
>  	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
> +	unsigned int	ports = HCS_N_PORTS(ehci->hcs_params);
>  	u32 __iomem	*status_reg;
> -	u32		temp;
> +	u32		temp, port_index;
>  	unsigned long	flags;
>  	int		retval = 0;
>  	bool		done = false;
>  	struct device *dev = hcd->self.controller;
>  	struct ci_hdrc *ci = dev_get_drvdata(dev);
>  
> -	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
> +	port_index = wIndex & 0xff;
> +	port_index -= (port_index > 0);
> +	status_reg = &ehci->regs->port_status[port_index];
>  
>  	spin_lock_irqsave(&ehci->lock, flags);
>  
> @@ -260,6 +263,11 @@ static int ci_ehci_hub_control(
>  	}
>  
>  	if (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_SUSPEND) {
> +		if (!wIndex || wIndex > ports) {
> +			retval = -EPIPE;
> +			goto done;
> +		}
> +
>  		temp = ehci_readl(ehci, status_reg);
>  		if ((temp & PORT_PE) == 0 || (temp & PORT_RESET) != 0) {
>  			retval = -EPIPE;
> @@ -288,7 +296,7 @@ static int ci_ehci_hub_control(
>  			ehci_writel(ehci, temp, status_reg);
>  		}
>  
> -		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
> +		set_bit(port_index, &ehci->suspended_ports);
>  		goto done;
>  	}
>  
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

