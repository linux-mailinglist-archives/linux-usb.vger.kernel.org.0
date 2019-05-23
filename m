Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145AD27B77
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 13:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbfEWLMU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 07:12:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14081 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728518AbfEWLMU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 07:12:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce680130001>; Thu, 23 May 2019 04:12:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 May 2019 04:12:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 May 2019 04:12:18 -0700
Received: from [10.24.193.7] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 May
 2019 11:12:15 +0000
Subject: Re: [Patch V3 3/8] phy: tegra: xusb: t210: add vbus override support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
 <20190523100333.GC30331@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <aecd9cff-9b1f-9a9d-4345-761788ad438c@nvidia.com>
Date:   Thu, 23 May 2019 16:43:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523100333.GC30331@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558609939; bh=1QcL6Qjh2O2xjy6a+l+mTNrRUATVWByCaoXPv0qKifk=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=L6kTKy/dFSrO0X5FQ4fK3rYAsIeRqQqmSzuzdFm28YaTKNL0O/F5GvLJld3Zatsgz
         tSJvntpFZb4qAu3CK93nFgGI18NdcmcZRuvUoPuPKBa4+F896qjzbRQPuMk3ps9pbk
         jgUCnJgFNw4wH76UpbvgIREowUPNsAjO1X3EiFPz3oXtac/sytqnjKBTa3HSjzveQc
         k5uoSWao+ertb0P5E6WsMLTP27o3yzux1Ucw3IcgSv7knoxKTBby3HQ/nviBGlCpm3
         YlQ7gSvX/VD/GdbTX+cQ1FW99H9DOmzlyr1td+AoCw9b0jaGSAKZXGg9KNLtDBwdpv
         j9h8GSirKBw9g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23-05-2019 15:33, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:27PM +0530, Nagarjuna Kristam wrote:
>> Tegra XUSB device control driver needs to control vbus override
>> during its operations, add API for the support.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/phy/tegra/xusb-tegra210.c | 59 +++++++++++++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>>  drivers/phy/tegra/xusb.h          |  2 ++
>>  include/linux/phy/tegra/xusb.h    |  6 ++--
>>  4 files changed, 87 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 829aca5..363d2aa 100644
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
>> @@ -2024,6 +2034,53 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
>>  	.map = tegra210_usb3_port_map,
>>  };
>>  
>> +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
>> +					      bool status)
>> +{
>> +	u32 value;
>> +
>> +	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
>> +
>> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
>> +
>> +	if (status) {
>> +		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
>> +		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
>> +			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
>> +		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
>> +			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
>> +	} else
>> +		value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
>> +
>> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra210_utmi_port_reset(struct phy *phy)
>> +{
>> +	struct tegra_xusb_padctl *padctl;
>> +	struct tegra_xusb_lane *lane;
>> +	struct device *dev;
>> +	u32 value;
>> +
>> +	lane = phy_get_drvdata(phy);
>> +	padctl = lane->pad->padctl;
>> +	dev = padctl->dev;
> 
> dev seems unused. Is this debugging leftover?
> 
> Thierry
> 
Yes, will clear this in next series

-Nagarjuna
>> +
>> +	value = padctl_readl(padctl,
>> +			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
>> +
>> +	if ((value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
>> +	    (value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
>> +		tegra210_xusb_padctl_vbus_override(padctl, false);
>> +		tegra210_xusb_padctl_vbus_override(padctl, true);
>> +		return 1;
>> +	}
>> -- 
>> 2.7.4
>>
