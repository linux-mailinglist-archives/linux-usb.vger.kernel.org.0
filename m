Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D49221747
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 23:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgGOVp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 17:45:56 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:36715 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOVpz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 17:45:55 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8DDB860002;
        Wed, 15 Jul 2020 21:45:51 +0000 (UTC)
Date:   Wed, 15 Jul 2020 23:45:51 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Songjun Wu <songjun.wu@atmel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND 2/3] usb: gadget: udc: atmel: fix uninitialized
 read in debug printk
Message-ID: <20200715214551.GF23553@piout.net>
References: <cover.1594231056.git.mirq-linux@rere.qmqm.pl>
 <248e7089f7fbb3727e83a1dfb43820d96a69e8c2.1594231056.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <248e7089f7fbb3727e83a1dfb43820d96a69e8c2.1594231056.git.mirq-linux@rere.qmqm.pl>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/07/2020 20:04:09+0200, Michał Mirosław wrote:
> Fixed commit moved the assignment of 'req', but did not update a
> reference in the DBG() call. Use the argument as it was renamed.
> 
> Fixes: 5fb694f96e7c ("usb: gadget: udc: atmel: fix possible oops when unloading module")
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/usb/gadget/udc/atmel_usba_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> index 9153e220848d..9342a3d24963 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> @@ -865,7 +865,7 @@ static int usba_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  	u32 status;
>  
>  	DBG(DBG_GADGET | DBG_QUEUE, "ep_dequeue: %s, req %p\n",
> -			ep->ep.name, req);
> +			ep->ep.name, _req);
>  
>  	spin_lock_irqsave(&udc->lock, flags);
>  
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
