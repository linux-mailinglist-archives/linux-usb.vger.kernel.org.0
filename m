Return-Path: <linux-usb+bounces-17224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D79BEF5B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 14:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BC3D1C21BDF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C1B1FA27E;
	Wed,  6 Nov 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f3CcdIPo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D491FA256
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900627; cv=none; b=rfLgVWktSy1APAk00BYhG8Ww6D6ADsi39qDWDlNE/0pIX1dufnTq7soHd3EP0jY/D6n/k+ptaY92NuLc9BQKNaZxygxtaIeBvo2YDMCVO6P57avm40mLKTjmhXUTLpvm1+KPT8vo0Q++Ep87obzUEARuIt1z0Dvd1O/1f+wOMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900627; c=relaxed/simple;
	bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwvG5Xl3DHneuDjMWwQaNS9TYepJgwWgEl7+KO3EMIyJW/kFfw1i808sK5zLNsM/mgb4/RvvNviS7q4B+BlUf3Bx4FcDE764ahu3jsWZyEMjrkUPbHJ9RtzIpBIdeTB2DpkYgDQORwlQH07V3OzIo1UNOi/TrV49iLxa3t0uNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f3CcdIPo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso10623011fa.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900624; x=1731505424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=f3CcdIPoULNOErGfe7BXfAsURIm4et373ySgVx6cdoUgNhp4INO93h6R/F2yDiDfLu
         ldr/kxxfMhsdCTBO4RcOT3i+xlleOh6EIAVyvupoIGUXjOEbPAMoNDXWYyAQ8hjSTPPx
         /FGUHI5TnpwImxyp5vlsMgDzQVhWKduYrGOtSRP5e4vGzQ8P6j7kkfO4CRCvfs4t8H/B
         Pbl1MbBRrILWpxMq1M0rR85mBG77/ZXX20DC5hMUM8EJxMs6iRuQt1bvUHiqIbtq20zx
         YrrDXLLp8jj09I7DE0vrVcdzxKLcZAI+zsSpF1DP+U+sKuXSwZ7YgxTCVPivyP50Lqby
         NvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900624; x=1731505424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=Aj0zcaziWYrFG9osqt+dZHC0L19YJbitOKoAUTTt6PQqfEaXmL312w1x7eMlEp3ZDS
         klz4RBlpfaAVPOUCGnVeC+P2U1Yt+HkcMyWT9BDlkX2Oi9WRpqPGVh807+Kt4ryTGtc+
         JZa9aiB4LblqD9TLnP39ZGyaGRUXOjCCqj0r2pL/ID52UHGJLJRYtgSUTYiNrQpqx0vi
         0DJwiMVdUxrBkvQ8xSMSCLA5aczavYgn2IQ+1k4LwVWUe98p87Z8j9Eet+3bKAPONgcl
         2KQzrzQp52vnewvW2T259v1gm2vMFHbbrcuUBF4tUT1TjbVTXDkcjdyeRDbhWqP3ohOy
         YAAg==
X-Forwarded-Encrypted: i=1; AJvYcCUH1tYQIa4ytHetEYRavM/SYRDDFDmOwLkjZGovW0KDVs+WuRVLUDJBRLkfQB3B8gFt95P04gzw3HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVGTmoRx1aNgy0pbho7Js9uF8H6t2IywySmZ75ptuEgSldro5
	R10FUo3LxvuMunxOECMu9AR6RWIszSsUMuFoMpFJnQm5k108AILpgXfrWWFG7j5YVmlPZRfEOMw
	Way0dTEwz1IspMGGRX52zhjXwhR0tjQIkumc8ug==
X-Google-Smtp-Source: AGHT+IHUtnnhEva3lCB8uWh8uIWC06tcgEpMXvu5am5NhlAEbhUxeQ79Id1SoLC6uXkPBOCC/N9jH1BHhM6ITnKzWf8=
X-Received: by 2002:a05:651c:210a:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2ff0cb2376emr8634191fa.2.1730900624427; Wed, 06 Nov 2024
 05:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <ZytP0XGgmz_R5gos@smile.fi.intel.com>
In-Reply-To: <ZytP0XGgmz_R5gos@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Nov 2024 14:43:32 +0100
Message-ID: <CAMRc=MfQw1YmOoq-rK5Bq3uDK8cmjG_xsUgVDs28phsqkcHofA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 04, 2024 at 11:34:18AM +0200, Andy Shevchenko wrote:
> > This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> > left. Convert those users to call modern APIs and drop this legacy piec=
e
> > from the source tree.
> >
> > The idea is to route this via GPIO tree, please Ack.
>
> Thank you for Acks, folks!
>
> Dominik, is it possible to get yours or are you inactive nowadays (I saw
> last mention of your name ca. 2023).
>
> Bart, we have all Acks except pcmcia (see also above), and the change is
> the same all over the places, do you think it's okay to apply if Dominik
> won't respond for a few days?
>

If we don't get an ack until Friday, I will take it as is.

Bart

