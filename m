Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD95633762
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 09:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbiKVIrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 03:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232952AbiKVIrE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 03:47:04 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79301583B
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 00:47:03 -0800 (PST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NGd7b5LgczqSd9;
        Tue, 22 Nov 2022 16:43:07 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 16:47:01 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 16:47:01 +0800
Subject: Re: [PATCH v3] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     <gregkh@linuxfoundation.org>, <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <yangyingliang@huawei.com>
References: <20221121144620.4059019-1-yangyingliang@huawei.com>
 <Y3yJYXBKgwD1fmCg@kuha.fi.intel.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <3dca37e7-a8d7-eaaa-384b-c70d88aee934@huawei.com>
Date:   Tue, 22 Nov 2022 16:47:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y3yJYXBKgwD1fmCg@kuha.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2022/11/22 16:33, Heikki Krogerus wrote:
> Hi,
>
> On Mon, Nov 21, 2022 at 10:46:20PM +0800, Yang Yingliang wrote:
>> I got the following report while doing device(mt6370-tcpc) load
>> test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
>>
>>    OF: ERROR: memory leak, expected refcount 1 instead of 2,
>>    of_node_get()/of_node_put() unbalanced - destroy cset entry:
>>    attach overlay node /i2c/pmic@34
>>
>> The 'parent' returned by fwnode_get_parent() with refcount incremented.
>> it needs be put after using.
>>
>> Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
>> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> That's not the appropriate tag in this case. I have not suggested
> this patch.
>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>> v2 -> v3:
>>    Remove not needed null pointer check.
>>
>> v1 -> v2:
>>    Add description to how is the report generated.
>> ---
>>   drivers/usb/roles/class.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
>> index dfaed7eee94f..0650295f261c 100644
>> --- a/drivers/usb/roles/class.c
>> +++ b/drivers/usb/roles/class.c
>> @@ -106,10 +106,13 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
>>   	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
>>   	struct device *dev;
>>   
>> -	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
>> +	if (!parent || !fwnode_property_present(parent, "usb-role-switch")) {
> Please change that as well like I proposed earlier:
>
> 	if (!fwnode_property_present(parent, "usb-role-switch")) {
>
> You don't need to check the parent separately.
Yes, fwnode_property_present() has already checked the parent, the 
parent check can be removed.
Need I add your suggest tag when I send v4 to change it as above.

Thanks,
Yang
>
>> +		fwnode_handle_put(parent);
>>   		return NULL;
>> +	}
>>   
>>   	dev = class_find_device_by_fwnode(role_class, parent);
>> +	fwnode_handle_put(parent);
>>   	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
>>   }
>>   
> thanks,
>
