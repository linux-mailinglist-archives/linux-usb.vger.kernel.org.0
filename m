Return-Path: <linux-usb+bounces-18970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167CA0136C
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 09:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D27367A1E62
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 08:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1098415624D;
	Sat,  4 Jan 2025 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="evJpU6yD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E5433B3;
	Sat,  4 Jan 2025 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735980833; cv=none; b=HoRSPOtM93tAmWdXxJNzuCsJznyqEyY5RypFsRZqIwy4xfa+rU09rbDZaflOPUW59K15Z3qGrJrW+wqYW1w7UIyFsnwbabQ15iR4Xej419IG3RzEi94BaWbWdxk4ZzO83hn4BsKOyjocNHr0utfqyWFZ8sXTPQmzHq9jf8p/5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735980833; c=relaxed/simple;
	bh=gU5OBMkGUVcGI+9DdStyOLlRsZJCngKlltNXo/WaLzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGxnW/b0B/SpezCBmOG20plf/hWYq3mOdGO7d0LS4xaRSDgkJAUqFM0slkkLiTeIrE4mdnRuBoF04ihyD46wanlFbOUetXv9800l5nxwlT2k98R5JJjz2lhdMZ8RT//jmwDaT+DFcx/UUO8IWN8cWkwHO4NBwM1k/Cpyw1rd2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=evJpU6yD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B84C4CED1;
	Sat,  4 Jan 2025 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735980833;
	bh=gU5OBMkGUVcGI+9DdStyOLlRsZJCngKlltNXo/WaLzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evJpU6yDxtwLwCxUR2p7Xnlq2emgn4fjWoBrX96yZAk7MGIDmV/wYCGBifoORXIo5
	 3jr1Wi5yM44CaHUTfp9prXW6zKUPShlmfnshBAsYbouba6wf7ca2dyMw3LjfaNjKur
	 uwjVa/SO+LL9oCLk5JhxWDZbUy9yrDFJIC4rFGy8=
Date: Sat, 4 Jan 2025 09:53:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Will Mortensen <willmo@gmail.com>
Cc: Nikolay Yakimov <root@livid.pp.ru>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, AT <kernel@twinhelix.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: core: prefer only full UAC3 config, not BADD
Message-ID: <2025010402-audacity-flounder-d8df@gregkh>
References: <20250104-usb-choose-config-full-uac3-v1-1-f8bf8760ae90@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104-usb-choose-config-full-uac3-v1-1-f8bf8760ae90@gmail.com>

On Sat, Jan 04, 2025 at 07:45:29AM +0000, Will Mortensen wrote:
> Previously, usb_choose_configuration() chose the first config whose
> first interface was UAC3 (if there was such a config), which could mean
> choosing UAC3 BADD over full UAC3, potentially losing most of the
> device's functionality. With this patch, we check the config's first IAD
> and only prefer the config if it's full UAC3, not BADD.
> 
> Note that if the device complies with the UAC3 spec, then the device's
> first config is UAC1/2. With this patch, if the device also has a UAC3
> BADD config but no full UAC3 config (which is allowed by the spec),
> then we'll select the first, UAC1/2 config, *not* the BADD config.
> 
> That might be undesirable (?), so we could instead try to implement a
> priority scheme like: full UAC3 > UAC3 BADD > UAC1/2. But unless we also
> enhance this function to look at more than one IAD and interface per
> config, we could incorrectly select the BADD config over more fully-
> featured UAC1/2/3 configs if the full UAC3 IAD is not first in its
> config(s). I don't know enough about UAC3 devices to know what's
> preferable, and I'm not sure how simple vs. correct the heuristics in
> this function should be. :-) This patch errs on the side of simple.
> 
> For some history, the preference for the first UAC3 config (instead of
> the first config, which should be UAC1/2) originated a bit before the
> Fixes commit, in commit f13912d3f014 ("usbcore: Select UAC3
> configuration for audio if present") and commit ff2a8c532c14 ("usbcore:
> Select only first configuration for non-UAC3 compliant devices"). Also,
> the Fixes commit's message is a bit wrong in one place since the UAC3
> spec prohibits a device's first configuration from being UAC3.
> 
> I tested only with an Apple USB-C headphone adapter (as in the linked
> bug), which has three configs in the following order: UAC2, UAC3 BADD,
> full UAC3. Previously the UAC3 BADD config was selected; with this patch
> the full UAC3 config is selected.
> 
> Reported-by: AT <kernel@twinhelix.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217501
> Fixes: 25b016145036 ("USB: Fix configuration selection issues introduced in v4.20.0")
> Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> Cc: Saranya Gopal <saranya.gopal@intel.com>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Cc: Nikolay Yakimov <root@livid.pp.ru>
> Signed-off-by: Will Mortensen <willmo@gmail.com>
> ---
>  drivers/usb/core/generic.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index b134bff5c3fe..ce9c86967922 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -20,6 +20,7 @@
>   */
>  
>  #include <linux/usb.h>
> +#include <linux/usb/audio-v3.h>
>  #include <linux/usb/hcd.h>
>  #include <uapi/linux/usb/audio.h>
>  #include "usb.h"
> @@ -48,9 +49,11 @@ static bool is_audio(struct usb_interface_descriptor *desc)
>  	return desc->bInterfaceClass == USB_CLASS_AUDIO;
>  }
>  
> -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> +static bool is_full_uac3(struct usb_interface_assoc_descriptor *assoc)
>  {
> -	return desc->bInterfaceProtocol == UAC_VERSION_3;
> +	return assoc->bFunctionClass == USB_CLASS_AUDIO
> +		&& assoc->bFunctionSubClass == UAC3_FUNCTION_SUBCLASS_FULL_ADC_3_0
> +		&& assoc->bFunctionProtocol == UAC_VERSION_3;

Nit, the "&&" should go on the previous lines, right?



>  }
>  
>  int usb_choose_configuration(struct usb_device *udev)
> @@ -84,6 +87,8 @@ int usb_choose_configuration(struct usb_device *udev)
>  	num_configs = udev->descriptor.bNumConfigurations;
>  	for (i = 0; i < num_configs; (i++, c++)) {
>  		struct usb_interface_descriptor	*desc = NULL;
> +		/* first IAD if present, else NULL */
> +		struct usb_interface_assoc_descriptor *assoc = c->intf_assoc[0];
>  
>  		/* It's possible that a config has no interfaces! */
>  		if (c->desc.bNumInterfaces > 0)
> @@ -137,17 +142,21 @@ int usb_choose_configuration(struct usb_device *udev)
>  		/*
>  		 * Select first configuration as default for audio so that
>  		 * devices that don't comply with UAC3 protocol are supported.
> -		 * But, still iterate through other configurations and
> -		 * select UAC3 compliant config if present.
> +		 * But, still iterate through other configurations and select
> +		 * full UAC3 compliant config if present. (If the only UAC3
> +		 * config is a BADD, we will instead select the first config,
> +		 * which should be UAC1/2.)
>  		 */
>  		if (desc && is_audio(desc)) {
> -			/* Always prefer the first found UAC3 config */
> -			if (is_uac3_config(desc)) {
> +			/* Always prefer the first found full UAC3 config */
> +			if (assoc != NULL && is_full_uac3(assoc)) {

I feel like this is making the kernel pick a specific policy, when
userspace might have wanted a different one, right?  Is there anything
in the USB spec that mandates that this is the correct config to always
pick "first"?

And what about your comment above which says it "should" be the first
config, where is that required?  What about devices that didn't have
that and now the functionality changes because that assumption isn't
true, and they weren't a "full UAC3 compliant" device?

In other words, I'm really worried about regressions here, what devices
has this change been tested on and how can we be assured nothing that
works today is suddenly going to break?

thanks,

greg k-h

