Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAC232F7F8
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 04:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhCFDOR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 22:14:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:58486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhCFDNt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Mar 2021 22:13:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A14C764F9C;
        Sat,  6 Mar 2021 03:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615000429;
        bh=2MzrbkBJCnXle4Uc8uEBZaFROhXRz9S2cN41AUv3PIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZUOS230VbWGPR7TkKb3mHIrAq+n0fQ7RJhuGZKtKIRPMn0ElrqqbcR52HOxDJ2u84
         rHqPZmLayJMBB36NtszSBpEltPuCRo4Bm+x9El0aNNvdGOOTCjFLkoc4upr2d4Mrof
         uz6rt6B8I/kleQWUNuuOCFRKpXouWqN8AjCAVYe6rLxsbPIAblsR2P/lIYMvG9zreJ
         Frs6lihHspoWZmN+hsnEVE1js9AJXo2aWfMmSve7uz7S+YdbbiyQQYqXx0o2O0dnG0
         ELAaSe9qhRXjpb5CDvdz9cR2QQwEM5gqIFpg7d4wyBcd80OkfI0+hG+iFnifrsewEu
         qZFXS9pdrQbIw==
Date:   Sat, 6 Mar 2021 11:13:43 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Frank Li <lznuaa@gmail.com>
Cc:     pawell@cadence.com, a-govindraju@ti.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] usb: cdns3: imx: add power lost support for
 system resume
Message-ID: <20210306031343.GA28902@b29397-desktop>
References: <20210218225109.265730-1-Frank.Li@nxp.com>
 <20210218225109.265730-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218225109.265730-2-Frank.Li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-02-18 16:51:09, Frank Li wrote:
> From: Frank Li <Frank.li@nxp.com>
> 
> imx need special handle when controller lost power
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both, thanks.

Peter

> ---
> split imx part 
> 
>  drivers/usb/cdns3/cdns3-imx.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index 8f88eec0b0ea..708b51cc5844 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -361,6 +361,39 @@ static int cdns_imx_suspend(struct device *dev)
>  
>  	return 0;
>  }
> +
> +
> +/* Indicate if the controller was power lost before */
> +static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
> +{
> +	u32 value;
> +
> +	value = cdns_imx_readl(data, USB3_CORE_CTRL1);
> +	if ((value & SW_RESET_MASK) == ALL_SW_RESET)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static int cdns_imx_system_resume(struct device *dev)
> +{
> +	struct cdns_imx *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = cdns_imx_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (cdns_imx_is_power_lost(data)) {
> +		dev_dbg(dev, "resume from power lost\n");
> +		ret = cdns_imx_noncore_init(data);
> +		if (ret)
> +			cdns_imx_suspend(dev);
> +	}
> +
> +	return ret;
> +}
> +
>  #else
>  static int cdns_imx_platform_suspend(struct device *dev,
>  	bool suspend, bool wakeup)
> @@ -372,6 +405,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
>  
>  static const struct dev_pm_ops cdns_imx_pm_ops = {
>  	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
>  };
>  
>  static const struct of_device_id cdns_imx_of_match[] = {
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

