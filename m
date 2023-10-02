Return-Path: <linux-usb+bounces-958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 857287B589D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 19:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id D17DD284910
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9741DDDF;
	Mon,  2 Oct 2023 17:10:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B21A73C
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 17:10:00 +0000 (UTC)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D28B3
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 10:09:58 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4526d872941so14928137.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696266597; x=1696871397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4s3u9gzn1fY4vQKJrXTM8R1Ev3FuIqlDuJZ92Kxk4Y=;
        b=ZsAYgIOfMblc0IodGrr3B3ZWhxqMurkYeXj4klpS7u1iuGrNPsb8myNa2Vcn3KAIU8
         s9d6OEScFyeZARlEAiAVGg9XavxpjwWDkLQqtJ35MmgHRr0aqDDIpQMkXnxXWOiBdaSY
         bFCWoOUxY+fpd3JyTiNsTw4+x9ysA80crX1xQ6wibdli4LLpRk5u79hH8Ln87cbqnE01
         yViIH7pqu5TfsnpDsFgxRXLyA1a/MkyXjUJ7EoZA8ooF7T2EsqwJdVJEVms7gshxfKUy
         hugAXwLcEYwRMrT/KE5bwHPJ5NpNreFikZW/3VH6xEnzey2PwCBvj2tS6TO0Up9qinQZ
         2rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696266597; x=1696871397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4s3u9gzn1fY4vQKJrXTM8R1Ev3FuIqlDuJZ92Kxk4Y=;
        b=c6WUTIYOWz9OZs2h9BBMYnxq28vbGAfPDAmexSbqPAPG+pZJW3oFpi0m9tfiu4mqC7
         DeRpEDGiMzxTb3F3w6Mu4vGeta7p24DvhAI24/CXujVCAXPHW0qWIR7TWlJmIKnphk4k
         VrVk+KjKqNWK6YQXLSlM2cbcP5bGPufP5FIz9u5V/43Ypj6iGWY5asj9nS//4OVa1W/O
         AY4OxmEek4DMoCaWG0paRXX4PmlYqIKvRx+GDb27maIR1NCGqAV9qdJ+3nkJlpkA228i
         SDnkkruIH6gyCHdBu+WPk9mzheSSZbq+03YGMbSDpn1vqicPlSYwPXX6AM6zHaDc3Vxj
         10Lg==
X-Gm-Message-State: AOJu0YwZTHNXq4xKNjUvivjXr823hThxHXmKcOMDPm+mbbO4GhPHhmLt
	N6YO0mlfBr4UAGD6ZdyhE5Dwf+t+5Y5zfNzLgcDLsQ==
X-Google-Smtp-Source: AGHT+IFTIF5dsRZkYCm1md1UGdL/Zau4L4i+A7Xq3Rr52jMVtqpPTtmSQQvOInuny67pqHUh7tgF3qTHDvzrzbNlj2Y=
X-Received: by 2002:a05:6102:109:b0:452:5a95:16a with SMTP id
 z9-20020a056102010900b004525a95016amr10676892vsq.1.1696266596905; Mon, 02 Oct
 2023 10:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr> <20231001-pxa-gpio-v4-5-0f3b975e6ed5@skole.hr>
 <CAMRc=MdHv0YxSowMnqJ8xG1_w8dwTWVJV1K0b1jgectPTbOheQ@mail.gmail.com> <4528128.LvFx2qVVIh@radijator>
In-Reply-To: <4528128.LvFx2qVVIh@radijator>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Oct 2023 19:09:45 +0200
Message-ID: <CAMRc=MeagrFg-E55fv24q-ZZQ_LH9CkXoeeVvQNTWo0XUk+_PQ@mail.gmail.com>
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

On Mon, Oct 2, 2023 at 4:53=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> On Monday, October 2, 2023 9:42:52 AM CEST Bartosz Golaszewski wrote:
> > This changes the way this code works. You release the descriptor here,
> > it returns to the driver and can be re-requested by someone else. Its
> > value is also not guaranteed to remain as "active". Is this what you
> > want?
>
> Good point. Is it enough to not call gpiod_put() at the end or is it nece=
ssary
> to use a static gpio_desc instead of a local one?
>

Technically it's enough to not put it. It will live on but the
reference will be leaked and most likely this will be reported by
kmemleak. So static desc would make more sense.

Bart

