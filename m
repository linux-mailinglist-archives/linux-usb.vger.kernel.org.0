Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A667280C3
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 17:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbfEWPPZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 11:15:25 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:59683 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730782AbfEWPPZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 May 2019 11:15:25 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 2D1CB440061;
        Thu, 23 May 2019 18:15:22 +0300 (IDT)
Date:   Thu, 23 May 2019 18:15:20 +0300
From:   Baruch Siach <baruch@tkos.co.il>
To:     Jun Li <jun.li@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2] usb: dwc3: move core validation to be after clks
 enable
Message-ID: <20190523151520.pa4zkby24cktnvl6@tarshish>
References: <1557311367-5863-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557311367-5863-1-git-send-email-jun.li@nxp.com>
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jun Li,

On Wed, May 08, 2019 at 10:52:37AM +0000, Jun Li wrote:
> From: Jun Li <jun.li@nxp.com>
> 
> Register access in core validation may hang before the bulk
> clks are enabled.

This patch fixes the hang issue for on my i.MX8MQ based system.

Tested-by: Baruch Siach <baruch@tkos.co.il>

However, commit b873e2d0ea1e is meant to move dwc3_core_is_valid() before 
dwc3_get_dr_mode(). With this patch dwc3_get_dr_mode() is called from 
dwc3_get_properties() before dwc3_core_is_valid().

I guess we need a larger change in the initialization sequence.

Thanks,
baruch

> Fixes: b873e2d0ea1e ("usb: dwc3: Do core validation early on probe")
> Signed-off-by: Jun Li <jun.li@nxp.com>
> ---
> 
> Change for v2:
> - Update ret to be -ENODEV in case dwc3_core_is_valid() fail.
> 
>  drivers/usb/dwc3/core.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 4aff1d8..93b96e6 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1423,11 +1423,6 @@ static int dwc3_probe(struct platform_device *pdev)
>  	dwc->regs	= regs;
>  	dwc->regs_size	= resource_size(&dwc_res);
>  
> -	if (!dwc3_core_is_valid(dwc)) {
> -		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
> -		return -ENODEV;
> -	}
> -
>  	dwc3_get_properties(dwc);
>  
>  	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
> @@ -1460,6 +1455,12 @@ static int dwc3_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unprepare_clks;
>  
> +	if (!dwc3_core_is_valid(dwc)) {
> +		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
> +		ret = -ENODEV;
> +		goto disable_clks;
> +	}
> +
>  	platform_set_drvdata(pdev, dwc);
>  	dwc3_cache_hwparams(dwc);
>  
> @@ -1524,7 +1525,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  err1:
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -
> +disable_clks:
>  	clk_bulk_disable(dwc->num_clks, dwc->clks);
>  unprepare_clks:
>  	clk_bulk_unprepare(dwc->num_clks, dwc->clks);

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
