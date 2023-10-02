Return-Path: <linux-usb+bounces-903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966D37B4D00
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 10:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C53B7281C3C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 08:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4571C38;
	Mon,  2 Oct 2023 08:00:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CA117F4
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 08:00:19 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6ADC9
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 01:00:17 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59e77e4f707so194754027b3.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696233616; x=1696838416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udyxD4x7r2SWeLX+7M3j8t9aW3/rijFvVpFn86la6k8=;
        b=M1NZ+q4A34mTI9MDRzUIL8KZkZgoARz4DJmTZO4XdH26xMgsrUATVmf3sNH+hYzvZw
         coEnGWEAd/CgWCmxN+RNrXv+ieG4ApZnvrsvhKMk2Uc9E58nzUE1h7CDHz0Vm6g2cBcX
         79WFITE7+iE+Xvg4nBgmo44gUiSzdJ2Dl2h9P/ngzNBBiDGn2FLE/TkDHuhwXpgx4dnd
         2NrFvvU3ZXt28IhN65o7cVZ4y6NoFJI4RZanFyuWqpDIxuUDEYlb9Mn0n9IBy1piLPPN
         hm8dMUdL+FQ9J4/Rluqb64ZHti8eRCP53nM229/rseJ92x75J0bg7YQ+kC0t1cH5mHpJ
         isRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696233616; x=1696838416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udyxD4x7r2SWeLX+7M3j8t9aW3/rijFvVpFn86la6k8=;
        b=YAKPtZyqPvzWc+qZyTA5jkW1AHdEs3nMykOHH6LkQv8YiOnJdEdhkPPry5PrKLWYLS
         0ZtJtOW9NMBG9UzVMdjvwovabCnzQKlmqO5DFlGwm6HpKsehGJMD7Q7r+B2iDiFlpIqK
         M6Dfd/8fS2opQf7WrEEVFsmbgVD+VtkWqHGZiAtkuk5X8XLXV3kXvnnw22hq1dXuWF39
         a817kcATDtvfQ2kTgehrnlcFP6QiO3DXJZs46rt+Vb59rhINmXKZFD/Nr1M4VLLjlF6L
         pY+g//KZKBLj4OZ3GGCcr3vzgfo8z5qIgMVn0isF+h4IYZF4/pRjD+rmcCxJndZ5GWtV
         jlKQ==
X-Gm-Message-State: AOJu0Yyn95eWlE+QRR5LAkqUOWffsKWuormL4oX2ej+m/0QIwzngLFcI
	ZFZhb2AkEltDufkq8BQ8vN7njJhlvrZsOYtj8Wom+w==
X-Google-Smtp-Source: AGHT+IF3wlU7ad/oGXZui3ASHjBwUlNbogFpckkC70kx7nGijdR5lIAniFUKJKv72IE9hCAU/VFTehBjqNFj/EOUTFg=
X-Received: by 2002:a81:49cd:0:b0:589:e7ab:d4e5 with SMTP id
 w196-20020a8149cd000000b00589e7abd4e5mr10969040ywa.0.1696233616287; Mon, 02
 Oct 2023 01:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr> <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
 <ZRE3JNVNqFN0knHl@smile.fi.intel.com> <CACRpkdZdSTCeobuFdXNbJcHTKJp1V=t1sfp2tp25Mb0FBh74pA@mail.gmail.com>
 <ZRkrYChL0hKZwQGp@smile.fi.intel.com> <ZRk6MQllYmgxV0fu@smile.fi.intel.com>
In-Reply-To: <ZRk6MQllYmgxV0fu@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Oct 2023 10:00:04 +0200
Message-ID: <CACRpkdaNTAKQHUBCeKpf5Qr1BTwCRQtnjKfYa78p5d_=g-jRyw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
To: Andy Shevchenko <andy@kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org, 
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

On Sun, Oct 1, 2023 at 11:22=E2=80=AFAM Andy Shevchenko <andy@kernel.org> w=
rote:

 One more thing, though. I think those warnings are incomplete or actually
> reversed, and we outta use WARN_ON(IS_ERR(desc)), no?
>
> This way it will fix my concerns and your concerns will be satisfied, rig=
ht?
> So, if gpiod_get() returns an error pointer and then we are trying to
> free it with GPIOLIB=3Dn, _then_ we will got a warning and it's obvious t=
hat
> driver has to be prepared for that, otherwise if we have it NULL and
> call for gpiod_get_optional(), even with GPIOLIB=3Dn, it's fine to free, =
we
> don't care.

Since we return return ERR_PTR(-ENOSYS) when compiled out
this sounds right to me!

Yours,
Linus Walleij

