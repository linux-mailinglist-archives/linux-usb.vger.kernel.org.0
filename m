Return-Path: <linux-usb+bounces-7267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5F86B934
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 21:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C3B9288ADD
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 20:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A2E15B10B;
	Wed, 28 Feb 2024 20:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PeL5ChEN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720621EA99
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709152906; cv=none; b=XS4OXa4yfUxXwcsmC8daAAZO8TtHxU5Ppgkru9IjwoA+FC9VU1qr83Gv4JTsE6ExM7UfvQX8DyipW07EMnslejputiIjrOnu63LR5HtYMSGAok503Osa8r0zNknhY5xAeXPF0K0Wu2+ga73gg1brAMBBTkaxK5gj1axFI/6r9xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709152906; c=relaxed/simple;
	bh=pcrCq/2jEzxjqO0m+FR7FzBK48L/+Z3u7o5R0CChEoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1p2kkjMsE7yrP90/zpTWBbLZoIl6gZKx53ay/w3KIRFCdOU3pHb5wZn4zYC5CeeZKZzJcR0dwGhtYcNWEgX0VE5yXda+yg+gC06alpZ6jOLeb9AWc26DdFmSg4VM3H+c+uams4QD0qxgVcutoVqofOKRR5t4PAz8oosWNQfDEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PeL5ChEN; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-365145ef32fso834865ab.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 12:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709152903; x=1709757703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Baw+xs3ggfXLm4MxOGqTtw4oYWjUFXR4qcJc+3eX6ws=;
        b=PeL5ChENXb/lS++fPGAAdSCTb40BJTR75CLLKyuXEZmYmsllC/sql4V7UKLhRB7SnI
         Rw/lGy041Oy1nF6oKsFrn7uYsUz+eEaRBz0LfzQnYV0ODBmmDn3gDOBeliV6dzRQ62UR
         ntukuh/VjS4Ru03IBBsjfnTPH3R/fL7wGw7u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709152903; x=1709757703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Baw+xs3ggfXLm4MxOGqTtw4oYWjUFXR4qcJc+3eX6ws=;
        b=SRGxKXiRFmJb9WGSWBBWY8MSLDClc2GrYcq5AETSAOQn14Xd775IRTgm6MqS/Ih4xz
         E4oSYLYLa56snLMnWimC+pnxKjiloqiHs2Frv5vEYW05SiBaqXoRZG1uDrSszyvlBTkP
         yyDfTwyl6wxRkj5UNl1l3xfMb16JSadzrpdxH1TpfHJoJybadzXcEWDe5xCZnP2IZ/h7
         at7cygHOISkF5G/f6F5BOrb5EnQMZmV0V/iO4gyq4sEqSxc+8iqUGbyqLFx+vkIzJASM
         Q08KCbpesdYoFsJFsmIfLk2vh7AcYtlSFzvWNx6jMHae0TQM9+y0SW0oBcLYNdqMIxor
         VaFg==
X-Forwarded-Encrypted: i=1; AJvYcCXl1QL9VqYyDAS4LQWEGbKZqU0D2+td/iEa702+2kWEi/QLG7SgrPKT9tzGxSFC4CgGyc7R4XWlKNRUu2reKYz37EBz/5vmMFu7
X-Gm-Message-State: AOJu0Yx8w/qfjXc/nw0wblrgzkcGkt0RqQvXYlYPih7dw4D7zU3pFBNX
	3lq0apDfUfrR3iB5tyz/ISxdg+HS7o/VAGy7wSlOg64F7HQJur/+SoTQ/ETRdw==
X-Google-Smtp-Source: AGHT+IH3ZpBdW2jBIz8fH0FB8KIQ7tWY8SxlmUVGC6UzHIlrtZ3R+qNemBz8OtGIPciy1hbt6wwyWw==
X-Received: by 2002:a92:d2cd:0:b0:365:b5aa:135d with SMTP id w13-20020a92d2cd000000b00365b5aa135dmr322432ilg.32.1709152903571;
        Wed, 28 Feb 2024 12:41:43 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id bc29-20020a056e02009d00b00364372c5b5asm49554ilb.15.2024.02.28.12.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 12:41:43 -0800 (PST)
Date: Wed, 28 Feb 2024 20:41:42 +0000
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
Subject: Re: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <Zd-ahtPpI8zbAYQ9@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
 <Zd93JZTlN4BCxWm7@google.com>
 <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecf303c3-d7a1-49d5-a997-32596215e43d@wolfvision.net>

On Wed, Feb 28, 2024 at 09:21:00PM +0100, Javier Carrasco wrote:
> On 28.02.24 19:10, Matthias Kaehlcke wrote:
> > On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
> >> Most of the functionality this driver provides can be used by non-hub
> >> devices as well.
> >>
> >> To account for the hub-specific code, add a flag to the device data
> >> structure and check its value for hub-specific code.
> >>
> >> The 'always_powered_in_supend' attribute is only available for hub
> >> devices, keeping the driver's default behavior for non-hub devices (keep
> >> on in suspend).
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> ---
> >>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
> >>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
> >>  2 files changed, 33 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> >> index e1779bd2d126..df0ed172c7ec 100644
> >> --- a/drivers/usb/misc/onboard_usb_dev.c
> >> +++ b/drivers/usb/misc/onboard_usb_dev.c
> >> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
> >>  	struct usbdev_node *node;
> >>  	bool power_off = true;
> >>  
> >> -	if (onboard_dev->always_powered_in_suspend)
> >> +	if (onboard_dev->always_powered_in_suspend &&
> >> +	    !onboard_dev->pdata->is_hub)
> >>  		return 0;
> > 
> > With this non-hub devices would always be powered down, since
> > 'always_powerd_in_suspend' is not set for them. This should be:
> > 
> 
> May I ask you what you meant in v4 with this comment?
> 
> > Even without the sysfs attribute the field 'always_powered_in_suspend'
> > could
> > be set to true by probe() for non-hub devices.

struct onboard_dev always has the field 'always_powered_in_suspend',
even for non-hubs, that don't have the corresponding sysfs attribute.
Currently it is left uninitialized (i.e. false) for non-hubs. Instead
it could be initialized to true by probe() for non-hubs, which would
be semantically correct. With that it wouldn't be necessary to check
here whether a device is hub, because the field would provide the
necessary information.

> >   if (!onboard_dev->pdata->is_hub ||
> >        onboard_dev->always_powered_in_suspend)
> > 
> > Checking for the (non-)hub status first is clearer IMO, also it avoids
> > an unneccessary check of 'always_powered' for non-hub devices.
> > 
> 
> That makes sense and will be fixed.
> 
> > Without code context: for hubs there can be multiple device tree nodes
> > for the same physical hub chip (e.g. one for the USB2 and another for
> > the USB3 part). I suppose this could also be the case for non-hub
> > devices. For hubs there is the 'peer-hub' device tree property to
> > establish a link between the two USB devices, as a result the onboard
> > driver only creates a single platform device (which is desired,
> > otherwise two platform devices would be in charge for power sequencing
> > the same phyiscal device. For non-hub devices there is currently no such
> > link. In many cases I expect there will be just one DT entry even though
> > the device has multiple USB interfaces, but it could happen and would
> > actually be a more accurate representation.
> > 
> > General support is already there (the code dealing with 'peer-hub'), but
> > we'd have to come up with a suitable name. 'peer-device' is the first
> > thing that comes to my mind, but there might be better options. If such
> > a generic property is added then we should deprecate 'peer-hub', but
> > maintain backwards compatibility.
> 
> I have nothing against that, but the first non-hub device that will be
> added does not have multiple DT nodes, so I have nothing to test that
> extension with real hardware.

I see, the XVF3500 is USB 2.0 only, so it isn't suitable for testing.

> That could be added in the future, though, if the need ever arises.

I expect it will, when a DT maintainer asks the hardware to be
represented correctly for a device that is connected to more than one USB
bus. IIRC that's how 'peer-hub' was born :)

Ok, we can leave it out for now. I might send a dedicated patch after your
series landed. If a switch to 'peer-device' or similar is anticipated then
it's probably best to deprecate 'peer-hub' ASAP, to avoid it from getting
added to more bindings.

