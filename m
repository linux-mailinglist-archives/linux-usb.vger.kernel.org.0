Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552EF631C49
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiKUJBu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiKUJBt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:01:49 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C7B2D1F5
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:01:47 -0800 (PST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NG1Zs5JcJzHvld;
        Mon, 21 Nov 2022 17:01:09 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 17:01:44 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 17:01:43 +0800
Subject: Re: [PATCH v2] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        <yangyingliang@huawei.com>
References: <20221119091541.1755640-1-yangyingliang@huawei.com>
 <097dc06a02377bf67e4d67a016060dbcd06f4798.camel@mediatek.com>
 <Y3s9G199bfkZxrJK@kuha.fi.intel.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <3dbcee61-7163-d210-5862-90495d049b90@huawei.com>
Date:   Mon, 21 Nov 2022 17:01:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y3s9G199bfkZxrJK@kuha.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

Hi,

On 2022/11/21 16:55, Heikki Krogerus wrote:
> Hi,
>
> On Mon, Nov 21, 2022 at 07:49:31AM +0000, Chunfeng Yun (云春峰) wrote:
>> On Sat, 2022-11-19 at 17:15 +0800, Yang Yingliang wrote:
>>> I got the following report while doing device(mt6370-tcpc) load
>>> test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:
>>>
>>>    OF: ERROR: memory leak, expected refcount 1 instead of 2,
>>>    of_node_get()/of_node_put() unbalanced - destroy cset entry:
>>>    attach overlay node /i2c/pmic@34
>>>
>>> The 'parent' returned by fwnode_get_parent() with refcount
>>> incremented.
>>> it needs be put after using.
>>>
>>> Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>> ---
>>> v1 -> v2:
>>>    Add description to how is the report generated.
>>> ---
>>>   drivers/usb/roles/class.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
>>> index dfaed7eee94f..289950e5fcfb 100644
>>> --- a/drivers/usb/roles/class.c
>>> +++ b/drivers/usb/roles/class.c
>>> @@ -106,10 +106,14 @@ usb_role_switch_is_parent(struct fwnode_handle
>>> *fwnode)
>>>   	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
>>>   	struct device *dev;
>>>   
>>> -	if (!parent || !fwnode_property_present(parent, "usb-role-
>>> switch"))
>>> +	if (!parent || !fwnode_property_present(parent, "usb-role-
>>> switch")) {
>>> +		if (parent)
>>> +			fwnode_handle_put(parent);
>>>   		return NULL;
>>> +	}
> fwnode API should be NULL safe, so perhaps like this - clean also the
> old condition while at it:
>
>          if (!fwnode_property_present(parent, "usb-role-switch")) {
>                  fwnode_handle_put(parent);
>                  return NULL;
>          }
Thanks for your suggestion, I will send a v3 to change this.

Thanks,
Yang
>
>>>   	dev = class_find_device_by_fwnode(role_class, parent);
>>> +	fwnode_handle_put(parent);
>>>   	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
>>>   }
>>>   
>> + Heikki
> Thanks Chunfeng!
>
> cheers,
>
