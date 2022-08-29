Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB935A4EA7
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 15:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiH2N46 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 09:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiH2N44 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 09:56:56 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 266947D7A9
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 06:56:53 -0700 (PDT)
Received: (qmail 122685 invoked by uid 1000); 29 Aug 2022 09:56:52 -0400
Date:   Mon, 29 Aug 2022 09:56:52 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hu Xiaoying <huxiaoying2008@gmail.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] usb: Improves USB2.0 write performance
Message-ID: <YwzFpJeoIPjOS8K7@rowland.harvard.edu>
References: <CABd4UjYS4QDozv-RKp3_9XhQec=LO+z9U8+=Oa8=MEFyaeXYhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABd4UjYS4QDozv-RKp3_9XhQec=LO+z9U8+=Oa8=MEFyaeXYhA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 29, 2022 at 04:58:57PM +0800, Hu Xiaoying wrote:
> From: Hu Xiaoying <huxiaoying@gmail.com>
> 
> USB external storage device(0x0b05:1932), use gnome-disk-utility tools
> to test usb write  < 30MB/s.
> Then, igoned to load module of uas for this device.
--------^^^^^^

"igoned" is not a word in English.

> ===============================================

Why did you put this line here?

> Write speed: Improves form 27MB/s to 40MB/s+
------------------------^^^^
---------------------------------------^^^^^^^
"from", not "form".
"> 40MB/s", not "40MB/s+".

> 
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

Entries should be sorted by vendor ID and product ID.  This entry is 
added in the wrong place (0x0b05 comes before 0x4971, not after).

Alan Stern
