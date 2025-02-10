Return-Path: <linux-usb+bounces-20403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A4A2EF69
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 15:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4061674CD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C04F233140;
	Mon, 10 Feb 2025 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HDjIuDK0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A82343BA
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196745; cv=none; b=Xw8GlJI/c0wO20qE84exuY5u0yeVqdwtRDbUHcMTN7MMAu4VD8+DamyNJTg3MY/b7NUPaby3yauj+GnJyzozChThj72Q43kAVT6AYl74DVLhgaG8nHM56z8vMm0IuSD+ryqCq1hVUdmdxKtZuXnX6+wfFi34VgU2rOGL7Z8ZKYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196745; c=relaxed/simple;
	bh=Nc6xjaTu9DkgHXfQNw9ft/2GNIRaRSDwDToBu7XdFyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJUASFB29HXK4j8XJvwcD2M8PdrKapqLNbA5aOJr7HpsZbeFBz4KPKT0CN/L9Zd35nPsxxneRf2Mn5x/SiUC3l8PhC7s/Gn5dtXZ8usnkBw84SzCX8kgWmS4iEyCuIRVqaNoHIqxrK75h8o/gbzwBZlCwWKMJVq5onxNtz1F4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HDjIuDK0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830CAC4CED1;
	Mon, 10 Feb 2025 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739196745;
	bh=Nc6xjaTu9DkgHXfQNw9ft/2GNIRaRSDwDToBu7XdFyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDjIuDK0PwkKyt6LuhkjRSsHz2BaWfg9LUpn9GfdKMPo02maAMca7gaziGiFCXygt
	 Z+nvAU83R3sNs2BGRX7qomIw3bh0BDRVMimYn4hPc/M7EGF/gja5dkp3HPPkHcqXgC
	 9OuSGs2Sbd26LOIKBxOY4+rFGyFT9HkawPfdxXGM=
Date: Mon, 10 Feb 2025 15:05:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Lee <matt@oscium.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: max3421: Improve retransmit handling for NAK
 responses
Message-ID: <2025021054-rush-endocrine-c5f7@gregkh>
References: <CABrMTjey9pZXh=fWevfv2saNOs+_2uV6feV5xbYbP_4nKcq8mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABrMTjey9pZXh=fWevfv2saNOs+_2uV6feV5xbYbP_4nKcq8mw@mail.gmail.com>

On Mon, Feb 10, 2025 at 07:57:20AM -0600, Matt Lee wrote:
> This reverts a previously submitted patch where the slow retransmit was removed.

What is that git commit id you are reverting?  Please list it and mark
the Fixes: and cc: stable tag as needed.

> 
> Previously, the max3421 driver would immediately retry transmissions
> indefinitely
> upon receiving a NAK response, leading to potential stalls.

Odd line-wrapping :(

> 
> This patch re-introduces a limit (`NAK_MAX_FAST_RETRANSMITS`) on how
> many times a
> request is retransmitted immediately.  After reaching this limit, the driver
> falls back to a slower retransmit strategy using `max3421_slow_retransmit()`.
> 
> This improves robustness when dealing with unresponsive USB devices.
> 
> Signed-off-by: Matt Lee <matt@oscium.com>
> ---
>  drivers/usb/host/max3421-hcd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 1234567..abcdef0 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -72,6 +72,12 @@
>  #define USB_MAX_FRAME_NUMBER   0x7ff
>  #define USB_MAX_RETRIES        3 /* # of retries before error is reported */
> 
> +/*
> + * Max. # of times we're willing to retransmit a request immediately in
> + * response to a NAK.  Afterwards, we fall back on trying once a frame.
> + */
> +#define NAK_MAX_FAST_RETRANSMITS       2
> +
>  #define POWER_BUDGET   500     /* in mA; use 8 for low-power port testing */
> 
>  /* Port-change mask: */
> @@ -924,8 +930,11 @@ max3421_handle_error(struct usb_hcd *hcd
>                  * Device wasn't ready for data or has no data
>                  * available: retry the packet again.
>                  */
> +               if (max3421_ep->naks++ < NAK_MAX_FAST_RETRANSMITS) {
>                 max3421_next_transfer(hcd, 1);
>                 switch_sndfifo = 0;
> +               } else
> +                       max3421_slow_retransmit(hcd);

Did you run scripts/checkpatch.pl on this change?

And why is 2 ok?  How did that number get picked?

thanks,

greg k-h

