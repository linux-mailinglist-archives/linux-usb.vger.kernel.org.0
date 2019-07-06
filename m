Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547C060E50
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 02:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfGFAoR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 20:44:17 -0400
Received: from gate.crashing.org ([63.228.1.57]:57769 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfGFAoR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:44:17 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660iCl7017702;
        Fri, 5 Jul 2019 19:44:13 -0500
Message-ID: <dfcd78c444df04772bf15f763d893808e29f9c01.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] usb: gadget: aspeed: Don't set port enable change
 bit on reset
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>
Date:   Sat, 06 Jul 2019 10:44:12 +1000
In-Reply-To: <e4d9881ac8f05550ba52a2a9d8682efd91a514ab.camel@amazon.com>
References: <e4d9881ac8f05550ba52a2a9d8682efd91a514ab.camel@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-07-02 at 21:17 +1000, Benjamin Herrenschmidt wrote:
> This bit should be only set when the port enable goes down, for
> example, on errors. Not when it gets set after a port reset. MacOS
> seems sensitive to this and fails enumeration.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Note: I don't know if you already applied those two, so I'll add them
to a new series I'm about to post with more fixes to that driver, feel
free to drop the first two from the series if you have as they are
identical to these.


> ---
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 7c040f56100e..0755115fd90d 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -449,8 +449,15 @@ static void ast_vhub_change_port_stat(struct
> ast_vhub *vhub,
>  		       USB_PORT_STAT_C_OVERCURRENT |
>  		       USB_PORT_STAT_C_RESET |
>  		       USB_PORT_STAT_C_L1;
> -		p->change |= chg;
>  
> +		/*
> +		 * We only set USB_PORT_STAT_C_ENABLE if we are
> disabling
> +		 * the port as per USB spec, otherwise MacOS gets upset
> +		 */
> +		if (p->status & USB_PORT_STAT_ENABLE)
> +			chg &= ~USB_PORT_STAT_C_ENABLE;
> +
> +		p->change = chg;
>  		ast_vhub_update_hub_ep1(vhub, port);
>  	}
>  }
> 

