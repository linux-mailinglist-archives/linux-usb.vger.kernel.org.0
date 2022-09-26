Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245ED5EAA17
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 17:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236038AbiIZPRk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 11:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236040AbiIZPQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 11:16:48 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC17A11C16
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 07:03:20 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mbkrg43r2zWhBH;
        Mon, 26 Sep 2022 21:59:15 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:03:18 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:03:18 +0800
Subject: Re: [PATCH -next 0/5] usb: musb: Switch to use dev_err_probe() helper
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <yangyingliang@huawei.com>
References: <20220926140348.2028052-1-yangyingliang@huawei.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <87d0eea6-cc17-143b-01ea-5da5403ea21c@huawei.com>
Date:   Mon, 26 Sep 2022 22:03:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220926140348.2028052-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

I missed SoB in patch #1, #2, please ignore this patchset, I will resend it.

Thanks,
Yang
On 2022/9/26 22:03, Yang Yingliang wrote:
> This patchset is trying to replace dev_err() with dev_err_probe() in
> the probe path.
>
> Yang Yingliang (5):
>    usb: musb: core: Switch to use dev_err_probe() helper
>    usb: musb: da8xx: Switch to use dev_err_probe() helper
>    usb: musb: cppi41: Switch to use dev_err_probe() helper
>    usb: musb: jz4740: Switch to use dev_err_probe() helper
>    usb: musb: sunxi: Switch to use dev_err_probe() helper
>
>   drivers/usb/musb/da8xx.c       |  8 +++-----
>   drivers/usb/musb/jz4740.c      | 10 +++-------
>   drivers/usb/musb/musb_core.c   |  5 ++---
>   drivers/usb/musb/musb_cppi41.c |  6 ++----
>   drivers/usb/musb/sunxi.c       | 29 +++++++++--------------------
>   5 files changed, 19 insertions(+), 39 deletions(-)
>
