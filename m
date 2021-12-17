Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928EB478914
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 11:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbhLQKjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 05:39:18 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:48176 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233421AbhLQKjS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Dec 2021 05:39:18 -0500
X-Greylist: delayed 376 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Dec 2021 05:39:18 EST
Received: from [192.168.178.106] (p57bc94c7.dip0.t-ipconnect.de [87.188.148.199])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 2A9C9282FDA;
        Fri, 17 Dec 2021 10:32:59 +0000 (UTC)
Message-ID: <32d35b68-50e9-a280-d0f7-edef8165825a@zonque.org>
Date:   Fri, 17 Dec 2021 11:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/4] usb: gadget: udc: pxa25x: propagate errors from
 platform_get_irq()
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org
References: <20211214204247.7172-1-s.shtylyov@omp.ru>
 <20211214204247.7172-3-s.shtylyov@omp.ru>
From:   Daniel Mack <daniel@zonque.org>
In-Reply-To: <20211214204247.7172-3-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/14/21 21:42, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENODEV for some strange reason.  Switch to propagating the error codes
> upstream.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Daniel Mack <daniel@zonque.org>

Greg, could you take this through your tree?


Best,
Daniel



> ---
>  drivers/usb/gadget/udc/pxa25x_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
> index 52cdfd8212d6..b38747fd3bb0 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.c
> @@ -2364,7 +2364,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> -		return -ENODEV;
> +		return irq;
>  
>  	dev->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dev->regs))
> 

