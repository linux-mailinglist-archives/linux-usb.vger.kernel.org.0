Return-Path: <linux-usb+bounces-6862-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF885E8F9
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 21:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3072B22C60
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 20:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D7F86646;
	Wed, 21 Feb 2024 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nH1No7aR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E881213
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708547120; cv=none; b=WAf3POY5bMNs5KDxB+wJL1ekiWz9huq/mNzvVVy78Sy5VUbIAScV7WOXQOoRe/fxAYZV6ooBmdbLq4KbURkN+unBrhiBX5D2y9DuCNzst6XhthwvQZM619AYCD69gO85IimBaVQAQCrFPRv0RQAWyBnHl4GAGMjAxTg7yu+zBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708547120; c=relaxed/simple;
	bh=4ZjH8dxUFZOI1zVzMUB0DO2W/+qELnvAjGzj7eUOXkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SR5YzyoBotyDB1cvD9qWU4TeDMZB3nBSLb8zG4lj2o3+98ISPwG6QXl0yxdRdjzAQLlp6e3WlrL1MFheLlBTCC+JCRwieq1DdZA88J2bPTqa6iBpuxVTnTeIaBQFP5HaTkF0ZCFHNLa8EQjG/4mrkIWM9hcln8AFryPrqnPZJTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nH1No7aR; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7c76e0c2086so71625739f.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 12:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708547117; x=1709151917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2wkgeRh9IF6PLJzH5c/hW4z1k21RwGIOmpMXRCu5Jsc=;
        b=nH1No7aRx5mIpcSh/u+QOuiKABSKvW+RaL+U4Wdx5PJQ62e83+VABPP8fZHlhL1VEv
         E00tjqIEhvj83yCUREo2wnDZ8+386GVXahNb2igRCMIMbAmtjldNtc2s6wibcUUfRcU/
         7lGUgXnMoxAb9FGwbk0LSo9zjKdJXm9sDU2sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547117; x=1709151917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wkgeRh9IF6PLJzH5c/hW4z1k21RwGIOmpMXRCu5Jsc=;
        b=eWFp9mpYvPPOiSZQjNaCsD/H/AYfYenpcDuL+l4Wt60gcUvI/jON0gNE7mxWB5dZ7d
         bINjiM83cz9vd/H1Xkxtknncte+FfoYvFJJKH6dkWe/2Rv4fMh8ssbVeJSk8Gcpt/pvI
         CflXIH1uj6qj19jADxpMg44yhZfJklWB4UB+6xDcIhwE9zFg1dfu1golIUetUjZsKs04
         mBTrww0iXd/h5xzNs+mWjG+a9Z5Q5KzOO8dr7pIbvHToA/NrJ8zmJkYMlsHf8Elc9YrX
         +QIQbajVcI5i1l3fZVR2pdu7X+kCbHrg/WgnQ+2wFDR6+eQIws5mSk04pWePuAJ2VnyX
         Q1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZcv/PKo/sZ/9xensh0TnWt6rH4f67+XNYYRSJJlfXa1jIEvsiOBgNTrJzBzejreB28sRA1X8SoPgs/E7yTF0fTQR9xXJysKj
X-Gm-Message-State: AOJu0Yx8u3VeBkE5e4uTOAD+TvuSVCfiDpV23Ta9rITHuTIigOEPtaaE
	kIyyafXop6EIcEXINOrqgtPGr3zkFf27RNG+XiOwhTIiJlR7W4/yNuTfnyE1dQ==
X-Google-Smtp-Source: AGHT+IHHf/4LjAJjVkP9U0N3B1K1orn7osgB11jKx5iI8zxropaoPlYRW14hh4HVSps9PWMjT6jAMg==
X-Received: by 2002:a05:6602:3408:b0:7c4:8a72:d17b with SMTP id n8-20020a056602340800b007c48a72d17bmr24641170ioz.13.1708547117013;
        Wed, 21 Feb 2024 12:25:17 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id b99-20020a0295ec000000b004742c0fafb5sm1724032jai.15.2024.02.21.12.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 12:25:16 -0800 (PST)
Date: Wed, 21 Feb 2024 20:25:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Message-ID: <ZdZcLOlSc3FScjLK@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>

On Tue, Feb 20, 2024 at 03:05:50PM +0100, Javier Carrasco wrote:
> The current mechanism uses generic names for the power supplies, which
> conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names as a fallback mechanism for backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 54 ++++++++++++++++++++------------------
>  drivers/usb/misc/onboard_usb_dev.h | 23 ++++++++++++++++
>  2 files changed, 52 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index f43130a6786f..e66fcac93006 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -29,18 +29,6 @@
>  
>  #include "onboard_usb_dev.h"
>  
> -/*
> - * Use generic names, as the actual names might differ between devices. If a new
> - * device requires more than the currently supported supplies, add a new one
> - * here.
> - */
> -static const char * const supply_names[] = {
> -	"vdd",
> -	"vdd2",
> -};
> -
> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
> -
>  static void onboard_dev_attach_usb_driver(struct work_struct *work);
>  
>  static struct usb_device_driver onboard_dev_usbdev_driver;
> @@ -66,6 +54,33 @@ struct onboard_dev {
>  	struct clk *clk;
>  };
>  
> +static int onboard_dev_get_regulator_bulk(struct device *dev,
> +					  struct onboard_dev *onboard_dev)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	const char * const *supply_names = onboard_dev->pdata->supply_names;
> +
> +	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
> +		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
> +				     MAX_SUPPLIES);
> +
> +	if (!supply_names[0])
> +		supply_names = generic_supply_names;

Please change to 'if (!supply_names)' and omit the initialization of
.supply_names for devices that use the generic supply names.

> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index ebe83e19d818..59dced6bd339 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -6,63 +6,86 @@
>  #ifndef _USB_MISC_ONBOARD_USB_DEV_H
>  #define _USB_MISC_ONBOARD_USB_DEV_H
>  
> +/*
> + * Fallback supply names for backwards compatibility. If the device requires
> + * more than the currently supported supplies, add a new one here, and if
> + * possible, the real name supplies to the device-specific data.
> + */
> +static const char * const generic_supply_names[] = {
> +	"vdd",
> +	"vdd2",
> +};
> +
> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)

This will have to change when support for a device with more than 2 non-generic
supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
with more supplies, but that change would be more straighforward.

> +
>  struct onboard_dev_pdata {
>  	unsigned long reset_us;		/* reset pulse width in us */
>  	unsigned int num_supplies;	/* number of supplies */
>  	bool is_hub;
> +	const char * const supply_names[MAX_SUPPLIES];
> +
>  };
>  
>  static const struct onboard_dev_pdata microchip_usb424_data = {
>  	.reset_us = 1,
>  	.num_supplies = 1,
> +	.supply_names = { NULL },
>  	.is_hub = true,
>  };
>
> ...

