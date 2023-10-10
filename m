Return-Path: <linux-usb+bounces-1384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED557C40A0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 22:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58974281E2B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 20:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D143029CF9;
	Tue, 10 Oct 2023 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYRDHubk"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68CC2745F
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 20:04:46 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766ABD56
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 13:04:27 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7af52ee31so22095267b3.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696968266; x=1697573066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dsgx0xQPge+9HmU8GeSr2i19e9kEWopqk+L20TkvvHU=;
        b=jYRDHubkHHeppyz50JJbbaZ8vgaSUrCsB5PS5zWtcfTY0UmBwGsKq1Xl0sY6zrhQqg
         O2u01L10tDfCLqUokrv372DGqDCMM/wrwEbQ3zHLml30+JXdWaIlqBTyEdsmgeniEnbq
         oEvIVjtpLK0LmAse6TsnBEbAjc2MZNMW31B5tymVrnYpyqHLq7hunLvl4lD4Jauhg4Px
         scOpNYWhfEVmbaJ5s1dqQcyrbAlc4UBGUrhEpIm/tQkKI7P/Qk8WNphImqdUS1IsP5xA
         jBL7dntbchvV7YlpdYsSkMsaiMsXn/wrZ6tTFkHMk0CevyRr5MXns8TW530aFsH5oMdD
         HtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696968266; x=1697573066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dsgx0xQPge+9HmU8GeSr2i19e9kEWopqk+L20TkvvHU=;
        b=m0O+rhKihmaWcpvOYKMR9WuKNefzlT1x1mO1VbMyKlVk1OPiAjENnDGep8vrrKwnuy
         3p3WGa0m0MB33NmLd51Vujbg2DvqXnuvch6YR08Q0HHEK5h/BFKYCh+eYtng/Jh1CBk2
         7W7XwloPWv/dsAkGAA8l6pwp8g9wxh2kni2hz2HoRM6cALMfYZu94kAdheEky5Hx13Il
         iEqFq845UmEE/6UZt9iMiCvzW1qqDjHrUSBqkMEOL65SxYMoHb6B3+HQzDZbIdRKhUVk
         blREXCaUX8I3DFjghLa8h676EZBXnErFd5cHS9q7ntLQUXiMA1CYG+TcJhbDQNJVQWtj
         QpXQ==
X-Gm-Message-State: AOJu0Yx+UsUNEsHbWQJpukkz+Ma84RHhkk+1Qi0YzJg3V+I1RWIVbEn9
	p+O9LnlIWq/zTGRcchpeiWrHq9NgnL73MNwGOrv/yA==
X-Google-Smtp-Source: AGHT+IGzom/ReBeggPYaQh3ululPlpooeQvd3UU+g9vhHJOk+VetQr2sXUXYcWmIJ7V4FJosqHhUU7LLH1jqvS0oyO0=
X-Received: by 2002:a81:b71f:0:b0:5a7:aa83:9fb with SMTP id
 v31-20020a81b71f000000b005a7aa8309fbmr4756178ywh.0.1696968266581; Tue, 10 Oct
 2023 13:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009-pxa-gpio-v7-0-c8f5f403e856@skole.hr> <20231009-pxa-gpio-v7-2-c8f5f403e856@skole.hr>
 <CAMRc=Mc7=E9bMQgiUM8qqk7UD4+exhJZqw2DucTcsnqHcttR3Q@mail.gmail.com>
 <12313687.O9o76ZdvQC@radijator> <CAMRc=MdWYNmBkJ6Nw6V_FzJKQw--g02tjLSztMYW_atNhisVpw@mail.gmail.com>
In-Reply-To: <CAMRc=MdWYNmBkJ6Nw6V_FzJKQw--g02tjLSztMYW_atNhisVpw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 22:04:14 +0200
Message-ID: <CACRpkda4ZeQ8eYKqXBR7XmWj9jJF58C+PLeRWqx2m7aSf2FWQw@mail.gmail.com>
Subject: Re: [PATCH RFT v7 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 7:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> It doesn't seem like anyone is using these GPIOs once they're
> requested? Wouldn't the above definitios be analogous to:
>
> GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, GPIO_ACTIVE_HIGH, GPIOD=
_ASIS)
> GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, GPIO_ACTIVE_HIGH, GPIOD_=
ASIS)

They are used:
+       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
+       spitz_gpio_leds[1].gpiod =3D leds->desc[1];

The descriptors are passed to the leds-gpio driver.

But wait: no.

This whole thing:

+static struct gpio_descs *leds;
+
(...)
+       leds =3D gpiod_get_array_optional(&spitz_led_device.dev,
+                       NULL, GPIOD_ASIS);
+       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
+       spitz_gpio_leds[1].gpiod =3D leds->desc[1];

Just delete all that.

The leds-gpio driver will request and use the lines.

It was just so unorthodox that I missed it. Adding the descriptor
table is enough.

Yours,
Linus Walleij

