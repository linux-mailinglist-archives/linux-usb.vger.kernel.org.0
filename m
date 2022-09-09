Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B75A5B2E30
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 07:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiIIFjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 01:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiIIFjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 01:39:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AEE1D0FA;
        Thu,  8 Sep 2022 22:39:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BE9D61E22;
        Fri,  9 Sep 2022 05:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C799C433C1;
        Fri,  9 Sep 2022 05:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662701974;
        bh=XZoGAJnq0Epw0ofT4kF1WcYEbl8SCrwY3jcmk+Ck+Fw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tzbWQDzQqSF1qxkUvwWC+MToN1KwKYT9TwEsc2n1pzdho9Xb9LiovSGRBFjzkSY0H
         U+QcC13iijqcN0VFut0gJrw/AA0rt15aAkIpWqr/c2uHK6PejyH6q2YxQhPHQpT3pJ
         DU6iteSAc6wUZh4i7Dnsk6LbEdZBiYZIEXwmbShA=
Date:   Fri, 9 Sep 2022 07:39:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sun Ke <sunke32@huawei.com>
Cc:     vincent.sunplus@gmail.com, kishon@ti.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: usb: Fix potential NULL dereference in
 sp_usb_phy_probe()
Message-ID: <YxrRlCytfPobnjSv@kroah.com>
References: <20220909013546.2259545-1-sunke32@huawei.com>
 <20220909013546.2259545-2-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909013546.2259545-2-sunke32@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 09, 2022 at 09:35:45AM +0800, Sun Ke wrote:
> platform_get_resource_byname() may fail and return NULL, so we should
> better check it s return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>  drivers/phy/sunplus/phy-sunplus-usb2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
> index 5269968b3060..d73a8a421d9c 100644
> --- a/drivers/phy/sunplus/phy-sunplus-usb2.c
> +++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
> @@ -249,11 +249,15 @@ static int sp_usb_phy_probe(struct platform_device *pdev)
>  	usbphy->dev = &pdev->dev;
>  
>  	usbphy->phy_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");

How can this fail on this system?

> +	if (!usbphy->phy_res_mem)
> +		return -EINVAL;
>  	usbphy->phy_regs = devm_ioremap_resource(&pdev->dev, usbphy->phy_res_mem);
>  	if (IS_ERR(usbphy->phy_regs))
>  		return PTR_ERR(usbphy->phy_regs);
>  
>  	usbphy->moon4_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "moon4");

Same here, how can this fail?
Have you seen these failures happen in real systems?

thanks,

greg k-h
