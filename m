Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A732569068D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 12:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjBILSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 06:18:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjBILRT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 06:17:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1575ACC9
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 03:16:23 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pQ4ua-0001ZP-7m; Thu, 09 Feb 2023 12:16:20 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pQ4uZ-0007Cz-Uv; Thu, 09 Feb 2023 12:16:19 +0100
Date:   Thu, 9 Feb 2023 12:16:19 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][6.2] Revert "usb: gadget: u_ether: Do not make UDC
 parent of the net device"
Message-ID: <20230209111619.GP10447@pengutronix.de>
References: <20230209105626.10597-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209105626.10597-1-paul@crapouillou.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 09, 2023 at 10:56:26AM +0000, Paul Cercueil wrote:
> This reverts commit 321b59870f850a10dbb211ecd2bd87b41497ea6f.
> 
> This commit broke USB networking on Ingenic SoCs and maybe elsewhere.
> The actual reason is unknown; and while a proper fix would be better,
> we're sitting at -rc7 now, so a revert is justified - and we can work on
> re-introducing this change for 6.3.
> 
> Fixes: 321b59870f85 ("usb: gadget: u_ether: Do not make UDC parent of the net device")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/gadget/function/u_ether.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 8f12f3f8f6ee..e06022873df1 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -798,6 +798,7 @@ struct eth_dev *gether_setup_name(struct usb_gadget *g,
>  	net->max_mtu = GETHER_MAX_MTU_SIZE;
>  
>  	dev->gadget = g;
> +	SET_NETDEV_DEV(net, &g->dev);
>  	SET_NETDEV_DEVTYPE(net, &gadget_type);
>  
>  	status = register_netdev(net);
> @@ -872,6 +873,8 @@ int gether_register_netdev(struct net_device *net)
>  	struct usb_gadget *g;
>  	int status;
>  
> +	if (!net->dev.parent)
> +		return -EINVAL;
>  	dev = netdev_priv(net);
>  	g = dev->gadget;
>  
> @@ -902,6 +905,7 @@ void gether_set_gadget(struct net_device *net, struct usb_gadget *g)
>  
>  	dev = netdev_priv(net);
>  	dev->gadget = g;
> +	SET_NETDEV_DEV(net, &g->dev);
>  }
>  EXPORT_SYMBOL_GPL(gether_set_gadget);
>  
> -- 
> 2.39.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
