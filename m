Return-Path: <linux-usb+bounces-28532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5BB95D82
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 14:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2FBF7A4CEF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 12:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4499F32340B;
	Tue, 23 Sep 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JVZ1vwOg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A8315D43
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758630558; cv=none; b=sJNKbna8w3rv0U7q+p8+y53Q9fRQo+7AGaS6BYRiONp8yPYCr6FTTJmBY6gVjeFDQnJat8o+vZ/UTAEKz2no7w0G68ks2EQy/KRpmA0VxaJnU6EouIWINow4G2WIERKwzOaT4rQRSvNPhuzScfZNA/nfyrrqyfM7tTUOUrMR6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758630558; c=relaxed/simple;
	bh=b0629hWOk++FdHoGQx4DsyToXSGFO5l7TnIod+y+aY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrPg985Ffr9SoW89TKhFDrLPPDMsbpoSwgIAttdqDUCRUWseXqaQDEy2ddW6a6z1WLuyk800pGDrcGA0cqpX+Atipb5NYYGLbMNwHco2OPySYLDrsIIU2z/YfYP5CsgxsZ9uFkO3C0qsqLuxw7Yf1YLqfB83gPbRZKShpMcytQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JVZ1vwOg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-267f0fe72a1so38618915ad.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758630556; x=1759235356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpjVEQ5z5WVH3TKN5mD9AEhTYjfuhAvILNbJny3GS3U=;
        b=JVZ1vwOgBq4aQIkufGPj9BPA4DX4fDTX6z0FXBLbfGLj7tEPy5Y7YRwYn62xshYR7G
         vDNx9PCicakczMjeNngLjbgsAtp2l286ueNzFFXUkr2LhkaCkQPVeCuc2WLgCTnBDnPs
         sLxas/73RnrE9QklUW9eKo3RUDxJ2EBpBebO60D9SNm6qbap8TIZou84+OUD81vj6j/q
         cs1bLkoi699hSkdUjxn645ANmxuG7iSu2YOaS557DqrHEnkte3a21V8tcxfxic0HjF1c
         oijrG07AX8Ib75jBDj6f1QK0bouDCLRfVsIETAgOo6W7d7ZqerPDlc2cp7D7RznK5elx
         Sm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758630556; x=1759235356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpjVEQ5z5WVH3TKN5mD9AEhTYjfuhAvILNbJny3GS3U=;
        b=Wu6DWWgendZjh9L4y4BjZgA7QbzKU4ly6Uex8LA/m+LLQp5QmnM51VUynCjXwSXG/H
         xt0AIth5HndjNqmVzuD+wi/CuDNsz8seX6odUC0QKYFkH+uLqRjy/AGbMRoLwgnGS7CK
         KqyK0X4+olvF0g9q4hkYcBGU0Va5ZoDp9FM7kQF42M8BRimjkrwJTTSD4OKy/+MYg99u
         EvuzzvsqFLsM6mgFa0UUW0NFZtHK39FPTUtPIePBxrihthZmGdsaFLfFAMbyoAckEyEr
         CdHBO9pKE4nBj9ulUraJopPQRUnsoW5oeSw4jFOywsghyQplkdMlkTJZ4j02W444AXlB
         1kvw==
X-Forwarded-Encrypted: i=1; AJvYcCU8JcGeKC7JW3gqyOOb2fjqVu9dlDim4pKuJy+P32L89BQcG7wfcCQ0V6D9LLUjckAUKOLXA16vd44=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEKDyRfcWbVjL7sDkK8MNG2fdfleU//OZPyXEwGYk0KMigVNIY
	DfLp5hCc7ru9J/ez3uhKAUsamMCqjWBaxYMu6PBv97s3ymL+hRvN9mPJGNkW0KYx7fK/4qD4DNV
	w16p8k4oVpvwbBq28qOAhvhy8SpLN+DVhdYMYSqVb
X-Gm-Gg: ASbGncu+toMMWcnyWKbX5EQFmfk8MyWoLe8h3ttLT0y+oMzI0zAD3WGH7ZggdjloXXX
	NhG1ReaSN3YaA/DC+tYgpACNuHurZV/sMehzew8NksNMadL/M19KqWFrAYG6bnKGeRqMXQGC+yV
	w06uPmoBGNe9Acp9pmkambAYsC0U8GHoFYwVPLeck6P6PTLlp7KNHeoy/24UGGV9F4uMCfWgo6L
	3QGgIbMTvqaBQ==
X-Google-Smtp-Source: AGHT+IHyp6poHtnMpA3kzSW7rSWviqzVVOw3NeVKRaOQ4IW3iAH826ZyVeXOg7aqveIlnS65wQjOHr5bvn7xKJPvUR4=
X-Received: by 2002:a17:902:ea07:b0:266:64b7:6e38 with SMTP id
 d9443c01a7336-27cc5de11bdmr33567235ad.46.1758630556307; Tue, 23 Sep 2025
 05:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com> <2025092338-elbow-dash-373d@gregkh>
In-Reply-To: <2025092338-elbow-dash-373d@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 23 Sep 2025 14:29:00 +0200
X-Gm-Features: AS18NWB7QE1N4rYqtAdt4Gmw5zNv1gca0xZBJ6E4G4ribW07_KnqBaVHkfkD8kk
Message-ID: <CAH5fLghm-syjWRrj=G2==W4PorPq47bkAPfkeJ1UAsGbbRhPfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 25, 2025 at 03:18:04PM -0300, Daniel Almeida wrote:
> > This adds initial support for USB Rust drivers, not only because I see =
a
> > widespread use of module_usb_driver() in media (which is a subsystem I
> > aim to support) but also because I want to learn about USB in general
> > and this is a nice opportunity to start doing so.
> >
> > I tried to keep things as consistent with pci.rs and platform.rs as
> > possible and tested it by manually binding a device (i.e.: my Logitech
> > mouse) to the sample driver via:
> >
> > /sys/bus/usb/drivers/rust_driver_usb/new_id
> >
> > This initial patch is therefore comprised of the same patterns that are
> > known to work for pci and platform already.
> >
> > Physically disconnecting the device also worked, i.e.: nothing bad
> > showed up in dmesg.
> >
> > Note that I did not touch MAINTAINERS at all. The objective is to
> > kickstart the discussion of what to do there here in v1.
>
> I tried to apply these, but I get the following build error when adding
> to the char-misc-testing tree:
>
> ld.lld: error: undefined symbol: usb_get_intf
> >>> referenced by kernel.1a949e63ee2acc6a-cgu.0
> >>>               rust/kernel.o:(<kernel::usb::Interface as kernel::sync:=
:aref::AlwaysRefCounted>::inc_ref) in archive vmlinux.a
> >>> referenced by kernel.1a949e63ee2acc6a-cgu.0
> >>>               rust/kernel.o:(<kernel::sync::aref::ARef<kernel::usb::I=
nterface> as core::convert::From<&kernel::usb::Interface<kernel::device::Co=
reInternal>>>::from) in archive vmlinux.a
>
> ld.lld: error: undefined symbol: usb_put_intf
> >>> referenced by kernel.1a949e63ee2acc6a-cgu.0
> >>>               rust/kernel.o:(<kernel::usb::Interface as kernel::sync:=
:aref::AlwaysRefCounted>::dec_ref) in archive vmlinux.a
>
> ld.lld: error: undefined symbol: usb_get_dev
> >>> referenced by kernel.1a949e63ee2acc6a-cgu.0
> >>>               rust/kernel.o:(<kernel::usb::Device as kernel::sync::ar=
ef::AlwaysRefCounted>::inc_ref) in archive vmlinux.a
> >>> referenced by kernel.1a949e63ee2acc6a-cgu.0
> >>>               rust/kernel.o:(<kernel::sync::aref::ARef<kernel::usb::D=
evice> as core::convert::From<&kernel::usb::Device<kernel::device::CoreInte=
rnal>>>::from) in archive vmlinux.a
>
> ld.lld: error: undefined symbol: usb_put_dev
> >>> referenced by kernel.1a949e63ee2acc6a-cgu.0
> >>>               rust/kernel.o:(<kernel::usb::Device as kernel::sync::ar=
ef::AlwaysRefCounted>::dec_ref) in archive vmlinux.a
>
>
> Any hints?

Did you enable CONFIG_USB?

Alice

