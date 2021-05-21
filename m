Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF7F38C5FD
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 13:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbhEULuK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 07:50:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:39160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230401AbhEULuJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 07:50:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 130DA613DA;
        Fri, 21 May 2021 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621597726;
        bh=rZqEZdVP5/Wm2Pn6E7g9wKzT5pGoLkymKZHnn3QSHBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wh4KPO9dpgmr2/v6HAn5EjeaDuvfkcKVwgkiexP9Z65pwj4oz7tJtVp0ycZ83THHq
         terpU4AqnegFczLG9GUrqoqi0T40psYmEBMBN6TjwYhGZqM6gIrIo6G0Ca2/4ysECl
         d6zn6AnQ+TYJ/d6o5mZJeyML+9RnryNAMtAJo83w=
Date:   Fri, 21 May 2021 13:48:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] USB: gadget: f_fs: Use ERR_CAST instead of
 ERR_PTR(PTR_ERR(...))
Message-ID: <YKeeHDy/VAhuoG6B@kroah.com>
References: <20210519023032.19812-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519023032.19812-1-yuehaibing@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 10:30:32AM +0800, YueHaibing wrote:
> A coccicheck run provided information like the following.
> 
> ./drivers/usb/gadget/function/f_fs.c:3832:9-16:
>  WARNING: ERR_CAST can be used with data
> 
> Use ERR_CAST to fix this.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index bf109191659a..61110ff52f49 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3829,7 +3829,7 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
>  
>  	data = memdup_user(buf, len);
>  	if (IS_ERR(data))
> -		return ERR_PTR(PTR_ERR(data));
> +		return ERR_CAST(data);

This should just be:
		return PTR_ERR(data);
right?

No need for 2 casts to happen here.

thanks,

greg k-h
