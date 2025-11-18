Return-Path: <linux-usb+bounces-30669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F8C6B372
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 19:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id E5E5E29010
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 18:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9C52D948D;
	Tue, 18 Nov 2025 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YW4lZ4FE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12652C0F73
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490670; cv=none; b=GulOHsGVDiu+52I9EKzOBk6TSS0luWxEt9G94JL+O8cAipYIwo/1LJK7xOdUzL361uD+a2vaNDdCBSjjMvcH4GuLpzFUi3azHOcfkTzAyxDd+E5OEkTNk+UayEzCfoL1YZq24JCQRZX63Hz6hIJpWmN9Wv5BkqLMieJvmLKNaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490670; c=relaxed/simple;
	bh=P3BkHutUzZpErH606PWVYArfOtRbKMR0WpEHsrNUd6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBok9X5Km/qqVBZ3Oxk3qdGNS2sXDlZopGHd9fJZnFSgocLl0h02qeJlm+/fnf6NSucOxb2RshQ5tqSSdESx5K6sXQQZlPypmF8+IZeiSjeL5m9/S15CugFrxmrb1ozXr43k5jtc7e4CafSd8MIsLuwBzK+v0+QjwYhTgTNL7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YW4lZ4FE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957db5bdedso5476135e87.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 10:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763490666; x=1764095466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VhYP8Yr2Bs/L0pguVS42Jfu20UdXEvyQ6QTbcMCUyc8=;
        b=YW4lZ4FEFEGCXdTxtr9BoWqyUDbaL/+L01Nd64otU15LHqsasUyQXaIXt3+OkY9W98
         9KnO2vPTJLWw7GX0zbnXYjIgrR2pU+0y5/8lNNN91HFpBxabR/m5n+15DsE3jyGV0+1a
         bmOUeZXTS7++J75H/kFI6KedMtewJmM3/na6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490666; x=1764095466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhYP8Yr2Bs/L0pguVS42Jfu20UdXEvyQ6QTbcMCUyc8=;
        b=JFWLTg+gMWPRFG3Bof1Ej/0k3qo4b64MqDupcR/4S4B8YTcuq4re5Ekp/l/1CgbYDf
         1luXbh9ZKb5QwNga1OITdhGDvYjZYIXcCUpq+Db0/vzrSEO7Q09HMw0TKrbmkyCcycIo
         +89ksLi9JwCLcec6iwSdxPvQc/z256QD2m+U87jgx1RgfKoFXmMIOvtzohwmJon+8luH
         gnCdtcBmDUQnHbzYZcwn54dyvbETy0MkiIvGx+NEMpf6I7AG9uaQaJ/ZOeGwPfBYaxyD
         ZiY6Bo8aBsIHnQDRho5yuBky8aGTwOELdg+G0K48od+kexED5CRq0EN1HUwmojhLsxWf
         aaoA==
X-Forwarded-Encrypted: i=1; AJvYcCXfydHTAnyRDyXFpOKDSVaBw/xFSQCWpWIqdqtlMRuyFvsbsIltnMDMDDDZmFOIM9OTZ7nnIrNdFyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb1x0hrFy6W1RVUH4Tg6FvrhFiUj59UliAHBe5E/OtVj4fzDK
	t7JcLv/SBGpynFdj9JOaEzWyDZ1NdsHLJnvt4l+x5E73CweSeQT5J7BtFAuAwu9wJNstJweli+C
	PtfKpuA==
X-Gm-Gg: ASbGncuV9fVJHWzZXJqWCipAKXyYi/0FTN6RVtq2J+orvzBo1hsH4rUclj1QlAqZt3a
	ARlQREqL3o4X6w1C49w21VIyOl9lHuDHB2B6H8DT4tPyxS9/r7NlGV6QDoezZ53rha/TcpiXyK0
	bMPgCDBY48zbFBL8lmKlf2wHHx500m7ukpEytWZreCwSCQVko5XsSms3S4ac/u4T2m2te89ZUJR
	q7OqCeJVzcqAU3MT13YJ3b0qE4Dl+jVJdo7BQHLn+TkiFeF8SjjYDxd8HmDzwpjirmLS7iEFeF+
	TXrs1DvkaJHBlc1kmiTCKrG4wyLGVhlRFokQ/axjv83Em5bU8SEdC/vHBdudY3kwLaOBfxTXOCf
	T77f2y2SnhyeJph3aJCTUYCTDdyaSM+6k9SdsMalD0Z/G+QBQN6pCmbA45khZkTgKTomuWB4pIv
	5RADYOcHwF8loEav/6MxPizwIgtrigd1GdUJ0dXneUii530RNhCL2w+x/yy0I=
X-Google-Smtp-Source: AGHT+IFkOIlIM1xL3dznT/IcvMz6g3iD7d82HuZepcJhsFX8WZqcIMrtizcaqzJo3bTD+KubjpYP+g==
X-Received: by 2002:a05:6512:2216:b0:594:7380:98d7 with SMTP id 2adb3069b0e04-595841c0e2emr5865296e87.24.1763490665927;
        Tue, 18 Nov 2025 10:31:05 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804004dbsm4126245e87.73.2025.11.18.10.31.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:31:03 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5958232f806so5702289e87.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 10:31:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSEQ9qn+TYpZmoZEunIYvwRVSNdpMHWu4fykulZkK3uk7d1SUGOyqHCSL50IQxZlrn0a3eHMU3Miw=@vger.kernel.org
X-Received: by 2002:a05:6512:2342:b0:595:8200:9f8f with SMTP id
 2adb3069b0e04-595841b7044mr5328031e87.18.1763490663342; Tue, 18 Nov 2025
 10:31:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu> <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
 <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu> <381cf376-72b0-4a5f-a99e-524f6d83a2d0@kernel.org>
 <374afd7b45297979278d02f6b06abaed35c12eae.camel@irl.hu>
In-Reply-To: <374afd7b45297979278d02f6b06abaed35c12eae.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 19:30:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCtZw48bHc7m7aVPX8jFubkPYc-NKXtcWg1_rdiCMVXLnw@mail.gmail.com>
X-Gm-Features: AWmQ_bkMHdZVf0LVzn1ijYbE1e_BvdtuDPL2POQEtFyju11rtqGYEj2xQq-UrxY
Message-ID: <CANiDSCtZw48bHc7m7aVPX8jFubkPYc-NKXtcWg1_rdiCMVXLnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>
Cc: Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

On Tue, 18 Nov 2025 at 16:36, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Hans,
>
> On Tue, 2025-11-18 at 15:26 +0100, Hans de Goede wrote:
>
> >
> > > > Do you have a compelling use-case for turning off the privacy LED?
> > > >
> > >
> > > As a pet camera, it is useful to be able to turn off the LED.
> > > In some cases, it can also eliminate unwanted reflections.
> > > Some cameras may have blue LED, and if someone hates blue LEDs..
> >
> > And almost all cameras already do not allow manually overriding the LED
> > turning on while streaming. There is a very low-tech solution for this,
> > put some black isolation tape over the LED :)
> >
>
> Yes, this is also a good and stable solution. :)
>
> > > > My core goal is simple: if the camera is in use, the privacy LED must
> > > > be ON. If the LED is ON unexpectedly, it serves as a clear indication
> > > > that something unusual is happening.
> >
> > ...
> >
> > > > No freedom is lost. This change simply increases the
> > > > trustworthiness/reliability of your device.
> > >
> > > It will decrease to the extent that fewer people will know that such an
> > > option exists because they will not read the description of the
> > > module's parameters.
> >
> > People currently already will not know that the option exists.
> >
> > Seeing the current LED controls on Logitech cams requires 2 manual steps:
> >
> > 1. Install uvcdynctrl which maps the custom GUIDs to the LED controls
> >    Note distros do not install this be default
> > 2. Use either a GUI v4l2-control app like qv4l2ucp or gtk-v4l, or
> >    v4l-ctrl -l to list controls and then change the setting.
> >
> > So there already is close to 0 discoverability for this Logitech
> > only feature.
>
> This is not completely true.
> The cameractrls uses these extensions and controls with
> uvc_xu_control_query() and has over 140k downloads on Flathub alone.
>
> >
> > For the new MIPI cameras on laptops we have deliberately made it
> > impossible to disable the privacy LED while streaming even though
> > it is often controlled by a separate GPIO because of privacy reasons.
> >
> > For the same privacy reasons I fully agree with Ricardo that this should
> > be behind a module option. Which replaces step 1. with creating
> > a /etc/modprobe.d/uvc.conf file, so just about as much work.
> >
>
> I agree that this will be useful. The module parameter is also simpler
> than per-V4L2 control permission management. And the latter is not
> needed in other cases, I think.
>
> However, if allow_privacy_override is enabled, would it be worth
> mapping these controls by the kernel?
> So uvcdynctrl or cameractrls would not be needed for this control.

If allow_privacy_override is enabled and there is a standard control
in include/uapi/linux/v4l2-controls.h that supports such control: I
have no issue adding the mapping for it.

Right now we only have V4L2_CID_PRIVACY which is a boolean and has
usually been used to tell if the privacy shutter is on or off, not to
configure the LED.

In any case, the default value of allow_privacy_override should be
false. I would even argue that the best approach is to block all the
known LED config controls after a deprecation period.
Check: https://lore.kernel.org/linux-media/CANiDSCuv8UG6TMx6pK348okK+NYzAorPEgPYzoRCEZiBDgPP=A@mail.gmail.com/

> >
>
> Regards,
> Gergo



-- 
Ricardo Ribalda

