Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B2F3B7662
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 18:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhF2QWP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 12:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232094AbhF2QWP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Jun 2021 12:22:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2250461DA2;
        Tue, 29 Jun 2021 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624983586;
        bh=Qn+i8wojtrT20WCppaP/KS3TmBNlvva789wwcTwXMfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=csAnvtJG9oBY3ep0bN2jEY61cbmnCOpTjtL4hmhWPYpKSG/kpMtpsajJrcuImlBvR
         B3OXwb8JpDVQCmYAoibaXzyh4pKMxdYLzY6Ib1OmS1kibnuXNIHcw1bG9tN0A2kqEz
         86luOWGPjIUYBVtzqxFYKpFZIxO2B5MBQyHlEjS8=
Date:   Tue, 29 Jun 2021 18:19:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Marco De Marco <marco.demarco@posteo.net>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Add support for u-blox LARA-R6 modules family
Message-ID: <YNtIIB1Yb13gjI9K@kroah.com>
References: <2310369.mZcMEZIq6f@mars>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2310369.mZcMEZIq6f@mars>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 29, 2021 at 03:32:55PM +0000, Marco De Marco wrote:
> Support for u-blox LARA-R6 modules family - usb serial interface.
> 
> Signed-off-by: Marco De Marco <marco.demarco@posteo.net>
> 
> 
> ---
> 
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index aeaa3756f..05d0379c9 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_UC15			0x9090
>  /* These u-blox products use Qualcomm's vendor ID */
>  #define UBLOX_PRODUCT_R410M			0x90b2
> +#define UBLOX_PRODUCT_R6XX          0x90fa
>  /* These Yuga products use Qualcomm's vendor ID */
>  #define YUGA_PRODUCT_CLM920_NC5			0x9625
>  
> @@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] = {
>  	/* u-blox products using Qualcomm vendor ID */
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
>  	  .driver_info = RSVD(1) | RSVD(3) },
> +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> +	  .driver_info = RSVD(3) },
>  	/* Quectel products using Quectel vendor ID */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 
> 0xff, 0xff, 0xff),
>  	  .driver_info = NUMEP2 },
> 
> 
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
