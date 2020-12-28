Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18EA2E68F0
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 17:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634527AbgL1QnY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 11:43:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:45248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634514AbgL1QnX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 11:43:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44975223E8;
        Mon, 28 Dec 2020 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609173762;
        bh=et/TI3auscafsOCmFdm/6umOhwDg24QVF34LygtTsbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mx9Q0+8G6VN1K0DgbVZQHG7iDB8j8KPrf0XwMHvxZgmWPSumcXcJqMVPI/PK3IcG1
         mL1IJIbakA1k+z5BbI83eFI59XJTNSb28To5zQ48vtROykcumC1A78795u5jnAx6Fs
         IjoCKP5G/sZ4574p9YXISZthJg9o70wQM4UBIsz4=
Date:   Mon, 28 Dec 2020 17:44:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michael Sweet <msweet@msweet.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB printer gadget (usb_f_printer) to use default q_len
 value
Message-ID: <X+oLVDDKWE7dq62l@kroah.com>
References: <38D8A36C-BD7B-4072-B608-D5E36D8523E2@msweet.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38D8A36C-BD7B-4072-B608-D5E36D8523E2@msweet.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 28, 2020 at 11:25:18AM -0500, Michael Sweet wrote:
> [Resending as requested]
> 
> Hi,
> 
> I've been doing some work on Linux-based printer firmware lately (https://www.msweet.org/pappl) and part of that includes support for USB printer gadgets - right now the legacy printer class 1/2 stuff, but soon class 4 IPP-USB.  Since I also want to support functions other than printing (serial for debugging, mass storage for access to SD cards, etc.) I've been working to configure the printer gadget using configfs. After spending a few days puzzling over why the legacy g_printer gadget worked but usb_f_printer didn't I discovered that the default q_len value for the new driver is *0*, which prevents any IO from occurring!  Moreover, once you've configured things and assigned the UDC it is basically impossible to change q_len, so if your Linux distro of choice does any "helpful" initialization for you then you are out of luck...
> 
> The following patch uses a default q_len value of 10 (which is what the legacy g_printer driver uses) to minimize the possibility that you end up with a non-working printer gadget.
> 
> 
> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
> index 9c7ed2539ff7..4f3161005e4f 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -50,6 +50,8 @@
> #define GET_PORT_STATUS		1
> #define SOFT_RESET		2
> 
> +#define DEFAULT_Q_LEN		10 /* same as legacy g_printer gadget */
> +
> static int major, minors;
> static struct class *usb_gadget_class;
> static DEFINE_IDA(printer_ida);
> @@ -1317,6 +1319,9 @@ static struct usb_function_instance *gprinter_alloc_inst(void)
> 	opts->func_inst.free_func_inst = gprinter_free_inst;
> 	ret = &opts->func_inst;
> 
> +	/* Make sure q_len is initialized, otherwise the bound device can't support read/write! */
> +	opts->q_len = DEFAULT_Q_LEN;
> +
> 	mutex_lock(&printer_ida_lock);
> 
> 	if (ida_is_empty(&printer_ida)) {
> 
> 
> ________________________
> Michael Sweet
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
