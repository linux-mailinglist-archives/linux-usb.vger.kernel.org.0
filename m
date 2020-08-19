Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C1924A24D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 17:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgHSPAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 11:00:08 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42481 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727087AbgHSO77 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Aug 2020 10:59:59 -0400
Received: (qmail 183296 invoked by uid 1000); 19 Aug 2020 10:59:57 -0400
Date:   Wed, 19 Aug 2020 10:59:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 10/10] usb: udc: net2280: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200819145957.GA183103@rowland.harvard.edu>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597840865-26631-10-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597840865-26631-10-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 08:41:05PM +0800, Chunfeng Yun wrote:
> Use readl_poll_timeout_atomic() to simplify code
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/gadget/udc/net2280.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> index 7530bd9..f1a21f4 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -52,6 +52,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/prefetch.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  
>  #include <asm/byteorder.h>
>  #include <asm/irq.h>
> @@ -360,18 +361,16 @@ static inline void enable_pciirqenb(struct net2280_ep *ep)
>  static int handshake(u32 __iomem *ptr, u32 mask, u32 done, int usec)
>  {
>  	u32	result;
> +	int	ret;
>  
> -	do {
> -		result = readl(ptr);
> -		if (result == ~(u32)0)		/* "device unplugged" */
> -			return -ENODEV;
> -		result &= mask;
> -		if (result == done)
> -			return 0;
> -		udelay(1);
> -		usec--;
> -	} while (usec > 0);
> -	return -ETIMEDOUT;
> +	ret = readl_poll_timeout_atomic(ptr, result,
> +					((result & mask) == done ||
> +					 result == U32_MAX),
> +					1, usec);
> +	if (result == U32_MAX)		/* device unplugged */
> +		return -ENODEV;
> +
> +	return ret;
>  }
>  
>  static const struct usb_ep_ops net2280_ep_ops;
> -- 

Acked-by: Alan Stern <stern@rowland.harvard.edu>

However, I noticed that the kerneldoc for readl_poll_timeout_atomic() is 
out of date.  Can you fix it up?

Alan Stern
