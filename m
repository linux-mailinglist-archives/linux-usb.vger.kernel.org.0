Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF3834A1F0
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 07:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhCZGic (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 02:38:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229768AbhCZGi1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 02:38:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 379B361938;
        Fri, 26 Mar 2021 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616740707;
        bh=b4FsOZb9T0I1VvM0VkzwvFa/450CGomGFrcQR6aOCe0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WZLLr7NqfVbqb0ZDjHX4PIDNXB3ch9D5X4IHTu/f3TptsCWWmaePrr+4bBycWEw84
         VNHHLapAkgL6scm11uTHrd/bv44M4j7cKGoTJpGxds0C1sI/JK1wYF3OM0K247qPKM
         TC8YYm3e7gORUR3T4TWIYotz2xodMkC0MbspLsCg=
Date:   Fri, 26 Mar 2021 07:38:23 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: remove unused including <linux/version.h>
Message-ID: <YF2BX7Ps9DcQe5tu@kroah.com>
References: <20210326061326.3234377-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326061326.3234377-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 26, 2021 at 02:13:26PM +0800, Zheng Yongjun wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/usb/core/hcd.c | 1 -
>  1 file changed, 1 deletion(-)
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 3f0381344221..53bc93d6eb0c 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -11,7 +11,6 @@
>  #include <linux/bcd.h>
>  #include <linux/module.h>
> -#include <linux/version.h>
>  #include <linux/kernel.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/slab.h>
> 

Your tool is VERY broken.  Please stop sending patches that you
obviously do not even test before submitting:
	https://lore.kernel.org/r/1614733752-56541-1-git-send-email-tiantao6@hisilicon.com

It's a sure way to make maintainers very grumpy.

greg k-h
