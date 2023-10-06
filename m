Return-Path: <linux-usb+bounces-1175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB307BB1C3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 08:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA0E28216F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 06:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84F053B4;
	Fri,  6 Oct 2023 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NugpWs80"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF569EA1
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 06:51:01 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478E7E4
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 23:51:00 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7b07719089aso1177970241.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696575059; x=1697179859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ4Goyu7ScewZS3ePtJeqq+qlPtIo29EJK50i7ykfyg=;
        b=NugpWs80YfpQm0gX9QQSl/jTzjsEeeDoDC7atBGiyaRRlaq7KMT+M1NJd8MR4LnIsb
         7USq7TovPY32db0GqP1dqHXoKLi/oD/WOGdh/ZS6fhAjmUu/HRpbntwYtDCgLO3fWw9H
         m7bqHkjHHb2puvhbsmywd8wlIWktX3+VizwgF6KZ9olTcOl+mn7HRlk7TOvkBXXfr0lR
         /S1qRNG7YdAERyKzp+3IJOEjPdRVN3kX/glSTifaw1Ql/TUOH/EEMhlQ6+dVo/63mhRw
         I6I26yr28j+Q5yA9LyIsCrx2sT7M0xzHX0d+H6G85SDv474xBMz5CoTgLapu+/Or2EGu
         ftHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696575059; x=1697179859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ4Goyu7ScewZS3ePtJeqq+qlPtIo29EJK50i7ykfyg=;
        b=Ppf4GGclWPonNLcyUu7Iaapr9E3peFCg82RFei3RwlycnqXdGQrSewxMHQL0ojxyfy
         c5k8UW+eIDAgsMJRM744a+rBDvGnJvocRV2PsjruwDn4fmD32F0RwEGV8XCuJvzlDmXR
         BJibF81IxV/uDRnzu9Xn+SZbVmPzoBt1n+RIwiwZm3YxQYsKnteJaETlOxDkUAk0cdVD
         hCY9qKPoZskmFpp2ZYnQBITOeC0A/FPoroxOYsnWb5mZXsntXhtvWjiJkzjjSJskV2I7
         iozA7u39bLXTCWMxNYTluCO9V25AIxM5+xXZGMRfL6UYsm1AvUOZdTuT36fr6nchg+zA
         icFw==
X-Gm-Message-State: AOJu0Yw6lmU9RC7zRamMGhUAFqis6xV8FATnFsZFsb4ZvcBIvmLJOo8B
	U0/SnVhvnRqAOBwaGCLBUHhkbY8CeyVt1/h9OViQqA==
X-Google-Smtp-Source: AGHT+IHpGkFbSMZRIWCm82duszP87XhU90G/l918j+LqyVxw/UR9sNKWyys180NpHwrfHj6hXa1rjT5Gk+Z9W159ixU=
X-Received: by 2002:a1f:9889:0:b0:49d:2a13:58fc with SMTP id
 a131-20020a1f9889000000b0049d2a1358fcmr1796623vke.2.1696575059288; Thu, 05
 Oct 2023 23:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-2-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-2-d99ae6fceea8@skole.hr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 6 Oct 2023 08:50:47 +0200
Message-ID: <CAMRc=Mf9x-Rui32ZYqcxhV5vA=r3mCLxqySs2pwNC6uaVmL=0w@mail.gmail.com>
Subject: Re: [PATCH RFC v5 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
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

On Wed, Oct 4, 2023 at 4:56=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
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
>  arch/arm/mach-pxa/spitz.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index 535e2b2e997b..b6a4085e9fb0 100644
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
> @@ -480,7 +489,12 @@ static struct platform_device spitz_led_device =3D {
>
>  static void __init spitz_leds_init(void)
>  {
> +       gpiod_add_lookup_table(&spitz_led_gpio_table);
>         platform_device_register(&spitz_led_device);
> +       spitz_gpio_leds[0].gpiod =3D gpiod_get_index(&spitz_led_device.de=
v,
> +                       NULL, 0, GPIOD_ASIS);
> +       spitz_gpio_leds[1].gpiod =3D gpiod_get_index(&spitz_led_device.de=
v,
> +                       NULL, 1, GPIOD_ASIS);

You're not using the con_id you specified in the lookup table. How
about using gpiod_get_array()?

Bart

>  }
>  #else
>  static inline void spitz_leds_init(void) {}
>
> --
> 2.42.0
>
>

