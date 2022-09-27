Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539525EB6BB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 03:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiI0BRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 21:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiI0BRe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 21:17:34 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D961767163
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 18:17:31 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mc1pM5JDlz1P6v1;
        Tue, 27 Sep 2022 09:13:15 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 09:17:29 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 09:17:29 +0800
Subject: Re: [PATCH -next resend 1/5] usb: musb: core: Switch to use
 dev_err_probe() helper
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>
References: <20220926141510.2265523-1-yangyingliang@huawei.com>
 <20220926141510.2265523-2-yangyingliang@huawei.com>
 <6d8b99a0-f12b-caaa-5fcd-a7a4a7d6e219@gmail.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <4ec33092-dac3-ff00-9001-58542122278b@huawei.com>
Date:   Tue, 27 Sep 2022 09:17:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6d8b99a0-f12b-caaa-5fcd-a7a4a7d6e219@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 2022/9/27 3:12, Sergei Shtylyov wrote:
> Hello!
>
> On 9/26/22 5:15 PM, Yang Yingliang wrote:
>
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs. It's more simple in error path.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/usb/musb/musb_core.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
>> index bbbcfd49fb35..37ef9d8cb8ea 100644
>> --- a/drivers/usb/musb/musb_core.c
>> +++ b/drivers/usb/musb/musb_core.c
>> @@ -2595,9 +2595,8 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
>>   	musb_platform_exit(musb);
>>   
>>   fail1:
>> -	if (status != -EPROBE_DEFER)
>> -		dev_err(musb->controller,
>> -			"%s failed with status %d\n", __func__, status);
>> +	dev_err_probe(musb->controller, status,
>> +		      "%s failed with status\n", __func__);
>     Printing "with status" when you no longer print the status itself has no sense.
Yes, " with status" string should be removed.

Thanks,
Yang
>
> [...]
>
> MBR, Sergey
> .
