Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F3B2201E3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 03:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgGOBcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 21:32:17 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:53131 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgGOBcR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 21:32:17 -0400
Received: from cwh (fob.gandi.net [217.70.181.1])
        (Authenticated sender: wxcafe@wxcafe.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 69093E0007;
        Wed, 15 Jul 2020 01:32:15 +0000 (UTC)
Message-ID: <7dbc46a51a7a2b8318418a0d40af3353b8f812c2.camel@wxcafe.net>
Subject: [PATCH 2/4] cdc_ether: export usbnet_cdc_update_filter
From:   =?ISO-8859-1?Q?Wxcaf=E9?= <wxcafe@wxcafe.net>
To:     linux-usb@vger.kernel.org
Cc:     Miguel =?ISO-8859-1?Q?Rodr=EDguez_P=E9rez?= 
        <miguel@det.uvigo.gal>, oliver@neukum.org, netdev@vger.kernel.org
Date:   Tue, 14 Jul 2020 21:32:12 -0400
In-Reply-To: <0202c34b1b335d8d8fcdd5406f5e8178b4c198ec.camel@wxcafe.net>
References: <0202c34b1b335d8d8fcdd5406f5e8178b4c198ec.camel@wxcafe.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixed the title, sorry

-- 
Wxcafé <wxcafe@wxcafe.net>

On Tue, 2020-07-14 at 21:25 -0400, Wxcafé wrote:
> This makes the function available to other drivers, like cdn_ncm.
> 
> Signed-off-by: Miguel Rodríguez Pérez <miguel@det.uvigo.gal>
> ---
>  drivers/net/usb/cdc_ether.c | 3 ++-
>  include/linux/usb/usbnet.h  | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/usb/cdc_ether.c
> b/drivers/net/usb/cdc_ether.c
> index 2afe258e3648..8c1d61c2cbac 100644
> --- a/drivers/net/usb/cdc_ether.c
> +++ b/drivers/net/usb/cdc_ether.c
> @@ -63,7 +63,7 @@ static const u8 mbm_guid[16] = {
>  	0xa6, 0x07, 0xc0, 0xff, 0xcb, 0x7e, 0x39, 0x2a,
>  };
>  
> -static void usbnet_cdc_update_filter(struct usbnet *dev)
> +void usbnet_cdc_update_filter(struct usbnet *dev)
>  {
>  	struct net_device	*net = dev->net;
>  
> @@ -90,6 +90,7 @@ static void usbnet_cdc_update_filter(struct usbnet
> *dev)
>  			USB_CTRL_SET_TIMEOUT
>  		);
>  }
> +EXPORT_SYMBOL_GPL(usbnet_cdc_update_filter);
>  
>  /* probes control interface, claims data interface, collects the
> bulk
>   * endpoints, activates data interface (if needed), maybe sets MTU.
> diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
> index b0bff3083278..33e7803b85af 100644
> --- a/include/linux/usb/usbnet.h
> +++ b/include/linux/usb/usbnet.h
> @@ -286,4 +286,5 @@ extern void usbnet_update_max_qlen(struct usbnet
> *dev);
>  extern void usbnet_get_stats64(struct net_device *dev,
>  			       struct rtnl_link_stats64 *stats);
>  
> +extern void usbnet_cdc_update_filter(struct usbnet *);
>  #endif /* __LINUX_USB_USBNET_H */
> -- 
> 2.27.0
> 

