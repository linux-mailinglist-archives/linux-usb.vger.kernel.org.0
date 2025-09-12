Return-Path: <linux-usb+bounces-28020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692EB5483E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 11:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3D246667A
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 09:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2051828751A;
	Fri, 12 Sep 2025 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wcx0gEk1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9BD285040
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670414; cv=none; b=lNm2o0LnG3ntSavZitWO/YzilgwEe7T2RqyvaKvSgJ7xKyQEprnrShw7iKMP2UYi/q7yTOG/kC1pwu3P+afgF8YoGjpaZCrcMl/n36+kBJRIaP0+9DKoDlqrs8T4QyKHblYpzWdxOPZgwWKOoK9EYshEdTRnQp9/z9Daq2BrRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670414; c=relaxed/simple;
	bh=WakJE+cvqSXQbjmOYQbodichcIjmv9n4NlYb9ZRRRAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfaugID0wdNPT41OgbL6pSs7vEGYFhQK+TiqcqfBcDSDeM1iMqlX0oM8gAp/6ZoQJxi1PefwNLMS7MilfHg37z/izITJIahK3brBleZElT3UjyZk8QGAd+iGAwsmFk5dJ0xfiWH3HwU8A74Kvg7RlxUPsng698DD++01YttZZ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wcx0gEk1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-560880bb751so1705773e87.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757670410; x=1758275210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/P+R10WDbc61MWbRvmoEbFq/PeYXf+VsuBmEygbV4Rc=;
        b=Wcx0gEk1/rO+haj6UXGiOYf8Dtgnkty/05ukZM+VwcW9yY31TegmAmGJDqD4837XvE
         51cJEgqq3/PA9VLvlg+gzj4HPf3b87eJ3zgOikYR+QtR6Y4ypPJ9BT6KcLQnABcXtHkC
         YoEz6RhB8jRwomHBOR03F73fGMQpAiNS2ZqmwP7ifwo/CW8QMmTq9orEXtBSg7fPHngd
         jSxFlhDoqT526DmzSonGwxIyTKnKZJME+QOGjZJb6MFYP7mO+iK17DdeTDjkmqBW6FTj
         rDjCxskBlYJr1omaC7X7aQUcb5jDlRKpGqnf+FlGarOcrFYkGPrO0BReJCy/eZiuSku/
         LURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757670410; x=1758275210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/P+R10WDbc61MWbRvmoEbFq/PeYXf+VsuBmEygbV4Rc=;
        b=OenXujBJuehg6S5nLbQLW5D76xARL0tGuo0VAqQxC5rbkoceLC88T4W8V+W1mQm6B9
         q2BK3OCAiKt5vP4GRDJgcPKdTndHAal1qzj17HzIVOfRbQbf8O3JycV+6+tdbI7gH55f
         2A1+Y16AbtmK6GLjucJO1OhP4rK15F+eHlQSOAzlIKkecSwLd42E7YZyB8C/MN3E9bi5
         6rYSMqAnuy214x/OxtFitBrsyPi3WqXQASQofLwWCxQ9+hJTCtjc58M1is0aLQoe4DEz
         1FPLQV2HcGUeG7w0OCpeZaOLjYYXk6QUuM2hsc1mCQREoUteoPijqr+GjfyoCPzCK2bS
         DBwA==
X-Forwarded-Encrypted: i=1; AJvYcCW6PJDGU0mZ5CU+e8vsZozX8ZdpBM67oULdYPKkAr2LpjoOPne9zJOcbrp8WMgYMWe1wMCZ5d6bEDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2RT+5mi14r0GQYTbrYR9mzI/OELyyPdJzEkx0ZAI1dJtV5Wyr
	Yk/OqXyQW30KMhUXugvJHFno93xQoSRhird6InT+LNL6Mzr9b5a6jzsD
X-Gm-Gg: ASbGncuLa0gPohixk2KTSRri3Dx5xq4vdTicpuRWXD/qFRz2mOSW5GBY1kko00sQ9Wb
	u+o3HlmYLyJlyBXyrFbSFYS3jVhuPKBV99/M/QvPmZKFj/0nGC2MDc0sg0IoO+cj9QfUspo3rpq
	UxCaz7odif52YfpmNr4w6GqXX0XrDgL8gGmAUmxbrQ6+i/9N3LO2YL5c/BU7v/yE28L0joYZdf9
	F+MZbB6ySjuWYYhkREr58AAgV9qZMFdYZ1Op5J8FpMllMdyQ6d7qOLN5YQ2UpWReyfb57z4f9xX
	MYxtsmy32c7M+8Tw+A8RQywGWuetSOe+2dhQIkTtKHwmiUAdpP+NfMwqON5x8ZWWJP9oZC9CZdd
	V80OIJ+/aFhP1FoCu5bPEITuSuf1mZUmIQe5+Jv7bKRd3RA==
X-Google-Smtp-Source: AGHT+IE9lOesTvjPb1Dp85rkn3pX1XH0De7MxfKAspYSzMmbLSjfN+P6cks4vgAnkEW1h/mV8tI9Tw==
X-Received: by 2002:a05:6512:3047:b0:55f:4ac2:a58c with SMTP id 2adb3069b0e04-5704c57e151mr900238e87.22.1757670409693;
        Fri, 12 Sep 2025 02:46:49 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65a32f66sm1006273e87.138.2025.09.12.02.46.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Sep 2025 02:46:49 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:46:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250912114644.7b9bfe37.michal.pecio@gmail.com>
In-Reply-To: <aMMtgsAa-dovMqdG@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
	<20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
	<20250910075630.0389536f.michal.pecio@gmail.com>
	<aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
	<20250911113451.1f5e5ca4.michal.pecio@gmail.com>
	<aMMtgsAa-dovMqdG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Sep 2025 23:13:54 +0300, Andy Shevchenko wrote:
> On Thu, Sep 11, 2025 at 11:34:51AM +0200, Michal Pecio wrote:
> > As for the %08llx format widespread in dynamic debug, I think it was
> > used in the past because it does approximately the right thing on both
> > types of systems and it's the only format capable of giving consistent
> > result on both dma_addr_t and u64, used for some DMA pointers too. =20
>=20
> The problem with it is that it can't give the proper result for the range=
s that
> span over the 4G. Which I consider a bad thing. So, the correct use is to=
 stick
> with HW register size and do appropriate specifier as it was a pointer.

I see no reason to bother padding pointers to full variable width and
when I run 'dmesg' on my 64 bit machine I see that most of the kernel
doesn't really bother either, so xhci isn't any outlier.

(Plus: why should we stop at pointers? Integers too have a width.)

It amounts to embedding static type information in logs. Maybe there
are cases where it could be helpful for people reading the log, maybe
there aren't, but this patch doesn't even attempt to make such case,
it just talks vaguely about "correctness".

I only see one truly incorrect case fixed here, a missing (u64) cast
for %llx format, which I presume will print garbage on 32 bits.


This brings up another problem with %pad: it is unknown to compilers
so they don't type check it. I can make the above bug a build error:

drivers/usb/host/xhci-ring.c: In function =E2=80=98xhci_move_dequeue_past_t=
d=E2=80=99:
drivers/usb/host/xhci-ring.c:784:45: error: format =E2=80=98%llx=E2=80=99 e=
xpects argument of type =E2=80=98long long unsigned int=E2=80=99, but argum=
ent 4 has type =E2=80=98dma_addr_t=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Werror=3Dformat=3D]
  784 |                        "Set TR Deq ptr 0x%llx, cycle %u", addr, new=
_cycle);
      |                                          ~~~^             ~~~~
      |                                             |             |
      |                                             |             dma_addr_=
t {aka unsigned int}
      |                                             long long unsigned int
      |                                          %x


but if I switch to %pad and later change my mind and extend 'addr' to
u64 without updating this format, the compiler will eat it up and once
again garbage will be printed on some systems.

Regards,
Michal


