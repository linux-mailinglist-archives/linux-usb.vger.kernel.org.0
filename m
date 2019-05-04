Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61331139B4
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2019 14:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfEDMSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 May 2019 08:18:00 -0400
Received: from mleia.com ([178.79.152.223]:42728 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbfEDMSA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 May 2019 08:18:00 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 5F5AD46792C;
        Sat,  4 May 2019 13:17:58 +0100 (BST)
Subject: Re: [PATCH -next] usb: gadget: udc: lpc32xx: fix return value check
 in lpc32xx_udc_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <20190504070407.56915-1-weiyongjun1@huawei.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <5a3a89cf-eee3-136c-1c5a-58024e946a24@mleia.com>
Date:   Sat, 4 May 2019 15:17:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190504070407.56915-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190504_131758_411217_35442B8F 
X-CRM114-Status: GOOD (  18.24  )
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Wei Yongjun,

On 05/04/2019 10:04 AM, Wei Yongjun wrote:
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 408b56ca5c8e ("usb: gadget: udc: lpc32xx: simplify probe")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/gadget/udc/lpc32xx_udc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> index d8f1c60793ed..00fb79c6d025 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -3070,9 +3070,9 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
>  	}
>  
>  	udc->udp_baseaddr = devm_ioremap_resource(dev, res);
> -	if (!udc->udp_baseaddr) {
> +	if (IS_ERR(udc->udp_baseaddr)) {
>  		dev_err(udc->dev, "IO map failure\n");
> -		return -ENOMEM;
> +		return PTR_ERR(udc->udp_baseaddr);
>  	}
>  
>  	/* Get USB device clock */

thank you for the change, it is a correct fix.

I do suppose that dev_err() in the context can be evenly removed, but
likely it should be another change.

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
