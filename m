Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE35B478849
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 10:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbhLQJ5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 04:57:37 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33432 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhLQJ5h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 04:57:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67DA0B82755
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 09:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B043C36AE8;
        Fri, 17 Dec 2021 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639735055;
        bh=nYy7/XGrgXdr3cBiu+xcyrrpcOwZJ02B98wv3fmwOr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aoYngfqlGiBzcxQQuoikRiFkqVui1gUH8q9jnfEW+oX3BYJDPnM4kevXZdz8qovpt
         7tOAL1am5xbMc4SgSdgbXAdZU/wgZPoa+Bhe8jG3c4JrOecJRTr12BqIwGBZhwM8T3
         8zej3t4Pahok/zTMJI47ikwKAfaMfJuxfUHCQ2WU=
Date:   Fri, 17 Dec 2021 10:57:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Colin Ian King <colin.king@intel.com>,
        Tony Olech <tony.olech@elandigitalsystems.com>,
        linux-usb@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] usb: ftdi-elan: fix memory leak on device disconnect
Message-ID: <YbxfDOmMvIirlhR/@kroah.com>
References: <20211217083428.2441-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217083428.2441-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 17, 2021 at 04:34:28PM +0800, Wei Yongjun wrote:
> 'ftdi' is alloced when probe device, but not free on device disconnect,
> this cause a memory leak as follows:
> 
> unreferenced object 0xffff88800d584000 (size 8400):
>   comm "kworker/0:2", pid 3809, jiffies 4295453055 (age 13.784s)
>   hex dump (first 32 bytes):
>     00 40 58 0d 80 88 ff ff 00 40 58 0d 80 88 ff ff  .@X......@X.....
>     00 00 00 00 00 00 00 00 00 00 00 00 ad 4e ad de  .............N..
>   backtrace:
>     [<000000000d47f947>] kmalloc_order_trace+0x19/0x110 mm/slab_common.c:960
>     [<000000008548ac68>] ftdi_elan_probe+0x8c/0x880 drivers/usb/misc/ftdi-elan.c:2647
>     [<000000007f73e422>] usb_probe_interface+0x31b/0x800 drivers/usb/core/driver.c:396
>     [<00000000fe8d07fc>] really_probe+0x299/0xc30 drivers/base/dd.c:517
>     [<0000000005da7d32>] __driver_probe_device+0x357/0x500 drivers/base/dd.c:751
>     [<000000003c2c9579>] driver_probe_device+0x4e/0x140 drivers/base/dd.c:781
> 
> Fix it by freeing 'ftdi' after nobody use it.
> 
> Fixes: a5c66e4b2418 ("USB: ftdi-elan: client driver for ELAN Uxxx adapters")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
> index e5a8fcdbb78e..6c38c62d29b2 100644
> --- a/drivers/usb/misc/ftdi-elan.c
> +++ b/drivers/usb/misc/ftdi-elan.c
> @@ -202,6 +202,7 @@ static void ftdi_elan_delete(struct kref *kref)
>  	mutex_unlock(&ftdi_module_lock);
>  	kfree(ftdi->bulk_in_buffer);
>  	ftdi->bulk_in_buffer = NULL;
> +	kfree(ftdi);
>  }

Wow, yes, good catch.  Funny no one has ever noticed that before :(

greg k-h
