Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76802C3D08
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 10:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgKYJwq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 04:52:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46826 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgKYJwq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 04:52:46 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AP9qYHN087573;
        Wed, 25 Nov 2020 03:52:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606297954;
        bh=EjBkaQQ8hkiOiGdh37NIn7xwhbnpm215Dhm11H1f0CU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LNdK4daC1sgiMHF3dzYhUSmL2/ZYxpKasYzK+KSGmBg3wW7z26MUPsZOn3C7tL2X9
         XWx8JOxJ60ZFrMtpvdih9rxHq66/GNvHmaEyTxqhBrg73hzYMZiWevwr0xTvT6EXly
         jTZCV19fk0I4uhEIhpjMmZo6euv69jLnkdziSF74=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AP9qYSR039198
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Nov 2020 03:52:34 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 25
 Nov 2020 03:52:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 25 Nov 2020 03:52:33 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AP9qVwx112639;
        Wed, 25 Nov 2020 03:52:32 -0600
Subject: Re: [PATCH] Revert "usb: cdns3: core: quit if it uses role switch
 class"
To:     Peter Chen <peter.chen@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201123115051.30047-1-rogerq@ti.com>
 <20201124064242.GA32310@b29397-desktop>
 <89067b6a-5b94-d7d2-b07a-f434c9e5e2bd@ti.com>
 <DBBPR04MB797982E6E190F0C0E0980F258BFB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
 <bdb2b4cb-686e-9283-bc66-78808b92c349@ti.com>
 <20201124114641.GA9929@b29397-desktop>
 <1c4fb95a-97b7-9022-7062-8fafcfe42c3d@ti.com>
 <20201125003550.GB9929@b29397-desktop>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <f74b3c57-a9f1-2f5f-119c-a52ce9ba2f70@ti.com>
Date:   Wed, 25 Nov 2020 11:52:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125003550.GB9929@b29397-desktop>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25/11/2020 02:36, Peter Chen wrote:
> On 20-11-24 14:22:25, Roger Quadros wrote:
>> Peter,
>>
>> On 24/11/2020 13:47, Peter Chen wrote:
>>> On 20-11-24 12:33:34, Roger Quadros wrote:
>>>>>>>
>>>>>>> I am sorry about that. Do you use role switch /sys entry, if you have
>>>>>>> used, I prefer using "usb-role-switch" property at dts to judge if SoC
>>>>>>> OTG signals or external signals for role switch. If you have not used
>>>>>>> it, I prefer only setting cdns->role_sw for role switch use cases.
>>>>>>>
>>>>>>
>>>>>> We use both hardware role switch and /sys entries for manually forcing a
>>>>>> certain role.
>>>>>>
>>>>>> We do not set any "usb-role-switch" property at DTS.
>>>>>>
>>>>>> Currently cdns->role_sw is being always set by driver irrespective of any DT
>>>>>> property, so this patch is clearly wrong and needs to be reverted.
>>>>>>
>>>>>> What do you think?
>>>>>>
>>>>>
>>>>> Could you accept below fix?
>>>>>
>>>>> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>>>>> index 2e469139769f..fdd52e87a7b2 100644
>>>>> --- a/drivers/usb/cdns3/core.c
>>>>> +++ b/drivers/usb/cdns3/core.c
>>>>> @@ -280,8 +280,8 @@ int cdns3_hw_role_switch(struct cdns3 *cdns)
>>>>>            enum usb_role real_role, current_role;
>>>>>            int ret = 0;
>>>>>
>>>>> -       /* Depends on role switch class */
>>>>> -       if (cdns->role_sw)
>>>>> +       /* quit if switch role through external signals */
>>>>> +       if (device_property_read_bool(cdns->dev, "usb-role-switch"))
>>>>>                    return 0;
>>>>>
>>>>>            pm_runtime_get_sync(cdns->dev);
>>>>
>>>> Although this will fix the issue I don't think this is making the driver to behave
>>>> as expected with usb-role-switch property.
>>>>
>>>> Now, even if usb-role-switch property is not present the driver will still register
>>>> the role switch driver.
>>>>
>>>> I think we need to register the role switch driver only if usb-role-switch property
>>>> is present. We would also need to set the default role if role-switch-default-mode is present.
>>>>
>>>> How about the following? It still doesn't handle role-switch-default-mode property though.
>>>>
>>>
>>> Roger, you said you also use /sys entries (I suppose it means through role
>>> switch class) to do role switch, with your change, there will be no /sys
>>> entry for role switch.
>>
>> Sorry for the confusion. Although we do need both features (SW role switch + HW role switch)
>> I don't think it is required to operate simultaneously. If users need SW control they can set the DT flag.
>>
> 
> I see. I prefer embracing all things related to role switch under the
> firmware entry condition. Besides, I find another issue that devm_request_irq
> for wakeup_irq does not call usb_role_switch_unregister if it has
> failed. So, probably, two patches are needed. I am OK you send the
> patches to fix both.

Pawel, can you please confirm that if you are ok with either h/w role switching
or s/w role switching but not both working at the same time?

It would have been nice by user to to know the current role even for h/w based
swithcing but it looks like now that won't be possible.

cheers,
-roger
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 2e469139769f..fc6a8152406c 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -427,7 +427,6 @@ static irqreturn_t cdns3_wakeup_irq(int irq, void *data)
>    */
>   static int cdns3_probe(struct platform_device *pdev)
>   {
> -	struct usb_role_switch_desc sw_desc = { };
>   	struct device *dev = &pdev->dev;
>   	struct resource	*res;
>   	struct cdns3 *cdns;
> @@ -529,18 +528,21 @@ static int cdns3_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err2;
>   
> -	sw_desc.set = cdns3_role_set;
> -	sw_desc.get = cdns3_role_get;
> -	sw_desc.allow_userspace_control = true;
> -	sw_desc.driver_data = cdns;
> -	if (device_property_read_bool(dev, "usb-role-switch"))
> +	if (device_property_read_bool(dev, "usb-role-switch")) {
> +		struct usb_role_switch_desc sw_desc = { };
> +
> +		sw_desc.set = cdns3_role_set;
> +		sw_desc.get = cdns3_role_get;
> +		sw_desc.allow_userspace_control = true;
> +		sw_desc.driver_data = cdns;
>   		sw_desc.fwnode = dev->fwnode;
>   
> -	cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
> -	if (IS_ERR(cdns->role_sw)) {
> -		ret = PTR_ERR(cdns->role_sw);
> -		dev_warn(dev, "Unable to register Role Switch\n");
> -		goto err3;
> +		cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
> +		if (IS_ERR(cdns->role_sw)) {
> +			ret = PTR_ERR(cdns->role_sw);
> +			dev_warn(dev, "Unable to register Role Switch\n");
> +			goto err3;
> +		}
>   	}
>   
>   	if (cdns->wakeup_irq) {
> @@ -583,7 +585,8 @@ static int cdns3_probe(struct platform_device *pdev)
>   	return 0;
>   err4:
>   	cdns3_drd_exit(cdns);
> -	usb_role_switch_unregister(cdns->role_sw);
> +	if (cdns->role_sw)
> +		usb_role_switch_unregister(cdns->role_sw);
>   err3:
>   	set_phy_power_off(cdns);
>   err2:
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
