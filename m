Return-Path: <linux-usb+bounces-1476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DEF7C56AF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 16:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC83B282639
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 14:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCCA20330;
	Wed, 11 Oct 2023 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BshUQzXu"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE2B20325
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 14:21:53 +0000 (UTC)
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC269E
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 07:21:51 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4a403fdebedso26647e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697034110; x=1697638910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiBaX2TqUvTbj5wkDIil5VnOSe22zVgH7ek2DB7rIck=;
        b=BshUQzXuorFbyaypct1b3NVCZbJo35Z7sXP3v85fdlBgL303Xlz+nZOMmSaFf4KSP0
         dwZxn5c77qBpGA8AkSvV43ISUnIXa1p8INqc4nMjbgsN2Lk7RcDRsuwCWA5tH5qQX4f1
         CZaA8aYD8m8eEP3JnDo168tIXcoR5VIuwlIq6/s99WQJDwLdrtK9MR0FlMMT+DAhwCns
         KZEEUXy3IOEk1hfz2t6A4+qrzGO/HoWAkSlEnYR4BNIA/lM0mfTgfPVH2hbQq6b8SlZi
         sgD6AgaZifxmrzORJndui2RgLQUiwpRVJmCW+0iXx9S4hxyIaENO4y8zTkJreT4TKKbV
         6Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034110; x=1697638910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiBaX2TqUvTbj5wkDIil5VnOSe22zVgH7ek2DB7rIck=;
        b=D/fsMgAz8YAc04Dvpr/8xmKbajKOMRLbJfiJ+gExcZzb8dvtIMgQV+8aRcwxEkz69l
         3g7QXshZVtxIK+Rowno82+kj80q74KV5Jklk8VE/0UiTaUBIBJGopnxNOgDBYsIm70W9
         YydSdhalL9Qq/xuGF/7FlsogMZtPQSPh4BSKW4UJFR07fEh8fxxLA2vOGk0RNwq4ISjF
         VrPfHnc1yPwtDTusDA/jo262ka5CNOp8pDSTJFThgibQlSkxZzKyTNkQXYEh9eVJ42uO
         qaTBWjr/HdrGoJwhsuJGFqDbGOCBO131TVrtW/Ac27Ue86A+qO4pWXT86l35ptHxcZOj
         V9UQ==
X-Gm-Message-State: AOJu0Yy5w7IT+igyLCSMrUBjWqw/Ju6NRjlHBsSiol8GGHQG4DICWYhD
	v+3GhRXJxxerSRx7t3rvIq6reJQwKhHGtYcHXkNP+g==
X-Google-Smtp-Source: AGHT+IENa5Kj8B8iGxM1cvH1JGwfG8NPGYjZ61KooMljJWwbckAx6atfjzUxdWTdEOyTIL9RTCxfnz11RHelb5Y3its=
X-Received: by 2002:a1f:cbc5:0:b0:49b:adce:e2d1 with SMTP id
 b188-20020a1fcbc5000000b0049badcee2d1mr17554689vkg.10.1697034110430; Wed, 11
 Oct 2023 07:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231011-pxa-gpio-v8-0-eed08a0fcac8@skole.hr> <20231011-pxa-gpio-v8-2-eed08a0fcac8@skole.hr>
In-Reply-To: <20231011-pxa-gpio-v8-2-eed08a0fcac8@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Oct 2023 16:21:39 +0200
Message-ID: <CAMRc=McWj1RHw-um2OcCpkToxXg6R63vLGTGfMTFiMSr4WXkJg@mail.gmail.com>
Subject: Re: [PATCH RFT v8 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
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

On Wed, Oct 11, 2023 at 3:24=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for configuring
> its two onboard LEDs.
>
> Convert them to use the GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm/mach-pxa/spitz.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index 535e2b2e997b..9efd603c715a 100644
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@ -452,16 +452,25 @@ static inline void spitz_keys_init(void) {}
>   * LEDs
>   ***********************************************************************=
*******/
>  #if defined(CONFIG_LEDS_GPIO) || defined(CONFIG_LEDS_GPIO_MODULE)
> +static struct gpiod_lookup_table spitz_led_gpio_table =3D {
> +       .dev_id =3D "leds-gpio",
> +       .table =3D {
> +               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, =
0,
> +                               GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, 1=
,
> +                               GPIO_ACTIVE_HIGH),
> +               { }
> +       }
> +};
> +
>  static struct gpio_led spitz_gpio_leds[] =3D {
>         {
>                 .name                   =3D "spitz:amber:charge",
>                 .default_trigger        =3D "sharpsl-charge",
> -               .gpio                   =3D SPITZ_GPIO_LED_ORANGE,
>         },
>         {
>                 .name                   =3D "spitz:green:hddactivity",
>                 .default_trigger        =3D "disk-activity",
> -               .gpio                   =3D SPITZ_GPIO_LED_GREEN,
>         },
>  };
>
> @@ -480,6 +489,7 @@ static struct platform_device spitz_led_device =3D {
>
>  static void __init spitz_leds_init(void)
>  {
> +       gpiod_add_lookup_table(&spitz_led_gpio_table);
>         platform_device_register(&spitz_led_device);
>  }
>  #else
>
> --
> 2.42.0
>
>

Which driver consumes these GPIOs? Doesn't it need any conversion?

Bart

