Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B802CF08C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 16:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgLDPQZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 10:16:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:34430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbgLDPQZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Dec 2020 10:16:25 -0500
Date:   Fri, 4 Dec 2020 16:17:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607094945;
        bh=/oVkJTobYG9YuE9TxjEpG3TfKjGcU4bWgUBwTFrTWD4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=zD+/oK8LHAj7tc/WRJxlGma2XNJXNlw0moSX0OpcduUn0L9Pcke/FKiVNMMx5j8O7
         GWuTqGjuwRl/7oVxOyanRKUBiZSZhWqFZ8Rrm8Dvm2fJc1YphhbcbLj20y+c3EQkhQ
         j3tjJ6hO+XimMPekQS8oOOn1VCEKk4Cy6pH7nJGk=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [PATCH 2/3] USB: core: drop short-transfer check from
 usb_control_msg_send()
Message-ID: <X8pS7a1n3Evu/Lym@kroah.com>
References: <20201204085110.20055-1-johan@kernel.org>
 <20201204085110.20055-3-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204085110.20055-3-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 09:51:09AM +0100, Johan Hovold wrote:
> A failure to send a complete control message is always an error so
> there's no need to check for short transfers in usb_control_msg_send().
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/core/message.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index a04b01247117..b08de9571f7a 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -216,9 +216,8 @@ int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
>  
>  	if (ret < 0)
>  		return ret;
> -	if (ret == size)
> -		return 0;
> -	return -EINVAL;
> +
> +	return 0;

Ah, this came from the read call where a short read is not an error, but
we wanted it to be.  Nice catch.

greg k-h
