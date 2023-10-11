Return-Path: <linux-usb+bounces-1480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B987C5843
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 17:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264D11C20E26
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2369208CC;
	Wed, 11 Oct 2023 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XZfm5mX2"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E12031D
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 15:40:48 +0000 (UTC)
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722118F
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 08:40:46 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-45600aceffbso2715239137.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 08:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697038845; x=1697643645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiqkmLVKop1bY7kTu5d76rBX8seKJtFxmVTzPnLP1bo=;
        b=XZfm5mX20l7kN7XURvmKfywMsDFkQaUNiuQRtjomgY82Y61T6/jK/U/LCOeVdgnv1G
         WvKVC01KnBcfUy7xXklqmPQma9i+tgQTth5ng2gjEDeKAR923l7PzOPwkE5/qTQ5asor
         Jt3zUOSDULyfDXfSKTWbf8aNTMvOBrbr6ktcXVaKTvLBNg2JnKWNprl2o4EY74A5L1Vg
         NO3+t/gNiApPoe18Q/tj+6w7eDNBTH2o2sPPrR3G3q91+H5WslKqx0plRHNWzHT8ZScy
         iWBUpP7iStCNgSFMgrWYU2kykL8v+SSUPm1UlGssmZVfUzYWXOEVLuXq7QB9LIutKMvm
         W2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038845; x=1697643645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiqkmLVKop1bY7kTu5d76rBX8seKJtFxmVTzPnLP1bo=;
        b=JJH7gRJJQKqaoeydPiAJwKbz4QNgu0js3zgiqE8JwhmAhbVsAUYwcv34gdd1wbEZPU
         S4FoHnSYpo7q7+ABn0bdGmnYw9xLqcCR1tzLnWc1sa0J85otnIFlZLVvXB4BwB3y6sjN
         DAcTjOsnW8V85aQYEvZbNmwhGsUUloGl8o7DMo0i6Zu3xZSZEZH0jQ8wuBijanhhXrdX
         +eM/oJWddQGnglhA7PRPEmCcES81LSP9mPoL+WyV9zb0ialc/UrrrssaMggWMfQBARV6
         7w1Xd5DeaklG3j9zgFtSSaHLiCD4aUloobo/Xr1/L0fkl16ne2PIm3mumC1xe977XmsN
         MPyA==
X-Gm-Message-State: AOJu0YzBwJFWOKa5zzQ9sX/29Zr3Rt2mB8lKOa0voMn4uhv2yb6UpPx/
	+aZCNW7OzUjENoQOXXoCp7DqQbW2FbqqECVQ9AiTgA==
X-Google-Smtp-Source: AGHT+IG5JPt7jU/kX+X7eDlJt7BFoHK21OdgrQOLlEuTAOd7ghzmyiZ7IZjjbLxUGh+HsuIIZJ+c5yN5NRQaFOz0b9o=
X-Received: by 2002:a67:b908:0:b0:452:5c6d:78c9 with SMTP id
 q8-20020a67b908000000b004525c6d78c9mr20597977vsn.12.1697038845467; Wed, 11
 Oct 2023 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231011-pxa-gpio-v8-0-eed08a0fcac8@skole.hr> <20231011-pxa-gpio-v8-2-eed08a0fcac8@skole.hr>
 <CAMRc=McWj1RHw-um2OcCpkToxXg6R63vLGTGfMTFiMSr4WXkJg@mail.gmail.com> <5740986.DvuYhMxLoT@radijator>
In-Reply-To: <5740986.DvuYhMxLoT@radijator>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Oct 2023 17:40:34 +0200
Message-ID: <CAMRc=MczBWwY96pkn1j5-EGK6ibrH3s12R_4Y4+OfDJWE4WbJw@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 5:17=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:
>
> On Wednesday, October 11, 2023 4:21:39 PM CEST Bartosz Golaszewski wrote:
> > Which driver consumes these GPIOs? Doesn't it need any conversion?
>
> That is drivers/leds/leds-gpio.c which has already been converted to the
> descriptor API way back in 5c51277a9aba ("leds: leds-gpio: Add support fo=
r
> GPIO descriptors").
>
> Regards,
> Duje
>
>
>

Perfect. In that case:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

