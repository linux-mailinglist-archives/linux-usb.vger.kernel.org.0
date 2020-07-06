Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C438E2155A4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 12:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbgGFKeJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 06:34:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728738AbgGFKeJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 06:34:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4FCB2073E;
        Mon,  6 Jul 2020 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594031648;
        bh=eRbnVjHRSeB9MvkePAFP3JUnL4JKWfqH2XJb7Vj+3ac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k8p7wwoCkANyjiRugabz7IKG7oA0yFXXKW9G+fSEy6w/s+eS/nZ/erortAggM+lx3
         aHo50krHKXp63N0giaPMTwV5FnFhU7oRRLv18CPryjMBGsg0cSV3qt+fLxQqdkGiHN
         16cWtrgaKNjhN3bNzWsj9Th9ZRPq6/6Za+a2CKbw=
Date:   Mon, 6 Jul 2020 12:34:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kars Mulder <kerneldev@karsmulder.nl>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        David Laight <David.Laight@aculab.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Pavel Machek <pavel@denx.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: core: fix quirks_param_set() writing to a const
 pointer
Message-ID: <20200706103405.GA11622@kroah.com>
References: <20200704115538.GD16083@amd>
 <3212-5f024c00-215-220fe080@174542169>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3212-5f024c00-215-220fe080@174542169>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 05, 2020 at 11:53:27PM +0200, Kars Mulder wrote:
> The function quirks_param_set() takes as argument a const char* pointer
> to the new value of the usbcore.quirks parameter. It then casts this
> pointer to a non-const char* pointer and passes it to the strsep()
> function, which overwrites the value.
> 
> Fix this by copying the value to a local buffer on the stack and 
> letting that buffer be written to by strsep().
> 
> Fixes: 027bd6cafd9a ("usb: core: Add "quirks" parameter for usbcore")
> Signed-off-by: Kars Mulder <kerneldev@karsmulder.nl>
> 
> ---
>  drivers/usb/core/quirks.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index e0b77674869c..86b1a6739b4e 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -12,6 +12,8 @@
>  #include <linux/usb/hcd.h>
>  #include "usb.h"
>  
> +#define QUIRKS_PARAM_SIZE 128
> +
>  struct quirk_entry {
>  	u16 vid;
>  	u16 pid;
> @@ -23,19 +25,21 @@ static DEFINE_MUTEX(quirk_mutex);
>  static struct quirk_entry *quirk_list;
>  static unsigned int quirk_count;
>  
> -static char quirks_param[128];
> +static char quirks_param[QUIRKS_PARAM_SIZE];
>  
> -static int quirks_param_set(const char *val, const struct kernel_param *kp)
> +static int quirks_param_set(const char *value, const struct kernel_param *kp)
>  {
> +	char val[QUIRKS_PARAM_SIZE];

That's a lot of stack space, is it really needed?  Can we just use a
static variable instead, or dynamically allocate this?

thanks,

greg k-h
