Return-Path: <linux-usb+bounces-30006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D69C2B512
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 12:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55C33B9878
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 11:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AD302179;
	Mon,  3 Nov 2025 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijnyZwNt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64348302166
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169083; cv=none; b=SR6x2M4dFXwUApQYPHdhpvEQNgvMVEKYJsEMEoVPsdM576rDORX1hfz0Kwy8ZJj52teTP9+NI5ljRa4tSDVmeyGwD56xSz4T4p5LmKHVLlbWcb+cu26Y3u36Zw0hgJvA4BVHUZaYsb5nQrZlQ7xwrvmHuhvdeLnuGL2x+34FtHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169083; c=relaxed/simple;
	bh=ygGB/YN2U+7m2mTyKycwXt7VfQMyJC+JIr2jtvOFeWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx6gvepOOrtcph5Jy+i6O+hsMbRomiBxOKWL0/mtinOMhOrlto+f79+FTjwdATxb1bZqrVJE6uSJBhw4N+Q8KcmRgt36Tao8+9Ipno+Ad0T5Un9Q2FI3BTLkFPx1+Jo4isz73ZjZyTTy5EAwGrCGs+A+BZTyz0vncWLczAE6fj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijnyZwNt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso1746024f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 03:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762169080; x=1762773880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JCDN6Cq9Tp4TkqXv0Efe98IMAIjlCf0jxvF8wS2LXY=;
        b=ijnyZwNtzBIqKM5Q/1u8nkEft3dm1LU/jlI7KnRBUW7cCq6AzFtwpz9DiZzRyXpHIT
         c23TsZMUQmwEwMlFgf0h+pEkc9M21Vgxlr7qyX5oFlbK2uW9ThLT97k+YHOTT8yeoSy3
         i4yowicAmT7pG1z2yVY4ie/cZU31Z2Q95Gr4WCKTMikd84/YRlKGpPdV72tYhH8mH7wX
         +uhFfv7OaXl8KPL64R/anKl0UCTZeEi16fso9m4eB9y03IXJWdDUzC/e6lyUsPL18b2m
         mb+UBuFYV5fmRAPuuy4DfQi27HszEKabvyPLREkUXV29m3StfeaQ6owvMMQCObjaAxYa
         LzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169080; x=1762773880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JCDN6Cq9Tp4TkqXv0Efe98IMAIjlCf0jxvF8wS2LXY=;
        b=dWRVMY1Ilx11W0BPwBWQVMWlMw9jokIX+C3Unxtf7KDCLUysbdb42FyaGh1MtmA34f
         Usl4/YaU+7gMHVOezwjHNIWUmHRs1CPgqDusOwWNg4GrVlaM/tlwuIEgzsKwluHcd8jt
         j8ZQpC3oUb5JNNVWKsDByUs4eC+knFz+2j58VdNQSy7P8NzXfQyfUhstKzJOiPbKFKPD
         pTohks3QOvoL06MGSdytUdVL3yNu22gUJPbD7cRvg6bL/DzPOklLgvSxjmGKty9aEvKT
         vNYZHbX+XaDOdNMNw2/nYYwFpTxnMJi+Q+ETr2NENi2nirrKe9tV0mnHXSBQlZ4aXsee
         aVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVieVj2AiAMcFkzsHnMF1ZTY2n2RrfsU0g6xshTzEyF1TRqN9dgS0/pavMupzjuIhv7Kk/MeuLGa4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDLEZdHhng+0TTcy1aDrIY5Nkgjuy0h1Ds9H3vV0DHIDono+1
	MCaclFrd23u3+iOuu2DDcmPIY/yoy3g2H+gv4aZYJCeaRuUK2PZmVEZWHOXh3XLStsDqVKFWQB8
	UgZjF78bEuArTPzzJSzZqvDe3AkGi4lOZGBfNVcCP
X-Gm-Gg: ASbGnctexxtJWr7iWN5ClT2IvV5HlE0i5oC0iL3wOsjk4JojvSgPsqV/VTKd3I8Kt6X
	+KmISqmnO0qN87f0KtBJw+WOOcgF6fsgo5LqIbH+vb0jCWuOWIwv8XlYtnzJouUEYL/jBCzrxK+
	Dm6Twzz2c4MqtyXJmzuPKsuZG+TVn63G1/6hh3rNxHKP05IQGf7adyQH6pddOeeyb2ymaEsYTaO
	jEzZR+4qDIcD9GlkkbVpYUgTC6HD7jySEcwl9Wia6PQzW3KvXPvtblyAYzgUgvZvYxynptI+UXJ
	mtHcwhvfi9QPFOsvpRfHZEtzAw==
X-Google-Smtp-Source: AGHT+IEKKis+/HH3jWT32CB9QgsHkpjuV5cak8KRGxOaDTY12Fw5xz2D+VE21Hf3ijFUTW2OmLNrEQDGT1Em+RSKdMo=
X-Received: by 2002:a05:6000:1867:b0:429:cbf8:1765 with SMTP id
 ffacd0b85a97d-429cbf817f7mr5373560f8f.33.1762169079371; Mon, 03 Nov 2025
 03:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103110115.1925072-1-dakr@kernel.org>
In-Reply-To: <20251103110115.1925072-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Nov 2025 12:24:26 +0100
X-Gm-Features: AWmQ_bnZiZ5Fse_UVDSHcbk9FlrG8xkBgTuDizGmSR1AoCz8I_gW748IjzTe-h0
Message-ID: <CAH5fLgidquc4nkYpeSD=OHzxYjNWoX=2Uc6iYWd2J7Lr00Ma6g@mail.gmail.com>
Subject: Re: [PATCH] rust: usb: fix broken call to T::disconnect()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Leemhuis <linux@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 12:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> A refactoring of Device::drvdata_obtain() broke T::disconnect() in the
> USB abstractions.
>
> """
> error[E0599]: no method named `data` found for struct `core::pin::Pin<kbo=
x::Box<T, Kmalloc>>` in the current scope
>   --> rust/kernel/usb.rs:92:34
>    |
> 92 |         T::disconnect(intf, data.data());
>    |                                  ^^^^ method not found in `core::pin=
::Pin<kbox::Box<T, Kmalloc>>`
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0599`.
> make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
> make[1]: *** [/builddir/build/BUILD/kernel-6.18.0-build/kernel-next-20251=
103/linux-6.18.0-0.0.next.20251103.436.vanilla.fc44.x86_64/Makefile:1316: p=
repare] Error 2
> make: *** [Makefile:256: __sub-make] Error 2
> """
>
> This slipped through, since the USB abstractions are globally disabled.
> However, the USB tree recently enabled them, hence it showed up in
> linux-next.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/all/1c8afbc0-e888-4702-9e4e-fa8aef0f97ae@=
leemhuis.info/
> Fixes: 6bbaa93912bf ("rust: device: narrow the generic of drvdata_obtain(=
)")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

