Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F375A2FBE0C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 18:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729063AbhASO7b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 09:59:31 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:43448 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391618AbhASOXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 09:23:38 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10JEDDUY023322;
        Tue, 19 Jan 2021 15:22:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UvHs684uAeD3bFunUh/ZA4myF0Q6gk6gMB70PXJxIjE=;
 b=QCLXI6/HOvFgfT4D28a3yWwJHglhJbIVhGZ7chesWbxNodmKk10TeJ+CdRCy5YcAmjNz
 AlOXjsO5am1Aau5zHR63KTcJc3KvHKzheXwL62JX7Ji+SnSy0Ce+VWdnh91bsvuJ0ADS
 R1MFaoMFF2Gl2h8SLloNPcllVHKQ9STH5NWFypJ5XkrY3CzkFzyEDRPgD58hwPVprzpP
 0yewEl+qQWxXt2IJZyAxin/IvjHWWHijSJzhoTqkaaDbOaGLclXiMyUEBNnddRhEOtZ/
 E+kpVKSDJCWut664z4Q0RyG+7pGtdlfS0peF1KAYfc6fj7Jick8D4fxq/8prmaKsORxi UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 363qwnga5j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 19 Jan 2021 15:22:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1110100034;
        Tue, 19 Jan 2021 15:22:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AD8A25D007;
        Tue, 19 Jan 2021 15:22:45 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 15:22:44 +0100
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: Change ordering of phy_init and
 phy_power_on
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Jules Maselbas <jmaselbas@kalray.eu>,
        <linux-usb@vger.kernel.org>
CC:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de>
 <20210112170124.14148-1-jmaselbas@kalray.eu>
 <20c8617b-069c-e9a5-f394-4e5a8e67deb4@pengutronix.de>
From:   Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <ccfd600c-112e-2dbd-0117-8cef6f591d45@foss.st.com>
Date:   Tue, 19 Jan 2021 15:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20c8617b-069c-e9a5-f394-4e5a8e67deb4@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-19_04:2021-01-18,2021-01-19 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ahmad, Jules,

On 1/12/21 10:30 PM, Ahmad Fatoum wrote:
> Hello Jules,
> 
> + linux-stm32 and Amelie, who upstreamed dwc2 glue for the stm32mp1.
> 
> [ some context: https://lore.kernel.org/lkml/6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de/ ]
> 
> On 12.01.21 18:01, Jules Maselbas wrote:
>> Call phy_init before phy_power_on as this is the intended way of using
>> the generic phy api.
> 
> Even if the PHY driver code itself doesn't show an apparent dependency
> between the power on and init operation, the hardware may expect things to
> happen in a defined order. This is at least the case for the stm32-usbphyc
> and would be violated if we just swap the order in the controller.
> 
> Instead, why not take it slow:
> 
>   - Document that phy_init -> phy_power_on is the correct order
>   - Throw a warning when the order is violated
>   - Ask for this patch to marinate a while in linux-next, so people
>     have a chance to sort out incompatibilities with their PHY drivers
> 

I agree with Ahmad, this should be documented somewhere.

Even if, with latest stm32-usbphyc updates 
(https://lore.kernel.org/patchwork/project/lkml/list/?series=478783), 
the order phy_init() then phy_power_on() would ensure a recommendation 
of STM32MP15 AN5031 [1].

Regards,
Amelie

[1] 
https://www.st.com/resource/en/application_note/dm00389996-getting-started-with-stm32mp151-stm32mp153-and-stm32mp157-line-hardware-development-stmicroelectronics.pdf

> Cheers,
> Ahmad
> 
>>
>> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
>> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Cc: Minas Harutyunyan <hminas@synopsys.com>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>>
>> ---
>>
>> I have quickly looked at usb-phy if this change could break something or
>> not. The following cmd list the compatible strings for usb-phy used by dwc2:
>>
>> git grep 'snps,dwc2' -- arch/ | sed 's/:.*$//' | { while read file; do \
>>          phyname=$(git grep -A10 'snps,dwc2' -- "$file" | \
>>                  sed -n '/phys/{s/.*<&\([^ >]*\).*/\1/p}'); \
>>          [ "$phyname" ] && { \
>> 	        git grep -A10 "${phyname}: " -- "$file" | \
>>                  grep -m1 'compatible'; \
>>          }; done };
>>
>>  From this output I took a look at:
>>   - brcm,kona-usb2-phy
>>   - samsung,exynos3250-usb2-phy
>>   - rockchip,rk3288-usb
>>   - amlogic,meson-gxbb-usb2-phy
>>   - amlogic,meson-gxl-usb2-phy
>>   - img,pistachio-usb-phy
>>
>> Most of these phys only defines .power_on and .power_off;
>> brcm,kona-usb2-phy also defines .init; and amlogic,meson-gxl-usb2-phy defines
>> .init .exit and .reset
>>
>>  From what I've seen it seems to be OK for these two phy to call
>> init/exit first and then power_on/power_off.
>> ---
>>   drivers/usb/dwc2/platform.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
>> index b58ce996add7..a07dff088a26 100644
>> --- a/drivers/usb/dwc2/platform.c
>> +++ b/drivers/usb/dwc2/platform.c
>> @@ -142,9 +142,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
>>   	} else if (hsotg->plat && hsotg->plat->phy_init) {
>>   		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
>>   	} else {
>> -		ret = phy_power_on(hsotg->phy);
>> +		ret = phy_init(hsotg->phy);
>>   		if (ret == 0)
>> -			ret = phy_init(hsotg->phy);
>> +			ret = phy_power_on(hsotg->phy);
>>   	}
>>   
>>   	return ret;
>> @@ -176,9 +176,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
>>   	} else if (hsotg->plat && hsotg->plat->phy_exit) {
>>   		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
>>   	} else {
>> -		ret = phy_exit(hsotg->phy);
>> +		ret = phy_power_off(hsotg->phy);
>>   		if (ret == 0)
>> -			ret = phy_power_off(hsotg->phy);
>> +			ret = phy_exit(hsotg->phy);
>>   	}
>>   	if (ret)
>>   		return ret;
>>
> 
