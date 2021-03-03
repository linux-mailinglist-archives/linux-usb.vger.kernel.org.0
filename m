Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD09C32B707
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 12:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbhCCKbu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:50 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:13420 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356164AbhCCHQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 02:16:50 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dr4xn5gGNzjT45;
        Wed,  3 Mar 2021 15:14:37 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Mar 2021
 15:15:53 +0800
Subject: Re: [PATCH] usb: hcd: remove unused including <linux/version.h>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Tian Tao <tiantao6@hisilicon.com>
CC:     <linux-usb@vger.kernel.org>
References: <1614733752-56541-1-git-send-email-tiantao6@hisilicon.com>
 <YD80gndsrjIRvy8H@kroah.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <ff94889c-1d51-e6e3-65dc-739b7509e05c@huawei.com>
Date:   Wed, 3 Mar 2021 15:15:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YD80gndsrjIRvy8H@kroah.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


ÔÚ 2021/3/3 15:02, Greg KH Ð´µÀ:
> On Wed, Mar 03, 2021 at 09:09:12AM +0800, Tian Tao wrote:
>> Remove including <linux/version.h> that don't need it.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>   drivers/usb/core/hcd.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
>> index 3f03813..53bc93d 100644
>> --- a/drivers/usb/core/hcd.c
>> +++ b/drivers/usb/core/hcd.c
>> @@ -11,7 +11,6 @@
>>   
>>   #include <linux/bcd.h>
>>   #include <linux/module.h>
>> -#include <linux/version.h>
>>   #include <linux/kernel.h>
>>   #include <linux/sched/task_stack.h>
>>   #include <linux/slab.h>
> You obviously did not even test-build this patch, which is very odd when
> submitting something to the community.  Why did you not do this?
>
> This file _DOES_ need this .h file, whatever tool you are using to
> detect this is completely broken.  Please fix it and be more careful
> before sending new patches.
this is reported by command ¡°make versioncheck¡±
> thanks,
>
> greg k-h
> .
>

