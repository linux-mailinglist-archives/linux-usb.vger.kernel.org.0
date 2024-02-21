Return-Path: <linux-usb+bounces-6864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E285E9D7
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 22:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4BF81C22F2D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 21:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17301272B6;
	Wed, 21 Feb 2024 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZgynwEv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED1126F00
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550292; cv=none; b=mwuzlGvViGDAtrgYwFT/h+km0prH7Ghlmd+p0m1ihBYvOMXJ4jp+YXpDpBcGt+Wu8TkTQGjqOLI0GYbytNcKhtjb5EBy+O2fXahqe+rKtZXwnyW9Kt/eeKxX4cSBRY8636dJSKPKEdJCZ1zbwq5OgOdnXzAJiZKV+gM+Jt6CHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550292; c=relaxed/simple;
	bh=TWdoc8orXqRI/aanAIDGuh1EKqnacCKzT5jovs7BBdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g571TRMdXHL0KjQat1X5c5JCC/wE4MTnf2EDVzp20VUdNMn+g+Ve+FkqJNqiyxwKXSJD9Ve1Zl4CY8YkMGSR0QmzGY10a9L9sWZQkMLnUoQloELWz4UVD20fVr1kw/2co1BhZR0dxKu+s7ZVoNyuUpdKI4yCrAtylIkEM1m9W4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZgynwEv; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c48e13e0d7so307941339f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 13:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708550290; x=1709155090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2o4Lt7sMW8yN4+uF0Im7dqQst5Gz28e1peL6R+UYnY=;
        b=PZgynwEvZLUO2mV/i+WodCea7Ldwq6EbQirJvjnqpxJIq3cmCbiFh1dzRAz+dtbd2c
         D4yCWH9n40MwBLO4eXqRCtG1EGWYc6QuCx4rLpRaR6ZaBzaOzRNANoPbeUULx/LQvix3
         GkrYYx2x7nt0B1hQInzvx07I+FaqdMcpQPNYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550290; x=1709155090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2o4Lt7sMW8yN4+uF0Im7dqQst5Gz28e1peL6R+UYnY=;
        b=DQTzNYHCSXIId6zyjlZDDkSF8RMVp1GUoeukb+0WxKi0AoBLbntgtw+KzpXiQRXeNC
         eJHodsxLFqbwS53R4m3RrCz5HO4J/IOlyCi428xNdPCcUi769Ix6WtAtuAX4XN6IBdBG
         K6zasRZ8Dzo1bev+jd7hBiSXlwwy3q8X6GWwU+fYGs1XTirRnOcUymYYN+nGKIUEWEVJ
         UiB6pjcZLyDyiLWTpd+Q9zWc8WRWKCDhJ2eDboQKKGJuLX9YQ3fYOZXk0caA0uNFcqJW
         xK4TJXoZw9kRIkeDhVO9++J+t12tHv0rTn7uCqgn4NVmwaSqIyZ1FyS+yb1Pa6wQv3Xm
         1WvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYULikaVuQzGAIDQahVrqcnbDe++pj0VsPm7VPKf+/h+dTwrYO0jtasSUgSN63NRO96DDi392Wmo6n06CesqDxzvaSRpE/v3/3
X-Gm-Message-State: AOJu0Yz/gwXV3P9ctoWobrjQs2HG7yVs6oxEVd7l8vJhGp7nwzh5nIcN
	PzwMFgAdrht5t4yAL/XM9WnvJI6pB5RAT3bLZgZS0JWuThtwCjEYH5VGKRI2yg==
X-Google-Smtp-Source: AGHT+IFCEkFAfp0WCqH40+qAFwemcqmk5bthCRNNsiVwbLdDrdKoCN24aa7ZKBsYLJkAuxIEgXFMUA==
X-Received: by 2002:a6b:c90d:0:b0:7c4:8b24:f926 with SMTP id z13-20020a6bc90d000000b007c48b24f926mr21213879iof.6.1708550290037;
        Wed, 21 Feb 2024 13:18:10 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id j3-20020a05663822c300b00472f79e0001sm2822585jat.171.2024.02.21.13.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 13:18:09 -0800 (PST)
Date: Wed, 21 Feb 2024 21:18:09 +0000
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
Message-ID: <ZdZokatitviYZ7rg@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
 <ZdZcLOlSc3FScjLK@google.com>
 <503d9ea9-9812-498b-a5ee-2579ba8a7ecf@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <503d9ea9-9812-498b-a5ee-2579ba8a7ecf@wolfvision.net>

Hi Javier,

On Wed, Feb 21, 2024 at 09:40:38PM +0100, Javier Carrasco wrote:
> On 21.02.24 21:25, Matthias Kaehlcke wrote:
> > On Tue, Feb 20, 2024 at 03:05:50PM +0100, Javier Carrasco wrote:
> >> The current mechanism uses generic names for the power supplies, which
> >> conflicts with proper name definitions in the device bindings.
> >>
> >> Add a per-device property to include real supply names and keep generic
> >> names as a fallback mechanism for backward compatibility.
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> ---
> >>  drivers/usb/misc/onboard_usb_dev.c | 54 ++++++++++++++++++++------------------
> >>  drivers/usb/misc/onboard_usb_dev.h | 23 ++++++++++++++++
> >>  2 files changed, 52 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> >> index f43130a6786f..e66fcac93006 100644
> >> --- a/drivers/usb/misc/onboard_usb_dev.c
> >> +++ b/drivers/usb/misc/onboard_usb_dev.c
> >> @@ -29,18 +29,6 @@
> >>  
> >>  #include "onboard_usb_dev.h"
> >>  
> >> -/*
> >> - * Use generic names, as the actual names might differ between devices. If a new
> >> - * device requires more than the currently supported supplies, add a new one
> >> - * here.
> >> - */
> >> -static const char * const supply_names[] = {
> >> -	"vdd",
> >> -	"vdd2",
> >> -};
> >> -
> >> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
> >> -
> >>  static void onboard_dev_attach_usb_driver(struct work_struct *work);
> >>  
> >>  static struct usb_device_driver onboard_dev_usbdev_driver;
> >> @@ -66,6 +54,33 @@ struct onboard_dev {
> >>  	struct clk *clk;
> >>  };
> >>  
> >> +static int onboard_dev_get_regulator_bulk(struct device *dev,
> >> +					  struct onboard_dev *onboard_dev)
> >> +{
> >> +	unsigned int i;
> >> +	int err;
> >> +
> >> +	const char * const *supply_names = onboard_dev->pdata->supply_names;
> >> +
> >> +	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
> >> +		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
> >> +				     MAX_SUPPLIES);
> >> +
> >> +	if (!supply_names[0])
> >> +		supply_names = generic_supply_names;
> > 
> > Please change to 'if (!supply_names)' and omit the initialization of
> > .supply_names for devices that use the generic supply names.
> > 
> 
> That looks much cleaner, I will apply it to the next version.
> 
> >> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> >> index ebe83e19d818..59dced6bd339 100644
> >> --- a/drivers/usb/misc/onboard_usb_dev.h
> >> +++ b/drivers/usb/misc/onboard_usb_dev.h
> >> @@ -6,63 +6,86 @@
> >>  #ifndef _USB_MISC_ONBOARD_USB_DEV_H
> >>  #define _USB_MISC_ONBOARD_USB_DEV_H
> >>  
> >> +/*
> >> + * Fallback supply names for backwards compatibility. If the device requires
> >> + * more than the currently supported supplies, add a new one here, and if
> >> + * possible, the real name supplies to the device-specific data.
> >> + */
> >> +static const char * const generic_supply_names[] = {
> >> +	"vdd",
> >> +	"vdd2",
> >> +};
> >> +
> >> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)
> > 
> > This will have to change when support for a device with more than 2 non-generic
> > supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
> > ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
> > with more supplies, but that change would be more straighforward.
> > 
> 
> I am not completely sure about this. Someone could increase MAX_SUPPLIES
> without adding a generic name.

That's perfectly fine and intended. MAX_SUPPLIES is a max, any list
shorther than that is valid. Any longer list will result in probe()
being aborted with a clear error message.

> Actually two modifications will be necessary for every addition (name
> and MAX_SUPPLIES). If ARRAY_SIZE is used, only new names are required,
> and MAX_SUPPLIES is automatically increased.

As per above it's not necessary to add a new name when MAX_SUPPLIES is
increased to support more non-generic names. It would only be necessary
if more generic names were added, my understanding is that this
should not happen because any newly supported onboard devices are
supposed to use device specific supply names. I don't like to idea of
adding unused pseudo supply names to the list, just for the sake of
using ARRAY_SIZE.

> I understand that the whole point of this is getting rid of the generic
> names, but we still have to provide generic names for every extra
> supply, at least for code consistency and to avoid size mismatches
> between real an generic supply names.

Please let me know if you still think the extra names are needed.

