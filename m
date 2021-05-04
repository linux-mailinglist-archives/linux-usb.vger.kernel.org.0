Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D8B372537
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 06:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhEDEqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 00:46:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhEDEqm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 May 2021 00:46:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A96E611C0;
        Tue,  4 May 2021 04:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620103546;
        bh=9IBL14Lhph4jveeY4EXEISveleh3xEweIs3+Z3ujDJw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R0PgEcZZY1Sj8OCW6bBXj7BZQR5ZguIgWuFx6Y4UqJ2CFTk7421rdzh/Na34kHPRP
         mfSkvN9xdIYV0m+FfiQiF1rXp2l8NJVmagm/rW5rMlpqN7+Y6XdC7wfehDMHc6Wjvy
         29puOzpJlRuugLNtyXbrtbGWZiQwoY+ZPCFfuHWM=
Date:   Tue, 4 May 2021 06:45:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Robert Wolters <robert@woltersonline.net>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: CR for ftdi_sio.c, SCS P4 Dragon
Message-ID: <YJDRePGjEiXzZmNH@kroah.com>
References: <b7ec696f-c5ca-30e6-0769-4c6e925e8367@woltersonline.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7ec696f-c5ca-30e6-0769-4c6e925e8367@woltersonline.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 03, 2021 at 09:45:04PM +0200, Robert Wolters wrote:
> Dear Johan,
> 
> I'd like to submit a small change request for the ftdi_sio.c Kernel module.
> 
> Problem: setting a special Baud-rate for the SCS P4 Dragon series (Pactor 4)
> of short-wave modems.
> 
> Solution: as implemented in the patch file attached. This change has been
> tested on several Debian-based machines, and works okay. Which is not a
> surprise, as only the Baud-rate is set, using a specific divisor, in a same
> manner as is already done for other devices currently supported by ftdi_sio.
> 
> I'm also submitting this change request on behalf of SCS GmbH & Co KG of
> Hanau in Germany.
> 
> Many thanks in advance. Looking forward to any feedback and/or comments.
> 
> Regards,
> Robert Wolters (DM4RW)
> 
> Südstrasse 4b
> 82131 Stockdorf (nr Munich)
> Germany
> 

> --- ftdi_sio.c  2021-04-21 13:01:00.000000000 +0200
> +++ ftdi_sio_new.c      2021-04-26 18:53:00.819175707 +0200
> @@ -97,6 +97,7 @@
>  static int   ftdi_8u2232c_probe(struct usb_serial *serial);
>  static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
>  static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
> +static void  ftdi_SCS_DR7X00_setup(struct ftdi_private *priv);
>  
>  static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
>         .probe  = ftdi_jtag_probe,
> @@ -122,6 +123,10 @@
>         .probe  = ftdi_8u2232c_probe,
>  };
>  
> +static const struct ftdi_sio_quirk ftdi_SCS_DR7X00_quirk = {
> +       .port_probe = ftdi_SCS_DR7X00_setup,
> +};
> +
>  /*
>   * The 8U232AM has the same API as the sio except for:
>   * - it can support MUCH higher baudrates; up to:
> @@ -157,8 +162,12 @@
>         { USB_DEVICE(FTDI_VID, FTDI_EV3CON_PID) },
>         { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_0_PID) },
>         { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_1_PID) },
> -       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) },
> -       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },
> +/*     { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) },
> +       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },*/
> +       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) ,
> +               .driver_info = (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },
> +       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) ,
> +               .driver_info = (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },
>         { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_4_PID) },
>         { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_5_PID) },
>         { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_6_PID) },
> @@ -2296,6 +2305,15 @@
>         priv->force_rtscts = 1;
>  }
>  
> +/* Setup for the SCS P4dragon DR-7X00 devices, which require hardwired
> + * baudrate of 829440 (38400 gets mapped to 829440) */
> +static void ftdi_SCS_DR7X00_setup(struct ftdi_private *priv)
> +{
> +       priv->flags |= ASYNC_SPD_CUST;
> +       priv->custom_divisor = 29;
> +       priv->force_baud = 38400;
> +}
> +
>  /*
>   * Module parameter to control latency timer for NDI FTDI-based USB devices.
>   * If this value is not set in /etc/modprobe.d/ its value will be set

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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
