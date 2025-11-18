Return-Path: <linux-usb+bounces-30668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEAC6B348
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 19:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF7CB4E1E0A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 18:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C932B363C50;
	Tue, 18 Nov 2025 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NrdPKcV0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF513612F9
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490520; cv=none; b=J5g0dWa2q/2SwsNXKx5r8y12ZZ8U8gA5l6d0BRNEosBOw7SPe6d8JWeVFNw0HZafl+3jOErwMFb0YOEg0OJcXbo5CYO+9Gr+ITh7snNaSmryuOhmL/KnQRXCsZYv9Vr0LQOTWGk7ohrA0WUyJkp8+SvOWc+Uxw0LwxS/qJawViY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490520; c=relaxed/simple;
	bh=DhPoh8Yg2X9WakZCAvg/708yGtup22jmnfZDgCthA0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvPkd4J9CGX3RAzGK/4ve5aT8dah7RAJwylLm1ZYIhdxH4IgcbBObOHEtaCrm9ztkhW3oS5OPSPzghNB1f1E7b+nBWGOFNTWUuWrvfMnBpyTFL2sDIzmWWuokYnVnFMxl845oudo8rbY2GFoEmniPL/QVW7LBx9g7CJ0rj+nFwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NrdPKcV0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36bf096b092so42359701fa.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763490516; x=1764095316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vJf9PmJagRyIa0BOvJOuBX45kWw0Bxs9hWW3HKipvOk=;
        b=NrdPKcV0K2vIyAbR5pwZRDDVkztZOhoreWcAJFP4dGNpzuIcW2LsUnIpF6ODje9UF7
         fhiwewARD6u+3otxljzImncSsYwDlFixu0ujjuvY80281adJnqdijD4oGLlu9hO5HPT3
         r/QjdqaHNFiH+BF8zm0bAWpuLYRwQ9LkbrYgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490516; x=1764095316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJf9PmJagRyIa0BOvJOuBX45kWw0Bxs9hWW3HKipvOk=;
        b=D+Ndryk4jkhxYoGZDa3oDaPmImuWYRDATcwhgHpluSZn5cKkVFApzSr62SdDX/n9+p
         7+5JstqmylVO1MJf+VrVnTen0Ba0RI+bMaJX8ciAS5zefKRcgT4eZcApIbjzPFId3gk0
         yUFK1q+ARFmqpuSv/5RTKrB6ltJIEyyMUblTxFqpqHlOxIQu3VMPT/RvbFZS5RFOdsi5
         aD/9T3XvJ5Y9+EDxEYmBxKvcpNpTQCiVVfB4T31K/dtzkgno+2JeqkFclef+ucKDmIUU
         M37+MJeQsR8QIqRTXOuAypQu2gXRaSuKNRBEjvcbdtUDko5TBtzxpLHGE7lAlwQlCF9K
         TQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCUCO2Qm3Vd9Akyrkyg1WMuqXvlRFzcbMND5JioMTD1ve1oha4KzYexhxsZdlZOoyVVQBPlwJDs2UDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAI51JWtGPOwMQF5klQ5lgSZlJgi+gaOUvvF+/muKkS55tcfh
	Ctu1HMKIV6GYgK82yEv4tZMXPlJI5kz9HCgtAVVvMzPyB6MXHXHVU6SYNnLK544PC7V4WlhsH9M
	4OFc/ng==
X-Gm-Gg: ASbGnct+nbwunavuGDa5SW04H5zmHZveN8gHFPx/0iKEt0KoOzqyoVzWlMoujR/lUxx
	vEqVWJycQEaYk4RK0EVuhomPyviTM6undOhsN1T8jJahDl9lrSxgV2U9r+Tqvx9VnX51c2Bsyns
	vL0dMXybt4qmOWV3HSS/TtWxuGfnFPveeplXWcYDSs5NbQPsF9UgicOeoN67bXFKqVPhThbJg5R
	k83lEP7H2rmdmjisRoZSbKArF9DMZ1SSk8dsKAJ9Lhc1t2k2+l5l2LesJkmXnw5kK713iLLGZG2
	bh96MadmFNi3rylRW/jINRpGfynCdhXaPmD5u8z82aHI2RdkCw5WAm6PdSH4GybfvD++VFo7I98
	Z/SqXx7lSPdn/ncFTAngcd/EG9kAgetANp5qyXRxL7DQ/9iDs0LeA9TLDI7B5ZVGcxPwa/BijMS
	fhrxILrX4nVpXmfqb1IOQVkkXU8rEa4exS9/pkBDMZ99v/jIjSCxqPvygOGKekyBQ=
X-Google-Smtp-Source: AGHT+IHNgL7zd0X9zv2Ky59fc0Z8F6MRFuYWcHQ5J54GE+nemyk4+BAxzDEBBHkCpPIqyA2C4ALFsQ==
X-Received: by 2002:a05:6512:3d04:b0:594:248d:afa7 with SMTP id 2adb3069b0e04-595841a2649mr5137714e87.13.1763490516440;
        Tue, 18 Nov 2025 10:28:36 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400519sm4094015e87.62.2025.11.18.10.28.35
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:28:35 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a49389deeso35280491fa.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 10:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXCIWt4WBVmT+OPceEFOBtmCYzM/RtvJA/uIeQ12LLwmO5GuGhF4v6nWTncpC9tFUkWo3z4Ee2BbU=@vger.kernel.org
X-Received: by 2002:a2e:9692:0:b0:37b:966a:493e with SMTP id
 38308e7fff4ca-37babd6e95bmr38757561fa.39.1763490514771; Tue, 18 Nov 2025
 10:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <2025111817-wages-anyone-e39a@gregkh>
 <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
In-Reply-To: <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 19:28:22 +0100
X-Gmail-Original-Message-ID: <CANiDSCuv8UG6TMx6pK348okK+NYzAorPEgPYzoRCEZiBDgPP=A@mail.gmail.com>
X-Gm-Features: AWmQ_blM7S4shaTGNxJfhLmGLTcwMtEJb-eDC45CoRNAlMmaP_NitZys0JaGpa8
Message-ID: <CANiDSCuv8UG6TMx6pK348okK+NYzAorPEgPYzoRCEZiBDgPP=A@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Tue, 18 Nov 2025 at 15:09, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Tue, Nov 18, 2025 at 06:14:09AM -0500, Greg Kroah-Hartman wrote:
> > On Mon, Nov 17, 2025 at 08:14:19PM +0000, Ricardo Ribalda wrote:
> > > Some camera modules have XU controls that can configure the behaviour of
> > > the privacy LED.
> > >
> > > Block mapping of those controls, unless the module is configured with
> > > a new parameter: allow_privacy_override.
> >
> > This is not the 1990's, please do not add new module parameters, they do
> > not scale, nor work properly at all for modern hardware where you can
> > have multiple devices in the same system.
> >
> > This isn't an agreement that we should do this feature at all, just that
> > if you do, it should NOT be a module parameter.
>
> I agree with Greg: modprobe makes things harder, especially on usb.

If the argument is that with parameters you cannot have a different
parameter for each USB camera, I would say that I see this option as a
system-wide policy, not as a per-device option. But yeah, the less
parameters that we have, the better.

>
> Also, in the specific case of privacy leds, IMO it should never be
> possible to directly disable it, not even root via a modprobe or
> runtime parameter.

+1

>
> Ok, as it might be some case where someone really wants to disable for his
> special pet toy. If such cases are relevant, a Kconfig parameter could
> be added (maybe depending on BROKEN), having privacy LED enabled by default.
>
> This way, any sane distro-generated Kernel should always have the privacy
> LED on when camera is in use.
>
> On other words, if someone has secure boot enabled, he can be more confident
> that a distro-vendor signed Kernel will honour the privacy LED, and not
> even the root can tamper with - as BIOS access to disable secure boot would
> be needed to change it - plus, booting a non-signed kernel.

If most of the people agree that the final goal is to block all the
LED privacy access from userspace we could have a mixed approach.

1. We introduce the allow_privacy_override parameter with default off.
If the user sets allow_privacy_override, they are welcomed with a message like:

uvcvideo: [DEPRECATION]: Access to the privacy controls will be
eventually blocked.

2. In one year, if nobody screams at us we remove the parameter and
call it a day.

3. If someone depends on this feature, we will move it into a kernel
configuration behind BROKEN.

What do you think?

>
> Regards,
> Mauro



-- 
Ricardo Ribalda

