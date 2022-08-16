Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94728595428
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 09:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbiHPHyG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 03:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiHPHxa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 03:53:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028E61B9156
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 22:04:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D33F4612B1
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 05:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C19AC433D7;
        Tue, 16 Aug 2022 05:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660626243;
        bh=Es2vbfNkZZbV7YOQ16n02kiBi9BRDmUnqochCN5UBjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1a43pyJFNIjUczGCsD6P5MsdsLKFn14OJgPLnSVJWLTW4IC8/CJTbLbcC/+Nhnlwk
         WMEgct5cH+8rNpe+HOl2yyEuSlv36mwhHjqQ43+Z623cJnTlox7UW9HG7DBYF7cqvI
         LF7wQKqVZnfKK0VQza0JT821JkLlOxefxepzvQ9o=
Date:   Tue, 16 Aug 2022 07:03:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thierry Guibert <thierry.guibert@croix-rouge.fr>
Cc:     oneukum@suse.com, linux-usb@vger.kernel.org
Subject: Re: Patch to support ICOM IC-F3400DT & ICOM-F4400DT in cdc-acm
Message-ID: <YvslP32I4BUaazM7@kroah.com>
References: <CAEzRux8J2MX7BSS=LTxYdn8WakJv23hS4v3F2BobRjjYxF83Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEzRux8J2MX7BSS=LTxYdn8WakJv23hS4v3F2BobRjjYxF83Ww@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 16, 2022 at 01:03:06AM +0200, Thierry Guibert wrote:
> Hi,
> 
> Please find the patch file to register ICOM IC-F3400DT & ICOM IC-F4400DT
> PMR radios in cdc-acm.
> 
> It has been successfully tested on debian sid.
> 
> Regards,
> 
> T. Guibert

> From 110171090dbc9c5194b5b14827038f397fe6eb7d Mon Sep 17 00:00:00 2001
> From: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
> Date: Tue, 16 Aug 2022 00:46:01 +0200
> Subject: [PATCH] CDC-ACM : Add Icom F3400 support (0C26:0020)
> 
> CDC-ACM : Add Icom F3400 support ID 0c26:0020 Prolific Technology Inc. ICOM Radio
> 
> Output of lsusb :
> Bus 001 Device 009: ID 0c26:0020 Prolific Technology Inc. ICOM Radio
> Couldn't open device, some information will be missing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            2 Communications
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x0c26 Prolific Technology Inc.
>   idProduct          0x0020
>   bcdDevice            0.00
>   iManufacturer           1 ICOM Inc.
>   iProduct                2 ICOM Radio
>   iSerial                 3 *obfuscated*
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0030
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                0mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         2 Communications
>       bInterfaceSubClass      2 Abstract (modem)
>       bInterfaceProtocol      1 AT-commands (v.25ter)
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval              12
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass        10 CDC Data
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> ---
>  drivers/usb/class/cdc-acm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 9b9aea24d58c..091fcfac3717 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1813,6 +1813,10 @@ static const struct usb_device_id acm_ids[] = {
>  	{ USB_DEVICE(0x0ca6, 0xa050), /* Castles VEGA3000 */
>  	.driver_info = NO_UNION_NORMAL, /* reports zero length descriptor */
>  	},
> +	{ USB_DEVICE(0x0c26, 0x0020), /* Icom ICF3400 Serie */
> +	.driver_info = NO_UNION_NORMAL, /* reports zero length descriptor */
> +	},
> +
>  
>  	{ USB_DEVICE(0x2912, 0x0001), /* ATOL FPrint */
>  	.driver_info = CLEAR_HALT_CONDITIONS,
> -- 
> 2.37.2
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
