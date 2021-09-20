Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3416C4113C8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 13:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbhITLvY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 07:51:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235132AbhITLvX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 07:51:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8792960FED;
        Mon, 20 Sep 2021 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632138596;
        bh=V+cmBJRSR3gf9oZ1kuR9sZl6koEX81Mz5k2mSytdilA=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=KVi60HGTp7mtplQ+bYfIsLc2QLkmJeu/k0QXTm3jQQ8JZ5WILN/8tY+R6HKa+nbr0
         MMtgsZ/IBxT4zw3RknX8rUBJuyFrjT/Se4xpvq7SMgYcjvP9drAz+iYbXdn+3jtWPU
         DjlEpiVzHvqWDLo5tSms/bO8VZNbzNwpq2n3gzOFfwKoL4u+rId2uSNCCU22U9/p9/
         FOSs63radpcC3hB6XIp6vTRcNglcEsT0EDxfwGZnf7CKJIAVNZpjLLfTY4M6HWrZ5c
         /x1T20oHOhauboJukxqYTwMTt43PNi+XIGPaVUcZdRfSb4UhilKyHl9mvpMHDzetdR
         9xZL5FlAKgDTQ==
References: <cover.1631871264.git.shubhrajyoti.datta@xilinx.com>
 <7341ed525f03f4593958bb3d1232660df23f838f.1631871264.git.shubhrajyoti.datta@xilinx.com>
User-agent: mu4e 1.6.6; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com,
        git@xilinx.com
Subject: Re: [PATCH v2 1/2] usb: gadget: udc-xilinx: Add clock support
Date:   Mon, 20 Sep 2021 14:48:52 +0300
In-reply-to: <7341ed525f03f4593958bb3d1232660df23f838f.1631871264.git.shubhrajyoti.datta@xilinx.com>
Message-ID: <87wnnbqxem.fsf@kernel.org>
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

might be a way idea to add a dev_warn() here in case you get
ENOENT. This should let people that DTS has to be updated accordingly.

-- 
balbi
