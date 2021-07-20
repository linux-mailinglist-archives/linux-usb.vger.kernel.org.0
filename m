Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7813CF724
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 11:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbhGTJFO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 05:05:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231560AbhGTJFJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Jul 2021 05:05:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1BAC60BD3;
        Tue, 20 Jul 2021 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626774348;
        bh=K2P4JHHONluvGAZ+DrlxosUinyApPr6LGBRqjNCJ178=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SHKsGIeT+WTxFummVDj4x0nl2JhFTgbhUWHwcabVn8TD1qKksJIXztau1zCEwTJ7/
         QGVN+2uytDtcIb4A/jBo6W1DZn5fDNO95JKkum09K8b2C5UdDbb5UxWKbY9E7WdZcr
         hHN5aqUKzyfBIclXvmSyEhw24dqzDwH7jmwFql2o=
Date:   Tue, 20 Jul 2021 09:43:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Julian Sikorski <belegdol@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>,
        linux-usb@vger.kernel.org, hdegoede@redhat.com
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
Message-ID: <YPZ+kv70G3OuCEp0@kroah.com>
References: <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
 <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
 <1568033125.365.17.camel@suse.com>
 <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
 <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
 <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
 <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 19, 2021 at 06:10:10PM +0200, Julian Sikorski wrote:
> W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
> > 
> > > Hi all,
> > > 
> > > apologies for necro-ing this thread. I have just tried this drive with
> > > my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
> > > get the drive to work:
> > > options usb-storage quirks=059f:1061:u
> > > 
> > > Should we still try to get uas working with this drive or should I
> > > send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
> > > now. Thanks for the feedback in advance.
> > > 
> > 
> > Hi,
> > 
> > 
> > sometimes we must give up. This thing is too elusive. Please send a
> > patch with a quirk.
> > 
> >      Regards
> > 
> >          Oliver
> > 
> > 
> 
> Hi,
> 
> thanks for confirming. Patch is attached, it appears to be working correctly
> when applied against 5.13.3. Please let me know if changes are required.
> 
> Best regards,
> Julian

> >From 01057f40aaf0036271dc401add9310dc63bfbcc1 Mon Sep 17 00:00:00 2001
> From: Julian Sikorski <belegdol+github@gmail.com>
> Date: Mon, 19 Jul 2021 17:27:16 +0200
> Subject: [PATCH] Add LaCie Rugged USB3-FW to IGNORE_UAS
> 
> LaCie Rugged USB3-FW appears to be incompatible with UAS. It generates
> errors like:
> [ 1151.582598] sd 14:0:0:0: tag#16 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
> [ 1151.582602] sd 14:0:0:0: tag#16 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00
> [ 1151.588594] scsi host14: uas_eh_device_reset_handler start
> [ 1151.710482] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [ 1151.741398] scsi host14: uas_eh_device_reset_handler success
> [ 1181.785534] scsi host14: uas_eh_device_reset_handler start
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index f9677a5ec31b..c35a6db993f1 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -45,6 +45,13 @@ UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>  
> +/* Reported-by: Julian Sikorski <belegdol@gmail.com> */
> +UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
> +		"LaCie",
> +		"Rugged USB3-FW",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /*
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
>   * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
> -- 
> 2.31.1
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
