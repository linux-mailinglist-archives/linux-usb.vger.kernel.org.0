Return-Path: <linux-usb+bounces-819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B27B3C15
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 23:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id E1874282B9E
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963EE67291;
	Fri, 29 Sep 2023 21:43:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6236669B
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 21:43:29 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF952B7
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 14:43:27 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f4bc88f9fso144475177b3.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696023807; x=1696628607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQswShTuKxxSh5nmMk81ZYZYkK3o9OGcLEs56wp3Irk=;
        b=XcVFnmzR9htXFWTa3c3UFloxs2CJuNsOMg8fjNw5PlhsvNN7lhLI8OxVJeidW4/rKF
         mpG4bF7+FCcXm765vqEfFJoIRXjDS/K1bJBA0vrInrsg+8ClIrG14iAHzE4/sm8S3Ej5
         TigNGS2PIdxqBAISIchrTNLyiA0UCG2PiAw8ElLDbdzLl2Vbl9mo7/MYVTOOEdpWVp3q
         7TXl8h7VbxnKatmMSxXFMUjKptAhvemMhE5kcORyWJPsI7cqng3X99mEvjqM5iHP5D/d
         KpkvF8i1/yPnJX1ufjwzBleHd4A5iZQrOFgrs/Z0BiSju4gPkD3q9W1KT9NZH/gYlU8P
         5uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696023807; x=1696628607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQswShTuKxxSh5nmMk81ZYZYkK3o9OGcLEs56wp3Irk=;
        b=iAFJXIqr71xq8pwz4OFQkG8DGTlETY9Gwed9AX+rI3TjAEbipyuIX53Hmvz9FAUoa1
         F4oSn8pHDI37/mmP7waD6OkaT46MFu6PfJhyTm1jrIw8BBnSSXjSraFw63cGwi49Ftlu
         k/QaFqlEag3C/CL/l01+uD4oykjL1HlVEkQZ5eEGvKYjShdkEA7LvICxXnMBEaeQ4B09
         LYbXhvXD/tO0mCyMNIfdPDMo9U7N0XE4b1GZz4gDFEVtdYckb648j87C2SmgDyxche3y
         RJwZk8tilOvjch3jHd1F5+wm2VmXj0GcqjROWEIl0lO9Hq6z/SOvMQMhMicm7HyKMMQ2
         OGGQ==
X-Gm-Message-State: AOJu0YyvezS0ByrbZAKM5L4rP9uIUuzpdjNQIZlbgZlthhRwaFURkW2Q
	ZEb0W6lJF5/TKAZUBIwHwD2kzMkNWLIVirCPS0Sf4w==
X-Google-Smtp-Source: AGHT+IF+IH5XX3pXSI0Xv1uCS3nzKWoHgIYiA8NwGlFfFyn8QHc4flVJoEqejmqpVOqFHEBmB/sNk00EsZmgPigOA7o=
X-Received: by 2002:a81:6907:0:b0:59b:f899:7bd6 with SMTP id
 e7-20020a816907000000b0059bf8997bd6mr5239914ywc.36.1696023806925; Fri, 29 Sep
 2023 14:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr> <20230929-pxa-gpio-v3-5-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-5-af8d5e5d1f34@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 23:43:15 +0200
Message-ID: <CACRpkdb0HZFGnNm=5NdSJjM1-3kUzLigfnz9Ks-CX8U9a51Zmg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 5/6] ARM: pxa: Convert Spitz hsync to GPIO descriptors
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Duje,

thanks for your patch!

On Fri, Sep 29, 2023 at 3:15=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz still uses the legacy GPIO interface in its
> wait_for_hsync() function.
>
> Convert it to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Overall this looks fine, but can't help but notice:

>  static void spitz_ads7846_wait_for_hsync(void)
>  {
> -       while (gpio_get_value(SPITZ_GPIO_HSYNC))
> +       while (gpiod_get_value(hsync))
>                 cpu_relax();

Waits while the line is high...

> -       while (!gpio_get_value(SPITZ_GPIO_HSYNC))
> +       while (!gpiod_get_value(hsync))
>                 cpu_relax();

Then as it goes low, waits for it to go high again.

So the hsync signal is *active* when it is *low*.

> @@ -543,6 +545,8 @@ static struct gpiod_lookup_table spitz_ads7846_gpio_t=
able =3D {
>         .table =3D {
>                 GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
>                             "pendown", GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_HSYNC,
> +                           "hsync", GPIO_ACTIVE_LOW),

Which is what you appropriately flag it for.

BUT: the signal is now inverted in gpiolib, so the

spitz_ads7846_wait_for_hsync() loops needs to be rewritten
inverted, because the value from gpiod_get_value() now means
"asserted" if high.

/* Wait while de-asserted */
while (!gpiod_get_value(hsync))
                cpu_relax();
/* Wait while asserted */
while (gpiod_get_value(hsync))
                cpu_relax();
return;

Right?

> @@ -622,8 +626,13 @@ static void __init spitz_spi_init(void)
>
>         gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
>         gpiod_add_lookup_table(&spitz_spi_gpio_table);
> +       hsync =3D gpiod_get(NULL, "hsync", GPIOD_IN);

You are getting the gpiod from device NULL which is probably correct
when you do this in the board file.

But the spitz_ads7846_gpio_table where you put the descriptor
is associated with the ads7846 device so this will not work.

You either have to add a one-gpio table just for this, or (better)
move the whole spitz_ads7846_wait_for_hsync() down into the
touchscreen driver instead, so the device driver can (optionally) obtain
this gpio and deal with it. Which is easy because:

[linus@Fecusia linux-nomadik]$ git grep ads7846_platform_data
Documentation/spi/spi-summary.rst:      static struct
ads7846_platform_data ads_info =3D {
arch/arm/mach-pxa/spitz.c:static struct ads7846_platform_data
spitz_ads7846_info =3D {
arch/mips/alchemy/devboards/db1000.c:static struct
ads7846_platform_data db1100_touch_pd =3D {
arch/powerpc/platforms/512x/pdm360ng.c:static struct
ads7846_platform_data pdm360ng_ads7846_pdata =3D {

Only three users in the kernel, and sptiz is the only one using the
void    (*wait_for_sync)(void) callback in ads7846_platform_data!

So delete that callback from ads7846_platform_data in
include/linux/spi/ads7846.h
and augment drivers/input/touchscreen/ads7846.c to get the
GPIO optionally with gpiod_get_optional() from the device,
then copy the code from spitz_ads7846_wait_for_hsync() right
into the driver and make sure it gets called if and only
if the "hsync" gpio exists.

Yours,
Linus Walleij

