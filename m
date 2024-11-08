Return-Path: <linux-usb+bounces-17357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF689C1809
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 09:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3C6A284526
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 08:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3396A1DE899;
	Fri,  8 Nov 2024 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQdrQq09"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7561D1519
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054825; cv=none; b=IAO17A0q/YcQlM84jxHHl2CmzMp9GMVaWe9Kaurn4s6HDc92Vs4b/AF3dnHlMB8iJqAlsSm2Urdl/OwJ1GCphwyx0OZo2+Giqq6x57PScAFDXtx1jsMgWk43cBGnoB5HxKFNq3RsXOCssIDhLo79YUTDCd6LPzgG1JaRsSluy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054825; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRdsGr2eT2EXG1Xx5wT+V9yX6B7S/mT9WJew+wRK/uqwafRGi5vYL9bCNRT0PIF0/5Om0X7kOeyhdF7rNWzFFrN6MtKX3V29dOaZWpmMThqakOwbYFeppyTFEPmCsXBNzJQGnEt7iwwJYYjV2ktQGy/AAMHTvR1blgyhb5pzxWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQdrQq09; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso30384461fa.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 00:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054822; x=1731659622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=UQdrQq09sJOLoisSqnk98aZyQUCU2WzUB8ZQ17v20xSmMXVoWPuqIZKLTBoIlWhar1
         sa5NrDuDLMhSI5FPEWQYfnuhTVKfEhjqdeW1YPG816v4lSbhF5agcqnFVKzzObmHjeR1
         XHE56xsiE0xhZpoLrU5I4UIUFPlP7IpBzFFkWyQtyODlu7TFxp/YQZTwlR608J5gwm06
         QALVRLQh/ebWrHrepOsNTRmv1B1MCJAF4RzOPkbEqCWOWhsUToIo2DHnFM14n5AD5+z3
         ooNd9BUg5qQAEWxghZcOpE4VU78z7dFanWF8Bz6KR+DZ4+3ZDmtCgCYcC3gWutze9Ggw
         ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054822; x=1731659622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=gWcN641lVAtbeC6gYy/5qU+CKEmAW2nPQeKOcJ9Plqud/D2LkQAuj5jw8Xkaa1yvCU
         RzExqSHbdG1cRpVVQhp+xsFICo0xfLqGMrKH+tyxMhA/DElBKov2XcQ7RAQwhDClhlW+
         ZTMbi660dsh2/srIbKmc5UIsJjRHGk23dH4HwKJGBVOWqfxVY3hsO2Aj3oOYB7yFXNJP
         VA6W6/ABLh/wjAloki+Rq5kjZfkP0/NVUBHEwyEMH2SZsbhtxUa0aj/gsxmdWaiJIBpC
         dgN15EGzdRobe/5FFlv8M1ygxjiTYlE+SAFtAQULZolhyXkz0DREok/5/EYMubEgVMHP
         F8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVBTCxYUeUc+Tnw21OKxnjRZtF0hV7vajzqs0o+0OEvXGGIYzTJ1t9CYm8bnp2OH4dvLiTiji/mVqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsiSvq0UlS7EeEEvC3VHayjNN0JvJsOnoBach9WYXrdFIU0Ot6
	92MXrpV4cDpHpdH/zevXafIZLHk79W2xc84BEOlTlppETaNAM031RL7a2KF9nqF6I9IjR0tsQE/
	i0iaB8c6BvV7XHssT26vZApi7B8B/ehUhqLeMXw==
X-Google-Smtp-Source: AGHT+IFyr+pHYPoU9m0KAAV5TzGf7UWj3G1xJPS3/nNGmi70pN4W31YM52rF43tSYPY2jobLCKLiVuwMjSY+Mo67UYc=
X-Received: by 2002:a2e:a9a4:0:b0:2fb:63b5:c0bc with SMTP id
 38308e7fff4ca-2ff20162837mr14265851fa.3.1731054822269; Fri, 08 Nov 2024
 00:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:30 +0100
Message-ID: <CACRpkdb251gJhbcoh9ewqh=TLjTgWA9ZKRAXc6dopjRHDrCVOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
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

