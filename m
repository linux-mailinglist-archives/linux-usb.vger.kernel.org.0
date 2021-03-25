Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E6034877D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 04:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhCYD07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 23:26:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14530 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbhCYD0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 23:26:36 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5VnX6tWTzNqWj;
        Thu, 25 Mar 2021 11:24:00 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 11:26:25 +0800
Subject: Re: [PATCH -next] usb: typec: tipd: Remove duplicated include from
 core.c
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20210325031255.120479-1-miaoqinglang@huawei.com>
From:   Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <6b2a8913-e11f-c3e6-aef5-0263c3c5fef1@huawei.com>
Date:   Thu, 25 Mar 2021 11:26:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210325031255.120479-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry for the noise, I've send this same patch three times for stupid 
reason.

Please ignore the following two.

ÔÚ 2021/3/25 11:12, 'Qinglang Miao Ð´µÀ:
> From: Qinglang Miao <miaoqinglang@huawei.com>
> 
> Remove duplicated include.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   drivers/usb/typec/tipd/core.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d8212b15f6f9..938219bc1b4b 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -6,8 +6,6 @@
>    * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>    */
>   
> -#include "tps6598x.h"
> -
>   #include <linux/i2c.h>
>   #include <linux/acpi.h>
>   #include <linux/module.h>
> 
> .
> 
