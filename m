Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92020630D03
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 08:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbiKSHrk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Nov 2022 02:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKSHrh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Nov 2022 02:47:37 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A0EA3162
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 23:47:36 -0800 (PST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NDm2N45DWzmVyf;
        Sat, 19 Nov 2022 15:47:08 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 15:47:34 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 15:47:33 +0800
Subject: Re: [PATCH] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <chunfeng.yun@mediatek.com>, <linux-usb@vger.kernel.org>,
        <yangyingliang@huawei.com>
References: <20221118141850.806564-1-yangyingliang@huawei.com>
 <Y3fHom6pvHT+dD5k@kroah.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <84ac82b3-5785-e879-8a36-3123683b4e83@huawei.com>
Date:   Sat, 19 Nov 2022 15:47:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y3fHom6pvHT+dD5k@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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


On 2022/11/19 1:57, Greg KH wrote:
> On Fri, Nov 18, 2022 at 10:18:50PM +0800, Yang Yingliang wrote:
>> I got the following report:
>>
>>    OF: ERROR: memory leak, expected refcount 1 instead of 2,
>>    of_node_get()/of_node_put() unbalanced - destroy cset entry:
>>    attach overlay node /i2c/pmic@34
> report from what?  What generates this?
I got this report while doing loading device (mt6370-tcpc) test
with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled.

Thanks,
Yang
>
> .
