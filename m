Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0C1457BFF
	for <lists+linux-usb@lfdr.de>; Sat, 20 Nov 2021 07:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbhKTGTj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Nov 2021 01:19:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:57402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236068AbhKTGTf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 20 Nov 2021 01:19:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED85C60E9B;
        Sat, 20 Nov 2021 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637388991;
        bh=aCaFFQjePkUYLnmbmH/fFvyrDFOqkjTBBmFsU+zIe9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EgBtlKdNhy1CeCedueLOHb4UibwJX9lA//3kJ1FrBLQ4SdwI2KVxUtKjoOUkRSejC
         99A8IxBOjPln6IadaI4fR8Fki99N87V9MRNUOmQ3/8Xcn/ZsddYdPJFqxVN6Ypda1J
         b5EFC4EYJHB8IluVVTy5OYe7Br5tdvqNxvRd4bfORl8W3sRgzufAf0pZkmKC2Rl1zh
         vRR3cY8PuEBGNNu0QCKbDZ7F2W4612KRPsmxEgqpHpKKIJHJ4pMkmuOwqpb4pOaQ+i
         EXkvqORHz4c8aoAVcFj5ts8gaLSkYitfb6moKMWGOiRcG5ETuBGrKwB3JRioaYxnAS
         RjgFmu9Xfxndw==
Date:   Sat, 20 Nov 2021 14:16:24 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: fix potential error pointer
 dereference in probe
Message-ID: <20211120061624.GA3874@Peter>
References: <20211117074923.GF5237@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117074923.GF5237@kili>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-11-17 10:49:23, Dan Carpenter wrote:
> If the first call to devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0)
> fails with something other than -ENODEV then it leads to an error
> pointer dereference.  For those errors we should just jump directly to
> the error handling.
> 
> Fixes: 8253a34bfae3 ("usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index f1d100671ee6..097142ffb184 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -420,15 +420,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>  	if (IS_ERR(data->phy)) {
>  		ret = PTR_ERR(data->phy);
> -		if (ret == -ENODEV) {
> -			data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
> -			if (IS_ERR(data->phy)) {
> -				ret = PTR_ERR(data->phy);
> -				if (ret == -ENODEV)
> -					data->phy = NULL;
> -				else
> -					goto err_clk;
> -			}
> +		if (ret != -ENODEV)
> +			goto err_clk;
> +		data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
> +		if (IS_ERR(data->phy)) {
> +			ret = PTR_ERR(data->phy);
> +			if (ret == -ENODEV)
> +				data->phy = NULL;
> +			else
> +				goto err_clk;
>  		}
>  	}
>  
> -- 
> 2.20.1
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

