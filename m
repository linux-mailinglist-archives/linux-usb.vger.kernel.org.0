Return-Path: <linux-usb+bounces-818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5777B3B96
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 22:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0B0C02837F8
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 20:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F18521B5;
	Fri, 29 Sep 2023 20:48:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E128F62
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 20:48:18 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B901B0
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:48:16 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-59bebd5bdadso179623857b3.0
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696020495; x=1696625295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PB3in7uQxQJMooXEXWpiBaHwk+ekocGtELm1zz7ac4=;
        b=U+3jJ0gKkYUho3gGmo88xldu9TJkA1CeWbLN6HTCIqW5mV1hQqFWK0XqN3lvN+ZMed
         /03R+MVkn/T25onIUeUtupXjNBoRNrZad4lqXb8xl5FdLo6ryTLVF9sCvD2SVPqZO5MN
         DvtFj4+5tFKF6OXQp6jzMKSOEV47nVCVnGqyFVjbOIbFksJQeyciKt+uKG53N6FZ0/iM
         GDGifjx7/jNpVpPguiJqoN7a+dkqrlYPuf7EQIYEfi0TgRtbg2QkFTOyMOb2/OsTw5+M
         DUhtfzEqqOyDKFmrVCw9W9Cjzea+6qYXomi4zNsvmCUXpnUAhozJ7r3qkw5bRhz06pty
         l21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696020495; x=1696625295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PB3in7uQxQJMooXEXWpiBaHwk+ekocGtELm1zz7ac4=;
        b=vazKli43w5lGtcbMCMk7fz4uziUcpzdbeflgVKyBsS0JKh9HCd8qb78mCuRhON1AjL
         6qRB3+AUycZW7+U0u3TyyThKrRNZAGNg4roXwx1vuj5YvRr1vl/KXJIpOhJVTo9mYEiu
         qCR+iC55gTOgIU4A4GjZ791aOlL+pkFBfdTxkXmk8H7Yu41Lf6WbHYsw7fdu8Q6eqHg2
         ovAdEgbdc8CYEd8Ra617VNsuVnE2wnwPZcTIB70EE8Ob4WC2u9QKEz8T43gW6aogEevQ
         AxM+GYPoRx26qfMoNeg9p+gt4cTCcXIUPWHW1uTnM/uAxvBGM1CiaF61+wXPjKF/Xl2/
         3utA==
X-Gm-Message-State: AOJu0Yw4UlLNkzUEO8jJS+74KP6xDZXeAymXRSjCU/QGQCtUK0trloNm
	P91yYmfYwJXFD9TdEvma0ojYovATj7UeL1gE95tOeQ==
X-Google-Smtp-Source: AGHT+IGhNuagYdzoQaqD/8H7vq+7TA/IEUrISt5AV9Vh1CFU389coOm1p2xo8o1X5Amvawa/yVVBQqfrtYEIKvx1fl4=
X-Received: by 2002:a05:690c:f8e:b0:5a2:4fd3:d05 with SMTP id
 df14-20020a05690c0f8e00b005a24fd30d05mr2158753ywb.31.1696020495343; Fri, 29
 Sep 2023 13:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr> <20230929-pxa-gpio-v3-2-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-2-af8d5e5d1f34@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 22:48:04 +0200
Message-ID: <CACRpkdbDVLZBku4VYK98VNDB5qdd-O5XtZsynT+d4MRf96ExXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Duje,

thanks for your patch!

On Fri, Sep 29, 2023 at 3:15=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for configuring
> its two onboard LEDs.
>
> Convert them to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
(...)
> +       .table =3D {
> +               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, =
0,
> +                               GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, 1=
,
> +                               GPIO_ACTIVE_HIGH),

This looks right!

> +       gpiod_add_lookup_table(&spitz_led_gpio_table);
> +       spitz_gpio_leds[0].gpiod =3D gpiod_get_index(&spitz_led_device.de=
v,
> +                       NULL, 0, GPIOD_ASIS);
> +       spitz_gpio_leds[1].gpiod =3D gpiod_get_index(&spitz_led_device.de=
v,
> +                       NULL, 1, GPIOD_ASIS);
>         platform_device_register(&spitz_led_device);

I missed this before, sorry.

This will probably not work. You need to register the spitz_led_device
first, then
you can get the gpiod:s.

The lookup will use the device name to locate the device, and if the device
isn't there it can't be found.

Yours,
Linus Walleij

