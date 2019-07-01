Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD078246E6
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 06:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfEUEeb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 00:34:31 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7162 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfEUEeb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 00:34:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce37fd60000>; Mon, 20 May 2019 21:34:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 21:34:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 May 2019 21:34:28 -0700
Received: from [10.19.108.117] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 04:34:26 +0000
Subject: Re: [Patch V3 3/8] phy: tegra: xusb: t210: add vbus override support
To:     Nagarjuna Kristam <nkristam@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
From:   jckuo <jckuo@nvidia.com>
Message-ID: <5607de95-da90-8a56-892c-8529d1b386d7@nvidia.com>
Date:   Tue, 21 May 2019 12:34:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558413270; bh=RgyJFoGOvxDvMqGUAfwr4y897g2Y196myodCl8oQPjI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jZB+6/IDesKlyUWBiK5PFWXR7ScY+tB2/szm4vIE/Sn4oA69kuoda9KunTardu3PW
         lFpzM6F8vEumE1pLUlPIF0qCOtO7Jh8Vk1XYm0jYuceqvt/T5DqSvoJgztSW/hLn91
         Rytm4sBwvCARkdCesy/1D1hP4f5zCIckcaZ7TwSudIZic/OlPFZTHsJKiaxLafvH0h
         IzVRoYPjI9kS5bT4AygJEzKa5VZbGA8bE6g5Lf4C5DT1W9zqnomdG05sqy9UknkmmY
         lynGB4ZxEscWAjJvcnjKgvg/fkMOQyyi2QVElHuEQrRizWYx5U4aZoMFOnPaayUjP7
         1W6m6Sz6oGR6A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Nagarjuna,

Please check tegra_phy_xusb_utmi_port_reset().

Thanks,

JC

On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> Tegra XUSB device control driver needs to control vbus override
> during its operations, add API for the support.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   drivers/phy/tegra/xusb-tegra210.c | 59 +++++++++++++++++++++++++++++++++++++++
>   drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>   drivers/phy/tegra/xusb.h          |  2 ++
>   include/linux/phy/tegra/xusb.h    |  6 ++--
>   4 files changed, 87 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 829aca5..363d2aa 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -73,6 +73,10 @@
>   #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
>   #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
>   
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x40)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
> +
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> @@ -235,6 +239,12 @@
>   #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>   #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
>   
> +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
> +
>   struct tegra210_xusb_fuse_calibration {
>   	u32 hs_curr_level[4];
>   	u32 hs_term_range_adj;
> @@ -2024,6 +2034,53 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
>   	.map = tegra210_usb3_port_map,
>   };
>   
> +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
> +					      bool status)
> +{
> +	u32 value;
> +
> +	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
> +
> +	if (status) {
> +		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
> +		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
> +			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
> +		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
> +			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
> +	} else
> +		value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
> +
> +	return 0;
> +}
> +
> +static int tegra210_utmi_port_reset(struct phy *phy)
> +{
> +	struct tegra_xusb_padctl *padctl;
> +	struct tegra_xusb_lane *lane;
> +	struct device *dev;
> +	u32 value;
> +
> +	lane = phy_get_drvdata(phy);
> +	padctl = lane->pad->padctl;
> +	dev = padctl->dev;
> +
> +	value = padctl_readl(padctl,
> +			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
If we allow USB device mode to be enabled at any USB 2.0 port, we should 
read corresponding XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) register.
> +
> +	if ((value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
> +	    (value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
> +		tegra210_xusb_padctl_vbus_override(padctl, false);
> +		tegra210_xusb_padctl_vbus_override(padctl, true);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
>   static int
>   tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
>   {
> @@ -2086,6 +2143,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
>   	.remove = tegra210_xusb_padctl_remove,
>   	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
>   	.hsic_set_idle = tegra210_hsic_set_idle,
> +	.vbus_override = tegra210_xusb_padctl_vbus_override,
> +	.utmi_port_reset = tegra210_utmi_port_reset,
>   };
>   
>   const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 6618db7..e333532 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1133,6 +1133,28 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>   }
>   EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);
>   
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +							bool val)
> +{
> +	if (padctl->soc->ops->vbus_override)
> +		return padctl->soc->ops->vbus_override(padctl, val);
> +
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
> +
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +
> +	if (padctl->soc->ops->utmi_port_reset)
> +		return padctl->soc->ops->utmi_port_reset(phy);
> +
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
> +
>   MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>   MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 26dd6d2..cb22a70 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -381,6 +381,8 @@ struct tegra_xusb_padctl_ops {
>   			     unsigned int index, bool idle);
>   	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
>   				    unsigned int index, bool enable);
> +	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
> +	int (*utmi_port_reset)(struct phy *phy);
>   };
>   
>   struct tegra_xusb_padctl_soc {
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
> index 8e1a57a..9b8351c 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
>    *
>    * This program is free software; you can redistribute it and/or modify it
>    * under the terms and conditions of the GNU General Public License,
> @@ -26,5 +26,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
>   				    unsigned int port, bool idle);
>   int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>   					   unsigned int port, bool enable);
> -
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +					bool val);
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>   #endif /* PHY_TEGRA_XUSB_H */
