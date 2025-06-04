Return-Path: <linux-usb+bounces-24482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD4ACD89D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 09:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A3F3A45EF
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 07:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07BB1DEFDD;
	Wed,  4 Jun 2025 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kNdo44MB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246802C327E
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022436; cv=none; b=SZRDHxmrSXRyciRu67FOt8o0TWkJg8AULOHbD+UVDhdHxc0Jcl1HGk7FYxy9upyJSL9ghWt2YrtNk/o4pAk0o0VLmSlTZGArgM17t1FdDMTko/j5XtXBUMunBwcBp9bdKJYpynM8M/enyJrChhhm3RcwZXRVyQQuGIUXtEmkusM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022436; c=relaxed/simple;
	bh=6H2YzBsOQ0+EX5ugcye0KiIDlFZ3UyNmW4FCCUK7zmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOBFlKt6ayWSJ7y7YT2nibggaSyXK2LWuTRGQIaIO12e2Pc+03f7M7Z9A/aJsjiGyOT7866xgQbeW+dW+sVizJH7LDtzyG19csp+kifaA86dOBeSKDuKFsgzXTdDjGPlpQHaxC0wzJTPgFp9flogTzzlQLTv23d4rQ1QODfTgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kNdo44MB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C731C4CEE7;
	Wed,  4 Jun 2025 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749022435;
	bh=6H2YzBsOQ0+EX5ugcye0KiIDlFZ3UyNmW4FCCUK7zmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNdo44MBH3M7Fp7yd0nCveBn1JC3yr7TyAxgbr/Cm0WsoMi+YuQ59pfMhggUJyLq5
	 I+u/5olb2EDuod0iQws1mqoYlWLJsoOgjrX80R6+AxbUnU5B4NcvMbyfg8w3y33nFU
	 OPsOxeCF6g8I2l7OsGYyAGQxpKXA72vu5Qe6gVYA=
Date: Wed, 4 Jun 2025 09:33:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Wyraz <michael@wyraz.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add Marvell ML352 to drivers/usb/serial/option.c
Message-ID: <2025060427-trimming-viewing-980b@gregkh>
References: <a35a3b78-89ff-496c-8e88-140927543f51@wyraz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a35a3b78-89ff-496c-8e88-140927543f51@wyraz.de>

On Wed, Jun 04, 2025 at 07:40:16AM +0200, Michael Wyraz wrote:
> 
> Add the device id of the Marvell ML352 to option.c so that the
> device is recognized as usb-serial device.
> 
> Signed-off-by: Michael Wyraz <michael@wyraz.de>
> ---
>  drivers/usb/serial/option.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 5cd26dac2069..3bfdab641369 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -619,6 +619,10 @@ static void option_instat_callback(struct urb *urb);
>  /* Luat Air72*U series based on UNISOC UIS8910 uses UNISOC's vendor ID */
>  #define LUAT_PRODUCT_AIR720U            0x4e00
> 
> +/* Marvell products */
> +#define MARVELL_VENDOR_ID            0x1286
> +#define MARVELL_PRODUCT_ML352        0x4e3c
> +
>  /* Device flags */
> 
>  /* Highest interface number which can be used with NCTRL() and RSVD() */
> @@ -2434,6 +2438,7 @@ static const struct usb_device_id option_ids[] = {
>      { USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID,
> SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
>      { USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C,
> 0xff, 0, 0) },
>      { USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U,
> 0xff, 0, 0) },
> +    { USB_DEVICE(MARVELL_VENDOR_ID, MARVELL_PRODUCT_ML352) },
>      { USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),            /* TCL
> IK512 MBIM */
>        .driver_info = NCTRL(1) },
>      { USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),            /* TCL
> IK512 ECM */
> -- 
> 2.49.0
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
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

