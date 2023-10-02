Return-Path: <linux-usb+bounces-901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C3D7B4C9C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 09:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3E760281870
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 07:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9105186E;
	Mon,  2 Oct 2023 07:36:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E417C3
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 07:36:29 +0000 (UTC)
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF7DBF
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 00:36:28 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7abda795363so5064683241.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696232187; x=1696836987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kzGcKH51BMhzvkfijbkvJZcq6BeliJjCgiKuHtTrZI=;
        b=XUBlhCQCluEKPTIeKdQAyXsvycYs0HPKyzJwsKaAlprAGDhvJkWBqmXREA4B4AeVgt
         g/1+uIOwYGamevIHZEQVWRY6ClzqwSx53B93NdDsKCefWtfGJ37005JkrvVSeshgefaq
         fhaBnJXTQgMS4XXJVVP1Pa7G5wrj59r3EopY+dGf1+r9epR7KQII32teS/JiSG8QqSlx
         2bk6UUpeuuBpLLRETmvP2lkfyAOt/zrmPsWgghVeTyTuSwJ2842z70SefXGyG6fpVQ+h
         dgoEbiySSPXuhZCQgIcYSQzI+AoNtkj0QsfB8x4ZFMfgmzPtsELWzDFWiC+e2PpX8KLo
         GS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232187; x=1696836987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kzGcKH51BMhzvkfijbkvJZcq6BeliJjCgiKuHtTrZI=;
        b=mhseLkLHDhJQMeEFxQs3xHsSrlwNAJeytzlyE4Gyz+s+1SWSSFumV1DBXe716lL7F+
         DchGpFkFN1UOLgOseUkcxWT3+HIGw45zmvsEu0t5+WVj69xSPD1/WSxSdSk0z2+HdCGs
         1zJOtENUCZQVTYEq2SHXlaksem9sKZBWVGK5In2PBBBgunIDiTsDwUw4tDzjq2BSDC3S
         OIEw/XVLzGEj4l4DWDpcwe6hPWDvyaggFnR2B7Z8oD4c3n9rtw40fKVHICTZY6GKAmOM
         MI7PVaQV4nG6OXfddyzP0jWs2uIkHn6FjSns4XPRYsfoShMWori9qEk2jttY+vR9LQQj
         yROA==
X-Gm-Message-State: AOJu0YxfgsbAek16zrj8cyqlVW9cZsodfbXVwE6K1WjBSt5ojlX4tGGN
	xtZS0ho3hXt2XH2ybHNZbXbDmjeK/7MSa3N7PEdWNw==
X-Google-Smtp-Source: AGHT+IHIgV9UAM4yA8MoechR8q4GLUBkoPowZHLEFw1ZULiGDp+VXiAj3o0rKyl0yWYlk/4LeZK5AfIRMZZY2/x23tg=
X-Received: by 2002:a67:fe0b:0:b0:452:560e:31a9 with SMTP id
 l11-20020a67fe0b000000b00452560e31a9mr8909087vsr.1.1696232186976; Mon, 02 Oct
 2023 00:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr> <20231001-pxa-gpio-v4-2-0f3b975e6ed5@skole.hr>
 <CAHp75VeYduD=uXpNKcxhwqFTkahUbz_Ockqi7KVO88cpeVHbQQ@mail.gmail.com>
In-Reply-To: <CAHp75VeYduD=uXpNKcxhwqFTkahUbz_Ockqi7KVO88cpeVHbQQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Oct 2023 09:36:16 +0200
Message-ID: <CAMRc=McgNoz-umhkJKZ-juWukgToEhPh3iex7G-QikmSTgDdnw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 1, 2023 at 4:35=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Oct 1, 2023 at 5:13=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovi=
c@skole.hr> wrote:
> >
> > Sharp's Spitz board still uses the legacy GPIO interface for configurin=
g
> > its two onboard LEDs.
> >
> > Convert them to use the GPIO descriptor interface.
>
> ...
>
> >  static void __init spitz_leds_init(void)
> >  {
> > +       gpiod_add_lookup_table(&spitz_led_gpio_table);
> >         platform_device_register(&spitz_led_device);
> > +       spitz_gpio_leds[0].gpiod =3D gpiod_get_index(&spitz_led_device.=
dev,
> > +                       NULL, 0, GPIOD_ASIS);
> > +       spitz_gpio_leds[1].gpiod =3D gpiod_get_index(&spitz_led_device.=
dev,
> > +                       NULL, 1, GPIOD_ASIS);
> >  }
>
> What's the point of keeping a lookup table after we got descriptors out o=
f it?
>

Normally the descriptors would be retrieved in drivers and so lookup
tables should stay in memory forever as static resources (just like
device-tree). We have recently added some "temporary" lookup tables to
address even worse hacks. The tables would be removed immediately
after the descriptor is retrieved simply because we used that hack in
drivers which may be unbound and re-bound resulting in adding
repeating lookup entries.

Here we're dealing with a board-file so a more classic approach of
having static lookup tables added once and never removed is in order.
So I'd leave it like this.

Bart

