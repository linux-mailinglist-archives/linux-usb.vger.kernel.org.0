Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13868777857
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 14:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbjHJMbK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 08:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbjHJMbJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 08:31:09 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42492127
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 05:31:04 -0700 (PDT)
Received: from dggpemm500017.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RM5m25scMzcdFF;
        Thu, 10 Aug 2023 20:27:30 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500017.china.huawei.com (7.185.36.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 20:31:01 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 20:31:00 +0800
Subject: Re: [PATCH -next] usb: dwc3: dwc3-octeon: remove unnecessary
 platform_set_drvdata()
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     <linux-usb@vger.kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
References: <20230810015117.3085574-1-yangyingliang@huawei.com>
 <ZNSx3Qv8ypMbOkho@lenoch>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <78f08ee1-8a74-b179-ac47-5a1541e7118a@huawei.com>
Date:   Thu, 10 Aug 2023 20:31:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ZNSx3Qv8ypMbOkho@lenoch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2023/8/10 17:46, Ladislav Michl wrote:
> On Thu, Aug 10, 2023 at 09:51:17AM +0800, Yang Yingliang wrote:
>> Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
>> the driver_data will be cleared in device_unbind_cleanup() after
>> calling ->remove() in driver call code.
> Isn't the same true also for dwc3-imx8mp, dwc3-keystone and dwc3-am62.c?
Yes, I can squash them in one patch.

Thanks,
Yang
>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/usb/dwc3/dwc3-octeon.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
>> index 6b6581057345..356347780c15 100644
>> --- a/drivers/usb/dwc3/dwc3-octeon.c
>> +++ b/drivers/usb/dwc3/dwc3-octeon.c
>> @@ -517,7 +517,6 @@ static void dwc3_octeon_remove(struct platform_device *pdev)
>>   	struct dwc3_octeon *octeon = platform_get_drvdata(pdev);
>>   
>>   	of_platform_depopulate(octeon->dev);
>> -	platform_set_drvdata(pdev, NULL);
>>   }
>>   
>>   static const struct of_device_id dwc3_octeon_of_match[] = {
>> -- 
>> 2.25.1
> .
