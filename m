Return-Path: <linux-usb+bounces-19332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03490A10647
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 13:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B34C1888AD7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 12:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCBF236EB5;
	Tue, 14 Jan 2025 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f68S+rd2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFB236EB7
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736856742; cv=none; b=DLmlx2DdmIVktVDEIaWmLb2kf/FWjOROYCXSDLMVs8vlZo/cURgN9pEMKkg98VaZ8xKdTdQZRXe9NWtzVEnSfV+r6w38796HgsZEzn7iXcMGs7Krz529JZXKpIBPImdHfFashcGFZ2XxeL9UAjiBzFUSsmB6Q7SgJ9UE0ULuVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736856742; c=relaxed/simple;
	bh=K6oz2DS94f8jy21SzXh52ZGsk7kmXvUL4fauuKsYHSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8m/AbsVH/PU9WkYVjC02NjZi6MqNuh1fx/NxUr+zRtgsXxspSRaAHM/Xa5vuYvcF8Qm1u0qRytiZAP+/cqh4iVO8ueUmNSnjpJgvt5RIWSfZXQ4fC9hoqEGmgsJWGJJfkbLArvpeYEBbkoL4W47CwqKKAKoYYeOlgOJGdxKpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f68S+rd2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30613037309so27293911fa.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 04:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736856739; x=1737461539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6oz2DS94f8jy21SzXh52ZGsk7kmXvUL4fauuKsYHSA=;
        b=f68S+rd2H2M+mTqpHL+RyKBn+6j9nrOVdFgEMefWySkKUAzP9y9mjuA6H0Ro66sBjM
         FCXYXkG4Lcg5tb8jEqGt4CbD58xensbZNXE5Pbmq2LtOZIbez4+69aj4vauoxAXkTgTy
         z6B1BSnHVTcPJ0q4kbHbJBN2xST9NIbHGqmkpCC8t6cBjS2olv3XycARQFl/Uo5WlRvV
         FOnoRwUGqxCx91jKhvi0O0oPFHQpTZZWyz5B0CLpORzWhxOfMr1B283BdubODqySHg2+
         tyzPDiJH777Ux4/Ar26YyhGNMjmIVyK5aJX69sAKH+0KRzFgg9irk2ishhA11kwkgKIR
         GidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736856739; x=1737461539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6oz2DS94f8jy21SzXh52ZGsk7kmXvUL4fauuKsYHSA=;
        b=fcsPEM0oe4mQjFXpwtz/cRG9J7bkp9MnJ3R4D+9LNWhM5f+Dsc1jSUs0JRgnAzsig5
         1pu8elWX8Xhgtn6x35zFGK3IrUPM4jqFfm+bkGvBbvzWymAr8QE5+EqPy1xHtiPB2b5U
         s21DsgFz54XD6N2nc+VZlIeHaSqsF3hp9VF1PDfABg9ZJu74m2fteW2kEnSZIxKFOBrB
         a/TV0e0SC0Ld3QCPezdoRqEOmpWt44Lj8vc0n9kj5f9bfqTLQGzG+YIJQ/EvQu/KRucH
         74b8oaKbLzA91zE6LyZF641nsOjQC0My/K8Y811RncEdKpz0qY6QyS66LkvXxo8MaF5I
         ixgA==
X-Forwarded-Encrypted: i=1; AJvYcCVXLTwNfQXMBz7pbFx9pzlKmdM9OWLcFGVHtucwnhd+OUrOpj5Pb0TX/ZYh4QVBrqG72YLVnuvCnKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8RtLriKshZfDLb5vFHSiwcpXCkPV8duWitbZ5oOFigfNysrF
	6D1SJwAWZvdj52iDoiibP5gMprd9bksdqDOBMlFb1gJ+vqo+NPPiesUHENd3P2RCfe34jOINL5v
	HVvtl/DiwFiEDbUTFsdaScsnsZiErBIiAwlH5Yw==
X-Gm-Gg: ASbGncvI1UJ+vtI6oej3SRH6ec3QLR45Q92YFXYH64/sEm3yjYiGNmINj7gOtO/G1T9
	SAmWTf65DG/1Phu/JCFyNH3kxh/FzXm2j95081nAi2/w9sQgIQtTVBJ4WOw+RmNrJdeQUcg==
X-Google-Smtp-Source: AGHT+IENAzQOWIqeBcjNLCeAWZHXeOZ644Mso77ytYMGJJwc3A78vETSt+TEx++AZVkXjYF397/HELxPeWd4tKYdKto=
X-Received: by 2002:a2e:a587:0:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-305f459aaddmr69824011fa.2.1736856738634; Tue, 14 Jan 2025
 04:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com> <20250114033010.2445925-3-a0282524688@gmail.com>
In-Reply-To: <20250114033010.2445925-3-a0282524688@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 14 Jan 2025 13:12:07 +0100
X-Gm-Features: AbW1kvZqlT9ZQof5_cPsRoDpTSEUzbcfgE_gPvPzrdmIRQZ45w8iL14wP2FIYK8
Message-ID: <CAMRc=MeEye9i2Z=Y8bHt2ruCS6JJRxmGiLvAUt6E7BJ2K4wosg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 4:30=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wro=
te:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---

Please pick up review tags when resending.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

