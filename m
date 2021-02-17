Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DC331D79F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Feb 2021 11:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhBQKk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Feb 2021 05:40:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229953AbhBQKkY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Feb 2021 05:40:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F33A64E24;
        Wed, 17 Feb 2021 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613558382;
        bh=iK22VCAfzy2/8scOE9xyat4rBgd68SJ5k9nwJPhHmAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fcytcU2A9WrkgcOefNMAApXI3fsNETMMRF1Y8mrPkqM2syCgVBvy+4qDpP/t7NSfI
         U5cHPmVKufA+B1W4rLpNId1fHLVsGNiiWUlfk/1nH3otVz6vW5bBRn+i3+1tNXgvyj
         c6zna9qIvu/6WlwqGzVADFlT0gNRCjkQHjAB4oILjK2LAPZ0EAYBWnGcs7NqsGcWuO
         dEx08Bl1VH8VL4X0xrRWP3u0Wkg7/tAHcb1MUd+oUyVG06Zz9aH8S0YwmZlceFwVIR
         3D9yFgCEjgJFLYt+x1djpbiW22yuOP5e7d452RuVkS6Dw3VZ7vm4c9oZSfPL/I9xmz
         sjmZ5TS3uUoyQ==
Date:   Wed, 17 Feb 2021 18:39:38 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Frank Li <Frank.Li@nxp.com>
Cc:     pawell@cadence.com, a-govindraju@ti.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        lznuaa@gmail.com
Subject: Re: [PATCH v3 1/1] usb: cdns3: add power lost support for system
 resume
Message-ID: <20210217103938.GA5107@b29397-desktop>
References: <20210208174820.31182-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208174820.31182-1-Frank.Li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-02-08 11:48:20, Frank Li wrote:
> If the controller lost its power during the system suspend, we need
> to do all initialiation operations.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Change from v1 to v3. 
>  - fix build error
>  - remove ret variable at cdns_is_power_lost
> 
>  drivers/usb/cdns3/cdns3-gadget.c |  2 ++
>  drivers/usb/cdns3/cdns3-imx.c    | 34 ++++++++++++++++++++++++++++++++

Please split imx part from this patch, and as a separate patch.
Pawel, please check if it will affect cdns3 ssp part, if not, I will
queue it.

>  drivers/usb/cdns3/cdns3-plat.c   | 22 ++++++++++++++++++++-
>  drivers/usb/cdns3/core.c         | 29 ++++++++++++++++++++++++++-
>  drivers/usb/cdns3/drd.c          | 16 +++++++++++++++
>  drivers/usb/cdns3/drd.h          |  2 +-
>  6 files changed, 102 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index 582bfeceedb4..44b7301b1888 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -3304,6 +3304,8 @@ static int cdns3_gadget_resume(struct cdns *cdns, bool hibernated)
>  		return 0;
>  
>  	cdns3_gadget_config(priv_dev);
> +	if (hibernated)
> +		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
>  
>  	return 0;
>  }
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
> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
> index 4b18e1c6a4bb..e61da57fe31a 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c
> @@ -19,6 +19,7 @@
>  
>  #include "core.h"
>  #include "gadget-export.h"
> +#include "drd.h"
>  
>  static int set_phy_power_on(struct cdns *cdns)
>  {
> @@ -236,6 +237,17 @@ static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
>  	if (!cdns->in_lpm)
>  		return 0;
>  
> +	if (cdns_power_is_lost(cdns)) {
> +		phy_exit(cdns->usb2_phy);
> +		ret = phy_init(cdns->usb2_phy);
> +		if (ret)
> +			return ret;

Add one blank line

Peter

> +		phy_exit(cdns->usb3_phy);
> +		ret = phy_init(cdns->usb3_phy);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = set_phy_power_on(cdns);
>  	if (ret)
>  		return ret;
> @@ -270,10 +282,18 @@ static int cdns3_plat_runtime_resume(struct device *dev)
>  static int cdns3_plat_suspend(struct device *dev)
>  {
>  	struct cdns *cdns = dev_get_drvdata(dev);
> +	int ret;
>  
>  	cdns_suspend(cdns);
>  
> -	return cdns3_controller_suspend(dev, PMSG_SUSPEND);
> +	ret = cdns3_controller_suspend(dev, PMSG_SUSPEND);
> +	if (ret)
> +		return ret;
> +
> +	if (device_may_wakeup(dev) && cdns->wakeup_irq)
> +		enable_irq_wake(cdns->wakeup_irq);
> +
> +	return ret;
>  }
>  
>  static int cdns3_plat_resume(struct device *dev)
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 199713769289..5d486c8a9d99 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -525,9 +525,36 @@ EXPORT_SYMBOL_GPL(cdns_suspend);
>  int cdns_resume(struct cdns *cdns, u8 set_active)
>  {
>  	struct device *dev = cdns->dev;
> +	enum usb_role real_role;
> +	bool role_changed = false;
> +	int ret;
> +
> +	if (cdns_power_is_lost(cdns)) {
> +		if (cdns->role_sw) {
> +			cdns->role = cdns_role_get(cdns->role_sw);
> +		} else {
> +			real_role = cdns_hw_role_state_machine(cdns);
> +			if (real_role != cdns->role) {
> +				ret = cdns_hw_role_switch(cdns);
> +				if (ret)
> +					return ret;
> +				role_changed = true;
> +			}
> +		}
> +
> +		if (!role_changed) {
> +			if (cdns->role == USB_ROLE_HOST)
> +				ret = cdns_drd_host_on(cdns);
> +			else if (cdns->role == USB_ROLE_DEVICE)
> +				ret = cdns_drd_gadget_on(cdns);
> +
> +			if (ret)
> +				return ret;
> +		}
> +	}
>  
>  	if (cdns->roles[cdns->role]->resume)
> -		cdns->roles[cdns->role]->resume(cdns, false);
> +		cdns->roles[cdns->role]->resume(cdns, cdns_power_is_lost(cdns));
>  
>  	if (set_active) {
>  		pm_runtime_disable(dev);
> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
> index 605a413db727..1213c540deb3 100644
> --- a/drivers/usb/cdns3/drd.c
> +++ b/drivers/usb/cdns3/drd.c
> @@ -478,3 +478,19 @@ int cdns_drd_exit(struct cdns *cdns)
>  
>  	return 0;
>  }
> +
> +
> +/* Indicate the cdns3 core was power lost before */
> +bool cdns_power_is_lost(struct cdns *cdns)
> +{
> +	if (cdns->version == CDNS3_CONTROLLER_V1) {
> +		if (!(readl(&cdns->otg_v1_regs->simulate) & BIT(0)))
> +			return true;
> +	} else {
> +		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +EXPORT_SYMBOL_GPL(cdns_power_is_lost);
> diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
> index 9724acdecbbb..cbdf94f73ed9 100644
> --- a/drivers/usb/cdns3/drd.h
> +++ b/drivers/usb/cdns3/drd.h
> @@ -215,5 +215,5 @@ int cdns_drd_gadget_on(struct cdns *cdns);
>  void cdns_drd_gadget_off(struct cdns *cdns);
>  int cdns_drd_host_on(struct cdns *cdns);
>  void cdns_drd_host_off(struct cdns *cdns);
> -
> +bool cdns_power_is_lost(struct cdns *cdns);
>  #endif /* __LINUX_CDNS3_DRD */
> -- 
> 2.24.0.rc1
> 

-- 

Thanks,
Peter Chen

