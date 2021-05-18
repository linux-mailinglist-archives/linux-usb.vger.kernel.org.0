Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5182F387D8D
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 18:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239835AbhERQdQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 12:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237685AbhERQdP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 May 2021 12:33:15 -0400
X-Greylist: delayed 499 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 May 2021 09:31:57 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A25CC061756
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 09:31:57 -0700 (PDT)
Received: from [IPv6:2003:d8:3f18:1d52:34a5:c062:d8b3:f51c] (p200300d83f181d5234a5c062d8b3f51c.dip0.t-ipconnect.de [IPv6:2003:d8:3f18:1d52:34a5:c062:d8b3:f51c])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 0A4524E39DB;
        Tue, 18 May 2021 16:23:34 +0000 (UTC)
Subject: Re: [PATCH] USB: gadget: pxa25x_udc: remove dentry storage for
 debugfs file
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>
References: <20210518162054.3697992-1-gregkh@linuxfoundation.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <00cc26c8-313c-9573-7138-754d86f4ca81@zonque.org>
Date:   Tue, 18 May 2021 18:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518162054.3697992-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/18/21 6:20 PM, Greg Kroah-Hartman wrote:
> There is no need to store the dentry pointer for a debugfs file that we
> only use to remove it when the device goes away.  debugfs can do the
> lookup for us instead, saving us some trouble, and making things smaller
> overall.
> 
> Cc: Daniel Mack <daniel@zonque.org>

Acked-by: Daniel Mack <daniel@zonque.org>


Greg, can you take this via your tree?


Thanks,
Daniel



> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/gadget/udc/pxa25x_udc.c | 4 ++--
>  drivers/usb/gadget/udc/pxa25x_udc.h | 4 ----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
> index 10324a7334fe..69ef1e669d0c 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.c
> @@ -1338,10 +1338,10 @@ DEFINE_SHOW_ATTRIBUTE(udc_debug);
>  
>  #define create_debug_files(dev) \
>  	do { \
> -		dev->debugfs_udc = debugfs_create_file(dev->gadget.name, \
> +		debugfs_create_file(dev->gadget.name, \
>  			S_IRUGO, NULL, dev, &udc_debug_fops); \
>  	} while (0)
> -#define remove_debug_files(dev) debugfs_remove(dev->debugfs_udc)
> +#define remove_debug_files(dev) debugfs_remove(debugfs_lookup(dev->gadget.name, NULL))
>  
>  #else	/* !CONFIG_USB_GADGET_DEBUG_FILES */
>  
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.h b/drivers/usb/gadget/udc/pxa25x_udc.h
> index ccc6b921f067..aa4b68fd9fc0 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.h
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.h
> @@ -116,10 +116,6 @@ struct pxa25x_udc {
>  	struct usb_phy				*transceiver;
>  	u64					dma_mask;
>  	struct pxa25x_ep			ep [PXA_UDC_NUM_ENDPOINTS];
> -
> -#ifdef CONFIG_USB_GADGET_DEBUG_FS
> -	struct dentry				*debugfs_udc;
> -#endif
>  	void __iomem				*regs;
>  };
>  #define to_pxa25x(g)	(container_of((g), struct pxa25x_udc, gadget))
> 

