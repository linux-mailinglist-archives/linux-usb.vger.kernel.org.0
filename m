Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 494B34A633
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 18:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729541AbfFRQHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 12:07:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729507AbfFRQHB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 12:07:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 110D620B1F;
        Tue, 18 Jun 2019 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560874020;
        bh=kYFiCLCeGJIrHbzMHz1SYuhG/cXC+BN+X0zJb7/77og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ARZhi1O+FJ+0gXyMib4C4LSGL6jJZiMslCjQQ+9wExkxfb3o69VKDndHxPhzQ/au+
         cKhdF4AtYB2FkeRnG//lWQgyx1bc6uIFNLIjLMaUScphhIDowUihTkSqFWeHDPgQeB
         /in3qdmq0p3QZpt9hW4AROs/fTDtk6yyV27b5dlE=
Date:   Tue, 18 Jun 2019 18:06:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dmg@turingmachine.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a,
 b) in adutux driver
Message-ID: <20190618160658.GA27611@kroah.com>
References: <20190618153529.11418-1-dmg@turingmachine.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618153529.11418-1-dmg@turingmachine.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 18, 2019 at 08:35:29AM -0700, dmg@turingmachine.org wrote:
> From: Daniel M German <dmg@turingmachine.org>
> 
> Use min_t to find the minimum of two values instead of using the ?: operator.
> 
> We use min_t instead of min to avoid the compilation warning 'comparison of
> distinct pointer types lacks a cast'.
> 
> This change does not alter functionality. It is merely cosmetic intended to
> improve the readability of the code.
> 
> Signed-off-by: Daniel M German <dmg@turingmachine.org>
> ---
>  drivers/usb/misc/adutux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> index 9465fb95d70a..4a9fa3152f2a 100644
> --- a/drivers/usb/misc/adutux.c
> +++ b/drivers/usb/misc/adutux.c
> @@ -379,7 +379,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
>  
>  		if (data_in_secondary) {
>  			/* drain secondary buffer */
> -			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
> +			int amount = min_t(size_t, bytes_to_read, data_in_secondary);

Shouldn't amount and data_in_secondary be of size_t type?  Then you can
just use min() here, right?

thanks,

greg k-h
