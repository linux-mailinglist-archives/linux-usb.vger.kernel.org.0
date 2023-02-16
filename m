Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE5B699334
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 12:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjBPLfq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 06:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjBPLfp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 06:35:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3A43C2BD
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 03:35:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E5D4B82713
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 11:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10BFC433D2;
        Thu, 16 Feb 2023 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1676547342;
        bh=nMD+cRl44W5N+ydfE8KY8XEZEqsTVng5M2aCPF/TySc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dnjMDuhaO/ZlDXEqGrT46jbwmD8LfoFqDJY+/ixYH3C/WxWQ04R79gkaK6n828AlW
         ZT6sz7CDNe6UP1f1ESlHBGC0xG1JLB2bOXXXBM7KxLbdVUXVZQyXkzAB7fhbCw4zXY
         s93hai4G3svHEy+0FpA+cZbBDGzBfqv3KvULCnFU=
Date:   Thu, 16 Feb 2023 12:35:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yuta Hayama <hayama@lineo.co.jp>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: gadget: f_fs: Fix incorrect version checking of
 OS descs
Message-ID: <Y+4VC+8ezcRlguI4@kroah.com>
References: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 13, 2023 at 06:07:14PM +0900, Yuta Hayama wrote:
> Currently, the USB gadget framework supports only version 1.0 of the MS OS
> descriptor. OS desc has a field bcdVersion indicating its version, with
> v1.0 represented by the value 0x100. However, __ffs_do_os_desc_header()
> was expecting the incorrect value 0x1, so allow the correct value 0x100.
> 
> The bcdVersion field of the descriptor that is actually sent to the host
> is set by composite_setup() (in composite.c) to the fixed value 0x100.
> Therefore, it can be understood that __ffs_do_os_desc_header() is only
> performing a format check of the OS desc passed to functionfs. If a value
> other than 0x100 is accepted, there is no effect on communication over
> the USB bus. Indeed, until now __ffs_do_os_desc_header() has only accepted
> the incorrect value 0x1, but there was no problem with the communication
> over the USB bus.
> 
> However, this can be confusing for functionfs userspace drivers. Since
> bcdVersion=0x100 is used in actual communication, functionfs should accept
> the value 0x100.
> 
> Note that the correct value for bcdVersion in OS desc v1.0 is 0x100, but
> to avoid breaking old userspace drivers, the value 0x1 is also accepted as
> an exception. At this time, a message is output to notify the user to fix
> the userspace driver.
> 
> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
> ---
>  drivers/usb/gadget/function/f_fs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 8ad354741380..9a1bd6fb5744 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2292,8 +2292,12 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
>  	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
>  	u16 w_index = le16_to_cpu(desc->wIndex);
>  
> -	if (bcd_version != 1) {
> -		pr_vdebug("unsupported os descriptors version: %d",
> +	if (bcd_version == 0x1) {
> +		pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
> +			  "Pass for compatibility, but fix your user space driver.\n",
> +			  bcd_version);

No one will see a debug message :(

Make this a much louder warning please.

thanks,

greg k-h
