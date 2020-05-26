Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE471E0725
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 08:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388581AbgEYGj0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 02:39:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56306 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730230AbgEYGjZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 02:39:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P6dLxn025253;
        Mon, 25 May 2020 01:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590388761;
        bh=QTcmQMGgorj0hYnomxK5QtZ3R0Y2ratjZI/hzTNR0H8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eEk861V9qPFgKtTKYfpiAUgJuMVDEcfkoeT4IcJfSIQJHt2LJ07S3Z4cizsxJFUG4
         scGqT1VXG15lmZxL1AbuPxKNXNaMHh4TuwEvcgrDMPO8YzK1vu+I8AjR98O3J6Qh19
         VCSfFK88DU9bQogiCVm170Gm0XQGIQzjzsII4iu0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P6dK9Y043128
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 May 2020 01:39:21 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 May 2020 01:39:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 May 2020 01:39:20 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P6dIsY085969;
        Mon, 25 May 2020 01:39:19 -0500
Subject: Re: [PATCH 3/3] usb: dwc3: keystone: Turn on USB3 PHY before
 controller
To:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     <robh+dt@kernel.org>, <vigneshr@ti.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200513130709.10239-1-rogerq@ti.com>
 <20200513130709.10239-4-rogerq@ti.com> <1589420265.5899.0.camel@mhfsdcap03>
 <baaaf89c-4baf-4218-e22e-53cd1a64ec02@ti.com> <87tv0i4y0v.fsf@kernel.org>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <debe1c1d-8e84-8047-d387-42d4f6e03f91@ti.com>
Date:   Mon, 25 May 2020 09:39:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87tv0i4y0v.fsf@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Felipe,

On 14/05/2020 13:21, Felipe Balbi wrote:
> Roger Quadros <rogerq@ti.com> writes:
> 
>> On 14/05/2020 04:37, Chunfeng Yun wrote:
>>> On Wed, 2020-05-13 at 16:07 +0300, Roger Quadros wrote:
>>>> The Local Power Sleep Controller (LPSC) dependency on AM65
>>>> requires SERDES0 to be powered on before USB.
>>>>
>>>> We need to power up SERDES0 power domain and hold it on
>>>> throughout the reset, init, power on sequence.
>>>>
>>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>>> ---
>>>>    drivers/usb/dwc3/dwc3-keystone.c | 47 +++++++++++++++++++++++++++++++-
>>>>    1 file changed, 46 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
>>>> index 1e14a6f4884b..46d46f3507fc 100644
>>>> --- a/drivers/usb/dwc3/dwc3-keystone.c
>>>> +++ b/drivers/usb/dwc3/dwc3-keystone.c
>>>> @@ -14,6 +14,7 @@
>>>>    #include <linux/dma-mapping.h>
>>>>    #include <linux/io.h>
>>>>    #include <linux/of_platform.h>
>>>> +#include <linux/phy/phy.h>
>>>>    #include <linux/pm_runtime.h>
>>>>    
>>>>    /* USBSS register offsets */
>>>> @@ -34,6 +35,7 @@
>>>>    struct dwc3_keystone {
>>>>    	struct device			*dev;
>>>>    	void __iomem			*usbss;
>>>> +	struct phy			*usb3_phy;
>>>>    };
>>>>    
>>>>    static inline u32 kdwc3_readl(void __iomem *base, u32 offset)
>>>> @@ -95,8 +97,44 @@ static int kdwc3_probe(struct platform_device *pdev)
>>>>    	if (IS_ERR(kdwc->usbss))
>>>>    		return PTR_ERR(kdwc->usbss);
>>>>    
>>>> -	pm_runtime_enable(kdwc->dev);
>>>> +	/* PSC dependency on AM65 needs SERDES0 to be powered before USB0 */
>>>> +	kdwc->usb3_phy = devm_phy_get(dev, "usb3-phy");
>>> Use devm_phy_optional_get() instead?
>>
>> Indeed, it seems better suited.
> 
> patches 1 and 2 are in testing/next
> 

Could you please drop them as I need to make changes to make the PHY optional.
I will send v2 of entire series.

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
