Return-Path: <linux-usb+bounces-28537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DCB95E65
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 14:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61CF161BA6
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A357A324B0F;
	Tue, 23 Sep 2025 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0qF03GE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA83323F69
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632181; cv=none; b=HJdV/Uochr1/jbMGiXQXQXGR9WpjVTMwIn2K7+CyhWwtBI7R1Y/oLnETQ3jxF5qIHpr/Vj8ijAJg2Vb1LWv1127bF7ygbnS/WwGpIWJja0mebuFJepvwIZ2xCzkiAeXh901yJzyPPdnigun+B3yFqAUpXl1PIVUoD+7H6aYuBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632181; c=relaxed/simple;
	bh=2tluKtN1BCzud6kXRW1xroiXueZTffg1NnGk0toH+EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avVGULLbgLRjn1Tzg91/iFuJr50i1QuoTD06rqpiTaVhUg4AjkXWT5O2t5sC2d/t93wUO3c8rT237abpADuuGNYGXBYexLEc9bR2yHLX6eJyfESTaUR0mEqWUlEIlGLfmmGKIu3txoM/WbLX6DHdbQt1pFU64XFhkAf3XRZE8qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0qF03GE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b5235737aedso630785a12.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758632179; x=1759236979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tluKtN1BCzud6kXRW1xroiXueZTffg1NnGk0toH+EE=;
        b=a0qF03GEt1uYeCzfaaR0uiPk8lUSXCNeGCryOYQ6DZaUGVYKMzI6442K7sjWmkdlku
         WrLRiE6RmQyMYLbjTkCuDjG1WrOEd32xLawn+FXO4kft3ne4Uh7lXOrJf00OJLyzJK9o
         nefo9LqzgH9clr07LpwdLVNL0j4vkpOWaFNgU9XKK/54a+P/PWQMdjYp1hIBoYsJRSEx
         lAZJWofzVBo7kDHacXL1JtCXkM3cCIdUZS/05KKx2mtfL2qW404L9jmeu4O1Z4r+xLAU
         7afd8Nyuj+g7YqR3jYAkXGjym/sFCWBfkgIXaiPhImc9C9XDeBHx5RHvhHXD33uQiXlQ
         X66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632179; x=1759236979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tluKtN1BCzud6kXRW1xroiXueZTffg1NnGk0toH+EE=;
        b=oTVh7KTPWcjzpWD9R9HOE5J+Ch1IpXM7xDgqGifN7ZBiybiB7us3Vait6jgXNEyfCO
         c90lQXUVkt2p8/IolQ9A/cL40Bw/ldSp3cByqyekVFY2+mRdlpegp+3syBH0gfYniPnC
         6f6TuMNg45vP9EeVXQN8IkMKJKmj/3Hgx+diIeZu0QZSY5YcgsSlrHJ8ZzZ2m4fOO89m
         cT8mjfpLTVQkgDHGM+XKBNH3SGbYEEDql/Oqg8o6l/wiJIYQHtQvBpAGcW7nAet7395y
         jFmt3Yiyll2YDH3jANdpeJYoKhiJJ1JhvT8NVbHND/S8Ed/RaYy5lt3QD2A/KEXh04Hm
         Ewyg==
X-Forwarded-Encrypted: i=1; AJvYcCW0WPqT0wKEHrsuZmrPWIRONbMh8e1OdMX0sn0lEeHGcs82Daj4L9Ixml+LhYU1TwyWBgV2ThG/rxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNWmLGivm0dlaXpTmNE0SGK/n7fxVtEx+GVlRWAl6d254pCnF
	/cRq4mRB4tJogAB8uxedx4BaTv1egI2FFVe+ZqKSrMVtRoOGwVvwK5blWZbDXHpTP/5vf8kREaa
	Ru1mGG0oawTe5rO3A4nvtWwa0SSmlyxg=
X-Gm-Gg: ASbGncswxqFKaFzH/HZROgO80LRHQ+WjYoXYu663fdBObLcwUaBUQE3zWEUOOO+ehpY
	HgpXdg2zLClMcoREPj/Q+4uHt4oVsRrR0umC2zR2362yodmzLmywhfLsg7l+lG3s6bCC3s4I2uH
	5UNwS4iojqCAKUm2gMqltLAyRAWxHh+KGTbC4LSucyqUaIIBqMRqmyUQNhfOLqPFIqb9eDF5hc9
	e0YNzJEzgrPzB7b0eRlAdw/axlYEH2RBV6kJVpnbbC2hQfh1de8oTlfbGBrEEhNk4vgMOhWlK5B
	Gf9/eQFQgbO77Tim/NMIuAYw0A==
X-Google-Smtp-Source: AGHT+IF0/NkAjbrntImSusssyg0q/7Q73fQZB6mEfktvsZqm+jJxVnz928jvTWpp9QHkKMte89aUba+cxGL8oEh0ahA=
X-Received: by 2002:a17:903:41cb:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-27cbbaa4eb4mr16801825ad.0.1758632176486; Tue, 23 Sep 2025
 05:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com> <2025092338-elbow-dash-373d@gregkh>
In-Reply-To: <2025092338-elbow-dash-373d@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 14:56:04 +0200
X-Gm-Features: AS18NWAH-rM7NFZKlCBr66FQi40K38NtL4yX19rUN2GxoJY45g8UXFo0cj5K8Zc
Message-ID: <CANiq72k4VG4UMDJUUfD=LNM+tJmvceNDxG=A-+6GDjLzCVXurw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I tried to apply these

By the way, a `MAINTAINERS` entry is needed, according to the log.

Cheers,
Miguel

