Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F985A4598
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 11:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiH2JAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 05:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiH2JAG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 05:00:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D7065F7
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 02:00:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B35FB80D53
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 09:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B5AC433D6;
        Mon, 29 Aug 2022 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661763602;
        bh=hJ7pQKuZUP+0llxe7b+ppp+OrLVGlE+Ul7hxkT4zd/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vfH3d0wU9O4v8UcA3rLE8QK+NMw57ht1DydAOmRd2r2/RIWt4hEBAYJvZ8SYjC/SG
         X6Y45Py2NYUKjFRh2JSTXO1bbtXWO8xf8tZa7gXDn8CSFQ1VsLbOnmiuByX5f3+IS8
         laCvVnCV6yC73nm1jfSoLO5v03uSUdgDrFpXUPpA=
Date:   Mon, 29 Aug 2022 10:59:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hu Xiaoying <huxiaoying2008@gmail.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v2] usb: Improves USB2.0 write performance
Message-ID: <YwyADyS9kD2qyoKJ@kroah.com>
References: <CABd4UjYSaZv6H9Q-UbM8QQZk8HcBPrJ7=DfDQGxJNVNot68Kfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABd4UjYSaZv6H9Q-UbM8QQZk8HcBPrJ7=DfDQGxJNVNot68Kfg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 29, 2022 at 04:52:36PM +0800, Hu Xiaoying wrote:
> >From ad9e714341bbc944d4b8868229f15622592f37d5 Mon Sep 17 00:00:00 2001
> From: Hu Xiaoying <huxiaoying@gmail.com>
> Date: Wed, 22 Jun 2022 16:35:59 +0800
> Subject: [PATCH] usb: Improves USB2.0 write performance
> 
> USB external storage device(0x0b05:1932), use gnome-disk-utility tools
> to test usb write  < 30MB/s.
> Then, igoned to load module of uas for this device.
> ===============================================
> Write speed: Improves form 27MB/s to 40MB/s+
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hu Xiaoying <huxiaoying@gmail.com>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h
> b/drivers/usb/storage/unusual_uas.h
> index 4051c8cd0cd8..abaf4ea8138b 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -157,3 +157,10 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
>                 "External HDD",
>                 USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>                 US_FL_ALWAYS_SYNC),
> +
> +/* Reported-by: Tom Hu <huxiaoying@gmail.com> */
> +UNUSUAL_DEV(0x0b05, 0x1932, 0x0000, 0x9999,
> +               "ASUS",
> +               "External HDD",
> +               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +               US_FL_IGNORE_UAS),
> -- 
> 2.25.1

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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
