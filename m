Return-Path: <linux-usb+bounces-29181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B931BBD0D24
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 00:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668283B7E33
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 22:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21980218EB1;
	Sun, 12 Oct 2025 22:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRdXyqh4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3296A1CA84
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760308895; cv=none; b=UJn4GrUapq3Ey/W9bTPGErEhBMCE2MVutS7gacCRULhCwfRfHIivF3VY4ZmyhTt4deH+w3buYCuMNgSPLPL0zdAPHncN7OnTc8l7PGKzGS+yz5ewVFA7CYImpGT1oJ+DLwT5MCFyj0ZbEeGYZF67Zra72pPMYLDG9VoXmF18iXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760308895; c=relaxed/simple;
	bh=hpa+8Y2QXgoA2mSF+L8ihXCuBXhafBZ5BUuiL7kw8Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYid4+EPXWgr+Jx3CTG7lbQC8ruZtFJczf3CeZv+pj0v2aWYFbYpCs4zZZjcMoAk/6Jn9QdrhYviI4KhyUSP5A9vTzasIMEaWTUCq6RLKONGFi3hbYsYFstbPbs1WKMfC/ar74nAaoOuoRVdGJ6ZeF6p+qu942A0ocuGCCnopow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRdXyqh4; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63497c2a27dso3671002d50.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760308893; x=1760913693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwgxrsrOSnWWxST8OgzwG4YEyZSEyOII0IK264ZPTt4=;
        b=RRdXyqh4fsUPhw5GkUSuVniNxplY9OeRHOXziqOhWIy2MAXYj4BMLt7JBDS/dIW9xT
         Kd3We6kEHPUS5G17JJ+PnLrAqGU9HQUk/7LA3uXMAX7pDjKksvN5QAES3UHJhPP9iCSv
         YX8okazN13BdFnednSS/p584UAOAFQAm2oQGiWMicDn4SOhXM7Gq3B24dV0zWc7ShWpi
         b+E1jNpR7IUGv8DcEn+Ib7p5rvuUWkEKte67XKNWewP4F9A7JSKdnrdkIFkLdDvzIBVn
         Tgg45vrjT0wkRQV3JOprxrZM3qluGW00NRuHUjbq2Wxn8dGNxZjgpNUIgeTSI1dPig/P
         XWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760308893; x=1760913693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwgxrsrOSnWWxST8OgzwG4YEyZSEyOII0IK264ZPTt4=;
        b=e69x47mwZnzqxRrSZIMmnjJhYHP7Mmu3FtXZZjCmL7TvHaHurYAQ5kPsygGr1/7rn2
         3FZp5fSTQ2xc1FkALIEJ+VVbegSpz8KD8l2ou9I8pavmSTji6Eeql3Q2KYHR+miOyb4S
         LVV4sfZ7/l0Ta8iciHklY0VQx4lYXImtIQdBMDr4D91KQ+pV+rU9QCiz76ZF3XWA/n99
         q6+IKwaauavrDc3zIJ6ifbpCDA8bcYwjIW0KPgcI6JYf8iEtnTCZ9p5qH3MABa5XF/Z3
         EBlsC44Cynai9Jqk01+x4OpNbwxPwMLwc+fJRMvtcOphj1Unw2p0dCPJmIh7Dt6xXCbJ
         pcvQ==
X-Gm-Message-State: AOJu0YzMupV7O763yI6VkCclhjy5L/L8JbLUQEofBmUP9425J3OJ2Gim
	wkQ8DTgbpCeHzCADkHH7un4scxEA2+IB+8xh223js5qEI562VmVf5yj2XkyND+r0S1EgltuwTCp
	WmJd+qgVYp9SNyYr2sACKrBVJ/eh4CRs=
X-Gm-Gg: ASbGnctgkAX7pHtjUSH5ebQTxoZ1/dU8yjr6gID7zlJQTJ9bfvX9BRo6mSRpKHF8jBZ
	+m5FuyBQKZXfV4fxHGItj6Z3d0MAImXtVwKMHd/7K2ZQzGGLO8lnhG6fE64L1nXC7BQ7NjIJh8z
	+d2luKfYU7ZrL8rt0TM+c5XBSFEj5Oy2QrMKZuCmoXs7w2fxhyco5/Gpd7VYvDiO38vF96C6pGC
	6JZJ+7OLuC3gMK2d2OFfpiRMz5xWOOHWWxG5us8SphuOydjHuTHsxPC6Jx1fKo080A=
X-Google-Smtp-Source: AGHT+IFnE5SOOpZ+/HqeHQDOALkbq1rz6sGe3fjKmr6ofZgkWpR2fVYXQ6gr/Cuf6CtAyJ2g3Rtab7e4jBJq40W9j8s=
X-Received: by 2002:a05:690c:48ca:b0:781:64f:2b1d with SMTP id
 00721157ae682-781064f3469mr178831097b3.63.1760308892910; Sun, 12 Oct 2025
 15:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh> <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh> <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
 <2025101210-gap-gravy-ae8c@gregkh>
In-Reply-To: <2025101210-gap-gravy-ae8c@gregkh>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 12 Oct 2025 16:40:00 -0600
X-Gm-Features: AS18NWCdpz3gLi76HQ9xgYHqa1HXUXMUO_eF_So2d2Qjn6sRNuJPVrHfHwvHGTI
Message-ID: <CAMMLpeRXdgAipHwmaCTDww00N5L1koYRDimUksYpBFm+tUSpvw@mail.gmail.com>
Subject: Re: ttyACM versus ttyUSB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com, 
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 1:54=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Oct 12, 2025 at 01:01:00PM -0600, Alex Henrie wrote:

> > Ah, so the name ttyACM is a historical accident, from the time when it
> > was the norm to use different device node names in different serial
> > drivers.
>
> It wasn't an "accident", it was on purpose at the time.

Yes, that's what I was trying to say. By "historical accident" I meant
"It seemed like a good idea at the time, and it's not worth changing now."

> > I did notice that the ACM protocol has no way to set the baud rate or
> > read the CTS line and I wondered if those limitations were the reason
> > for keeping its driver separate. Today there are ttyUSB drivers that
> > likewise have limitations on the baud rate and the flow control lines
> > (some are even based on ACM), but they weren't around in 1999, so I
> > can see how the difference in capabilities would have been another
> > motivation for the difference in naming conventions.
>
> Yes, baud rate and line control is important for the usb-serial devices
> that were real serial ports.  The ACM protocol did not want to implement
> those for various reasons best discussed over your favorite beverage :)

If we ever bump into each other in person, I will take you up on that ;-)

-Alex

