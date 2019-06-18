Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5375749B05
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 09:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfFRHqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 03:46:40 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53643 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfFRHqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 03:46:39 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DF38AFF807;
        Tue, 18 Jun 2019 07:46:33 +0000 (UTC)
Date:   Tue, 18 Jun 2019 09:46:33 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        James Grant <james.grant@jci.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: lpc32xx: allocate descriptor with
 GFP_ATOMIC
Message-ID: <20190618074633.GC23549@piout.net>
References: <20190510124248.2430-1-alexandre.belloni@bootlin.com>
 <87zhmffiui.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhmffiui.fsf@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 18/06/2019 10:33:41+0300, Felipe Balbi wrote:
> Alexandre Belloni <alexandre.belloni@bootlin.com> writes:
> 
> > Gadget drivers may queue request in interrupt context. This would lead to
> > a descriptor allocation in that context. In that case we would hit
> > BUG_ON(in_interrupt()) in __get_vm_area_node.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> > index d8f1c60793ed..b706d9c85a35 100644
> > --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> > +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> > @@ -938,7 +938,7 @@ static struct lpc32xx_usbd_dd_gad *udc_dd_alloc(struct lpc32xx_udc *udc)
> >  	struct lpc32xx_usbd_dd_gad	*dd;
> >  
> >  	dd = (struct lpc32xx_usbd_dd_gad *) dma_pool_alloc(
> > -			udc->dd_cache, (GFP_KERNEL | GFP_DMA), &dma);
> > +			udc->dd_cache, (GFP_ATOMIC | GFP_DMA), &dma);
> 
> doesn't apply:
> 
> checking file drivers/usb/gadget/udc/lpc32xx_udc.c
> Hunk #1 FAILED at 938.
> 

You already applied it for v5.2-rc5


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
