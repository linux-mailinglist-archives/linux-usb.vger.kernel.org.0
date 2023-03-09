Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B91A76B26BA
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 15:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbjCIOXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 09:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjCIOXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 09:23:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945F9136FD
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 06:22:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 244A5B81F0E
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 14:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551E9C433D2;
        Thu,  9 Mar 2023 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678371774;
        bh=6mdk0u9QuJ0Msw/7CpLLyF6tGEGrWdiEJuo202793H4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AB9xg6a13d9/5itPypZHRhUrIqy+71u5sCqp3JDeMrqz6zisOqtFXxoeahsUlQKcf
         7vOY91KO/TbF7xV00Jpw9JwR/bcB8zetW95MAxqQXJZgb5yEVsC8idjkYA7cMA7ggh
         XnA3Mhj1irKCTwaBxXrdcn59KK1YNicnH5VDk+y8=
Date:   Thu, 9 Mar 2023 15:22:51 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jerry Zhang <jerry@skydio.com>
Cc:     embedded@skydio.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Send a create event for endpoint files
Message-ID: <ZAnruycYh3jpMs+W@kroah.com>
References: <20230307232636.9369-1-Jerry@skydio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307232636.9369-1-Jerry@skydio.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

<resend as your email headers were corrupt so only got sent to 1 person>

On Tue, Mar 07, 2023 at 03:26:36PM -0800, Jerry Zhang wrote:
> From: Jerry Zhang <jerry@skydio.com>
> 
> If userspace is creating a composite gadget with one or
> more functionfs functions, it generally goes through a process of:
> 
> 1. mount functionfs devices
> 2. start up driver processes
> 3. driver processes open ep0 and write descriptors
> 4. once all descriptors are written, enable gadget
> 
> The user may want the gadget to be enabled as soon as possible.
> However there is no race-free way to know when to enable the gadget
> since the gadget enable process doesn't know the status of the
> other driver processes. Furthermore, other driver processes
> may be fixed binaries, so there may not be an opportunity to
> modify their source to use a cooperative synchronization method.
> 
> This can be resolved by enabling inotify create events for endpoint
> files. The gadget enable process can create inotify watches in each
> driver's directory, and a create event for "ep1" will indicate that
> the driver has finished writing descriptors. Once events for all
> drivers have been received, the gadget is ready to be enabled.
> 
> Signed-off-by: Jerry Zhang <jerry@skydio.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ddfc537c7526..fc038db46e14 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -13,10 +13,11 @@
>  
>  /* #define DEBUG */
>  /* #define VERBOSE_DEBUG */
>  
>  #include <linux/blkdev.h>
> +#include <linux/fsnotify.h>
>  #include <linux/pagemap.h>
>  #include <linux/export.h>
>  #include <linux/fs_parser.h>
>  #include <linux/hid.h>
>  #include <linux/mm.h>
> @@ -1443,10 +1444,11 @@ static struct dentry *ffs_sb_create_file(struct super_block *sb,
>  		dput(dentry);
>  		return NULL;
>  	}
>  
>  	d_add(dentry, inode);
> +	fsnotify_create(dentry->d_parent->d_inode, dentry);
>  	return dentry;
>  }
>  
>  /* Super block */
>  static const struct super_operations ffs_sb_operations = {
> -- 
> 2.37.3
> 

This is a good idea, but where is it now documented that this is the
expected functionality and that userspace can rely on this?

thanks,

greg k-h
