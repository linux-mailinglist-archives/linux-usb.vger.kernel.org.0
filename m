Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF02012B1DB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 07:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfL0GhX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 01:37:23 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11826 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfL0GhW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Dec 2019 01:37:22 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e05a67c0000>; Thu, 26 Dec 2019 22:36:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 26 Dec 2019 22:37:21 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 26 Dec 2019 22:37:21 -0800
Received: from [10.24.192.96] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Dec
 2019 06:37:17 +0000
Subject: Re: [Patch V2 03/18] phy: tegra: xusb: Add usb-role-switch support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-4-git-send-email-nkristam@nvidia.com>
 <20191219132650.GJ1440537@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <74d94004-2022-3b04-6cd9-d6b1e9eca230@nvidia.com>
Date:   Fri, 27 Dec 2019 12:09:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191219132650.GJ1440537@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1577428604; bh=bI5VIPedVxKsj8DUcsAVgjGijDib+I6V20ZeTFfznwo=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Bd37sWm/MXOKGy4t4m8ch8/ipRZjZP5gjJCczchiQbBXV5KJCJG24OqbHCk3CeaYC
         G6FZ8qg+6o28cCFymUOXnLx1svvZVdTXzmoagRR62kpLQ7nmyqZFDXNt6siOCJ3YtJ
         pkU6vJthRrTxi2NjhVtY7aIc/YJlgOVNcL2kvIXJMghHXSnA04hnQ+FkfJm5/bhw+0
         wUbyRUUZa1WHAjM3Tihjhsq2oAiZKFf3JfedyDL1VkKc9IgcXNYa3qa4HDQhJV0HqA
         +W19rI953ooUFPuBTocsGde19dCbOHYM7dyXnmZaoX++ADkw2gZ/mOXNRx5OycCtOi
         SAQXTsBOwgCig==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 19-12-2019 18:56, Thierry Reding wrote:
> 
> On Wed, Dec 18, 2019 at 02:46:16PM +0530, Nagarjuna Kristam wrote:
>> If usb-role-switch property is present in USB 2 port, register
>> usb-role-switch to receive usb role changes.
>>
>> Signed-off-by: Nagarjuna Kristam<nkristam@nvidia.com>
>> ---
>> V2:
>>   - Removed dev_set_drvdata for port->dev.
>>   - Added of_platform_depopulate during error handling and driver removal.
>> ---
>>   drivers/phy/tegra/Kconfig |  1 +
>>   drivers/phy/tegra/xusb.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   drivers/phy/tegra/xusb.h  |  3 +++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
>> index f9817c3..df07c4d 100644
>> --- a/drivers/phy/tegra/Kconfig
>> +++ b/drivers/phy/tegra/Kconfig
>> @@ -2,6 +2,7 @@
>>   config PHY_TEGRA_XUSB
>>   	tristate "NVIDIA Tegra XUSB pad controller driver"
>>   	depends on ARCH_TEGRA
>> +	select USB_CONN_GPIO
>>   	help
>>   	  Choose this option if you have an NVIDIA Tegra SoC.
>>   
>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index f98ec39..dc00b42 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -523,6 +523,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
>>   	port->dev.type = &tegra_xusb_port_type;
>>   	port->dev.of_node = of_node_get(np);
>>   	port->dev.parent = padctl->dev;
>> +	port->dev.driver = padctl->dev->driver;
>>   
>>   	err = dev_set_name(&port->dev, "%s-%u", name, index);
>>   	if (err < 0)
>> @@ -541,6 +542,10 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
>>   
>>   static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
>>   {
>> +	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
>> +		of_platform_depopulate(&port->dev);
>> +		usb_role_switch_unregister(port->usb_role_sw);
>> +	}
>>   	device_unregister(&port->dev);
> Nit: I prefer blank lines after blocks for readability.
> 
Will update

>>   }
>>   
>> @@ -551,11 +556,42 @@ static const char *const modes[] = {
>>   	[USB_DR_MODE_OTG] = "otg",
>>   };
>>   
>> +static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
>> +{
>> +	dev_dbg(dev, "%s calling notifier for role is %d\n", __func__, role);
> I don't understand what "for role is %d" means here. I think perhaps you
> meant to simply say "for role %d"? Also, perhaps add parentheses after
> the "%s" to clarify that you're referring to a function.
> 
Yes, intention is to print role, Will update as mentioned "for role %d"

>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
>> +{
>> +	int err = 0;
>> +	struct usb_role_switch_desc role_sx_desc = {
>> +					.set = tegra_xusb_role_sw_set,
>> +					.fwnode = dev_fwnode(&port->dev),
>> +						   };
> The indentation here is odd. Use a single tab to indent lines after the
> opening { and put the closing } on the same column as "struct". Also,
> the above may become more readable if you follow the "inverse Christmas
> tree" style of declaring functions, where you order lines by their
> length, with the longest line first, like so:
> 
> 	struct usb_role_switch_desc role_sx_desc = {
> 		.fwnode = dev_fwnode(&port->dev),
> 		.set = tegra_xusb_role_sw_set,
> 	};
> 	int err = 0;
> 
Thanks for inputs, will update accordingly.

>> +
>> +	port->usb_role_sw = usb_role_switch_register(&port->dev,
>> +						&role_sx_desc);
> &role_sx_desc should be aligned with &port->dev.
> 
Will align here and at other places wherever missed.

>> +	if (IS_ERR(port->usb_role_sw)) {
>> +		err = PTR_ERR(port->usb_role_sw);
>> +		if (err != EPROBE_DEFER)
>> +			dev_err(&port->dev, "Failed to register USB role SW: %d",
> Error messages typically start with a lowercase letter (at least in this
> driver). Also perhaps spell out "switch" above because SW could easily
> be confused with "software".
> 
Will update.

>> +				err);
> Shouldn't we abort here? Consider the case where this indeed defers
> probe. If we don't abort here, the of_platform_populate() below will be
> called multiple times. Shouldn't it only be called when we actually
> succeed in registering the switch?
> 
Yes, we should abort here, "return err;" got moved to next patch during
re-base. Will move to current patch.
> Also, looking at usb_role_switch_register(), I don't think it ever can
> return -EPROBE_DEFER, so I think you can drop that check and print the
> error unconditionally.
> 
> Thierry
> 
Will update.
-Nagarjuna
>> +	}
>> +
>> +	/* populate connector entry */
>> +	of_platform_populate(port->dev.of_node, NULL, NULL, &port->dev);
>> +
>> +	return err;
>> +}
>> +
>>   static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>>   {
>>   	struct tegra_xusb_port *port = &usb2->base;
>>   	struct device_node *np = port->dev.of_node;
>>   	const char *mode;
>> +	int err;
>>   
>>   	usb2->internal = of_property_read_bool(np, "nvidia,internal");
>>   
>> @@ -572,6 +608,12 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>>   		usb2->mode = USB_DR_MODE_HOST;
>>   	}
>>   
>> +	if (of_property_read_bool(np, "usb-role-switch")) {
>> +		err = tegra_xusb_setup_usb_role_switch(port);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
>>   	usb2->supply = devm_regulator_get(&port->dev, "vbus");
>>   	return PTR_ERR_OR_ZERO(usb2->supply);
>>   }
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index da94fcc..9f27899 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -12,6 +12,7 @@
>>   #include <linux/workqueue.h>
>>   
>>   #include <linux/usb/otg.h>
>> +#include <linux/usb/role.h>
>>   
>>   /* legacy entry points for backwards-compatibility */
>>   int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
>> @@ -266,6 +267,8 @@ struct tegra_xusb_port {
>>   	struct list_head list;
>>   	struct device dev;
>>   
>> +	struct usb_role_switch *usb_role_sw;
>> +
>>   	const struct tegra_xusb_port_ops *ops;
>>   };
>>   
>> -- 
>> 2.7.4
