Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C737C10A15A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 16:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbfKZPld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 10:41:33 -0500
Received: from mga18.intel.com ([134.134.136.126]:48316 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbfKZPld (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Nov 2019 10:41:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Nov 2019 07:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; 
   d="scan'208";a="202753867"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 26 Nov 2019 07:41:30 -0800
Subject: Re: [PATCH 10/10] usb: host: xhci-tegra: Implement basic ELPG support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
 <20191125123210.1564323-11-thierry.reding@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <ceee6a21-c46f-c63f-d38f-78daf7a72969@linux.intel.com>
Date:   Tue, 26 Nov 2019 17:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191125123210.1564323-11-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.11.2019 14.32, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This implements basic engine-level powergate support which allows the
> XUSB controller to be put into a low power mode on system sleep and get
> it out of that low power mode again on resume.
> 
> Based on work by JC Kuo <jckuo@nvidia.com>.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/usb/host/xhci-tegra.c | 137 ++++++++++++++++++++++++++++++++--
>   1 file changed, 129 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index cd3afec408ea..d0e30927a73f 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1451,6 +1451,45 @@ static int tegra_xusb_remove(struct platform_device *pdev)
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> +static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
> +{
> +	struct device *dev = hub->hcd->self.controller;
> +	bool status = true;
> +	unsigned int i;
> +	u32 value;
> +
> +	for (i = 0; i < hub->num_ports; i++) {
> +		value = readl(hub->ports[i]->addr);
> +		if ((value & PORT_PE) == 0)
> +			continue;
> +
> +		if ((value & PORT_PLS_MASK) != XDEV_U3) {
> +			dev_info(dev, "%u-%u isn't suspended: %#010x\n",
> +				 hub->hcd->self.busnum, i + 1, value);
> +			status = false;
> +		}
> +	}
> +
> +	return status;
> +}
> +
> +static int tegra_xusb_check_ports(struct tegra_xusb *tegra)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	unsigned long flags;
> +	int err = 0;
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +
> +	if (!xhci_hub_ports_suspended(&xhci->usb2_rhub) ||
> +	    !xhci_hub_ports_suspended(&xhci->usb3_rhub))
> +		err = -EBUSY;
> +
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	return err;
> +}
> +
>   static void tegra_xusb_save_context(struct tegra_xusb *tegra)
>   {
>   	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
> @@ -1485,31 +1524,113 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
>   	}
>   }
>   
> -static int tegra_xusb_suspend(struct device *dev)
> +static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool wakeup)
>   {
> -	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>   	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> -	bool wakeup = device_may_wakeup(dev);
> +	u32 value;
>   	int err;
>   
> -	/* TODO: Powergate controller across suspend/resume. */
> +	err = tegra_xusb_check_ports(tegra);
> +	if (err < 0) {
> +		dev_err(tegra->dev, "not all ports suspended: %d\n", err);
> +		return err;
> +	}
> +
>   	err = xhci_suspend(xhci, wakeup);
> -	if (err < 0)
> +	if (err < 0) {
> +		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
>   		return err;
> +	}
>   
>   	tegra_xusb_save_context(tegra);
> +	tegra_xusb_phy_disable(tegra);
> +	tegra_xusb_clk_disable(tegra);
>   
>   	return 0;
>   }
>   
> -static int tegra_xusb_resume(struct device *dev)
> +static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool wakeup)
>   {
> -	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>   	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
> +	u32 value;
> +	int err;
>   
> +	err = tegra_xusb_clk_enable(tegra);
> +	if (err < 0) {
> +		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
> +		return err;
> +	}
> +
> +	err = tegra_xusb_phy_enable(tegra);
> +	if (err < 0) {
> +		dev_err(tegra->dev, "failed to enable PHYs: %d\n", err);
> +		goto disable_clk;
> +	}
> +
> +	tegra_xusb_config(tegra);
>   	tegra_xusb_restore_context(tegra);
>   
> -	return xhci_resume(xhci, false);
> +	err = tegra_xusb_load_firmware(tegra);
> +	if (err < 0) {
> +		dev_err(tegra->dev, "failed to load firmware: %d\n", err);
> +		goto disable_phy;
> +	}
> +
> +	err = __tegra_xusb_enable_firmware_messages(tegra);
> +	if (err < 0) {
> +		dev_err(tegra->dev, "failed to enable messages: %d\n", err);
> +		goto disable_phy;
> +	}
> +
> +	err = xhci_resume(xhci, true);
> +	if (err < 0) {
> +		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
> +		goto disable_phy;
> +	}
> +
> +	return 0;
> +
> +disable_phy:
> +	tegra_xusb_phy_disable(tegra);
> +disable_clk:
> +	tegra_xusb_clk_disable(tegra);
> +	return err;
> +}
> +
> +static int tegra_xusb_suspend(struct device *dev)
> +{
> +	struct tegra_xusb *tegra = dev_get_drvdata(dev);
> +	bool wakeup = device_may_wakeup(dev);
> +	int err;
> +
> +	synchronize_irq(tegra->mbox_irq);
> +
> +	mutex_lock(&tegra->lock);
> +
> +	err = tegra_xusb_enter_elpg(tegra, wakeup);
> +	if (err < 0)
> +		goto unlock;

Is there some code missing here, or just preparing for some future feature?

> +
> +unlock:
> +	mutex_unlock(&tegra->lock);
> +	return err;
> +}
> +
> +static int tegra_xusb_resume(struct device *dev)
> +{
> +	struct tegra_xusb *tegra = dev_get_drvdata(dev);
> +	bool wakeup = device_may_wakeup(dev);
> +	int err;
> +
> +	mutex_lock(&tegra->lock);
> +
> +	err = tegra_xusb_exit_elpg(tegra, wakeup);
> +	if (err < 0)
> +		goto unlock;
> +
> +unlock:
> +	mutex_unlock(&tegra->lock);
> +	return err;
>   }
>   #endif
>   

Whole series looks good to me otherwise.

Let me know if you want me to take this as is, or if you are planning on making a second version

Thanks
Mathias
