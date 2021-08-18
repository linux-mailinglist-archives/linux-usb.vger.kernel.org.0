Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8983F0107
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 11:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhHRJz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 05:55:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:37620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232505AbhHRJz1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 05:55:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9775360C3E;
        Wed, 18 Aug 2021 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629280492;
        bh=PNb8GOIHkUMwROloLnGwRbBaZbhxZwaghS14In1ePiM=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=snIojCbQZci8uqXArXOuju5NMSYi2sfc4Nab4JmACYwDAv3G7x4lj2p2+UGUtp5nU
         PdJ/NQGdinXNfynU2DGdgbe1rUGhkwXGITtosqy8eNbHKqyZwOIkhWsYXxemlOR5M1
         OrSP42VdiIkytMk0ORfiipjXrRacj9xQ/QmEOP8HDlLZi1OYtxAgANI6qBPSuq2Zdz
         +5FGD5GZH9xUVsU9EJMMbEdIO3mpy2dnZO3a+piDKbaRgN6nBNRspDs6MQWMoVDNNJ
         kmIVIXmi1Roodo78z5Q7YWek8QtPp+NrPFjO/OJPE2GmNnLYebVAKaXC0E7HRMLIgv
         Qv89YdQLO51Aw==
References: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
User-agent: mu4e 1.6.3; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, git@xilinx.com
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Add clock support
Date:   Wed, 18 Aug 2021 12:54:00 +0300
In-reply-to: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
Message-ID: <87v943f57a.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> writes:
> Currently the driver depends on the  bootloader to enable the clocks.
> Add support for clocking. The patch enables the clock at  probe and
> disables them at remove.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/usb/gadget/udc/udc-xilinx.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index fb4ffedd6f0d..30070a488c87 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -11,6 +11,7 @@
>   * USB peripheral controller (at91_udc.c).
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> @@ -171,6 +172,7 @@ struct xusb_ep {
>   * @addr: the usb device base address
>   * @lock: instance of spinlock
>   * @dma_enabled: flag indicating whether the dma is included in the system
> + * @clk: pointer to struct clk
>   * @read_fn: function pointer to read device registers
>   * @write_fn: function pointer to write to device registers
>   */
> @@ -188,6 +190,7 @@ struct xusb_udc {
>  	void __iomem *addr;
>  	spinlock_t lock;
>  	bool dma_enabled;
> +	struct clk *clk;
>  
>  	unsigned int (*read_fn)(void __iomem *);
>  	void (*write_fn)(void __iomem *, u32, u32);
> @@ -2092,6 +2095,26 @@ static int xudc_probe(struct platform_device *pdev)
>  	udc->gadget.ep0 = &udc->ep[XUSB_EP_NUMBER_ZERO].ep_usb;
>  	udc->gadget.name = driver_name;
>  
> +	udc->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
> +	if (IS_ERR(udc->clk)) {
> +		if (PTR_ERR(udc->clk) != -ENOENT) {
> +			ret = PTR_ERR(udc->clk);
> +			goto fail;
> +		}
> +
> +		/*
> +		 * Clock framework support is optional, continue on,
> +		 * anyways if we don't find a matching clock
> +		 */
> +		udc->clk = NULL;

should it be, though? Might be a good idea to add fixed-clock instances
to the boards still depending on clock framework. Maybe that can be done
over time, but worth considering anyhow.

-- 
balbi
