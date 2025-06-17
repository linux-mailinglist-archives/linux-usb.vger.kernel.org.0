Return-Path: <linux-usb+bounces-24816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D300CADBFF9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 05:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 837AE172247
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 03:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56339202F87;
	Tue, 17 Jun 2025 03:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4HietNh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F98F54
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 03:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750131731; cv=none; b=YlWWMiL6pYAEtBJMzmUdUFLzdGu4mDNc9yYn6yOId4WAu94o2fLgmXVHFTYlUhlfCXiNaM5DwXtG/wZXvySIvZE0zRZzcqRE77lkNYS+Wu23Xts4jXLVGBSw90tQAvXOQj0PUXUHj4eQHVHIXLfXmkGYdIItYm44ezgTF3U+9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750131731; c=relaxed/simple;
	bh=djidobfX+nc9lhuiH0b/pzhC4MdvYONOrN/Qx0eVxj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOnm9Up/ofk4Y6bZmG00ysHh+7HPUF7q8GicW7sOUDH5S7uOHIp5nVneOGRz0Oo9Ai8KxCw9g3V7cEehObwm6NkK1QjxL3T+X5XlFrsTWmv+HBc5l8B0wiM+XxBRly4UZu6ZQwE8bm0V/3SCJvexh9pofFFM3eKFv3ZmtlwZLUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4HietNh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553a66c3567so2632e87.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 20:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750131728; x=1750736528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2NfvF9el5AdBL6AJbnbuT3bMWgWET/InEPeyPfqQjQ=;
        b=V4HietNh9nQrkml34ljwOhBdMb2lVgp9iPPy7g6nfZ0ON3/FPUdugOIY4eN8SQyT/U
         kl8OPGR/vaPZQ9JgVX6nxPttVhlbrZOR7dE9AFA7aExh1jYLxIIW+2gbI1CmqOlhXLQR
         9MR7uY13UxDBCApUDpwyyV270esl+pQZwUw1WbBFCPMw8HjPLJado3YC/lfhK7rVcL1A
         2b/4FoibtsnjhUoq2WiVrxXQpWUY0hKB+7WAWas2TGLyKOb7xwu+WmL6K0asVkCQEntB
         ntwRy/Bb211qWK3Aom11OhbtUQ+9y1rESuL5FQNgoK5zu+dEr66RDzyCkVuKC5FKvFp2
         g97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750131728; x=1750736528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2NfvF9el5AdBL6AJbnbuT3bMWgWET/InEPeyPfqQjQ=;
        b=tKsd7tILoykhzyAnTAWY0A1WP1/NrbrX+PGf4o9kUekkYtLcnCgF1+WgWtwY1HzqhB
         QZVrEjvg5yEGHuRnsRFKUZJUbRGhUr09L1hWQacS5g5l0c0lRvRLtMBom4lHoSk7rmJ0
         bnagIXGBThf6lRnPXOIGID+y4yQQRVx21C5q8oxc5QqHblLvxGuACayKwrHnJVZz1eZg
         vwyBm+VyIOYbQIChWj99LTcAX7NdG46T5gHOWAImVNxpHS8s4gJ61Kk1J2ZqvminZtb7
         LOTLhETKLUzfCMDVN5h6mX7xVx1kM0Yo0iNZ647ZiWytheCWloRi3mfpWvcc9bYzLkoF
         Q3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxMBTnhj3aV5pjHlaguaN8dssOk3kKHDk0WmsIbEf9DUZuhDfqGNC3Dw+8QD6D5hOXl2mjpAA8GXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDMZMiQC0n5Xs0xx2SrE+4o4l21kwiH0JDb16quOyfDca5FNj
	T3Eh3cF5g6BMSlw1u6M9RopjU0lJzyCMD+3jZlikulX/ghs8rwrAk3lyo9+UFCMbzWwpqQqUBwx
	mp3jTNCryT4Yf5H//Ba1NfuxVbc3O07466sk/THHMjPwVxLDhpXbzpzzOd7EXGg==
X-Gm-Gg: ASbGnctOtYkPjZrtfTGQA8ZhyX2wstXyaTvsFYlp9yROAmpv8uwSZTWovnvqEYknvEV
	nvbxa4zmUgZ/swfUMKBTn86g3Zd98Aj7BdS5BzB5X+JVxdOK6YWJe9J57oDoAkzCesQCWWyZe85
	z0V6WHrGd0UID8N7J7t3hsRM17lvU19s8pOjjHrXAujpJNg/uK60pW3W27dRi8rDZE55FgXo6xP
	bXAHEiyhw==
X-Google-Smtp-Source: AGHT+IE1HGuS/UXcZN38gJ3Om7o1YtfpFub9gZFI04jZyWXYK0MsDeD+zd2QDgtR2tqTqw6L383temVsLjgXJcMqHOI=
X-Received: by 2002:a19:3854:0:b0:543:e496:81d2 with SMTP id
 2adb3069b0e04-553b80b35f5mr477852e87.4.1750131728234; Mon, 16 Jun 2025
 20:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616132152.1544096-1-khtsai@google.com> <2025061642-likeness-heaving-dd75@gregkh>
In-Reply-To: <2025061642-likeness-heaving-dd75@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 17 Jun 2025 11:41:41 +0800
X-Gm-Features: AX0GCFsqS6ELG_timUPRELpGtN16JVLYdXgKdTK3Tm3fK47Rt6YG8b1h0yiBp8Y
Message-ID: <CAKzKK0ou8gt4iBcpz9cs8V42BaOi29waXd1zCw+Cad9fs=NEtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "usb: gadget: u_serial: Add null pointer check
 in gs_start_io"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: prashanth.k@oss.qualcomm.com, hulianqin@vivo.com, 
	krzysztof.kozlowski@linaro.org, mwalle@kernel.org, jirislaby@kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Jun 16, 2025 at 09:21:46PM +0800, Kuen-Han Tsai wrote:
> > This reverts commit ffd603f214237e250271162a5b325c6199a65382.
> >
> > Commit ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in
> > gs_start_io") adds null pointer checks at the beginning of the
> > gs_start_io() function to prevent a null pointer dereference. However,
> > these checks are redundant because the function's comment already
> > requires callers to hold the port_lock and ensure port.tty and port_usb
> > are not null. All existing callers already follow these rules.
> >
> > The true cause of the null pointer dereference is a race condition. Whe=
n
> > gs_start_io() calls either gs_start_rx() or gs_start_tx(), the port_loc=
k
> > is temporarily released for usb_ep_queue(). This allows port.tty and
> > port_usb to be cleared.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in =
gs_start_io")
>
> As this is removing unneeded checks, why is it cc: stable?  What bug is
> being resolved here?
>
> confused,
>
> greg k-h

Sorry for not using the "cc: stable" correctly. I'll remove it and send
out a new version soon.

Regards,
Kuen-Han

