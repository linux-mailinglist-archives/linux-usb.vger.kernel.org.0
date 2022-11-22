Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7988F6340A0
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 16:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbiKVPyW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 10:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbiKVPyI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 10:54:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D286725C6
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 07:54:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5B966174C
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 15:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC90DC433D6;
        Tue, 22 Nov 2022 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669132446;
        bh=X6PdGbPkJr/uQ/4I5ASpX/0XLwGdDXxq5tPCLjd+gu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d0sL9NISCvodfJKi0nkKaSGPw6wOPtZpVemN8nLIfeQR3dKW9MzsKaxFAaqb3kEUI
         Wx+v9TTZW5i2NCY906j1UTgl66ug/RJCXaH/GSz/znydSqIOpbLCSskJQRcu0F81F9
         neraGekfvxAqhdIrKJPJKpoVZPE09O5KonvVEhQs=
Date:   Tue, 22 Nov 2022 16:54:03 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-usb@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] usb: gadget: function: Simplify error messaging in
 printer open/close
Message-ID: <Y3zwm70hEmH7RQP3@kroah.com>
References: <1894a272-4816-c44c-61d5-bfcfe478d7e5@collabora.com>
 <20221122141603.70242-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122141603.70242-1-andrzej.p@collabora.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 22, 2022 at 03:16:03PM +0100, Andrzej Pietrasiewicz wrote:
> Don't issue any messages if printer_open() is successful.
> Also don't issue them if unsuccessful - the error code is propagated
> to the calling layers and should be acted on appropriately there. Just as
> it is with the -ENODEV case.
> 
> For those who really want this message leave an option to compile-in
> with composite framework's VDBG() by uncommenting #define VERBOSE_DEBUG.
> 
> While at it, visually detach the "return ret;" statement.
> 
> Use __func__ instead of explicitly hardcoding the function name. This, in
> turn makes checkpatch issue this for the message in printer_close():
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> 54: FILE: drivers/usb/gadget/function/f_printer.c:387:
> +	VDBG(dev, "%s\n", __func__);
> 
> which lets us eliminate the debug message from printer_close() altogether.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> Attention
> 
> This patch depends on a recent patch from Dan Carpenter:
> 
> usb: gadget: function: use after free in printer_close()
> 
>  drivers/usb/gadget/function/f_printer.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
> index 01e842e1ba2f..d686c7be4fb5 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -11,6 +11,8 @@
>   * Copyright (C) 2006 Craig W. Nadler
>   */
>  
> +/* #define VERBOSE_DEBUG */
> +
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/delay.h>
> @@ -364,7 +366,8 @@ printer_open(struct inode *inode, struct file *fd)
>  	spin_unlock_irqrestore(&dev->lock, flags);
>  
>  	kref_get(&dev->kref);
> -	DBG(dev, "printer_open returned %x\n", ret);
> +	VDBG(dev, "%s returned %x\n", __func__, ret);

This is what ftrace is for, please just delete this line entirely.

thanks,

greg k-h
