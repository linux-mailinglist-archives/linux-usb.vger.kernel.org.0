Return-Path: <linux-usb+bounces-1436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51247C4C75
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA23C1C20E5D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D9219BAF;
	Wed, 11 Oct 2023 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jtSdGqV2"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0799199DB
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 07:59:27 +0000 (UTC)
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D70E91
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 00:59:26 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7b6043d0bbeso437864241.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697011165; x=1697615965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T+G3IiEpAugHoIlaD3hRukPzEGsZANvnqJPVq5ffG8=;
        b=jtSdGqV2QaB1dOZo3W8RC2BtHpnoWBXPFoZBsrbiBrX+lRAozmlcb3QzUwCgAUIVk6
         ELN119v7dd4ks9xxLOu9cTvqgzOt9DWwTEzjsgCGtvHRKY6c2t3UQvmKBLb24ty4q0vh
         NTPbPVe8ciCe+LA2FlYgSTIW6BFZLA9wTUl+//dDA14PSdxc9S24vx9qrovAHpwZD5/y
         GLEwzIdjZqOdk7Ukz51ZHO41UVP7CcxfPQhbefK9ViUlO5eLaUNFkKIvcNMsOgECxKsh
         w8EeLSLrq+zytqqyPzsrqU4c99R4uku5BwHZLtiWcYCzuFHsOSFI6MqfsPicfUdROCSr
         GfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697011165; x=1697615965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T+G3IiEpAugHoIlaD3hRukPzEGsZANvnqJPVq5ffG8=;
        b=tRRaR38OYNovtj0hz1vgsrU2sw9EAcDNBtVciHC74VnipaRcLWWm7P2gFFGeKlP4Up
         KdcHGGMdeMUs0FWBegwVu8XU+9DpCpYpicYPReLCBw8lEX09vzfavtg44gfAAuDUQWQP
         O2djLQnUZKOUPDCtcnlscWFSlCwVFrTZegFQ0MQ8BgjN/Fx3M6zx9LbR9/P94KZzbnli
         VR6r31pwMpBhDAHLRmErOsv9nAL6WfOMEGRPjD9Ff5tu4aiXBka0X5DPrm3Y+22TzgEI
         BEZAeZ5g8PziK8CGq+8Y4/dJd6HAIxqjpDEA4g8u+s03oTimQbRPB3Chtkxe6/QZ96wv
         luWw==
X-Gm-Message-State: AOJu0YwKDtySj/8gOMPEDp+qzxloFCUOrCajmnNGqnqdoKAixWKJSuQu
	YgBplgsuxg5DxDyn/TG9Hl4F3mQxSRV4ZsJ8BK/y5p8t7iXog3vx81w=
X-Google-Smtp-Source: AGHT+IEUbJzy5iOn2Ns9Aln42pFrnXXQ7IdE1abA3Z4713vj8tR+ayKZo6qJyvwJCRhJxXfDbVJASyLhzCqOOBRnH/o=
X-Received: by 2002:a67:f950:0:b0:44e:8c20:a92d with SMTP id
 u16-20020a67f950000000b0044e8c20a92dmr14800228vsq.7.1697011165108; Wed, 11
 Oct 2023 00:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009-pxa-gpio-v7-0-c8f5f403e856@skole.hr> <20231009-pxa-gpio-v7-2-c8f5f403e856@skole.hr>
 <CAMRc=Mc7=E9bMQgiUM8qqk7UD4+exhJZqw2DucTcsnqHcttR3Q@mail.gmail.com>
 <12313687.O9o76ZdvQC@radijator> <CAMRc=MdWYNmBkJ6Nw6V_FzJKQw--g02tjLSztMYW_atNhisVpw@mail.gmail.com>
 <CACRpkda4ZeQ8eYKqXBR7XmWj9jJF58C+PLeRWqx2m7aSf2FWQw@mail.gmail.com>
In-Reply-To: <CACRpkda4ZeQ8eYKqXBR7XmWj9jJF58C+PLeRWqx2m7aSf2FWQw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Oct 2023 09:59:14 +0200
Message-ID: <CAMRc=Mc6ww7Te+JvzW_=+X9Tj_jjKnQaVRJMKgU4zTuXViPxcg@mail.gmail.com>
Subject: Re: [PATCH RFT v7 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 10:04=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, Oct 10, 2023 at 7:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > It doesn't seem like anyone is using these GPIOs once they're
> > requested? Wouldn't the above definitios be analogous to:
> >
> > GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, GPIO_ACTIVE_HIGH, GPI=
OD_ASIS)
> > GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, GPIO_ACTIVE_HIGH, GPIO=
D_ASIS)
>
> They are used:
> +       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
> +       spitz_gpio_leds[1].gpiod =3D leds->desc[1];
>
> The descriptors are passed to the leds-gpio driver.
>
> But wait: no.
>
> This whole thing:
>
> +static struct gpio_descs *leds;
> +
> (...)
> +       leds =3D gpiod_get_array_optional(&spitz_led_device.dev,
> +                       NULL, GPIOD_ASIS);
> +       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
> +       spitz_gpio_leds[1].gpiod =3D leds->desc[1];
>
> Just delete all that.
>
> The leds-gpio driver will request and use the lines.
>
> It was just so unorthodox that I missed it. Adding the descriptor
> table is enough.

Ah, good catch. Your suggestion is of course the correct one.

Bart

>
> Yours,
> Linus Walleij

