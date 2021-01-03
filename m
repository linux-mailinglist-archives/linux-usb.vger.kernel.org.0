Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52032E8BD6
	for <lists+linux-usb@lfdr.de>; Sun,  3 Jan 2021 12:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbhACLCp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Jan 2021 06:02:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:43622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbhACLCp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 3 Jan 2021 06:02:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B3E320771;
        Sun,  3 Jan 2021 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609671724;
        bh=VRjbp+IJuJgQQ5BrI6b9t+hQ7twkZMElX5DK5C7KO/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fg9s6N72LfU6yZVlr8Cl2d50j7W5BmCf7Fm5+97H3LwOBI1aFIK1XAVQJw8Vt4c6J
         kS2bqykq5O30N0iif+S3IwkfYWYVTnV9kKhCdbfBprutSKbSZzxvWbQZJ67FPdf4R1
         D+AAnqXMFT88iwk5EUi/xf8/kU1rRL29z6BR2y/Y=
Date:   Sun, 3 Jan 2021 12:03:22 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     qiang.zhang@windriver.com
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: add __get_free_pages() in hcd_buffer_alloc function
Message-ID: <X/GkeoCnnsA0tJOU@kroah.com>
References: <20210103081902.2381-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103081902.2381-1-qiang.zhang@windriver.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 03, 2021 at 04:19:02PM +0800, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>
> 
> When USB hosts just use PIO, allocate memory by slab/slub
> memory manager, if the required memory size is larger than
> one or more page sizes, need allocate memory directly from
> buddy systems.

That says _what_ you are doing, but not _why_ you need to do this.

What in-tree host controller has this problem and on what platform?

> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  drivers/usb/core/buffer.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> index fbb087b728dc..28e7db9f93d5 100644
> --- a/drivers/usb/core/buffer.c
> +++ b/drivers/usb/core/buffer.c
> @@ -131,7 +131,8 @@ void *hcd_buffer_alloc(
>  	/* some USB hosts just use PIO */
>  	if (!hcd_uses_dma(hcd)) {
>  		*dma = ~(dma_addr_t) 0;
> -		return kmalloc(size, mem_flags);
> +		return size < PAGE_SIZE ? kmalloc(size, mem_flags)
> +					: __get_free_pages(mem_flags, get_order(size));

Please never use ? : statements if at all possible.  Use a real if ()
instead.

Oh, and make sure your code actually builds properly :(

What platforms did you test this on?

thanks,

greg k-h
