Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 911A3B353B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 09:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfIPHLW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 03:11:22 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:16688 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726082AbfIPHLW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 03:11:22 -0400
X-UUID: f1b8921be39243db81135c57cd8880b7-20190916
X-UUID: f1b8921be39243db81135c57cd8880b7-20190916
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1352235378; Mon, 16 Sep 2019 15:11:14 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 16 Sep
 2019 15:11:07 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Sep 2019 15:11:06 +0800
Message-ID: <1568617865.7317.74.camel@mhfsdcap03>
Subject: Re: [Patch V9 3/8] phy: tegra: xusb: Add vbus override support on
 Tegra210
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Mon, 16 Sep 2019 15:11:05 +0800
In-Reply-To: <1568354873-24073-4-git-send-email-nkristam@nvidia.com>
References: <1568354873-24073-1-git-send-email-nkristam@nvidia.com>
         <1568354873-24073-4-git-send-email-nkristam@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: DF578D0D8935BFB61BBE328B9FF34215B0B7C778C60519D9D891F49837686EC22000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-09-13 at 11:37 +0530, Nagarjuna Kristam wrote:
> Tegra XUSB device control driver needs to control vbus override
> during its operations, add API for the support.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 57 +++++++++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  include/linux/phy/tegra/xusb.h    |  4 ++-
>  4 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 8c31f03..9e6f14b 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -65,6 +65,10 @@
>  #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
>  #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
>  
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x40)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
> +
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> @@ -227,6 +231,12 @@
>  #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>  #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
>  
> +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
> +
>  struct tegra210_xusb_fuse_calibration {
>  	u32 hs_curr_level[4];
>  	u32 hs_term_range_adj;
> @@ -2016,6 +2026,51 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
>  	.map = tegra210_usb3_port_map,
>  };
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
Nit: use braces in else branch

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
> +	u32 value;
> +
> +	lane = phy_get_drvdata(phy);
> +	padctl = lane->pad->padctl;
> +
> +	value = padctl_readl(padctl,
> +		     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(lane->index));
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
>  static int
>  tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
>  {
> @@ -2078,6 +2133,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
>  	.remove = tegra210_xusb_padctl_remove,
>  	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
>  	.hsic_set_idle = tegra210_hsic_set_idle,
> +	.vbus_override = tegra210_xusb_padctl_vbus_override,
> +	.utmi_port_reset = tegra210_utmi_port_reset,
>  };
>  
>  static const char * const tegra210_xusb_padctl_supply_names[] = {
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index b4b217e..bf4b008 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1121,6 +1121,28 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>  }
>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);
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
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index bd91832..da94fcc 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -373,6 +373,8 @@ struct tegra_xusb_padctl_ops {
>  			     unsigned int index, bool idle);
>  	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
>  				    unsigned int index, bool enable);
> +	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
> +	int (*utmi_port_reset)(struct phy *phy);
>  };
>  
>  struct tegra_xusb_padctl_soc {
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
> index ee59562..1235865 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -18,5 +18,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
>  				    unsigned int port, bool idle);
>  int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
>  					   unsigned int port, bool enable);
> -
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +					bool val);
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>  #endif /* PHY_TEGRA_XUSB_H */


