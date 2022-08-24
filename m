Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C4359F417
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 09:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbiHXHUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 03:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiHXHUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 03:20:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46892F3A3
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 00:20:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D74D615D2
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 07:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5099DC433C1;
        Wed, 24 Aug 2022 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661325649;
        bh=1FyWTL/hYlIXoGKRicQgwQww2cBGZ1SJV6f2HELVkKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=suQ3YWCL4pFxI6nHuUNwU0vA32sH9Alm94jpCWoC8QR67E2SAaq+2Kio5mm7XKsJh
         ITF+37X8WFNMwcuySei6++dN8qFUPQzyNHEnFSCIlHnEWEOrJ4SwlYL3KY+VkMgJ1J
         ifbhOaLtdGsxsM6eEWFUKDQCL96KNolZqKjjeGQw=
Date:   Wed, 24 Aug 2022 09:20:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hu Xiaoying <huxiaoying2008@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Subject: Re: linux-next patch
Message-ID: <YwXRTo5SCbF0MKa0@kroah.com>
References: <CABd4UjZCm-EmqmD0z2bNkem8K138SV+Gvo90h9S_ckHc4QT5yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABd4UjZCm-EmqmD0z2bNkem8K138SV+Gvo90h9S_ckHc4QT5yQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 24, 2022 at 03:04:03PM +0800, Hu Xiaoying wrote:
> 

> From 040e7ed7e6e9ed850575ed075e02d960a5ffe191 Mon Sep 17 00:00:00 2001
> From: Hu Xiaoying <huxiaoying@kylinos.cn>
> Date: Wed, 22 Jun 2022 16:35:59 +0800
> Subject: [PATCH -next] KYLIN: usb: Improves USB2.0 write performance for
>  External HDD device (VID:PID = 0x0b05:0x1932)
> 
> CVE: NA
> 
> USB external storage device(0x0b05:1932), use gnome-disk-utility tools
> to test usb write  < 30MB/s.
> then, igoned to load module of uas for this device.
> ===============================================
> Write speed: Improves form 27MB/s to 40MB/s+
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hu Xiaoying <huxiaoying2008@gmail.cn>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 4051c8cd0cd8..abaf4ea8138b 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -157,3 +157,10 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
>  		"External HDD",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_ALWAYS_SYNC),
> +
> +/* Reported-by: Tom Hu <huxiaoying@kylinos.cn> */
> +UNUSUAL_DEV(0x0b05, 0x1932, 0x0000, 0x9999,
> +		"ASUS",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> -- 
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
