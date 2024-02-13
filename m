Return-Path: <linux-usb+bounces-6325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1AB852EBF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 12:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA7A6B247F8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 11:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E0B2C840;
	Tue, 13 Feb 2024 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WWslb2Hf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2D134D8;
	Tue, 13 Feb 2024 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707822350; cv=none; b=UKNQ582+6laARgNsKEfx43by8Zyx57BTBz+IVX7qIbRJUjb65g3Rkp2/2tYy2kaHwlRWj3S9shZaDXqmCq1UNHDm2sX23l5eUeFaNCpvKDwfB7wXCBslx0kjCqYfBK0wklsxQENgvYmIkMFztYMLkJcxSuBqAESH9n5oa91BaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707822350; c=relaxed/simple;
	bh=saEEW2K86dM6FLv55BUHxbVrfwkcPU+hjYCqovDchuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEob2ZKIZapb+K4gtAn4taiNU/WkP9us60oZZgjNn+yi636wKfcSYw5kTEgbqUZLIXOcAE0i09UiD7IezwO/VLnb7Zn8R2TzK4wrMv2MUIZOgM+yoJyXhy4Gal2nRXLFZW8RulfdT5Q/bIZxvapvIvs8AQNWAZUIxqB3Rc9Kg6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WWslb2Hf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99541C433F1;
	Tue, 13 Feb 2024 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707822350;
	bh=saEEW2K86dM6FLv55BUHxbVrfwkcPU+hjYCqovDchuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWslb2HfAr2jGZgmRghTVvSL5AEn56kpCKX3evrc60iEsvE4AjaW4BFwJjmNatY9Q
	 YOWGnFGCoYtz6OD7dQ9qU7wL/z6Xb2My0+oMtxmX3vhKil5rDh9UIPC2PlszYW3sH0
	 FhV2jViRZJUoRYZM6aHBIhveIufTmt87SNWxLIas=
Date: Tue, 13 Feb 2024 12:05:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nikolay Yakimov <root@livid.pp.ru>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH] USB: Always select config with the highest supported UAC
 version
Message-ID: <2024021353-reversing-waltz-7402@gregkh>
References: <20240212152848.44782-1-alexander@tsoy.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212152848.44782-1-alexander@tsoy.me>

On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> Config with the highest supported UAC version is always preferable because
> it usually provides more features.
> 
> Main motivation for this change is to improve support for several UAC2
> devices which have UAC1 config as the first one for compatibility reasons.
> UAC2 mode provides a wider range of supported sampling rates on these
> devices. Also when UAC4 support is implemented, it will need just one
> additional case line without changing the logic.
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> ---
>  drivers/usb/core/generic.c | 39 +++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index b134bff5c3fe..8aeb180e1cf9 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -48,9 +48,16 @@ static bool is_audio(struct usb_interface_descriptor *desc)
>  	return desc->bInterfaceClass == USB_CLASS_AUDIO;
>  }
>  
> -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> +static bool is_supported_uac(struct usb_interface_descriptor *desc)
>  {
> -	return desc->bInterfaceProtocol == UAC_VERSION_3;
> +	switch(desc->bInterfaceProtocol) {
> +	case UAC_VERSION_1:
> +	case UAC_VERSION_2:
> +	case UAC_VERSION_3:
> +		return true;
> +	default:
> +		return false;
> +	}
>  }
>  
>  int usb_choose_configuration(struct usb_device *udev)
> @@ -135,22 +142,28 @@ int usb_choose_configuration(struct usb_device *udev)
>  		}
>  
>  		/*
> -		 * Select first configuration as default for audio so that
> -		 * devices that don't comply with UAC3 protocol are supported.
> -		 * But, still iterate through other configurations and
> -		 * select UAC3 compliant config if present.
> +		 * Iterate through audio configurations and select the first of
> +		 * the highest supported UAC versions. Select the first config
> +		 * if no supported UAC configs are found.
>  		 */
>  		if (desc && is_audio(desc)) {
> -			/* Always prefer the first found UAC3 config */
> -			if (is_uac3_config(desc)) {
> -				best = c;
> -				break;
> -			}
> +			struct usb_interface_descriptor	*best_desc = NULL;
> +
> +			if (best)
> +				best_desc = &best->intf_cache[0]->altsetting->desc;

Are you sure you always have a intf_cache[0] pointer?  What about
altsetting?  Remember, invalid descriptors happen all the time, and are
a known "attack vector" against the USB stack.

>  
> -			/* If there is no UAC3 config, prefer the first config */
> -			else if (i == 0)
> +			if (i == 0)
>  				best = c;
>  
> +			/* Assume that bInterfaceProtocol value is always
> +			 * growing when UAC versions are incremented, so that
> +			 * the direct comparison is possible. */

How do we know this assumption is always true?  What happens when it is not?

> +			else if (is_supported_uac(desc) && best_desc &&
> +				 (!is_supported_uac(best_desc) ||
> +				  (desc->bInterfaceProtocol >
> +				   best_desc->bInterfaceProtocol)))
> +					best = c;

I really can't understand this if logic, sorry, can you describe it
better so that we can maintain it over time?

thanks,

greg k-h

