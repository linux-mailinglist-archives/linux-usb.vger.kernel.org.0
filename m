Return-Path: <linux-usb+bounces-2271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4C7D97DA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A46282400
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DD41A705;
	Fri, 27 Oct 2023 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PxiIB72q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721818C10
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 12:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AF3C433C7;
	Fri, 27 Oct 2023 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698409368;
	bh=w3kuSWFsqERK1AcVD71FWEK+mAzoU8B3QlN2k4xy9+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxiIB72qSmlC8eFF81yhD0urLkNROFdcQRPx+yn8il/CqGr6lqeWQtm1g/wlGymoO
	 2yX9qByOFiZBBiir5ZeBrQMZQmZefil1jfY1vsXQRtc8jSOjzXk67TB4L4ksiRITZ4
	 URSDz7w5oYyQPaKFmrTba7d4M49eNGXfB8qWOwMg=
Date: Fri, 27 Oct 2023 14:22:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LihaSika <lihasika@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux USB Storage <usb-storage@lists.one-eyed-alien.net>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] set 1.50 as the lower bcdDevice value for "Super
 Top"-device in drivers/usb/storage/unusual_cypress.h
Message-ID: <2023102704-stable-lid-c86a@gregkh>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>

On Fri, Oct 27, 2023 at 03:15:46PM +0300, LihaSika wrote:
> On 27.10.2023 4.27, Bagas Sanjaya wrote:
> > On Thu, Oct 26, 2023 at 10:39:14PM +0300, LihaSika wrote:
> > > On 26.10.2023 22.14, Greg KH wrote:
> > > > Please submit a proper patch to the linux-usb@vger.kernel.org mailing
> > > > list and we will be glad to take it from there.
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > OK, here it is!
> > > 
> > > Best regards,
> > > L.
> > > --
> > > 
> > > $ cat lihasika-unusual_cypress.patch
> > > diff --git a/drivers/usb/storage/unusual_cypress.h
> > > b/drivers/usb/storage/unusual_cypress.h
> > > index 0547daf..7b3d5f0 100644
> > > --- a/drivers/usb/storage/unusual_cypress.h
> > > +++ b/drivers/usb/storage/unusual_cypress.h
> > > @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
> > >   		"Cypress ISD-300LP",
> > >   		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> > > 
> > > -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
> > > +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
> > >   		"Super Top",
> > >   		"USB 2.0  SATA BRIDGE",
> > >   		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> > > 
> > 
> > Hi LihaSika,
> > 
> > Please follow proper patch submission process in order to get above patch
> > accepted. See Documentation/process/submitting-patches.rst in the kernel
> > sources for how to do that properly. You may also consider adding
> > `Cc: stable@vger.kernel.org` trailer in your patch to mark it to be
> > backported to stable kernels (including one you use).
> > 
> > Thanks.
> > 
> 
> All right, here's a new attempt. Is it OK now?
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Liha Sikanen <lihasika@gmail.com>
> ---
> 
> diff --git a/drivers/usb/storage/unusual_cypress.h
> b/drivers/usb/storage/unusual_cypress.h
> index 0547daf..7b3d5f0 100644
> --- a/drivers/usb/storage/unusual_cypress.h
> +++ b/drivers/usb/storage/unusual_cypress.h
> @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
>          "Cypress ISD-300LP",
>          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> 
> -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
> +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
>          "Super Top",
>          "USB 2.0  SATA BRIDGE",
>          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

