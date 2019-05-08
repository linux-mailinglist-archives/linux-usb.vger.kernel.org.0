Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC5541752D
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfEHJeh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 05:34:37 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:6770 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfEHJeh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 05:34:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd2a2a60000>; Wed, 08 May 2019 02:34:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 08 May 2019 02:34:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 08 May 2019 02:34:34 -0700
Received: from [10.19.66.43] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 09:34:31 +0000
Subject: Re: [PATCH V2 2/8] phy: tegra: xusb: t210: add usb3 port fake support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-3-git-send-email-nkristam@nvidia.com>
 <20190425145505.GD24213@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <bbe95b97-9833-2879-6c7e-faa2c43edaa0@nvidia.com>
Date:   Wed, 8 May 2019 15:05:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425145505.GD24213@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557308070; bh=sA+SwPOWai8HGLJWX5+iMGxpLAqsYCQGhbDZYlORcxc=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=d6mpdMhMu+ZTvWGYK7/J0D+uOOjDarDdquK+3mImlTf2D4HjOlNDT9tbIvDbZuN4z
         z86wjot0V4HiyjL3S4oRxmZfhGzvJ+OInVPiIx3aLOtILx6wkMPY1t6hyNMkNL2Qpr
         SIJGXuYb6odjv04DjEfeEYIEABTkxXq9H1sjQ3Z8uAepXc+Hb/sdFWuavUdcoZ0nsS
         P4zwmHKAnm6MZaRC3Yy0Ov35bZZNzaatq8CHBvcj6+r8+QTVPPiSuZ+zrf5JB3QJrM
         L8ZVtrgL99NPYUpgzq760vbet+GdLZRllshYmfHKGG4nZRpNkuMDkQ7r3g64QIPYhs
         gPGFKQlMEXf7w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25-04-2019 20:25, Thierry Reding wrote:
> On Mon, Mar 11, 2019 at 04:41:50PM +0530, Nagarjuna Kristam wrote:
>> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
>> They need an assosciated usb3 port to work in device mode. Identify
>> an unused usb3 port and assign it as a fake USB3 port to USB2 only
>> port whose mode is otg/peripheral
>>
>> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/phy/tegra/xusb-tegra210.c | 40 +++++++++++++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.c          | 29 ++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.h          |  6 ++++++
>>  3 files changed, 75 insertions(+)
> 
> I think this looks a whole lot better than the initial version. One or
> two minor comments below.
> 
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 4beebcc..48478bc4 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -58,6 +58,7 @@
>>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
>>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5))
>> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
>>  
>>  #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>>  #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
>> @@ -952,6 +953,15 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
>>  
>>  	priv = to_tegra210_xusb_padctl(padctl);
>>  
>> +	if (port->usb3_port_fake != -1) {
>> +		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
>> +		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
>> +					port->usb3_port_fake);
>> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
>> +					port->usb3_port_fake, index);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
>> +	}
>> +
>>  	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
>>  	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
>>  		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
>> @@ -1086,6 +1096,15 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
>>  
>>  	mutex_lock(&padctl->lock);
>>  
>> +	if (port->usb3_port_fake != -1) {
>> +		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
>> +		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
>> +					port->usb3_port_fake);
>> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
>> +					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
>> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
>> +	}
>> +
>>  	if (WARN_ON(pad->enable == 0))
>>  		goto out;
>>  
>> @@ -1784,6 +1803,27 @@ static const struct tegra_xusb_pad_soc * const tegra210_pads[] = {
>>  
>>  static int tegra210_usb2_port_enable(struct tegra_xusb_port *port)
>>  {
>> +	struct tegra_xusb_usb2_port *usb2 = to_usb2_port(port);
>> +	struct tegra_xusb_padctl *padctl = port->padctl;
>> +
>> +	/* Disable usb3_port_fake usage by default and assign if needed */
>> +	usb2->usb3_port_fake = -1;
>> +	if (usb2 && (usb2->mode == USB_DR_MODE_OTG ||
>> +		    usb2->mode == USB_DR_MODE_PERIPHERAL)) {
>> +		if (!tegra_xusb_usb3_port_has_companion(padctl, port->index)) {
>> +			int fake = tegra_xusb_find_unused_usb3_port(padctl);
>> +
>> +			if (fake >= 0) {
>> +				dev_dbg(&port->dev, "Found unused usb3 port: %d\n",
>> +					 fake);
>> +				usb2->usb3_port_fake = fake;
>> +			} else {
>> +				dev_err(&port->dev, "usb2-%u has neither a companion nor an unused usb3 port to fake it\n",
>> +					port->index);
>> +				return -ENODEV;
>> +			}
>> +		}
>> +	}
> 
> Generally it's preferable to check for errors and deal with success in
> the regular code path. So the above would be:
> 
> 			if (fake < 0) {
> 				dev_err(...);
> 				return -ENODEV;
> 			}
> 
> 			dev_dbg(...);
> 			...
> 
> Also, the error message is slightly redundant because &port->dev will
> already output the usb2-%u part. Also, perhaps try to make that message
> a little shorter. Something like:
> 
> 	dev_err(&port->dev, "no unused USB3 ports available\n");
> 

Will update accordingly

> Also, I don't think this is the right place to do this. There's really
> no way for the ->enable() callbacks to fail. Or at least failures will
> be ignored, so there's no chance for the driver to do anything about the
> failure. It also looks somewhat tacked on.
> 
> But how about if we do this as part of tegra_xusb_usb3_port_parse_dt()
> or tegra_xusb_add_usb3_port() already? The former is where we read the
> USB2 companion port index from DT so we know exactly which USB2 port to
> associate with a given USB3 port. So in the latter we could iterate over
> the USB2 ports (which have already been set up) and establish a backlink
> to the USB3 companion.
> 

Ok, instead of doing in ->enable(), will move the logic currently inside ->enable()
to a separate function called from  tegra_xusb_setup_ports(). This will get executed
under soc flag need_fake_usb3_support, which will be set only in t210 soc data.

> Something like this, in tegra_xusb_add_usb3_port():
> 
> 	struct tegra_xusb_usb2_port *companion;
> 
> 	for (i = 0; i < padctl->soc->ports.usb2.count; i++) {
> 		companion = tegra_xusb_find_usb2_port(padctl, i);
> 		if (!companion)
> 			continue;
> 
> 		if (companion->base.index == usb3->port) {
> 			companion->port = index;
> 			break;
> 		}
> 	}
> 
> Then, as part of tegra_xusb_setup_ports() we could add functionality to
> hook up a fake port if no companion is available, much like you're doing
> above. Perhaps we should introduce a new ->setup() callback to the port
> ops to encapsulate this, or perhaps add a flag to tegra_xusb_padctl_soc
> that is set to true on SoC generations that need the fake USB3 port.
> 
> Thierry

I believe adding usb3 port index data to usb2 port data structure is not needed.
Logic inside current ->enable() [which will be moved based on soc data feature flag]
takes care of the needs.

- Nagarjuna
> 
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index c6178a0..e89746d 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -799,6 +799,35 @@ static void __tegra_xusb_remove_ports(struct tegra_xusb_padctl *padctl)
>>  	}
>>  }
>>  
>> +bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl *padctl,
>> +						       unsigned int index)
>> +{
>> +	unsigned int i;
>> +	struct tegra_xusb_usb3_port *usb3;
>> +
>> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
>> +		usb3 = tegra_xusb_find_usb3_port(padctl, i);
>> +		if (usb3 && usb3->port == index)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl)
>> +{
>> +	struct device_node *np;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
>> +		np = tegra_xusb_find_port_node(padctl, "usb3", i);
>> +		if (!np || !of_device_is_available(np))
>> +			return i;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>>  static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>>  {
>>  	struct tegra_xusb_port *port;
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index 17cc8dc..b263165 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -274,6 +274,7 @@ struct tegra_xusb_usb2_port {
>>  	struct regulator *supply;
>>  	bool internal;
>>  	enum usb_dr_mode mode;
>> +	int usb3_port_fake;
>>  };
>>  
>>  static inline struct tegra_xusb_usb2_port *
>> @@ -413,6 +414,11 @@ struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *padctl,
>>  					     const char *name,
>>  					     unsigned int index);
>>  
>> +bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl *padctl,
>> +					unsigned int index);
>> +
>> +int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl);
>> +
>>  #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
>>  extern const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc;
>>  #endif
>> -- 
>> 2.7.4
>>
