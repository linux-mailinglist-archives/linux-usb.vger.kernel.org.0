Return-Path: <linux-usb+bounces-11970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84214926562
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 17:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B807283F3C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 15:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C66181B9F;
	Wed,  3 Jul 2024 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LqjFPToF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E3181311
	for <linux-usb@vger.kernel.org>; Wed,  3 Jul 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720022349; cv=none; b=IpYjUHslJbZSVRYK0eLeIZq4M+3sjriNIbEYh3Mtc8Qo1qMpHrWHAh7clIRlO7CkSDZunl1DftPqoUyvyeh3msXB08eAlCJ2oj+Z4/likMRSWumIqcXUwmUoL868iI5gPpOYSWRvEtbGHx6ndDHAg/rTVU6u4J2eej8E7kCCMJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720022349; c=relaxed/simple;
	bh=kw+i48wUHIKLPANobfnoGVgboD9WtzhZacEnJR9xTj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdwPD/NLbrUsUlWaw4U0QRPjoHeTZibrX8O0DM1+OGkH0760HG02wlyBNit+0xG1nhskklzEH96c0WUdFooRpDqWVNq3B22kRjyOi15K28xzd9vht2iiRxKlBybZSil1d9kmWi9cS3EYFw7mG/FKFNeiSoLRH0xQ2umXsURMj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LqjFPToF; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0360f890a1so697732276.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Jul 2024 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1720022346; x=1720627146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AzVnxmrPhsGH+MV5zEtWgqYRuXmnHJ2NW9xRAWbg94o=;
        b=LqjFPToF6bmN70L2sptauAMPmAU7InVz8t5il6BpMsyJAA7n56o3UmnWTL1Rl8Y54H
         ujbFNMu63il6tQoSyhEJ30XYdniaowiVbNBhlMVtoXurKjm/gNy2jvLiiDOfZ9mzeZhZ
         alLD8zaBO+MItc36xNgZydAxC8DZXBZpuX2sX5Tj60p+w+ce49qd3Cglp+Epm9UZrXyA
         5FZZR9cduYuFgIwNMAZ+9Z6aZGHBsGXe7/F6jBOVCcBJvz9cgxOD0tlzl+BS1sRPflJp
         dQN9ZY9mfzD+fD8jN8BADuUlUgFQdo9oOXMRM2daq8zMQTgU/vcBLiagVRI39R8Hn8SX
         /VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720022346; x=1720627146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzVnxmrPhsGH+MV5zEtWgqYRuXmnHJ2NW9xRAWbg94o=;
        b=NGyOFW77bbZ8RSk8wsai/53bX//DdkGAmv0ZHOM8AGNWoUBe86+rkoxFHAzh0yL5j1
         qlb54sPvLyhjv25FB3A509T6JOdxdXQWkG+Z01+6OQZYdt6/puClWYNWH7h/NGu3ULxt
         f61n4kYHC3POso5pi/eMx4X+PSaCuUEWmixBn/oP6zpbJUq/OKceWYnVngL5mRl0kjxh
         RSuW/x2Q5kYtUSvCFY7iMT0sXRXLYukflQoKeMgnStLmynpRekut7gHoRtcNhM9lWWFt
         jsjrngcJ6fMU8/8LExbBdud8Knp1y8UD+Q57YIMNQTGLKEyyDl6TXQsF0uTXaPQ3/ntw
         jfYw==
X-Forwarded-Encrypted: i=1; AJvYcCVqYPyDiI3rJCb6Hf5IdfTdJWshqv5MXDdm/76HDOJdc+OoXy1epRjajNzfzuNCrQamlo4ow2G8pxMhjcGn4XCHoFQdTwFBqYof
X-Gm-Message-State: AOJu0YymZrM5yRO5jGFMwG23Nedjc8MeM1ubq4j+Xsp7xuKDD/6YJjVh
	Wo2qqN1hvWrYQsT3SYCRvKlwaRwAoZ+A9YikCL3dLs/otvEM8I2WfKWXmRIkGtujn37MVvX5bgP
	9LhGJ4mZ1lU6PwhJNtoBswT3m0Stf6t7jo5dSRg==
X-Google-Smtp-Source: AGHT+IGqCViiKmmK3QRMAQYZrLMjCIwJNQ8NdAg3wRUVNKBTDZnLrc4qjCCOWQvlXVuWYKuWOAPNETjht013Knj8XzI=
X-Received: by 2002:a25:9105:0:b0:e03:5372:6b1a with SMTP id
 3f1490d57ef6-e03ad927492mr1348985276.20.1720022346289; Wed, 03 Jul 2024
 08:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630153652.318882-1-wahrenst@gmx.net> <20240630153652.318882-8-wahrenst@gmx.net>
 <20240702-qualified-archetypal-worm-416a2f@houat> <b4295be1-6fa4-4118-8554-b8a7cc605f9d@gmx.net>
 <7e3d4769-bd9c-47e8-bac2-9245b08866c3@gmx.net>
In-Reply-To: <7e3d4769-bd9c-47e8-bac2-9245b08866c3@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 3 Jul 2024 16:58:49 +0100
Message-ID: <CAPY8ntDg_cqqN4TmQPNiULVS-Fw0uOx8Ut-VCro56_-FTALeQg@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/vc4: hdmi: Disable connector status polling
 during suspend
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, 
	Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"

Hi Stefan

On Wed, 3 Jul 2024 at 16:32, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Am 03.07.24 um 12:28 schrieb Stefan Wahren:
> > Hi Maxime,
> >
> > Am 02.07.24 um 15:48 schrieb Maxime Ripard:
> >> Hi,
> >>
> >> On Sun, Jun 30, 2024 at 05:36:48PM GMT, Stefan Wahren wrote:
> >>> Suspend of VC4 HDMI will likely triggers a warning from
> >>> vc4_hdmi_connector_detect_ctx() during poll of connector status.
> >>> The power management will prevent the resume and keep the relevant
> >>> power domain disabled.
> >>>
> >>> Since there is no reason to poll the connector status during
> >>> suspend, the polling should be disabled during this.
> >>>
> >>> It not possible to use drm_mode_config_helper_suspend() here,
> >>> because the callbacks might be called during bind phase and not all
> >>> components are fully initialized.
> >>>
> >>> Link:
> >>> https://lore.kernel.org/dri-devel/7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net/
> >>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >>> ---
> >>>   drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++++
> >>>   1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> index b3a42b709718..e80495cea6ac 100644
> >>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> @@ -3106,6 +3106,13 @@ static int vc5_hdmi_init_resources(struct
> >>> drm_device *drm,
> >>>   static int vc4_hdmi_runtime_suspend(struct device *dev)
> >>>   {
> >>>       struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> >>> +    struct drm_device *drm = vc4_hdmi->connector.dev;
> >>> +
> >>> +    /*
> >>> +     * Don't disable polling if it was never initialized
> >>> +     */
> >>> +    if (drm && drm->mode_config.poll_enabled)
> >>> +        drm_kms_helper_poll_disable(drm);
> >> Does it make sense to add it to runtime_suspend?
> > i saw that other drm drivers used drm_mode_config_helper_suspend() in
> > the RUNTIME_PM_OPS. But i agree, it should be better moved to
> > SYSTEM_SLEEP_PM_OPS.
> >> What if the board boots without a display connected, and only after a
> >> while one is connected? Wouldn't that prevent the driver from detecting
> >> it?
> > tbh I noticed that HDMI re-detection didn't worked in my setup
> > 6.10-rcX before this series. I need to investigate ...
> Okay, this patch breaks definitely HDMI re-detection. So please ignore
> this patch. Sorry, about this mess.
>
> There is another minor issue which already exists before that cause the
> following log entry on HDMI reconnect:
>
> [   74.078745] vc4-drm soc:gpu: [drm] User-defined mode not supported:
> "1920x1200": 60 154000 1920 1968 2000 2080 1200 1203 1209 1235 0x68 0x9
>
> But in this case HDMI works.

That's saying the mode specified on the kernel command line via
"video=" is invalid. All other modes enumerated from the EDID should
still be present.

I don't immediately see anything wrong with the mode - it's just DMT
mode 0x44 aka 1920x1200@60Hz with reduced blanking. 154MHz clock is
less than the 162MHz limit for Pi0-3 so should be supported.
Setting the module parameter drm.debug to 0x4 should give you the
extra debug of the reason the mode was rejected via the log message at
[1].

At a guess the firmware has inserted the video= line based on the mode
it configured. Whilst that was useful, we've moved away from that now
by setting "disable_fw_kms_setup=1" in config.txt.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_modes.c#L1815-L1816

> Regards
> >>
> >> Maxime
> >
>

