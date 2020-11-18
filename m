Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7D02B76A9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 08:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgKRHBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 02:01:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:51630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726164AbgKRHBe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 02:01:34 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BCA92223D;
        Wed, 18 Nov 2020 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605682891;
        bh=0VJIEeodTTqoytgg19JxfAD4IqQe7uJlNhI4wiEdFEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y9pSJJEC0siISN9UhVqwpJBT9DOoLT+LOkobm5LxGU5DsZsk/GCYULoEqSia5x4oa
         Sp5ScLOD+8Q6JtxFO24l2xeLDbx8IXnfyFLjm11+giJ07WiIMg9g3tBiDCixgSzx5F
         3Eh3kQLIMVPHM/TOx+oDD1qe67Pcr455XU3QFBG0=
Date:   Wed, 18 Nov 2020 08:02:17 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Longfang Liu <liulongfang@huawei.com>
Cc:     linux-usb@vger.kernel.org, yisen.zhuang@huawei.com,
        tanxiaofei@huawei.com
Subject: Re: [RFC PATCH] USB: xhci: Enable HCE event reset function
Message-ID: <X7TG+UWWtgbX6EnU@kroah.com>
References: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 18, 2020 at 11:36:13AM +0800, Longfang Liu wrote:
> The HCE(Host Controller Error) event has been defined in
> the XHCI driver but has not been used. If we want to use
> the HCE event to reset the controller, can we implement
> it in the interrupt function as follows:
> 
> xhci_irq()
>     |----xhci_halt()
>     |----xhci_shutdown()
>     |----xhci_start()
>     |----xhci_run()
> 
> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
> ---
>  drivers/usb/host/xhci-ring.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

$ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci-ring.c
Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
linux-kernel@vger.kernel.org (open list)

Any reason to not include the maintainer of the xhci driver here?

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 2c255d0..87b3a40 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2857,6 +2857,16 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>  		goto out;
>  	}
>  
> +	if (status & STS_HCE) {
> +		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> +		xhci_halt(xhci);
> +		xhci_shutdown(hcd);
> +		xhci_start(xhci);
> +		xhci_run(hcd);
> +		ret = IRQ_HANDLED;
> +		goto out;
> +	}
> +

Does this fix a real problem for you?  Are you sure we will not suddenly
start resetting devices that were working properly and sending this
error incorrectly?  How did you test this?

thanks,

greg k-h
