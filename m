Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DB6171CB
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 08:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfEHGjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 02:39:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbfEHGjJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 May 2019 02:39:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40D28214C6;
        Wed,  8 May 2019 06:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557297548;
        bh=Wr3VJaXHbdnXXSrn6PYKNDl5Wv8La9obI2pYfOb0zqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x1IdYfOfoslx7Huq9WfHHH4uaHveNvhAQzlzlJC8Qmi7FTnAL870Kq6+cz0OJER2c
         rjx9heumWGrXH1CtHTjrOX6/M6zPr4U8oRSvN/IpMDVeGY0so1l6PffRzc4lclmM9r
         WKCgFA0oMM4SyF7QdHYwiCHtJG8xkBZ1g0scrAg8=
Date:   Wed, 8 May 2019 08:39:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     EJ Hsu <ejh@nvidia.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: storage: Remove warning message
Message-ID: <20190508063906.GB14085@kroah.com>
References: <1557285840-16958-1-git-send-email-ejh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557285840-16958-1-git-send-email-ejh@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 08, 2019 at 11:24:00AM +0800, EJ Hsu wrote:
> This change is to fix below warning message in following scenario:
> usb_composite_setup_continue: Unexpected call
> 
> When system tried to enter suspend, the fsg_disable() will be called to
> disable fsg driver and send a signal to fsg_main_thread. However, at
> this point, the fsg_main_thread has already been frozen and can not
> respond to this signal. So, this signal will be pended until
> fsg_main_thread wakes up.
> 
> Once system resumes from suspend, fsg_main_thread will detect a signal
> pended and do some corresponding action (in handle_exception()). Then,
> host will send some setup requests (get descriptor, set configuration...)
> to UDC driver trying to enumerate this device. During the handling of "set
> configuration" request, it will try to sync up with fsg_main_thread by
> sending a signal (which is the same as the signal sent by fsg_disable)
> to it. In a similar manner, once the fsg_main_thread receives this
> signal, it will call handle_exception() to handle the request.
> 
> However, if the fsg_main_thread wakes up from suspend a little late and
> "set configuration" request from Host arrives a little earlier,
> fsg_main_thread might come across the request from "set configuration"
> when it handles the signal from fsg_disable(). In this case, it will
> handle this request as well. So, when fsg_main_thread tries to handle
> the signal sent from "set configuration" later, there will nothing left
> to do and warning message "Unexpected call" is printed.
> 
> Signed-off-by: EJ Hsu <ejh@nvidia.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 18 +++++++++++++++---
>  drivers/usb/gadget/function/storage_common.h |  4 ++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 043f97a..813083f 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2003-2008 Alan Stern
>   * Copyright (C) 2009 Samsung Electronics
> + * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
>   *                    Author: Michal Nazarewicz <mina86@mina86.com>

If this is the only nvidia contribution to this file, then this new line
is not warrented, sorry.  Please contact your corporate lawyers to
understand why, I'm sure they will be glad to have you learn all you
ever wanted to know about copyright law :)

thanks,

greg k-h
