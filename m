Return-Path: <linux-usb+bounces-1211-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C067BBDB4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 19:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9170D1C209AF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 17:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113F230FBE;
	Fri,  6 Oct 2023 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kdO3qI33"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044061865D
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 17:25:46 +0000 (UTC)
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37344D6
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 10:25:44 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7abda795363so999867241.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 10:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696613143; x=1697217943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dfqdpiaz02xN8PLTPu9pWuaYxQEaAnQY6icekWcwU9s=;
        b=kdO3qI33aPBkfgeK5AxV6UIAGYQ1iYuJR54B9k5s+ZHkyFeEDCgfxeh7hdbtm6iygD
         Y/t23b7Fypy9mm8aZmDVgP17hKL0pqqgOLPsPc+GMJ2NFfZhY+e4YwvmuimYUA/pXG0f
         LXlTZJaE31a6+z2D0yI/DKpdF++j1fY9+QJv5U5zD7/uaA9ym24Zc11/fk/mhyQlWrpb
         Y6CXx+HrmdIDYfrTxdGvo8mX+g7sLV1nOaXru2XUDMFrV338/278UqQq4reprYiyVtHv
         WV/AKa12opu6HcQYsVH7w976I2dzt9YSwcJWklKJpI0BOkxFsZMVpQNm8iOOiVDUNFbL
         eziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696613143; x=1697217943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dfqdpiaz02xN8PLTPu9pWuaYxQEaAnQY6icekWcwU9s=;
        b=vX0VPOAXPn4rzSmX9sLn1BRfEQTG81KeSu7Zn+WAJCVr5upajdIH6yH1x+UI/dyMPR
         AKI9EhiElIIFBm9dVuv2ix/qS5BttoLB1HvIQo55jX6x39YQ1harCRcGVKFVDmegfLl4
         mERCj6JbihkCVPwrnlTQrLdtWCKevSdhEe4xa+oIlT6d437cV6xx1qvRITqdVVLzNlgz
         Pl/E6isJAYH/9e1lJUAwjElidnzgnLG5BN9pIzkCV5+4bhoU9jJ4Ll+6mWWUQO6XQG5p
         fACD4eq2vP6PDto43GMTmKguFXKzMZPZLr0H1wHO0fJ86nUCLYyd2JayjgyJz5xAvZjd
         MDKg==
X-Gm-Message-State: AOJu0YyxNDE6UXMvmeL0/7vvTPo0PGV0vHxoT3Cp9J3iAe1ETfaqM4kz
	13IbM7vkd+c0YjBihpChFUxedIZgSjIgMv7P9g9zqg==
X-Google-Smtp-Source: AGHT+IFAfquioQvCUi1yrJicx4juipJtkOOWOyEzXNLtXeXDDfkDZKDvRvHpEr2iQgkuqnzhVnkDvAAn+uh8ePAxBsg=
X-Received: by 2002:a1f:4cc7:0:b0:493:7c76:bbac with SMTP id
 z190-20020a1f4cc7000000b004937c76bbacmr7557435vka.2.1696613143171; Fri, 06
 Oct 2023 10:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006-pxa-gpio-v6-0-981b4910d599@skole.hr> <20231006-pxa-gpio-v6-2-981b4910d599@skole.hr>
In-Reply-To: <20231006-pxa-gpio-v6-2-981b4910d599@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Oct 2023 19:25:32 +0200
Message-ID: <CAMRc=McaMx-pNb__8BhU7zj9D=3FERm0BzSbQebS+BQew=ZTbA@mail.gmail.com>
Subject: Re: [PATCH RFT v6 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 6, 2023 at 3:45=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for configuring
> its two onboard LEDs.
>
> Convert them to use the GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm/mach-pxa/spitz.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index 535e2b2e997b..1fb4102ea39e 100644
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
> @@ -480,7 +489,14 @@ static struct platform_device spitz_led_device =3D {
>
>  static void __init spitz_leds_init(void)
>  {
> +       struct gpio_descs *leds;

This should be global, otherwise KASAN will complain.

Bart

> +
> +       gpiod_add_lookup_table(&spitz_led_gpio_table);
>         platform_device_register(&spitz_led_device);
> +       leds =3D gpiod_get_array_optional(&spitz_led_device.dev,
> +                       NULL, GPIOD_ASIS);
> +       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
> +       spitz_gpio_leds[1].gpiod =3D leds->desc[1];
>  }
>  #else
>  static inline void spitz_leds_init(void) {}
>
> --
> 2.42.0
>
>

