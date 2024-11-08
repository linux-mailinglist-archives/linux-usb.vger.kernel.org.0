Return-Path: <linux-usb+bounces-17358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E99C180F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 09:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BDEB1C22DF5
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 08:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B64C1DF27D;
	Fri,  8 Nov 2024 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjAlJJWq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF551DC759
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054847; cv=none; b=E1v6wGxyILYfC6nWEdjGbdsRSJ7bg04YQXWXJ7VmEfb5GcDyAnQ2ptY9TNdfYcrtxbPmpwLao39RzHQSzQEsTRJvoZC1ydhpc1iB3kBkCyga2OO7GQ99BRB3rJsbgiDEJ1yLi2ZS5E/RryFrVTi71KHTO0djWKO84sQ+eVhsUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054847; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3rYIEgboxGjNyLQnvlSFF30Hv0Q9S24FARgsbk8RbOjUFkJrfDSz6eI9h38X6rWcM2bEtFdWPcUiiPZZRuIRm87/FO82sLN+FjPbLZ7l7DKIgBmyhjasUkIEoJcvSSBCUgS3n9300+Yy7xNd7wxjGY3IWXO1q+ARgkN042FfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjAlJJWq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so17627701fa.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054843; x=1731659643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=xjAlJJWqX0HSSNoH6NdsMfiPu44D1spoJUIiT3J3Xp40RiHVFvafLYUmQzldCpIs5D
         WnLruQJJDv7+UlQJemNEYN4CogQZwaani60Ol7k0hz9L1jpCiqzhCMUt02yxVqZrjAoL
         QRJc9r8obpv+vQohZpQKKy+W/l4hvECRujmHRSaB7a5CvyuULcW2ndh75zxjGIrqFLMM
         cOws26E39SCdUPt9DxB8C9s2yPUNByN5aZJBDyyu9xPFGB9LmNWMgkjfCgq5nT4BzNUe
         tN6AHJ94trIAE8KOD1bOB/HHM6PX9KXoOn/I3t9b1wLyZGDzq6wnhRUKnwdFsSUwWaYU
         D6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054843; x=1731659643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=SJmTxzY7slIY/x6Q86/7CTbrxeXH/fI/ybKUETiv+P1BSSCrDTfyOq8MRFRaptOL6S
         Dr24LDMICK78ulLQ6BtNUyniBpYoiQJzmgmM7Hh3lPwbPv5M10CidQRHk0EWBkp6WK5Y
         BVEHb0aU9orYWlWyzUoPXXv0nreAJqZu2Hj82vhfow+7Y+UaMC2OHoHHW5aKCge9KDGs
         lYBshfyNm1Qn5LbnTfrlZ9Iw6G+IOiTTxFn7CAAVFghS2p35U/lNnX3HeMfhvc1CKxA/
         zfZs0l2tHbThSsMFSm/kJWlXnnNmMO/cgViFjQw4i9ZIYgOfyFESH69C+ECYlB7itcyW
         YT0A==
X-Forwarded-Encrypted: i=1; AJvYcCU3l8IrTGDMBJLXjUU9VoGMf7UCG2n7lInih84k5bS44O3MWEaUpWne3z3FzVHWOlZEhrBW8vUGhN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJyLTruURcswl9kQamkb9Pa3tC0gc5A5ocp5Uagh4BzPGspSuR
	gG6w2LOvjlsB82E2GF+df1ErKMiaAnK9RDAT6NezVWeyXGqzDcydqyvbNiyMIkGkIwA+yjp6lVX
	CEAvTpu/e8RJMHwMuTAV5nW9XbX+R7RISINEowA==
X-Google-Smtp-Source: AGHT+IGtlBw8/BzKpYwXBVKDarOJwHXN0bQ5Y2Edkm/hG0GzbaUmoWPVA9ksvjdd8kLv/JY3KG1mkk4/qEjDQJYnfQs=
X-Received: by 2002:a2e:be86:0:b0:2fb:59dc:735a with SMTP id
 38308e7fff4ca-2ff2031a659mr7523931fa.41.1731054843501; Fri, 08 Nov 2024
 00:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:51 +0100
Message-ID: <CACRpkdb2NvL3-+BahUHVWEj+gPKLRmVi3aTrLUSemFoNuj2nmg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
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

