Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39C56175DC
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 12:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfEHKUO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 06:20:14 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10333 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfEHKUO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 06:20:14 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd2ad550001>; Wed, 08 May 2019 03:20:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 08 May 2019 03:20:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 08 May 2019 03:20:09 -0700
Received: from [10.19.66.43] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 10:20:06 +0000
Subject: Re: [PATCH V2 3/8] phy: tegra: xusb: t210: add vbus override support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-4-git-send-email-nkristam@nvidia.com>
 <20190425150440.GE24213@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <12eb0a94-c137-38e3-187b-a75fff9ad505@nvidia.com>
Date:   Wed, 8 May 2019 15:51:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425150440.GE24213@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557310807; bh=Qp0Ey8laNXgLP2V1hPgvdbXCfD2Vkaqd4q2dCi5rReA=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Dd/QjJj8CS85qB0pbbmGuKOicaG452L4qrZHUJWxChC3MIoStl1ATOEv6OfVk8Tlk
         ebvMQj3GFIJeoKvWiANpG873IvhjiUg8GbCfBmtXbHWk4l/dtf0VVWhtrHz9KqWNrO
         LtxcdCN61UUoc348zySX+zos6KG4SID2YeesdOEkGSgOFHAUVE/B1kq4vO7jUBAvc9
         svbd0thNDkfVKR+EAk6hbpIeYT7ujnjd0v8ObqBQXitFXRi9Mz/1gB6uZ7LxEVdl1e
         gcIHLlrGba81j6NG2RCYdPTsZwMfXs5Ehfjz9h0aVGUJhuKh2N8AOSgd6hMUBz7yxe
         +Xx4sVYHqHsoQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25-04-2019 20:34, Thierry Reding wrote:
> On Mon, Mar 11, 2019 at 04:41:51PM +0530, Nagarjuna Kristam wrote:
>> Tegra XUSB device control driver needs to control vbus override
>> during its operations, add API for the support
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/phy/tegra/xusb-tegra210.c | 61 +++++++++++++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.c          | 28 ++++++++++++++++--
>>  drivers/phy/tegra/xusb.h          |  2 ++
>>  include/linux/phy/tegra/xusb.h    |  6 ++--
>>  4 files changed, 92 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 48478bc4..be1a870 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -73,6 +73,10 @@
>>  #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
>>  #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
>>  
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x40)
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
>> +
>>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
>>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
>> @@ -235,6 +239,12 @@
>>  #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>>  #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
>>  
>> +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
>> +
>>  struct tegra210_xusb_fuse_calibration {
>>  	u32 hs_curr_level[4];
>>  	u32 hs_term_range_adj;
>> @@ -2009,6 +2019,55 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
>>  	.map = tegra210_usb3_port_map,
>>  };
>>  
>> +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
>> +					      bool set)
> 
> I think "status" would perhaps be somewhat more meaningful.
> 
Will update accordingly
>> +{
>> +	u32 reg;
> 
> The rest of the driver uses "u32 value". It'd be good to be consistent.
> 
Will sync with rest of code as suggested.
>> +
>> +	dev_dbg(padctl->dev, "%s vbus override\n", set ? "set" : "clear");
>> +
>> +	reg = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
>> +	if (set) {
>> +		reg |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
>> +		reg &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
>> +			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
>> +		reg |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
>> +			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
>> +	} else
>> +		reg &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
> 
> This could use some blank lines to separate blocks and make it more
> readable.
> 
will update accordingly
>> +	padctl_writel(padctl, reg, XUSB_PADCTL_USB2_VBUS_ID);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra210_utmi_port_reset(struct phy *phy)
>> +{
>> +	struct tegra_xusb_padctl *padctl;
>> +	struct tegra_xusb_lane *lane;
>> +	struct device *dev;
>> +	u32 reg;
> 
> u32 value
> 
will do
>> +
>> +	if (!phy)
>> +		return -ENODEV;
> 
> When would this happen?
> 

Added this as safety check, if caller class with null.
But in current code flow this won't happen, it can be removed.

>> +
>> +	lane = phy_get_drvdata(phy);
>> +	padctl = lane->pad->padctl;
>> +	dev = padctl->dev;
>> +
>> +	reg = padctl_readl(padctl,
>> +				XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
> 
> Usually subsequent lines are indented so that they align with the first
> argument of the first line.
> 
will do
>> +	dev_dbg(dev, "BATTERY_CHRG_OTGPADX_CTL0(0): 0x%x\n", reg);
> 
> You can use %#x to avoid having to explicitly provide the 0x prefix.
> Also, is this really useful for debugging? We could add trace support to
> this driver (to padctl_readl() and padctl_writel() for example) to allow
> for more flexible tracing of register programming sequences.
> 
will remove the debug log
>> +
>> +	if ((reg & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
>> +	    (reg & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
>> +		dev_dbg(dev, "Toggle vbus\n");
> 
> This one is pretty redundant because the function calls below each
> already output something to that effect.
> 
will remove
>> +		tegra210_xusb_padctl_vbus_override(padctl, false);
>> +		tegra210_xusb_padctl_vbus_override(padctl, true);
>> +		return 1;
>> +	}
>> +	return 0;
>> +}
>> +
>>  static int
>>  tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
>>  {
>> @@ -2071,6 +2130,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
>>  	.remove = tegra210_xusb_padctl_remove,
>>  	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
>>  	.hsic_set_idle = tegra210_hsic_set_idle,
>> +	.vbus_override = tegra210_xusb_padctl_vbus_override,
>> +	.utmi_port_reset = tegra210_utmi_port_reset,
>>  };
>>  
>>  const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index e89746d..bbb839b 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -1027,7 +1027,7 @@ int tegra_xusb_padctl_usb3_save_context(struct tegra_xusb_padctl *padctl,
>>  	if (padctl->soc->ops->usb3_save_context)
>>  		return padctl->soc->ops->usb3_save_context(padctl, port);
>>  
>> -	return -ENOSYS;
>> +	return -ENOTSUPP;
>>  }
>>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_save_context);
>>  
>> @@ -1037,7 +1037,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
>>  	if (padctl->soc->ops->hsic_set_idle)
>>  		return padctl->soc->ops->hsic_set_idle(padctl, port, idle);
>>  
>> -	return -ENOSYS;
>> +	return -ENOTSUPP;
>>  }
>>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
>>  
>> @@ -1048,10 +1048,32 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>>  		return padctl->soc->ops->usb3_set_lfps_detect(padctl, port,
>>  							      enable);
>>  
>> -	return -ENOSYS;
>> +	return -ENOTSUPP;
>>  }
>>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);
> 
> I think these changes should be a separate patch.
> 
> Thierry
> 
will remove from current patch

-Nagarjuna
>>  
>> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
>> +							bool val)
>> +{
>> +	if (padctl->soc->ops->vbus_override)
>> +		return padctl->soc->ops->vbus_override(padctl, val);
>> +
>> +	return -ENOTSUPP;
>> +}
>> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
>> +
>> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
>> +{
>> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
>> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
>> +
>> +	if (padctl->soc->ops->utmi_port_reset)
>> +		return padctl->soc->ops->utmi_port_reset(phy);
>> +
>> +	return -ENOTSUPP;
>> +}
>> +EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
>> +
>>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>>  MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index b263165..9a39b05 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -356,6 +356,8 @@ struct tegra_xusb_padctl_ops {
>>  			     unsigned int index, bool idle);
>>  	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
>>  				    unsigned int index, bool enable);
>> +	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
>> +	int (*utmi_port_reset)(struct phy *phy);
>>  };
>>  
>>  struct tegra_xusb_padctl_soc {
>> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
>> index 8e1a57a..9b8351c 100644
>> --- a/include/linux/phy/tegra/xusb.h
>> +++ b/include/linux/phy/tegra/xusb.h
>> @@ -1,5 +1,5 @@
>>  /*
>> - * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
>> + * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
>>   *
>>   * This program is free software; you can redistribute it and/or modify it
>>   * under the terms and conditions of the GNU General Public License,
>> @@ -26,5 +26,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
>>  				    unsigned int port, bool idle);
>>  int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>>  					   unsigned int port, bool enable);
>> -
>> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
>> +					bool val);
>> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>>  #endif /* PHY_TEGRA_XUSB_H */
>> -- 
>> 2.7.4
>>
