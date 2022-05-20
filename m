Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870FB52E217
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 03:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344245AbiETBjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 May 2022 21:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbiETBjP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 21:39:15 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367749A9AB;
        Thu, 19 May 2022 18:39:15 -0700 (PDT)
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L48Sx4pQNzQkDb;
        Fri, 20 May 2022 09:36:17 +0800 (CST)
Received: from [10.67.111.227] (10.67.111.227) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 20 May 2022 09:39:13 +0800
Subject: Re: [PATCH -next] usb: host: ohci-tmio: Fix unchecked return value
 for device_wakeup_enable
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <dbaryshkov@gmail.com>, <stern@rowland.harvard.edu>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220519020434.31575-1-lizhengyu3@huawei.com>
 <YoZoe3iOJDbd6SJ9@kroah.com>
From:   "lizhengyu (E)" <lizhengyu3@huawei.com>
Message-ID: <32cf6110-2c78-96ee-1950-28977efce767@huawei.com>
Date:   Fri, 20 May 2022 09:39:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YoZoe3iOJDbd6SJ9@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 19 May 2022 17:55:39 +0200, Greg KH <gregkh@linuxfoundation.org> 
wrote:
> On Thu, May 19, 2022 at 10:04:34AM +0800, Li Zhengyu wrote:
>> The return value of device_wakeup_enable() is unchecked, as the result
>> usb_remove_hcd() is unreachable even if device_wakeup_enable() is failed.
>>
>> Fixes: 78c73414f4f6 ("USB: ohci: add support for tmio-ohci cell")
>>
>> Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>
>> ---
>>   drivers/usb/host/ohci-tmio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/ohci-tmio.c b/drivers/usb/host/ohci-tmio.c
>> index 49539b9f0e94..8148dc90c066 100644
>> --- a/drivers/usb/host/ohci-tmio.c
>> +++ b/drivers/usb/host/ohci-tmio.c
>> @@ -244,7 +244,7 @@ static int ohci_hcd_tmio_drv_probe(struct platform_device *dev)
>>   	if (ret)
>>   		goto err_add_hcd;
>>   
>> -	device_wakeup_enable(hcd->self.controller);
>> +	ret = device_wakeup_enable(hcd->self.controller);
>>   	if (ret == 0)
>>   		return ret;
> But now if there is an error you do not clean up properly, so you have
> memory leaks?
>
> How did you test this?
There is no test. It is a suggest by Dmitry Baryshkov in previous patch 
https://lore.kernel.org/all/CALT56yO_ek55BGX4cKuTim2gWwQp7EXUFyh332MPYHPdi7xEWw@mail.gmail.com/ 

>
> thanks,
>
> greg k-h
> .
