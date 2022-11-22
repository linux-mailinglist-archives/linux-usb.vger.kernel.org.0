Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166C26340EE
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 17:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbiKVQJt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 11:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbiKVQJr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 11:09:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1186C7340C
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 08:09:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6F76B81BEA
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 16:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1946C433C1;
        Tue, 22 Nov 2022 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669133384;
        bh=njWJAQ+O01ZDITWiKKz1GOqaJgV/9mR5GQdyitwDyz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I+h67Hx9tdw+3x3zysWIsA32HYsL6Ir//M6nzGmQLTbSiMhulhBvE3LtliFFJ4Qdh
         jFfVEJUrxMhpUugX2wMYdTTBX+gDMCyL7jiuibuFN1E1HSOsP9Xr7nF1buOx2Xu9ut
         H6jkeZ106yIaKpSexzLeOe9veYQ4xp3yrXgXMLnI=
Date:   Tue, 22 Nov 2022 17:09:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     yhchen@faraday-tech.com, mudongliangabcd@gmail.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: fusb300_udc: free irq on the error path
 in fusb300_probe()
Message-ID: <Y3z0RNumksn8cUwM@kroah.com>
References: <20221121014623.769014-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121014623.769014-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 09:46:23AM +0800, Gaosheng Cui wrote:
> When request_irq(ires1->start) failed in w5300_hw_probe(), irq ires->start
> has not been freed, and on the clean_up3 error path, we also need to free
> ires1->start irq.
> 
> In addition, We need to add free_irq in fusb300_remove(), fix it.
> 
> Fixes: 0fe6f1d1f612 ("usb: udc: add Faraday fusb300 driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v2:
> - Add free_irq in fusb300_remove(), thanks!
>  drivers/usb/gadget/udc/fusb300_udc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
> index 9af8b415f303..d6b2f76d2662 100644
> --- a/drivers/usb/gadget/udc/fusb300_udc.c
> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
> @@ -1347,6 +1347,7 @@ static int fusb300_remove(struct platform_device *pdev)
>  	usb_del_gadget_udc(&fusb300->gadget);
>  	iounmap(fusb300->reg);
>  	free_irq(platform_get_irq(pdev, 0), fusb300);
> +	free_irq(platform_get_irq(pdev, 1), fusb300);
>  
>  	fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
>  	for (i = 0; i < FUSB300_MAX_NUM_EP; i++)
> @@ -1432,7 +1433,7 @@ static int fusb300_probe(struct platform_device *pdev)
>  			IRQF_SHARED, udc_name, fusb300);
>  	if (ret < 0) {
>  		pr_err("request_irq1 error (%d)\n", ret);
> -		goto clean_up;
> +		goto clean_up2;

"clean_up2" means nothing.  Please give lables a proper name so that
they can be understood easily.

thanks,

greg k-h
