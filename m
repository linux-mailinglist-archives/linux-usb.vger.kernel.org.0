Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E697435A0A0
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 16:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhDIOEy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 10:04:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDIOEx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 10:04:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67DC661108;
        Fri,  9 Apr 2021 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617977080;
        bh=yKWsA1tj25u0+0VAe93DnnuhYoM2MG0/uON9oz+d1ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KJC0AMqmdA9HJIMDjdweckcbxRNXsKOo1LMcc/zJ301JLyy0ZwL94YLCW5r9CIfcG
         Ek1Tmb/1FiIRyx58I0cl7gzOfvxUyDHe3lm1tsOJNDQy5bsQoyjkR2zIQEu+ka/Pl0
         NpRja8RagTBx8oEJDw6a8hnvABP7jKWPV0eTCQm4=
Date:   Fri, 9 Apr 2021 16:04:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ye Bin <yebin10@huawei.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hulkci@huawei.com
Subject: Re: [PATCH -next v2] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
Message-ID: <YHBe9m7wGqlZ2cp+@kroah.com>
References: <20210408112305.1022247-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408112305.1022247-1-yebin10@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 07:23:05PM +0800, Ye Bin wrote:
> Add the missing unlock before return from function usbip_sockfd_store()
> in the error handling case.
> 
> Fixes: bd8b82042269 ("usbip: vudc synchronize sysfs code paths")
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
> -- 
> 2.25.4
> 

This breaks the build, are you sure you tested it???

