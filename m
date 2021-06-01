Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2769391898
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhEZNU1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhEZNU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:20:27 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85BC9C061574
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:18:55 -0700 (PDT)
Received: from [10.100.244.107] (unknown [176.126.217.202])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 388A54CC777;
        Wed, 26 May 2021 13:18:51 +0000 (UTC)
Subject: Re: [PATCH 18/24] usb: gadget: udc: pxa27x_udc: Fix documentation for
 'pxa27x_udc_start()'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-19-lee.jones@linaro.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <e3dc3a08-ffab-e145-2777-34d310c20ef7@zonque.org>
Date:   Wed, 26 May 2021 15:18:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526130037.856068-19-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/26/21 3:00 PM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/usb/gadget/udc/pxa27x_udc.c:1749: warning: expecting prototype for pxa27x_start(). Prototype was for pxa27x_udc_start() instead
> 

Acked-by: Daniel Mack <daniel@zonque.org>


Thanks!


> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index ce57961dfd2d6..b2759b04b8e94 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1730,7 +1730,7 @@ static void udc_enable(struct pxa_udc *udc)
>  }
>  
>  /**
> - * pxa27x_start - Register gadget driver
> + * pxa27x_udc_start - Register gadget driver
>   * @g: gadget
>   * @driver: gadget driver
>   *
> 

