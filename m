Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29F22462E
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 05:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfEUDAs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 23:00:48 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3131 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfEUDAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 23:00:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce369df0000>; Mon, 20 May 2019 20:00:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 20:00:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 May 2019 20:00:46 -0700
Received: from [10.19.108.117] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 03:00:43 +0000
Subject: Re: [Patch V3 2/8] phy: tegra: xusb: t210: add usb3 port fake support
To:     Nagarjuna Kristam <nkristam@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
From:   jckuo <jckuo@nvidia.com>
Message-ID: <3e9c1919-c3d6-2d08-ca83-c600f4fd60f9@nvidia.com>
Date:   Tue, 21 May 2019 11:00:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558407647; bh=xzd8K7QatPf5UqKD5Worin1mwSmT7Lcu3b/WfKZo2i4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=KwHlzubNLFuQgyg5lvxYpxawyizNIkmXDpf2cbSLe8nfYml8WB47JBbnYdXfZtk5U
         JT30RjxSzq32CZlVft0NRIRABs3z4pFANEHkxHLG+ZrTvnFim5KYUf5nEc80y8bI3C
         d3wGEas1Ch1Q3L9bSPPNlymE+uyKB7pg8ithvB9YXsrNYU6hnOTA401L/E8VVaMyni
         1MjnEG2avfe8EvX+3iyaHATgz8sVXWgLKDP+8akiupxp5koNeGKzPLC9mp2UVUq9JJ
         fjcSdhGPClcWYrxNn6ze3Wra4Yy9ix1s70TOJLrMPs2WSy55uGG1dCiy/qiAVzL2Do
         PMQNaY2lroyiA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Nagarjuna,

Please check tegra_xusb_update_usb3_fake_port().

Thanks,

JC

On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
> They need an assosciated usb3 port to work in device mode. Identify
> an unused usb3 port and assign it as a fake USB3 port to USB2 only
> port whose mode is otg/peripheral.
>
> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++
>   drivers/phy/tegra/xusb.c          | 69 +++++++++++++++++++++++++++++++++++++++
>   drivers/phy/tegra/xusb.h          |  2 ++
>   3 files changed, 127 insertions(+)
>
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 4beebcc..829aca5 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -58,6 +58,7 @@
>   #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>   #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
>   #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
>   
>   #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>   #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
> @@ -952,6 +953,34 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
>   
>   	priv = to_tegra210_xusb_padctl(padctl);
>   
> +	if (port->usb3_port_fake != -1) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
> +					port->usb3_port_fake);
> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
> +					port->usb3_port_fake, index);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +
> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +	}
> +
>   	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
>   	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
>   		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
> @@ -1086,6 +1115,32 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
>   
>   	mutex_lock(&padctl->lock);
>   
> +	if (port->usb3_port_fake != -1) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(250, 350);
> +
> +		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
> +					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +	}
> +
>   	if (WARN_ON(pad->enable == 0))
>   		goto out;
>   
> @@ -2051,6 +2106,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
>   		},
>   	},
>   	.ops = &tegra210_xusb_padctl_ops,
> +	.need_fake_usb3_port = true,
>   };
>   EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
>   
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 0417213..6618db7 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -808,9 +808,66 @@ static void __tegra_xusb_remove_ports(struct tegra_xusb_padctl *padctl)
>   	}
>   }
>   
> +static int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl)
> +{
> +	struct device_node *np;
> +	unsigned int i;
> +
> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
> +		np = tegra_xusb_find_port_node(padctl, "usb3", i);
> +		if (!np || !of_device_is_available(np))
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl *padctl,
> +							     unsigned int index)
> +{
> +	unsigned int i;
> +	struct tegra_xusb_usb3_port *usb3;
> +
> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
> +		usb3 = tegra_xusb_find_usb3_port(padctl, i);
> +		if (usb3 && usb3->port == index)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int tegra_xusb_update_usb3_fake_port(struct tegra_xusb_usb2_port *usb2)
> +{
> +	int fake;
> +
> +	/* Disable usb3_port_fake usage by default and assign if needed */
> +	usb2->usb3_port_fake = -1;
> +
> +	if ((usb2->mode == USB_DR_MODE_OTG ||
> +	     usb2->mode == USB_DR_MODE_PERIPHERAL) &&
> +		!tegra_xusb_usb3_port_has_companion(usb2->base.padctl,
> +						    usb2->base.index)) {
> +		fake = tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
> +
> +		if (fake < 0) {
> +			dev_err(&usb2->base.dev, "no unused USB3 ports available\n");
> +			return -ENODEV;
> +		}
> +
> +		dev_dbg(&usb2->base.dev, "Found unused usb3 port: %d\n",
> +					 fake);
> +		usb2->usb3_port_fake = fake;
> +		tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
This looks redundant to me.
> +	}
> +
> +	return 0;
> +}
> +
>   static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>   {
>   	struct tegra_xusb_port *port;
> +	struct tegra_xusb_usb2_port *usb2;
>   	unsigned int i;
>   	int err = 0;
>   
> @@ -840,6 +897,18 @@ static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>   			goto remove_ports;
>   	}
>   
> +	if (padctl->soc->need_fake_usb3_port) {
> +		for (i = 0; i < padctl->soc->ports.usb2.count; i++) {
> +			usb2 = tegra_xusb_find_usb2_port(padctl, i);
> +			if (!usb2)
> +				continue;
> +
> +			err = tegra_xusb_update_usb3_fake_port(usb2);
> +			if (err < 0)
> +				goto remove_ports;
> +		}
> +	}
> +
>   	list_for_each_entry(port, &padctl->ports, list) {
>   		err = port->ops->enable(port);
>   		if (err < 0)
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index e0028b9f..26dd6d2 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -299,6 +299,7 @@ struct tegra_xusb_usb2_port {
>   	struct regulator *supply;
>   	enum usb_dr_mode mode;
>   	bool internal;
> +	int usb3_port_fake;
>   };
>   
>   static inline struct tegra_xusb_usb2_port *
> @@ -397,6 +398,7 @@ struct tegra_xusb_padctl_soc {
>   
>   	const char * const *supply_names;
>   	unsigned int num_supplies;
> +	bool need_fake_usb3_port;
>   };
>   
>   struct tegra_xusb_padctl {
