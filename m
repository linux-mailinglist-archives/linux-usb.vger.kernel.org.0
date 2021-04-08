Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A45357E88
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 10:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhDHI5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 04:57:32 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15178 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhDHI5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 04:57:30 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGFSR5792zpWTl;
        Thu,  8 Apr 2021 16:54:31 +0800 (CST)
Received: from [10.174.179.96] (10.174.179.96) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 16:57:11 +0800
Subject: Re: [PATCH -next] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
To:     Ye Bin <yebin10@huawei.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20210408085033.909377-1-yebin10@huawei.com>
From:   YueHaibing <yuehaibing@huawei.com>
Message-ID: <bf976317-2bf5-d019-bf7b-4a4ead0b1c94@huawei.com>
Date:   Thu, 8 Apr 2021 16:57:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210408085033.909377-1-yebin10@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.96]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


这种bugfix最好加下Fixes tag

On 2021/4/8 16:50, Ye Bin wrote:
> Add the missing unlock before return from function usbip_sockfd_store()
> in the error handling case.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>  drivers/usb/usbip/vudc_sysfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> index f7633ee655a1..d1cf6b51bf85 100644
> --- a/drivers/usb/usbip/vudc_sysfs.c
> +++ b/drivers/usb/usbip/vudc_sysfs.c
> @@ -156,12 +156,14 @@ static ssize_t usbip_sockfd_store(struct device *dev,
>  		tcp_rx = kthread_create(&v_rx_loop, &udc->ud, "vudc_rx");
>  		if (IS_ERR(tcp_rx)) {
>  			sockfd_put(socket);
> +			mutex_unlock(&udc->ud.sysfs_lock);
>  			return -EINVAL;
>  		}
>  		tcp_tx = kthread_create(&v_tx_loop, &udc->ud, "vudc_tx");
>  		if (IS_ERR(tcp_tx)) {
>  			kthread_stop(tcp_rx);
>  			sockfd_put(socket);
> +			mutex_unlock(&udc->ud.sysfs_lock);
>  			return -EINVAL;
>  		}
>  
> 
> .
> 
