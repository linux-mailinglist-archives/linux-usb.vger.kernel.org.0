Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AC11D1082
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgEMLDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 07:03:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36142 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729376AbgEMLDq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 07:03:46 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DB3eWb013026;
        Wed, 13 May 2020 06:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589367820;
        bh=Gfwm5e1mdI1E7raLgIubXpvFVM27Q1u/4c7BfKx2MgI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JMotxA9guqNCRsVe7NgA/X0tLnSnR7aGuoybvAbR2YSVh/T1jZV08qPp+IBiMM+eg
         TZ0jdZ7DH3z8cIo+todowCkxIO7xTmh+WejBQn3cmH+0FInE/ZaWJMwfbWSBJ3xSfW
         QNoMYpWgAoJdY0ibPJcx1flwDzbQoyxAHgVFUP1E=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04DB3e2f099472
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 May 2020 06:03:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 06:03:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 06:03:40 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DB3cmT023849;
        Wed, 13 May 2020 06:03:38 -0500
Subject: Re: [PATCH 1/1] phy: phy-cadence-salvo: add phy .init API
To:     Peter Chen <peter.chen@nxp.com>
CC:     "vkoul@kernel.org" <vkoul@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
References: <20200507052120.27497-1-peter.chen@nxp.com>
 <20200513025709.GB29070@a0393678ub> <20200513105141.GB3698@b29397-desktop>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <9e3811e7-6a2e-f6b2-18de-3939067ea805@ti.com>
Date:   Wed, 13 May 2020 16:33:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513105141.GB3698@b29397-desktop>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On 5/13/2020 4:21 PM, Peter Chen wrote:
> On 20-05-13 08:27:09, Kishon Vijay Abraham I wrote:
>> Hi Peter,
>>
>> On Thu, May 07, 2020 at 01:21:20PM +0800, Peter Chen wrote:
>>> .init is used for PHY's initialization, and .power_on/power_off are only
>>> used for clock on and off.
>>>
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>
>> This patch doesn't apply cleanly. Can you kindly check phy -next is
>> proper since I expected this to merge cleanly?
>>
> 
> Hi Kishon,
> 
> I don't see my first salvo PHY at your phy -next tree
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/log/?h=next

PHY tree is moved here
git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Thanks
Kishon

> 
> But I do see it is on linux-next tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=50d35aa8c15f7210fe76de64b1940100b588bcae
> 
> What happened?
> 
> Peter
>> Thanks
>> Kishon
>>> ---
>>>  drivers/phy/cadence/phy-cadence-salvo.c | 12 +++++++++++-
>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
>>> index fa666527356d..c2b6ddfe02e0 100644
>>> --- a/drivers/phy/cadence/phy-cadence-salvo.c
>>> +++ b/drivers/phy/cadence/phy-cadence-salvo.c
>>> @@ -206,7 +206,7 @@ static struct cdns_reg_pairs cdns_nxp_sequence_pair[] = {
>>>  };
>>>  
>>>  
>>> -static int cdns_salvo_phy_power_on(struct phy *phy)
>>> +static int cdns_salvo_phy_init(struct phy *phy)
>>>  {
>>>  	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
>>>  	struct cdns_salvo_data *data = salvo_phy->data;
>>> @@ -231,9 +231,18 @@ static int cdns_salvo_phy_power_on(struct phy *phy)
>>>  
>>>  	udelay(10);
>>>  
>>> +	clk_disable_unprepare(salvo_phy->clk);
>>> +
>>>  	return ret;
>>>  }
>>>  
>>> +static int cdns_salvo_phy_power_on(struct phy *phy)
>>> +{
>>> +	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
>>> +
>>> +	return clk_prepare_enable(salvo_phy->clk);
>>> +}
>>> +
>>>  static int cdns_salvo_phy_power_off(struct phy *phy)
>>>  {
>>>  	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
>>> @@ -244,6 +253,7 @@ static int cdns_salvo_phy_power_off(struct phy *phy)
>>>  }
>>>  
>>>  static struct phy_ops cdns_salvo_phy_ops = {
>>> +	.init		= cdns_salvo_phy_init,
>>>  	.power_on	= cdns_salvo_phy_power_on,
>>>  	.power_off	= cdns_salvo_phy_power_off,
>>>  	.owner		= THIS_MODULE,
>>> -- 
>>> 2.17.1
>>>
> 
