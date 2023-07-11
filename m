Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E063874E608
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 06:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjGKEoi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 00:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGKEog (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 00:44:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5569390
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 21:44:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD0B46130A
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 04:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58B2C433C8;
        Tue, 11 Jul 2023 04:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689050674;
        bh=80QHdb1DJ3t9umRKO3Wd39eAEbZXoEKKHWN8bVWKufk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mhPRewwgATaxzOwbFoQFdOmktrJgmPCHlMHaiSk8FvQ9D6BrdF6TboMyE5MXVnVZ8
         HyLXAbpHRISe0x6JmNizR31EwBA7GfLKQeXqiPblEz1GIkkOX/5G7goBZjZNPeY8fo
         tbmIfyhW01C8xdGyms/y8TLnWbLWt0eivEMiqFMY=
Date:   Tue, 11 Jul 2023 06:44:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Cc:     krzk@kernel.org, raychi@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] driver/usb: Fixing code style error/warning
Message-ID: <2023071158-apron-acorn-30da@gregkh>
References: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
 <20230711042720.2544320-1-princekumarmaurya06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711042720.2544320-1-princekumarmaurya06@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 10, 2023 at 09:27:20PM -0700, Prince Kumar Maurya wrote:
> Update the patch and verified it with --strict flag.
> Found no error/warning for this patch.
> 
> Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
> ---
>  drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index a739403a9e45..27037affb746 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
>  	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
>  		return false;
> 
> -        return true;
> +	return true;
>  }
> 
>  static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> @@ -5854,37 +5854,37 @@ static void hub_event(struct work_struct *work)
>  }
> 
>  static const struct usb_device_id hub_id_table[] = {
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT
> -                   | USB_DEVICE_ID_MATCH_INT_CLASS,
> -      .idVendor = USB_VENDOR_SMSC,
> -      .idProduct = USB_PRODUCT_USB5534B,
> -      .bInterfaceClass = USB_CLASS_HUB,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT,
> -      .idVendor = USB_VENDOR_CYPRESS,
> -      .idProduct = USB_PRODUCT_CY7C65632,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT
> +			| USB_DEVICE_ID_MATCH_INT_CLASS,
> +	  .idVendor = USB_VENDOR_SMSC,
> +	  .idProduct = USB_PRODUCT_USB5534B,
> +	  .bInterfaceClass = USB_CLASS_HUB,
> +	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +			| USB_DEVICE_ID_MATCH_PRODUCT,
> +	  .idVendor = USB_VENDOR_CYPRESS,
> +	  .idProduct = USB_PRODUCT_CY7C65632,
> +	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
>  			| USB_DEVICE_ID_MATCH_INT_CLASS,
> -      .idVendor = USB_VENDOR_GENESYS_LOGIC,
> -      .bInterfaceClass = USB_CLASS_HUB,
> -      .driver_info = HUB_QUIRK_CHECK_PORT_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +	  .idVendor = USB_VENDOR_GENESYS_LOGIC,
> +	  .bInterfaceClass = USB_CLASS_HUB,
> +	  .driver_info = HUB_QUIRK_CHECK_PORT_AUTOSUSPEND},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
>  			| USB_DEVICE_ID_MATCH_PRODUCT,
> -      .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
> -      .idProduct = USB_PRODUCT_TUSB8041_USB2,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> +	  .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
> +	  .idProduct = USB_PRODUCT_TUSB8041_USB2,
> +	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
>  			| USB_DEVICE_ID_MATCH_PRODUCT,
> -      .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
> -      .idProduct = USB_PRODUCT_TUSB8041_USB3,
> -      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> -    { .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
> -      .bDeviceClass = USB_CLASS_HUB},
> -    { .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
> -      .bInterfaceClass = USB_CLASS_HUB},
> +	  .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
> +	  .idProduct = USB_PRODUCT_TUSB8041_USB3,
> +	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
> +	  .bDeviceClass = USB_CLASS_HUB},
> +	{ .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
> +	  .bInterfaceClass = USB_CLASS_HUB},
>      { }						/* Terminating entry */
>  };
> 
> --
> 2.40.1
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
