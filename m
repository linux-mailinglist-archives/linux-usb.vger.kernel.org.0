Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C7A33F42F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 16:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhCQPsJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 11:48:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231842AbhCQOvF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Mar 2021 10:51:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 407A364EF9;
        Wed, 17 Mar 2021 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615992664;
        bh=4VcLOf5FcqANxa7czNJztDMKXZfpCwehi9gIKnTKjIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IDgG62yKEj7efmC1TZ/EaPzRC388J+gVk6jexjZtVWzI/KqoSlRju9xdM/mTa8Br9
         lW1QnMZu09j+coovXWCdImQHrUdaRLuLVaSBay7336ryjD21QC/0uCDpg6ExH8Jrvm
         9QK9Jjl/WLMu48N9PJgplN4m4Nws/8MjeSe/sIZI=
Date:   Wed, 17 Mar 2021 15:51:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jzp0409 <jzp0409@163.com>
Cc:     linux-usb@vger.kernel.org, "edison.jiang" <jiangzhipeng@yulong.com>
Subject: Re: [PATCH] usb: acpi: Fix shifting 31 bits
Message-ID: <YFIXVojHb3LmCOTb@kroah.com>
References: <20210317142513.1340-1-jzp0409@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317142513.1340-1-jzp0409@163.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 17, 2021 at 10:25:13PM +0800, jzp0409 wrote:
> From: "edison.jiang" <jiangzhipeng@yulong.com>
> 
> Fix undefined behaviour in the usb apci driver by using 'BIT' marcro.

What is undefined about it?

> 
> Signed-off-by: edison.jiang <jiangzhipeng@yulong.com>

This name is not a valid signed-off-by name (I doubt you sign documents
with a ".", right?) and it does not match the "From:" name either, so
something needs to be fixed before this patch could be accepted.

> ---
>  drivers/usb/core/usb-acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 50b2fc7..3e467a8 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -122,7 +122,7 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
>   * Private to usb-acpi, all the core needs to know is that
>   * port_dev->location is non-zero when it has been set by the firmware.
>   */
> -#define USB_ACPI_LOCATION_VALID (1 << 31)
> +#define USB_ACPI_LOCATION_VALID BIT(31)

I do not understand what this is trying to fix, please be more specific.

thanks,

greg k-h
