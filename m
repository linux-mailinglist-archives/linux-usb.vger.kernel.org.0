Return-Path: <linux-usb+bounces-17361-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED99C1823
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 09:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36C0D1F243E1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 08:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A16B1DE8A8;
	Fri,  8 Nov 2024 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J4trMXOC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AAF1C8FB9
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055046; cv=none; b=nWnTStFJy+VYzEvYnQwk36NcbeGzn4IaHiCEVpV6/ltsJG/hODIOQgdE/Huj36cevfvaeWZOlBXunrOuRNm38KHXOrv1/jFksrNK6U+XZfThJBeohwgjYU1fB6pmfO3DmIID4exUDnOexWn9lGJHCFkpjvM4Ii5SONToQT8Elbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055046; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaX8okH/+u3LSevBEQPCIJS4viq71I79EkmKvm1nwS04PBLD0dTU0XL9ASdo1ngM2uHdGjQ27HuXKDj/2KtgMe2mF7p8m18nvObZpjOLAxWF3LO+ATWGICgWO+E1OYI4PpjL6dL1aybY7iCSOUuvHjM/xwiWT0tiUvWm3iEiXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J4trMXOC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so17655041fa.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 00:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731055042; x=1731659842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=J4trMXOCdlZotamJ1c9PSB5u42g2LpaT42W9S3lTMICufykI3At19WUB8nbWt1et5d
         NaYe/AsGBdmYZkz4swrG8HoiTFErd2BI8D5AFcOB/2alLSMoNRSa9cE26mzG89AD/Max
         DzIZXmCwfy+VvW/mKKbe85jin/fQo4C33Fs8mKaciNEKRDIfU32h8za1qLurF2nTksyk
         nN0ip+hDQX3o7U0aZoqFXaZKQn6l/E+rQHqND9Mhc2E2ZYkY/9vLvxvEh904Xa/zSEBe
         IMFLTrLCAt0yr24bnMOVw46yT5p4jaHLWggGbyDJ93eJB8WEnGB7UE1EtQHWNGT7MCRs
         fLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055042; x=1731659842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=bf71Quii1I+KEzOX2mhcauep+5Ln+7GiXgJP4G8McBLUsPed7INfHskSMhVuu6LGFU
         v08r78enJ2OhRkHQOeAvK1Ec/hpkGEdj5MNhOXdfiWJ2YIcQCXklYgG7vpC71Lbk5OsE
         4Zf+5x/8yCxkBhHyr5uf8SRQEpJlxomDxfmNUANCTVGFqWMS6zvNhQJ67qyhABO100Jj
         Lt/36yqNNznL5Taao+JUGjOlgARR89P8gYdwQyEH/uEnWZZ6J2rBA4CjsHe/0tQ9ujzU
         KhE4SqH9/uafrmfV7yaAksdKTPQCIBC6Whue4Y8k1wgCX/FM2TbWSlLg3POG7bKd8q0M
         CXsA==
X-Forwarded-Encrypted: i=1; AJvYcCVbqPEk514NwSOqnmxGBtYVaxQQbzR31NLqE3lMYcRyxRFZhe6ZGnLe9ftS5+gb3ZdAdAUbYlRon7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqV842K2u/TtdZSg2S6Iqp7Zt95lIIy5fYCDjJ65CuV0zFDFc
	FPifSIcZUFeq4z69+OmahIMnPx9DLvUaMdkflBjrrPcy257vTkP8I7H3kbrp5Nw41vlSOYkh4m8
	stk7Wk1cTsjom9hpJaa1f7iu0IXl9yXbzOXqcng==
X-Google-Smtp-Source: AGHT+IFNMbx//cYEjFKlLreQGe6KHnDtkiSUF8TkDB0AJS6zWunIMN9dfiGm3wfKDkFfc9lg5KxffwMABzLboCKR1AQ=
X-Received: by 2002:a05:651c:881:b0:2fb:628c:2580 with SMTP id
 38308e7fff4ca-2ff201e6d03mr10547841fa.2.1731055042295; Fri, 08 Nov 2024
 00:37:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:37:11 +0100
Message-ID: <CACRpkdb7gaYW3FXfqZ=E-yC6071LEiv8hnyMD4Hh=bxJ3BEdrw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

