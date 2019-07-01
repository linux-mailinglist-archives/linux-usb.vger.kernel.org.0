Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F53D245E6
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 04:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfEUCQ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 22:16:56 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11616 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbfEUCQ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 22:16:56 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce35f950000>; Mon, 20 May 2019 19:16:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 19:16:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 May 2019 19:16:53 -0700
Received: from [10.19.108.117] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 02:16:51 +0000
Subject: Re: [Patch V3 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
To:     Nagarjuna Kristam <nkristam@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
From:   jckuo <jckuo@nvidia.com>
Message-ID: <b0c36707-a198-8996-f2c5-c8c410bf5450@nvidia.com>
Date:   Tue, 21 May 2019 10:16:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-2-git-send-email-nkristam@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558405014; bh=hTNWfpPzKc+o2LhadCsahKcFEzKIn4MCvixm6q/cOJY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=oJXcu5fJMrbsInh4v9x3uWYlXw34mx2n9AzroLDs7PSYWo/HUlV3mWo/OZPtUlTJQ
         l+W0g18C+d75kWR4R5tb3VuDJ3FVsp5AonCmWVdBzOikK4KLQZwt5ZEYIu6oux4MGe
         OiygHEYoLBxOcHavkK6oxWo+PIVk1thA+HB/gR4wtVCJgDUGk7liLCBG7nyDsfahjh
         seJZHlIZoRlQKa37QUdV5Cu0eFJ+dhiBLarFXA5dHpn0kkf1QXogmNiQveouV0nvrN
         4kPG68exwlM5+5KTJXQ7fCTVQyZDEZl5Ny1v0nwW+MsGNABnIcmg5RQoROJPYttu6r
         +xVbg1Lwvqh2Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>


On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> Configure the port capabilities based on usb_dr_mode settings.
>
> Based on work by JC Kuo <jckuo@nvidia.com>.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   drivers/phy/tegra/xusb-tegra210.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 05bee32..4beebcc 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
>    * Copyright (C) 2015 Google, Inc.
>    *
>    * This program is free software; you can redistribute it and/or modify it
> @@ -47,7 +47,10 @@
>   #define XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_XUSB 0x1
>   
>   #define XUSB_PADCTL_USB2_PORT_CAP 0x008
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(x) (0x0 << ((x) * 4))
>   #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(x) (0x1 << ((x) * 4))
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(x) (0x2 << ((x) * 4))
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(x) (0x3 << ((x) * 4))
>   #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(x) (0x3 << ((x) * 4))
>   
>   #define XUSB_PADCTL_SS_PORT_MAP 0x014
> @@ -72,6 +75,7 @@
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
>   #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
>   
>   #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
> @@ -965,7 +969,14 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
>   
>   	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
>   	value &= ~XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(index);
> -	value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
> +	if (port->mode == USB_DR_MODE_UNKNOWN)
> +		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(index);
> +	else if (port->mode == USB_DR_MODE_PERIPHERAL)
> +		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(index);
> +	else if (port->mode == USB_DR_MODE_HOST)
> +		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
> +	else if (port->mode == USB_DR_MODE_OTG)
> +		value |= XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(index);
>   	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PORT_CAP);
>   
>   	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> @@ -997,7 +1008,12 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
>   			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
>   	value &= ~(XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK <<
>   		   XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT);
> -	value |= XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +	if (port->mode == USB_DR_MODE_HOST)
> +		value |= XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +	else
> +		value |=
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL <<
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT;
>   	padctl_writel(padctl, value,
>   		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
>   
