Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0E45B2EF9
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 08:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbiIIGat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 02:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiIIGao (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 02:30:44 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC041ED98E;
        Thu,  8 Sep 2022 23:30:36 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MP5cc4l9GzQj7k;
        Fri,  9 Sep 2022 14:26:56 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 14:30:34 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 14:30:33 +0800
Subject: Re: [PATCH 1/2] phy: usb: Fix potential NULL dereference in
 sp_usb_phy_probe()
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <vincent.sunplus@gmail.com>, <kishon@ti.com>, <vkoul@kernel.org>,
        <p.zabel@pengutronix.de>, <linux-usb@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <kernel-janitors@vger.kernel.org>
References: <20220909013546.2259545-1-sunke32@huawei.com>
 <20220909013546.2259545-2-sunke32@huawei.com> <YxrRlCytfPobnjSv@kroah.com>
From:   Sun Ke <sunke32@huawei.com>
Message-ID: <027f9ef7-b447-b685-d190-01ff1d45c46a@huawei.com>
Date:   Fri, 9 Sep 2022 14:30:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YxrRlCytfPobnjSv@kroah.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



ÔÚ 2022/9/9 13:39, Greg KH Ð´µÀ:
> On Fri, Sep 09, 2022 at 09:35:45AM +0800, Sun Ke wrote:
>> platform_get_resource_byname() may fail and return NULL, so we should
>> better check it s return value to avoid a NULL pointer dereference
>> a bit later in the code.
>>
>> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>>   drivers/phy/sunplus/phy-sunplus-usb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
>> index 5269968b3060..d73a8a421d9c 100644
>> --- a/drivers/phy/sunplus/phy-sunplus-usb2.c
>> +++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
>> @@ -249,11 +249,15 @@ static int sp_usb_phy_probe(struct platform_device *pdev)
>>   	usbphy->dev = &pdev->dev;
>>   
>>   	usbphy->phy_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
> 
> How can this fail on this system?
> 
>> +	if (!usbphy->phy_res_mem)
>> +		return -EINVAL;
>>   	usbphy->phy_regs = devm_ioremap_resource(&pdev->dev, usbphy->phy_res_mem);
>>   	if (IS_ERR(usbphy->phy_regs))
>>   		return PTR_ERR(usbphy->phy_regs);
>>   
>>   	usbphy->moon4_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "moon4");
> 
> Same here, how can this fail?
> Have you seen these failures happen in real systems?

No, just code review.

Thanks,
Sun Ke
> 
> thanks,
> 
> greg k-h
> .
> 
