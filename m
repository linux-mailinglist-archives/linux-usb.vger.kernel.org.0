Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB07842264E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 14:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbhJEMYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 08:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233784AbhJEMYX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 08:24:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF54761186;
        Tue,  5 Oct 2021 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633436553;
        bh=xjYxuPHcE+fckCEOqZKaTlkA5kNr/SZJVhCh9p/9sBE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=B0foE4qqyWb4Ka73HWprZU7CpyeQl57wx4vISDvOVzu7h+N41roi6m6GqmRBwChEx
         1QjGM+QrY5ECixVayWqq9Kb3ifrE9HjmY4B/VlH+DK5IcEBQJrG+g5JXDqWZvSt882
         NHXRNOgr5QRsiu18o8YkcmXpv+gZ5y0/x9K54MRhw9hpIc2P2RFiLEjTmU4ff/9R9L
         kmEmZttC8cJfSqyfhw3n36KckkCk9Fl3pd/5MWkBYeSZc0imdCDBssuE1eIP7x32Qv
         J8DpUVqcqdAtrXmfmusnqLNpbToStqjwzy5/2epNHjgEQC/k0iPUjdIS7zpzGbRyO3
         qa3pEKkDhCp+w==
References: <20211005111025.3514231-1-shubhrajyoti.datta@xilinx.com>
User-agent: mu4e 1.6.6; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, shubhrajyoti.datta@gmail.com,
        git-dev@xilinx.com
Subject: Re: [PATCH] usb: xilinx: Add suspend resume support
Date:   Tue, 05 Oct 2021 15:20:21 +0300
In-reply-to: <20211005111025.3514231-1-shubhrajyoti.datta@xilinx.com>
Message-ID: <871r4zzmnu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> writes:

> Add suspend resume support. In the suspend udc is disconnected
> and it is set to ready at resume for it to be functional.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/usb/gadget/udc/udc-xilinx.c | 52 +++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index f5ca670776a3..1369792f195a 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -2176,6 +2176,57 @@ static int xudc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int xudc_suspend(struct device *dev)
> +{
> +	struct xusb_udc *udc;
> +	u32 crtlreg;
> +	unsigned long flags;
> +
> +	udc = dev_get_drvdata(dev);
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	crtlreg = udc->read_fn(udc->addr + XUSB_CONTROL_OFFSET);
> +	crtlreg &= ~XUSB_CONTROL_USB_READY_MASK;
> +
> +	udc->write_fn(udc->addr, XUSB_CONTROL_OFFSET, crtlreg);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +	if (udc->driver && udc->driver->disconnect)
> +		udc->driver->disconnect(&udc->gadget);

Why disconnect? Seems like you should call ->suspend() instead, no?

-- 
balbi
