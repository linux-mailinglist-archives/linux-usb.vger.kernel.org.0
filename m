Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05CE32B70F
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 12:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239094AbhCCKbt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:33864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355936AbhCCHDK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 02:03:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B62D664EE1;
        Wed,  3 Mar 2021 07:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614754949;
        bh=vaG1elq+sTvUfo7XCvsKUrb395oT0+MsMl9tgpolPhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o55/ZO+SxXBqFOWIgXAVgnXamKiQRklg1q9PBJHHZZ4wihpAiObdhbOw1V5HegMUe
         JKd1+J/8S7+XIGIyKehwHfUCE7zroPTIdbJZ1Unt5u2TWRKmyGV7+lm1MK3OGSxdWL
         p5mwxbO+YQYOiTIsz2BySBdx+jzl5ys1c1wPBRXI=
Date:   Wed, 3 Mar 2021 08:02:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: hcd: remove unused including <linux/version.h>
Message-ID: <YD80gndsrjIRvy8H@kroah.com>
References: <1614733752-56541-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614733752-56541-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 03, 2021 at 09:09:12AM +0800, Tian Tao wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/usb/core/hcd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 3f03813..53bc93d 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -11,7 +11,6 @@
>  
>  #include <linux/bcd.h>
>  #include <linux/module.h>
> -#include <linux/version.h>
>  #include <linux/kernel.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/slab.h>

You obviously did not even test-build this patch, which is very odd when
submitting something to the community.  Why did you not do this?

This file _DOES_ need this .h file, whatever tool you are using to
detect this is completely broken.  Please fix it and be more careful
before sending new patches.

thanks,

greg k-h
