Return-Path: <linux-usb+bounces-1379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B780C7C02D9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 19:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CD31C20D23
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 17:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6220F38DEA;
	Tue, 10 Oct 2023 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D0BZI28A"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719A19454
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 17:39:59 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6148DCF
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 10:39:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5056ca2b6d1so86078e87.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696959595; x=1697564395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4xZpqEwWtfUV1JgIse7nmPsmTUQIv/zlM1eTbPf9Zc=;
        b=D0BZI28AAuxlKIwt2Y0k5v38edjDTKmuGVqY4uy/m17vCEsvmGEbcvOwDu87+7Zb9V
         0D6uCHCzHrBQJrLK/5KTiArgrqq+0ibHB9va84XZdmlUDh9QtD5GZM4bFuHEeVU9MRMU
         9W8ZS1kPKpa5LoCDSDqj99t1Rb/Oxi4oGfL5BneZuZ+Qtoh1p8Wo7FXn/BNfu4j7H6U1
         dCFQrt9mb7tM9LIVgnURnMzgEAwYMNJvgBPZkR7CP6Ym7oBY4JopAmdrGIsJ2rrCq3fz
         qI+hyUqFE8OS+ZmLzq51i92wjxsPjSMs0LSIA8Ahuer7gRileC0Ia2p9cg2TsMZmWUY3
         34Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696959595; x=1697564395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4xZpqEwWtfUV1JgIse7nmPsmTUQIv/zlM1eTbPf9Zc=;
        b=EzdTqEB2sl9q0gz4ktSM0nyzh/MGK/N5bafXQc0v7EPQVr1V5uv58d9QDD1+FVw5sK
         q3eay3qpiDx7UnTglJsliFieGj/R19SxrC9noDYPZ2QDhFY0SzvyxMqEUSeBIsHdETEh
         KqrMZCMfDmut2VTvfdfOOHrcpXXqV5UOaia+V5zTeVSbe/uYbDqMjj55yDYgS7kwCfnD
         CZPycvr5thGd0jvT9/ZxknqftWt6b8MSCMVcnU7l4SOMzAE+bKtMySB9Cy6uNr49nbpf
         FC/oCy31tzf3SGKAa6rmDhNlo6oi4IlhP03RDfRN+m6XaO3Hh3X9M7aKhw30aCl3BvMo
         NVhg==
X-Gm-Message-State: AOJu0YyqEHh1eFsomkyLnN+EyTOLOA+Vzg6+hx2wNJ4URq9E2kWGwDVp
	7yEmdvXN6f13Wa/hezB+ZrZE6VwTjiIjGxXMj/EDuQ==
X-Google-Smtp-Source: AGHT+IGSK51KyaDcnsl41rah8ft25iKVz+wl1YCpS4m2RF+QtVWHG/EMQEczDjGuYeiEzvYsApMjlsD9ch7wMtde8XA=
X-Received: by 2002:a05:6512:3183:b0:503:2879:567 with SMTP id
 i3-20020a056512318300b0050328790567mr13675359lfe.28.1696959595193; Tue, 10
 Oct 2023 10:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009-pxa-gpio-v7-0-c8f5f403e856@skole.hr> <20231009-pxa-gpio-v7-2-c8f5f403e856@skole.hr>
 <CAMRc=Mc7=E9bMQgiUM8qqk7UD4+exhJZqw2DucTcsnqHcttR3Q@mail.gmail.com> <12313687.O9o76ZdvQC@radijator>
In-Reply-To: <12313687.O9o76ZdvQC@radijator>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Oct 2023 19:39:43 +0200
Message-ID: <CAMRc=MdWYNmBkJ6Nw6V_FzJKQw--g02tjLSztMYW_atNhisVpw@mail.gmail.com>
Subject: Re: [PATCH RFT v7 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
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

On Tue, Oct 10, 2023 at 6:33=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:
>
> On Tuesday, October 10, 2023 1:12:05 PM CEST Bartosz Golaszewski wrote:
> > Gah! I should have noticed this earlier but this is a perfect
> > candidate for using hogs. Can you use gpiod_add_hogs() from
> > linux/gpio/machine.h instead? That would save you having the lookup
> > and the static leds descriptor array.
>
> From what I can tell, the hogs keep a certain pin at a certain state as l=
ong
> as the machine is powered on. Is this really what we want to do with LEDs=
 or
> am I missing something?
>

It doesn't seem like anyone is using these GPIOs once they're
requested? Wouldn't the above definitios be analogous to:

GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, GPIO_ACTIVE_HIGH, GPIOD_A=
SIS)
GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, GPIO_ACTIVE_HIGH, GPIOD_AS=
IS)

?

Bart

