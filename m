Return-Path: <linux-usb+bounces-24512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E52ACF0C9
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 15:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8AC3AD786
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 13:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7421238D2B;
	Thu,  5 Jun 2025 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oO89MaWR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E922327A1
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130420; cv=none; b=EU0f4Bgi8JGXJ0HI7C9cZOHw4a/8tFKpcp74OWkoY0eEi/vAsAqWhMftsX5BEFQUi1QC2WjnHIAy22r7rhb+um0LU1UN122ptEMjuM6uEGKGRvnbasf7P0NGpz2x8itioohD7SNdlDI5yRE/DNcLmv6JI2ss+p/zeZF4lz+keVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130420; c=relaxed/simple;
	bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn0aRA8pyK42ZNmskV/ESZh8B06YUSIwNYsrYVbqd97j0UVvyV45eMw3yP2N2KCKpj9DUp7nhDHzRj44ef6fAoMZpBZ99d9jHa1MxJiB1ZSpcuR4DLCrg+d68pJIkngYvlK06Nl6fbOCxBo1NpqNpSITuseA8HsRxG2yXeU9/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oO89MaWR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553543ddfc7so1078954e87.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130415; x=1749735215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=oO89MaWRZQYYIdAXI0QboMa2M695ugR4shKTGo10iJ0LW2logpiSHxfroMIGzb4DcP
         R6oCTjJdKjljUutH3L4DnXSQP1xbN9nXmb2HAPstu7YADkVy7q+iqKaa6CJD2tbePkBg
         zvIk5VnvXTeA2NosMkH0zF6zDTHNSwhGtmOApci4nQ2epnN16XL8fMKNrBNzsMq1xPHq
         /0FzV1Kc4MyBQ4+67xvYcS+Vp/qxCnd0I4GCfFmID9lGAquHmQXz0M+b837i2Aa0Mcv3
         dQn3LX7yzeHuCpLjHdBwgh7mcffoq/DCghjebZli08LnmYU00WifHt+uVauxSTUgORtL
         DZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130415; x=1749735215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=IgRsE2QCGkOtqiGhwArniHncVYKVVLfwvuytqEqJ9cWSdIURQ3D/B6hGoxCzdt0GxD
         nCxy/+FQ3RcUt37oRqsyD6nn+7VC//CpOyZt5aoGrKZMCHXP0R1bV6/xX28IEjz7Trc7
         Dy8DvJp6xiZvRo8n2vsZQ3mwzBQqZUYF8e3PF73uDu8PuiXhLcdd0nDXeEATKO0qD/5z
         Eni2p40AmIgY9zTIuLDAcFNVuhLi584FTl976+NBWlFAwSIEZUbUNGKFMdae8p3pDoV4
         8WMCY8SrYrMi+sN6ICaRCot53voV7sAFY9UjuXpWySVrDmPnnf98In+P0arF4Xu7uQMx
         fBCg==
X-Forwarded-Encrypted: i=1; AJvYcCWVFQvkQCx8VucWSaEnGwqmj5Wh8L4pyEEwblYkjr0SLuPPBFd4rdxy74cHwUoLpx50kggOwBppk5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQsF9WZrI2gLI8hMVj8ZLKaoc0AcvuDqZUB7/bdJbeoO4AWRE
	21EGLp+PUzLcOJ4Da7G5lSHMMG77Re9FL5e0Sd9s5pST9eJ2xF+TRglJP9p+UoUM3tHJvsVIt+D
	hI/ozFa38BTaAWo0WApMjiqQpTOk7C3J+I22D2Ia7pw==
X-Gm-Gg: ASbGnct0l52eMR31X5fdq/Sc64QLIjmt7G3vxYbvJJwAMYbehPwWmTmQh4jyGd3jtoE
	zrcutYNMUpFL2d7GVsdcq31IC5nLNeaI/Dm/QxFRcfowoYEa3BEpKHHzmwNNu/8XIs4DALgZtxb
	CmNOMOgFyaj7JH0IzsnG8Pj7UJaRjtdBZETkrp157DzaETqvYTDGb/sg==
X-Google-Smtp-Source: AGHT+IEgjC4fcmg+OD5IGVLjZUrIMPEfYs/w9+6VTW1vagtiTaUcBabncwsUcBazgBGF/ZYxoheFQtZJR4MPvZFNfsc=
X-Received: by 2002:a05:6512:3c85:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55356df1e50mr2121333e87.55.1749130415411; Thu, 05 Jun 2025
 06:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:33:24 +0200
X-Gm-Features: AX0GCFvHxiWRpP5cMCB8iSavv_JwXNB2m6sizTI16LHxsIHw9CZ-Y-5vnZK5ofQ
Message-ID: <CACRpkdYD1F_AGXkeEhKcfS8BZxgznmfj_r3BBaK8LJLQJkDMvg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.

Excellent cleanup, as always!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

