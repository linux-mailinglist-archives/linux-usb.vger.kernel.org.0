Return-Path: <linux-usb+bounces-31545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E56CC7DAD
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 14:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59F48303358F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 13:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466C23596F0;
	Wed, 17 Dec 2025 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d+0UXIdp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA03590DD;
	Wed, 17 Dec 2025 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978055; cv=none; b=c+yHo3onn/93yDJi/IuFMKFUH81R6eInCQfMzNTLavR8lv/Ne4LXDJTuNwAZ9F00vNd8abyZjBU/Y77icTf2M0x6xy5elxbBWwIYsE2m7jo9vVNcJpPbg5nWYbZJz0dmGvFdgua3CxJpnrrlCj3AYHEBCoJHkaEBrorIR7YOM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978055; c=relaxed/simple;
	bh=VnDZMETIp/4sSPGHuaAyIV65nEVItusuWNcr9hwFVCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjFBFcWyLlrs1KUibGj9kRG7MrroY6Vy327U3ppUIvrUoK0aQvUo5DRWSqJYtgDCnEzfPMRgW4Jkehnl111I3hwDdMMFW59oJhaBxyHJbr6y9lF1Q9t2azRVfc4S7oLHMyxLi0COXE47KlV6dUjpqc/T3hbQFnHyINJH8lzMpyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d+0UXIdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC10C4CEF5;
	Wed, 17 Dec 2025 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765978055;
	bh=VnDZMETIp/4sSPGHuaAyIV65nEVItusuWNcr9hwFVCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+0UXIdpNtnPvn9B5/M3ECUNY/X+9Jiatu9FeOJaVJQ+w4M/WjP7y3m2ihQIvTyYh
	 kpvw53z0KGcBqR1kbNsxQ7GZ3nxB4pgOJ4Q4LShmP+Xja4+AbNSBlNNa1LqEVARNb+
	 nGseCNq/mLRozkLueVlfbSGuVFRFgUcF3YGOgsMg=
Date: Wed, 17 Dec 2025 14:27:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Miao Li <limiao870622@163.com>
Cc: zaitcev@redhat.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miao Li <limiao@kylinos.cn>
Subject: Re: [PATCH] USB: usblp: reset device at probe for Fuji Xerox
 DocuPrint P475 AP
Message-ID: <2025121739-parking-swizzle-3cf2@gregkh>
References: <20251128065206.361475-1-limiao870622@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128065206.361475-1-limiao870622@163.com>

On Fri, Nov 28, 2025 at 02:52:06PM +0800, Miao Li wrote:
> From: Miao Li <limiao@kylinos.cn>
> 
> when connecting Fuji Xerox DocuPrint P475 AP printer(which vid:pid is
> 0550:020e) to Huawei hisi platform and do reboot test for 500 cycles,
> usblp probe function executed successfully but there is a small
> chance it might not work, we can reset the device at probe to deal
> with the problem.
> 
> Signed-off-by: Miao Li <limiao@kylinos.cn>
> ---
>  drivers/usb/class/usblp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> index a7a1d38b6bef..566930eb88a1 100644
> --- a/drivers/usb/class/usblp.c
> +++ b/drivers/usb/class/usblp.c
> @@ -210,6 +210,7 @@ struct quirk_printer_struct {
>  #define USBLP_QUIRK_BIDIR	0x1	/* reports bidir but requires unidirectional mode (no INs/reads) */
>  #define USBLP_QUIRK_USB_INIT	0x2	/* needs vendor USB init string */
>  #define USBLP_QUIRK_BAD_CLASS	0x4	/* descriptor uses vendor-specific Class or SubClass */
> +#define USBLP_QUIRK_RESET_DEV	0x8	/* reset USB device */
>  
>  static const struct quirk_printer_struct quirk_printers[] = {
>  	{ 0x03f0, 0x0004, USBLP_QUIRK_BIDIR }, /* HP DeskJet 895C */
> @@ -228,6 +229,7 @@ static const struct quirk_printer_struct quirk_printers[] = {
>  	{ 0x0482, 0x0010, USBLP_QUIRK_BIDIR }, /* Kyocera Mita FS 820, by zut <kernel@zut.de> */
>  	{ 0x04f9, 0x000d, USBLP_QUIRK_BIDIR }, /* Brother Industries, Ltd HL-1440 Laser Printer */
>  	{ 0x04b8, 0x0202, USBLP_QUIRK_BAD_CLASS }, /* Seiko Epson Receipt Printer M129C */
> +	{ 0x0550, 0x020e, USBLP_QUIRK_RESET_DEV }, /* FUJI XEROX DocuPrint P475 AP Printer */
>  	{ 0, 0 }
>  };
>  
> @@ -1189,6 +1191,13 @@ static int usblp_probe(struct usb_interface *intf,
>  		le16_to_cpu(dev->descriptor.idVendor),
>  		le16_to_cpu(dev->descriptor.idProduct));
>  
> +	/*
> +	 * Some printer need to reset the device here or it might not work
> +	 * when finished probe.
> +	 */
> +	if (usblp->quirks & USBLP_QUIRK_RESET_DEV)
> +		usb_reset_device(dev);

This feels very very wrong.  Why must a driver tell the device to reset
itself?  How does it pass any Windows USB validation without such a
"reset"?  Why does it require this?

Are you sure this isn't a bug in the host controller logic instead?

thanks,

greg k-h

