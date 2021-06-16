Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C173AA078
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 17:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbhFPP5l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 11:57:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59659 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234754AbhFPP5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Jun 2021 11:57:30 -0400
Received: (qmail 223233 invoked by uid 1000); 16 Jun 2021 11:55:19 -0400
Date:   Wed, 16 Jun 2021 11:55:19 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Li Jun <jun.li@nxp.com>
Cc:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        zhipeng.wang_1@nxp.com
Subject: Re: [PATCH] usb: chipidea: host: fix port index underflow and UBSAN
 complains
Message-ID: <20210616155519.GB221112@rowland.harvard.edu>
References: <1623810298-32001-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623810298-32001-1-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 16, 2021 at 10:24:58AM +0800, Li Jun wrote:
> If wIndex is 0 (and it often is), these calculations underflow and
> UBSAN complains, here resolve this by not decrementing the index when
> it is equal to 0, this copies the solution from commit 85e3990bea49
> ("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")
> 
> Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/chipidea/host.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index e86d13c04bdb..25327b1b49b7 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -241,14 +241,16 @@ static int ci_ehci_hub_control(
>  {
>  	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
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
> @@ -288,7 +290,7 @@ static int ci_ehci_hub_control(
>  			ehci_writel(ehci, temp, status_reg);
>  		}
>  
> -		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
> +		set_bit(port_index, &ehci->suspended_ports);
>  		goto done;
>  	}

Does this code test anywhere to ensure that wIndex > 0 and wIndex <= 
number of ports?

Alan Stern
