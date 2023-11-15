Return-Path: <linux-usb+bounces-2390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFA97DC9DB
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 10:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DC10B20F3D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 09:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1AE168B7;
	Tue, 31 Oct 2023 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BW0jS6/L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692AD28F
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 09:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E787C433C8;
	Tue, 31 Oct 2023 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698745696;
	bh=sM1Wv4trc5rYZHu5HPyjKmqhgM0mXr3pLbPOECiZojA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BW0jS6/LBpKeo8eSNpHnM0lI92BdOehwUWDCNEqNAwtKgSgNv49mXuO0AYlgO8v3M
	 H7b5YRXO1CESFmn6lcM8v9y1DLYWYPDuRhwMpfS0ZfmMm7gwqkv6ALrjoR+0w5nj72
	 KS2x/XljH6UXfgQmWSQaUn1mHjNIHlimwKpCRYyM=
Date: Tue, 31 Oct 2023 10:48:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
	stern@rowland.harvard.edu, heikki.krogerus@linux.intel.com,
	mkl@pengutronix.de, hadess@hadess.net, mailhol.vincent@wanadoo.fr,
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	pumahsu@google.com, raychi@google.com, albertccwang@google.com
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
Message-ID: <2023103133-kelp-copartner-8e9c@gregkh>
References: <20231031093921.755204-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031093921.755204-1-guanyulin@google.com>

On Tue, Oct 31, 2023 at 05:38:55PM +0800, Guan-Yu Lin wrote:
> Introducing PM_RPM_EXCEPTION config flag, which may alter the priority
> between system power management and runtime power management. In
> suspend-to-idle flow, PM core will suspend all devices to avoid device
> interact with the system. However, chances are devices might be used by
> other systems rather than a single system. In this case, PM core shouldn't
> suspend the devices. One may use PM_RPM_EXCEPTION config flag to mark
> such exception, and determine the power state of a device with runtime
> power management rather than system power management.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  drivers/usb/core/generic.c |  6 ++++++
>  drivers/usb/core/usb.h     | 16 ++++++++++++++++
>  kernel/power/Kconfig       |  8 ++++++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index 740342a2812a..bb0dfcfc9764 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -266,6 +266,9 @@ int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
>  {
>  	int rc;
>  
> +	if (usb_runtime_pm_exception(udev))
> +		return 0;
> +
>  	/* Normal USB devices suspend through their upstream port.
>  	 * Root hubs don't have upstream ports to suspend,
>  	 * so we have to shut down their downstream HC-to-USB
> @@ -294,6 +297,9 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
>  {
>  	int rc;
>  
> +	if (usb_runtime_pm_exception(udev))
> +		return 0;
> +
>  	/* Normal USB devices resume/reset through their upstream port.
>  	 * Root hubs don't have upstream ports to resume or reset,
>  	 * so we have to start up their downstream HC-to-USB
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index 60363153fc3f..14a054f814a2 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -90,6 +90,22 @@ extern void usb_major_cleanup(void);
>  extern int usb_device_supports_lpm(struct usb_device *udev);
>  extern int usb_port_disable(struct usb_device *udev);
>  
> +#ifdef	CONFIG_PM_RPM_EXCEPTION
> +
> +static inline int usb_runtime_pm_exception(struct usb_device *udev)
> +{
> +	return atomic_read(&udev->dev.power.usage_count);
> +}
> +
> +#else
> +
> +static inline int usb_runtime_pm_exception(struct usb_device *udev)
> +{
> +	return 0;
> +}
> +
> +#endif
> +
>  #ifdef	CONFIG_PM
>  
>  extern int usb_suspend(struct device *dev, pm_message_t msg);
> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 4b31629c5be4..beba7a0f3947 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -193,6 +193,14 @@ config PM
>  	  responsible for the actual handling of device suspend requests and
>  	  wake-up events.
>  
> +config PM_RPM_EXCEPTION
> +	bool "Prioritize Runtime Power Management more than Power Management"
> +	default n

The default is always 'n' so no need to specify it.

> +	help
> +	Provides a way to prioritize Runtime Power Management more than Power
> +	Management. This way system can suspnd with maintaining specific
> +	components in operation.

This really doesn't give me a good description of why someone would ever
want to enable this at all.

And why does this have to be a build option?  That feels very heavy, why
not make it changable at runtime?

If this is a build option, how are you going to get all the distros and
all of the Android/ChromeOS systems in the world to enable it?

thanks,

greg k-h

