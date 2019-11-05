Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8564DEF767
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730571AbfKEIkw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:40:52 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14889 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbfKEIkw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:40:52 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dc135980000>; Tue, 05 Nov 2019 00:40:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 05 Nov 2019 00:40:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 05 Nov 2019 00:40:50 -0800
Received: from [10.24.193.88] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Nov
 2019 08:40:48 +0000
Subject: Re: [PATCH] usb: host: xhci-tegra: Correct phy enable sequence
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <linux-usb@vger.kernel.org>, Jui Chang Kuo <jckuo@nvidia.com>
References: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
 <20191104095247.GC985882@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <e5d280b7-207f-f7da-8f12-58520f668494@nvidia.com>
Date:   Tue, 5 Nov 2019 14:12:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191104095247.GC985882@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1572943257; bh=B04lmCFv4f64T8SboT4InOujcLY31oksceo6IC3c2D4=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BboidMPNSrZN574Qxpm/FnlMkF0NE5Fx0QeEWW7IIS2FFRBVPu3PhBNLB0xHmv7l/
         1HA4cxC5RaB68xBk0/tg7WIDuyP+dksK8NCvogbB2dK0TqPBbggBiiSO6PBGB/H986
         LlSEhG1dlJD61dLVqlUiZl//5dReRgckMluZ77HUEfkfii0MZYFXW5D/+qU2sTWhHd
         ZLlmCapVRSmVKjHAP//eiAEUKYE8FcfEXmI7moblOp0bxv880wNr0PvUHGdM6hWj08
         ACribso2/54iRwUSysyF1VFIaiagKAbaFh9Ct1p1ksgzjl3VhocR3y9tAHwmr84LgU
         mh6yb6ZCdftfQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 04-11-2019 15:22, Thierry Reding wrote:
> On Mon, Nov 04, 2019 at 02:54:30PM +0530, Nagarjuna Kristam wrote:
>> XUSB phy needs to be enabled before un-powergating the power partitions.
>> However in the current sequence, it happens opposite. Correct the phy
>> enable and powergating partition sequence to avoid any boot hangs.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Signed-off-by: Jui Chang Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 25 +++++++++++++------------
>>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> Do you know what the amount of power is that the PHYs drain? We're now
> no longer able to power off the PHYs when the XHCI controller goes into
> runtime suspend. That's a little unfortunate, but given the powergate
> sequence, there's no easy way around that.
> 
> If the amount of power we're now consuming the idle state is significant
> enough, it may be an incentive to look into a way that allows us to save
> it. If it's insignificant, it might not be worth looking into it much
> further.
> 
> My understanding is that the only reason we can't do this right now is
> because the generic power domains are always enabled before the device's
> ->runtime_resume() is called and disabled after ->runtime_suspend() is
> called. So one possibility would be to add a mechanism to mark a device
> as wanting explicit control over the generic power domain. That way we
> could order the power domain vs. PHY in a way that's compatible with the
> powergate sequence.
> 
> Again, it may not be worth the extra effort, but without numbers that's
> a difficult call to make.
> 
> Thierry
> 
Thierry,

For USB host driver, power savings are done via ELPG feature support.
They are currently handled in https://patchwork.kernel.org/cover/10994599/

It is required to have USB phy always powered on to have host mode functionality.
Performing run-time suspend/resume with phy enable breaks host mode
functionality. In the current version of the driver, even though phy
enable/disable calls are part of pm runtime, they are controlled only from
_probe and _remove only, which is exactly same sequence used in current
change, only order reversed.

Hence, current changes does not cause any change in power consumption
of phy lines.

Thanks,
Nagarjuna
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index 540b47a..bf90654 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -763,7 +763,6 @@ static int tegra_xusb_runtime_suspend(struct device *dev)
>>  {
>>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>>  
>> -	tegra_xusb_phy_disable(tegra);
>>  	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
>>  	tegra_xusb_clk_disable(tegra);
>>  
>> @@ -787,16 +786,8 @@ static int tegra_xusb_runtime_resume(struct device *dev)
>>  		goto disable_clk;
>>  	}
>>  
>> -	err = tegra_xusb_phy_enable(tegra);
>> -	if (err < 0) {
>> -		dev_err(dev, "failed to enable PHYs: %d\n", err);
>> -		goto disable_regulator;
>> -	}
>> -
>>  	return 0;
>>  
>> -disable_regulator:
>> -	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
>>  disable_clk:
>>  	tegra_xusb_clk_disable(tegra);
>>  	return err;
>> @@ -1188,6 +1179,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  	 */
>>  	platform_set_drvdata(pdev, tegra);
>>  
>> +	err = tegra_xusb_phy_enable(tegra);
>> +	if (err < 0) {
>> +		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
>> +		goto put_hcd;
>> +	}
>> +
>>  	pm_runtime_enable(&pdev->dev);
>>  	if (pm_runtime_enabled(&pdev->dev))
>>  		err = pm_runtime_get_sync(&pdev->dev);
>> @@ -1196,7 +1193,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  
>>  	if (err < 0) {
>>  		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
>> -		goto disable_rpm;
>> +		goto disable_phy;
>>  	}
>>  
>>  	tegra_xusb_config(tegra, regs);
>> @@ -1282,9 +1279,11 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  put_rpm:
>>  	if (!pm_runtime_status_suspended(&pdev->dev))
>>  		tegra_xusb_runtime_suspend(&pdev->dev);
>> -disable_rpm:
>> -	pm_runtime_disable(&pdev->dev);
>> +put_hcd:
>>  	usb_put_hcd(tegra->hcd);
>> +disable_phy:
>> +	tegra_xusb_phy_disable(tegra);
>> +	pm_runtime_disable(&pdev->dev);
>>  put_powerdomains:
>>  	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
>>  		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
>> @@ -1321,6 +1320,8 @@ static int tegra_xusb_remove(struct platform_device *pdev)
>>  		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
>>  	}
>>  
>> +	tegra_xusb_phy_disable(tegra);
>> +
>>  	tegra_xusb_padctl_put(tegra->padctl);
>>  
>>  	return 0;
>> -- 
>> 2.7.4
