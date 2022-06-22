Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C355542A0
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 08:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbiFVGLd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 02:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbiFVGLb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 02:11:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B35620F4B
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 23:11:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 539A5B81C4B
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 06:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7824AC34114;
        Wed, 22 Jun 2022 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655878288;
        bh=xKZFvn44TVCKBwbFNgbclrJugXr5d6NQghY3H/Z6M90=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N/VKWhAfpB4HS5DCPNsa3m+mwPsGZN0Rxv+1euVDptLMDhUZwICPdAZUzf9InwmNf
         uyrDCt5timcgCUHhRsq7mA1ccVTa8GhrEuGIO9yI9h4OYbTSVzrmR7YPox0YM+6R6B
         ew+R1TBb74XVapvArx3TD7ckSVQEDg248ZdLC8Mo=
Date:   Wed, 22 Jun 2022 08:11:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Darren Stevens <darren@stevens-zone.net>
Cc:     linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host
 mode.
Message-ID: <YrKyjITQbhiHiCcq@kroah.com>
References: <20220621230941.381f9791@Cyrus.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621230941.381f9791@Cyrus.lan>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 21, 2022 at 11:09:41PM +0100, Darren Stevens wrote:
> In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.
> 
> Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)

Nit, please put a space after the :.

Also not that many characters are needed, as you can see in our
documentation, this is the proper format:

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")

> Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by Darren Stevens <darren@stevens-zone.net>
> ---
> Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
> correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 385be30..d0bf7fb 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/fsl_devices.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_address.h>
>  #include <linux/io.h>
>  
>  #include "ehci.h"
> @@ -46,9 +47,10 @@ static struct hc_driver __read_mostly
> fsl_ehci_hc_driver; */
>  static int fsl_ehci_drv_probe(struct platform_device *pdev)
>  {
> +	struct device_node *dn = pdev->dev.of_node;
>  	struct fsl_usb2_platform_data *pdata;
>  	struct usb_hcd *hcd;
> -	struct resource *res;
> +	struct resource res;
>  	int irq;
>  	int retval;
>  	u32 tmp;
> @@ -76,14 +78,10 @@ static int fsl_ehci_drv_probe(struct
> platform_device *pdev) return -ENODEV;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev,
> -			"Found HC with no IRQ. Check %s setup!\n",
> -			dev_name(&pdev->dev));
> -		return -ENODEV;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		return irq;
>  	}

Did you run checkpatch on this?  Coding style is not correct :(

thanks,

greg k-h
