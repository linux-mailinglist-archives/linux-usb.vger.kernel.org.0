Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE32E402F
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408382AbgL1OtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:49:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:49854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408376AbgL1OtC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:49:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7FC32084D;
        Mon, 28 Dec 2020 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609166902;
        bh=YyQtIlwfRhSKZHfIrP6IibtXLu2q6yJf5CyE02JHRy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pNXQ+Jq3F0lx4WbYisQiQVCDx1OcCkRnT7vCqiZE91fWgf5TH0HOfFapr98h9S2q6
         /Btpcx/SR4yEux5OJjeKZZrzeaEnMcQvo18Xp0zOtK96S4TO9I7uWrhIYYi72plczQ
         u7vwGgbinx7fs4xNJ10m8ZoZ6oRHX+UqhC+WRf68=
Date:   Mon, 28 Dec 2020 15:49:44 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dave Penkler <dpenkler@gmail.com>
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com,
        john.harvey@non.keysight.com, jian-wei_wu@keysight.com,
        gabe.jones@ni.com
Subject: Re: [PATCH 4/4] USB: usbtmc: Bump USBTMC_API_VERSION value
Message-ID: <X+nwiL11nXfAl7xo@kroah.com>
References: <20201215155621.9592-1-dpenkler@gmail.com>
 <20201215155621.9592-5-dpenkler@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215155621.9592-5-dpenkler@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 15, 2020 at 04:56:21PM +0100, Dave Penkler wrote:
> The previous patches in this series have changed the behaviour of the
> driver and added new calls.
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
> Tested-by: Jian-Wei Wu <jian-wei_wu@keysight.com>
> ---
>  drivers/usb/class/usbtmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> index d2fcc698c745..74d5a9c5238a 100644
> --- a/drivers/usb/class/usbtmc.c
> +++ b/drivers/usb/class/usbtmc.c
> @@ -25,7 +25,7 @@
>  /* Increment API VERSION when changing tmc.h with new flags or ioctls
>   * or when changing a significant behavior of the driver.
>   */
> -#define USBTMC_API_VERSION (2)
> +#define USBTMC_API_VERSION (3)

Why is this needed?  You should be able to detect new calls by just
doing the ioctl and checking right?

I'll take this for now, but versioning apis is not a good thing to do in
general.

thanks,

greg k-h
