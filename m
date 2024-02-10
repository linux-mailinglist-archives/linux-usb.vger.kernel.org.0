Return-Path: <linux-usb+bounces-6203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8E850626
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 20:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 993DEB22CF8
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 19:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B315F57E;
	Sat, 10 Feb 2024 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mXx4L30f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A75F47E
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707594029; cv=none; b=A2xO2bAtSrwPDXiQYyXfCbzO8O4+Pot6Mwc4r8otUAg7c20ua+ml339k2ynPgD2fl9TtsGUoTTsx1HkDZASfpSrgRhLtan7yDW89DDoCXEeA8TrpcjVbnDae138TPOzZScoVv209/c/Wkz2o6tqKt5VONMPfZOSITVuJ0SIweGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707594029; c=relaxed/simple;
	bh=r5wrUd3um7uKkGJHnNNGznYfB7o1Ys8ms184CE0FLBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWbePjJhZMg3JK5S/+LERyCAepObM01a3N59U+afCiCtamUkp+yj36DDWdEfo2KCdg/vnhEELQktLjoeHiCNwDv7+2WxpEaoRke9UrtqKYKIgG8lT+12IatU7g8dHkbA7sLcI248OBmMMiRrch16etzmHnucJYgPY7Qca1Bvj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mXx4L30f; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1da120617c7so76775ad.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 11:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707594027; x=1708198827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzcidhCo+F6gBLxwDgBelCvN5KH6EoPstq5oHIcbBjc=;
        b=mXx4L30fVuIttR+MUym3IODTtq46W/9Lw0IayjuaD3L3pTcJUQoyOBCct3ssixBUKK
         HWB9mW+5m6w+QjSJCx9YURQDXUVgMJMn0A0MqsiZOVTPjpl4S9Aq3TBbPuE0ZfeexAlC
         tJFk+L5dHcDg1BOmkMebyJpGAeQICFEqpWGfpcyZPpNHUwIL2f2FsoHc12TBdSZ5xHtJ
         tIYfD3o/E26s+FPj/SqTWTnBvow7qj33CdKQLmaqBVE6r/yr+M/m/tu6EME0xRicWxHh
         BAEzva6t58CcjDcENG3stwFhpjyvCtjBjUcipWUEZe7viLGmzA5z5doZp1CgUzNZjyIr
         0ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707594027; x=1708198827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzcidhCo+F6gBLxwDgBelCvN5KH6EoPstq5oHIcbBjc=;
        b=QANO30reznx2vMSzOwMro7YnuUHRhLi+0CKFsYriI3PfGnRDH/0SFLx+jLEphUMqGM
         uHNSiKIIDX8bnOv0ILkRC9kO/fT2kaJooTXhq3Dlas5wM+NykQAX2CElvejKWwFNYc6F
         d5YAztF+aAFZf00wiCiR0X/3oP0BlS37rCliHxydj9blVJthHZkRvwWrpWNINGkQQIqi
         cFcy+WqWZ8o5h6wm6aZWC4iDO8+pGQVVKW4bcRGJIXRLMkiuXVmFv9XOQMOjtC5SOB6a
         9Cvj2L8snYa6zTrisY2+DpZPHqX1O1OxrxY06VpWKdoftieH5Yo5xNBhwX4mMZGoR2RC
         CEQw==
X-Forwarded-Encrypted: i=1; AJvYcCVXW/TU/TsjD2bfKjwBCgTGlEfWDDjJmUpd4iK1v6v3jtLgzgS7vyWBUBFaU4kMezeuKvlUE4iqACU4u5G++KUrIyRjf3psQqH1
X-Gm-Message-State: AOJu0YyLxHzuFe/GQztDJPNRZBuD2NPyN2ZgjTWGeize8Ek9tBaGFrgt
	WBh7jn9vkgpVprAgCEkHHRGIlIVM/tV7usCl4Dr5CcVX44RR8zsbJjpeBLUeZORCDwuQYI3dYCQ
	gDgbBUJXM9VRzeosO/g0eTby6vXQ8TJbhgBw7
X-Google-Smtp-Source: AGHT+IFZ4C4xgGhqwC1b1miGoFAeYDo6i0L6CdiMbluMyqeXV7IszQAynLz5F/Dd0JbjeLEjLloiOr0bc5aw4FCeeNs=
X-Received: by 2002:a17:902:b194:b0:1d8:eac9:bbfc with SMTP id
 s20-20020a170902b19400b001d8eac9bbfcmr66589plr.15.1707594027047; Sat, 10 Feb
 2024 11:40:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205104049.48900-1-christianshewitt@gmail.com>
 <CANEJEGuVPfdteBfY_LyQ+D=t4HGHLvDut-Vj2xFjRM4e8kgh=Q@mail.gmail.com> <D050DF05-8745-42E8-8ED1-890A4DC0380B@gmail.com>
In-Reply-To: <D050DF05-8745-42E8-8ED1-890A4DC0380B@gmail.com>
From: Grant Grundler <grundler@google.com>
Date: Sat, 10 Feb 2024 11:40:13 -0800
Message-ID: <CANEJEGtidrEyS9UvmgmBVJRG6hVqJ4ha-evzHoeoAKMn7omGTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: asix: add 0b95:1790 to AX88179A device list
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Grant Grundler <grundler@chromium.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 11:11=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
...
> > 1) The USB output is telling you this device is a AX88179A : the
> > changes most likely should be in ax88179_178a.c using the
> > ax881798_info:
> >   https://elixir.bootlin.com/linux/latest/source/drivers/net/usb/ax8817=
9_178a.c#L1690
>
> Yup, having sent the patch some git grep=E2=80=99ing showed me the newer =
driver
> already has the ID for the card included.
>
> > 2) What Andrew Lunn said. I'll add the asix driver should not be
> > probing (or claiming) this device - or at least be quiet about it when
> > it does.
>
> So the problem now is .. I have both drivers enabled in kernel config:
>
> https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/RPi/device=
s/RPi5/linux/linux.aarch64.conf#L2324-L2325


You have:
CONFIG_USB_NET_AX8817X=3Dm
CONFIG_USB_NET_AX88179_178A=3Dm
 CONFIG_NET_VENDOR_ASIX=3Dy

and
   CONFIG_INPUT_MOUSEDEV=3Dy

But also loads of other modules ("=3Dm").

> And This is a Linux 6.6.10 kernel boot (without this patch):
> https://paste.libreelec.tv/oriented-mastodon.log
>
> The card is visible on the USB bus but why isn=E2=80=99t the correct (new=
er)
> driver probing? =C2=AF\_(=E3=83=84)_/=C2=AF

I'm a bit confused too since the original email showed both asix and
ax88179_178a drivers getting invoked. You should have seen the same
previous failure with "Failed to read reg index 0x0040: -32". But
since the kernel timestamps were clipped in that email, I'm now
assuming the two messages were not printed at boot time (but rather
much later). Perhaps someone forgot to load the ax88179_178a driver
module after rebooting to their latest kernel build?

My guess is the root file system (linux distro?) doesn't include udev
at the moment. Normally, udev (user space) will "discover" the USB
device and load the appropriate device driver *module* (based on
device IDs listed in e.g. "modinfo ax88179_178a")

Note that asix driver is built-in. If CONFIG_USB_NET_AX88179_178A=3Dy
were used instead, the system won't depend on udev.

If my guess is correct, you might want to review the entire list of
CONFIG...=3Dm entries and determine which ones udev can help
automatically load (I would not assume all of them) and which ones
should always be loaded anyway (make them "=3Dy").

cheers,
grant

>
> Christian
>

