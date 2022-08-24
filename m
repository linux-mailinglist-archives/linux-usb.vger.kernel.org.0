Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B46F59F8D3
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 13:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236838AbiHXLuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 07:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236885AbiHXLuH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 07:50:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA097961B
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 04:50:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B4A661965
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 11:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385A6C433C1;
        Wed, 24 Aug 2022 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661341802;
        bh=Okrp3GWFhOqv2pUg6uu8hJxDbk+w3NKuxSPf7s33mmo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lBFVFtpEZmcAzLXfS0EKKiDIAeAMgI59bKB2IO1QnHPN1V3wDKp3ZcXwHfntfZ4RY
         bNouTD4+AioeQGDEmOQW0kOKtjvhXJfe3v7Taxd1/b54Rg2fev/sjrqFMYnFz/LZ2L
         Sy144r7vGgjWUVQttk4CFBNLm7SLOTLNIepU/aRI=
Date:   Wed, 24 Aug 2022 13:49:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hu Xiaoying <huxiaoying2008@gmail.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: Re: Confirmation for subscribe linux-usb
Message-ID: <YwYQZ/3Nf2hMKcHO@kroah.com>
References: <S240916AbiHWHMh/20220823071237Z+20120@vger.kernel.org>
 <CABd4Uja9SoHpiMr2gDFcEP2Cudp7dcWJ_2i+KTEse9CU=KMtzw@mail.gmail.com>
 <CABd4UjYB=nzha=eoogNJU4pFwW9+4PQ65bC5u=R-gCE_ZLSQXw@mail.gmail.com>
 <CABd4UjaBog_VVcYjc2YDTq3Q-cfSWVzVbRbffJr8i_YE8dh-nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABd4UjaBog_VVcYjc2YDTq3Q-cfSWVzVbRbffJr8i_YE8dh-nQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 24, 2022 at 05:45:49PM +0800, Hu Xiaoying wrote:
> >From 040e7ed7e6e9ed850575ed075e02d960a5ffe191 Mon Sep 17 00:00:00 2001

Please stop and take a break for a day.

Look at the subject line of your email, is that what the other subject
lines for this mailing list look like?  You can see all of the prior
emails on the list on lore.kernel.org if you want some examples.

> From: Hu Xiaoying <huxiaoying@kylinos.cn>

Ok, but this does not match your signed-off-by line, as my bot told you
to fix, why not?

> Date: Wed, 22 Jun 2022 16:35:59 +0800
> Subject: [PATCH -next] KYLIN: usb: Improves USB2.0 write performance for
>  External HDD device (VID:PID = 0x0b05:0x1932)

That is a very long subject line, your editor told you to only use 50 or
so characters, please follow that rule.

> 
> CVE: NA

Why is this even here at all?  We don't track CVE numbers for kernel
patches, that's crazy and insane and even MITRE agrees that CVEs do not
make any sense at all for the Linux kernel.  So don't even attempt to
classify something as "no CVE here" as that makes no sense.

> 
> USB external storage device(0x0b05:1932), use gnome-disk-utility tools
> to test usb write  < 30MB/s.
> then, igoned to load module of uas for this device.
> ===============================================
> Write speed: Improves form 27MB/s to 40MB/s+

That seems very odd, what about the USB 3 connection for this device?
Why is UAS so slow for this specific device?

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hu Xiaoying <huxiaoying2008@gmail.cn>
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
>   "External HDD",
>   USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>   US_FL_ALWAYS_SYNC),
> +
> +/* Reported-by: Tom Hu <huxiaoying@kylinos.cn> */
> +UNUSUAL_DEV(0x0b05, 0x1932, 0x0000, 0x9999,

Why all versions?  Why not just your one specific one?

Also, your patch is corrupted and can not be applied at all :(

Please take a day off, relax, and come back in a few days and resubmit a
fixed up commit after reading our documentation for how to properly
write and submit a kernel change.

thanks,

greg k-h
