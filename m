Return-Path: <linux-usb+bounces-902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7927B4CBF
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 09:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2D2A1281A3A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 07:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15511844;
	Mon,  2 Oct 2023 07:43:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E811C01
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 07:43:08 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492B7BD
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 00:43:04 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7abda795363so5067597241.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696232583; x=1696837383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+VAUc4E+Y21AdLpQo4ZI38h7A9OH7Ux8a8Ek8zfCE8=;
        b=qplXjsWHxVZXvDUoPJc+ruqcd/LRX1kKkgII1SKDn4FvThkhEGf2Lf+QfX+2O8ktTz
         1MCoMyNWO3JAqO5k8gXrR2Z8fxyNdIypQmpF8NIAq77zRyi9mCnp2XJlzQbXXfKbYdyK
         fmNqkOT630jLVqHNOphKHctCSwPvlSMuaqV4ygHW7tGsLgYJZF+Johncih+QN79x0Dcz
         ztW90zVVfTG3md3HZ7jCWnhjwpjs/3lCqEV2PG+hwIm6IA6xnINdPFMssFMLDQH/lJzr
         /gdfzQrV57+EgAP0Tl/KlCUWQ6aXStJsA4IdA4bYCPbj9hrMkniMByf4dGRQaC/JQkVN
         oPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232583; x=1696837383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+VAUc4E+Y21AdLpQo4ZI38h7A9OH7Ux8a8Ek8zfCE8=;
        b=X3PxazxGWANHO+Kc1dMjvjrtWPWRUXFZSXELQIdd0VI1pJjq7y6KA2mqeRFW6VQaF/
         myXpTMxRsYv5UgyV2zPB7GeSFll5EYtiEn3RXHSTF7xh4XAFMvK7vNMyfZn1rdULMXR0
         EUDiKUPO/FINregMMDm8q1tiqXwk9D51zI0ao2R8BuDHRaZN5DS1r3c000fx2wp2jI4S
         cGvwN3JcNqh6qieQFD/Ni+rMQnEFrqnJPvU1k1rHgYsmrZReeqm/6lqk0oHBdJyVtASS
         rRb3cwS74JA5EkRS+GJDjH4igYuPImP1l07I0D75VnPRvOXKjsvpLKIo3uvdCjUafK9B
         TkJA==
X-Gm-Message-State: AOJu0Yz8/TplrvqQLoDWubuSYxUyUhSL29aDXuXEDwA5x1/FA9fjMy5Q
	tCdGhV0tkQKD3J/Hf3OQ1POLcXWc+uwHR+LTtbR00Nj4nCmW+9fW
X-Google-Smtp-Source: AGHT+IFmS8Y8o10/iX1hxTsbAjkfklmWIjUvA2ZCS4Kabcn+Zm8qj4rKrioQbkwgn36XGL+DicPyDjqH3RTB3brkDMI=
X-Received: by 2002:a67:cfc6:0:b0:452:7795:7c93 with SMTP id
 h6-20020a67cfc6000000b0045277957c93mr9731589vsm.29.1696232583363; Mon, 02 Oct
 2023 00:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr> <20231001-pxa-gpio-v4-5-0f3b975e6ed5@skole.hr>
In-Reply-To: <20231001-pxa-gpio-v4-5-0f3b975e6ed5@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Oct 2023 09:42:52 +0200
Message-ID: <CAMRc=MdHv0YxSowMnqJ8xG1_w8dwTWVJV1K0b1jgectPTbOheQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 5/6] ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
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

On Sun, Oct 1, 2023 at 4:13=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
> device.
>
> Convert it to use the GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm/mach-pxa/gumstix.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
> index c9f0f62187bd..14e1b9274d7a 100644
> --- a/arch/arm/mach-pxa/gumstix.c
> +++ b/arch/arm/mach-pxa/gumstix.c
> @@ -20,8 +20,8 @@
>  #include <linux/delay.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
> -#include <linux/gpio.h>
>  #include <linux/err.h>
>  #include <linux/clk.h>
>
> @@ -129,6 +129,9 @@ static void gumstix_udc_init(void)
>  #endif
>
>  #ifdef CONFIG_BT
> +GPIO_LOOKUP_SINGLE(gumstix_bt_gpio_table, "pxa2xx-uart.1", "pxa-gpio",
> +               GPIO_GUMSTIX_BTRESET, "BTRST", GPIO_ACTIVE_LOW);
> +
>  /* Normally, the bootloader would have enabled this 32kHz clock but many
>  ** boards still have u-boot 1.1.4 so we check if it has been turned on a=
nd
>  ** if not, we turn it on with a warning message. */
> @@ -153,24 +156,23 @@ static void gumstix_setup_bt_clock(void)
>
>  static void __init gumstix_bluetooth_init(void)
>  {
> -       int err;
> +       struct gpio_desc *desc;
> +
> +       gpiod_add_lookup_table(&gumstix_bt_gpio_table);
>
>         gumstix_setup_bt_clock();
>
> -       err =3D gpio_request(GPIO_GUMSTIX_BTRESET, "BTRST");
> -       if (err) {
> +       desc =3D gpiod_get(&pxa_device_btuart.dev, "BTRST", GPIOD_OUT_HIG=
H);
> +       if (IS_ERR(desc)) {
>                 pr_err("gumstix: failed request gpio for bluetooth reset\=
n");
>                 return;
>         }
>
> -       err =3D gpio_direction_output(GPIO_GUMSTIX_BTRESET, 1);
> -       if (err) {
> -               pr_err("gumstix: can't reset bluetooth\n");
> -               return;
> -       }
> -       gpio_set_value(GPIO_GUMSTIX_BTRESET, 0);
> +       gpiod_set_value(desc, 0);
>         udelay(100);
> -       gpio_set_value(GPIO_GUMSTIX_BTRESET, 1);
> +       gpiod_set_value(desc, 1);
> +
> +       gpiod_put(desc);

This changes the way this code works. You release the descriptor here,
it returns to the driver and can be re-requested by someone else. Its
value is also not guaranteed to remain as "active". Is this what you
want?

Bart

>  }
>  #else
>  static void gumstix_bluetooth_init(void)
>
> --
> 2.42.0
>
>

