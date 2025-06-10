Return-Path: <linux-usb+bounces-24637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314BFAD2F97
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 10:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDDF516EDBE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 08:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3028137F;
	Tue, 10 Jun 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2L/6sPv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69228003D
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543127; cv=none; b=nQLn3SvihVzH0Vh9nvfQtEtyOfce6UuMCEQfThz8x+ynBtD3qbgcG/giyWDte3QQHJyAtgoYiCVmWlEHc1e9nskwh++q/xwAWanDkXMuaRgLGCwyGVgT8fpG7AInPbIIC6cjBD/5tcSdRL6n4eVBs8yk1rNiiNmSQZdj9LBeZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543127; c=relaxed/simple;
	bh=yvgWF5tnQNZRDjc0fGYDrUE1mlV0Lq+VUCZV1FeRugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTLo2Az/g5P+Ao2AJ+7bnmOJ2me+er4ZHsugPvOE+0gPgGxk087ELRKeZDuXZoOTRF9xoHOH8JKxqge3bZu2b28XhDFdrEQhcqmlDGeYl685YeSM0G1cuN9t9Mq05i+8MUFi9eip+diSq0iT53ZCvhtVtiVGjUAZKrx5SU0O6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2L/6sPv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso47989955e9.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543124; x=1750147924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=B2L/6sPv4hjzgzss/Y2f2WHnLWyp9sYdo19Olow9g9PDb/yXFShZzQ9piKhvc3trpC
         yhpDpBgGwdy4UBxUB4IIMIT1BvF3EH9qXOXUtw9GC0O3cksdqHKlfUdBfYam2iflpPy2
         Nojx5YbuXh99Ge7RUW1Ji8+RVNtM2M6QAzk+k6/TVIhCBKiUtUaItqAhEnaS0bYBpA4A
         h0cDAYljIHXTGUlYwoEcq3slWgVXIJ0639p0/ock22bLDGPqWtsBVep71qxQq6dxNkAn
         F06T/r3zmozbUbLo+39aYxRjckIWk7/Z1qYrRbifIYTtwjj2D9iRnsXa4NlTn2pBHIHa
         Irrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543124; x=1750147924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=AyFSs2QeF6D+N+Jv7BRJ4jkZ4ogqbGp4801dE/j/GeAHy9A8YVLfp9BRAHx2I5EFre
         fPSk7CMGVAXlMU/aaPDJFYpNv3K3VDPdmibZ71tJX5mfAaD0yqol7oJenyzgUiEhs9wg
         3NZyYDpwhWgW22hY9bGM7w8mC3IMoKxmQQGZFXtVubwE296ZHBMzqvqCEsVZl1wr4vI/
         CtN15VC0w9918iurYqX4YTcaoQ+K63efjkRk1mIkeAQ8DjmyiQemUt/hzv+sUa3yYKP9
         XY8hhvYTvWSAuhhMTDB15XZXz3QkATp6nQTkaII67sAUvb/y4LH8iIZRi4HxKGiRj2Wz
         NlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW23NlQFsp+Ec19ta/c8ZDV8CRpfFCQ3UUqKXLVKwTt6bKjYzJGFYxDCA5yePG+WLbkptzDVkKT2gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJ1g+NdUsE18++mBf5fvpirAtL6CAGArlE+5DZ65mrdQyn/LW
	pbsBttyCTCot6E7pPBurd7xkfuN3ECCcKsX/T+hzxY3v1OGUKj55O//fEAj65HlbCh8=
X-Gm-Gg: ASbGncu3pKG8dQDu1DKiBJP3Y65O4Z9vJwR6eoq5KSt3dR8vnQOJXSsyPa79sqFycpX
	EbWNE/Xg9igi1smg5zhrBtQZwawAehfRbloOVXbZS/PVa1Xvnl1p/mFPyPXS4/kS4l3lk0i4LbI
	GadSmxd3SDC33mFWS7Yis+h9XenJAbCIbe4ZlVDmWBET/TScKUSsTZKY5QLg8o8wgjxxhIWXQJv
	B75SRBnguKIR+P4kRQJgwc1DQQQicfKrOquSouXeyeFQai2uOcvlIq9LCyGc1WYRPHO63E3vyo5
	nK9nPyNcrMrXC+yZM2r86LmTsWfRyjEqwmNXKPl2dqRAa4iB1a3oVHWGbEfW
X-Google-Smtp-Source: AGHT+IHw7/V7r+W55JJPgOoMHWnb03kXm/kQE97NwVLeZNevpDtk4rbU8g1Mkp4wQwowMYR4Dz0aYg==
X-Received: by 2002:a05:600c:528a:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4530efe68f4mr70110725e9.12.1749543123640;
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Tue, 10 Jun 2025 10:11:51 +0200
Message-ID: <174954311123.28634.1499230964159731709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 01 Jun 2025 00:21:37 +0300, Andy Shevchenko wrote:
> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.
> 
> Andy Shevchenko (2):
>   usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
>   gpiolib: Remove unused devm_gpio_request()
> 
> [...]

Applied, thanks!

[1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
      https://git.kernel.org/brgl/linux/c/32f6d31dc0401e6af7c48e5e2381997b6d957d85
[2/2] gpiolib: Remove unused devm_gpio_request()
      https://git.kernel.org/brgl/linux/c/a5589313383074c48a1b3751d592a6e084ae0573

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

