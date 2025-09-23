Return-Path: <linux-usb+bounces-28570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D0B9791D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 23:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9E03ABF6D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 21:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9810F30C622;
	Tue, 23 Sep 2025 21:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHGwRrl+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8755265CBD
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662989; cv=none; b=bXXjKRKojsWbfhEl2DrkpNcQJVKbQ8rQXqHMwX5gG8GjBvFtQzE4+tXHsS+sFwOjqbswzSfCAdYHwWo2p+Hp2Wn7+5ebbKfuXeV1pYg7oAgDziN8Mu6YM2FnaHCNoEFauAzcwj9tBxZQEtgBYsdHhR7pqYONTIzoxAWPFn+d/tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662989; c=relaxed/simple;
	bh=klwPCi4puQ0zuDEZyWWCXYcdBGsO/A0fjywC3l40eYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQGk7q2j6BQEAJPRmn0Z/3Lo21v99IRdH7CP6B38P+hQiNaTKwU/32gy5ZaQkge6uH24xhrtYxODeK3aiGvTQAFGWrOfecVcanHfe3Lx2EfAqjnLJCQOpRQYHaouuu1I6ItIx9lgxwGPA7S0nKBDNldpk1H/z8p2Gj3ZXiuZ9CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHGwRrl+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-333abc4394dso103388a91.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758662987; x=1759267787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klwPCi4puQ0zuDEZyWWCXYcdBGsO/A0fjywC3l40eYA=;
        b=hHGwRrl+vRBIDsXW8Yw2H3AsVLKcoHwqEz3rusLUH847L0K/xR6LURZHK7LCyAWcKy
         4/Ex0JtciQx4FgwTlh52fghHp03M4ZEPJeeExyuFRKOY3UF66a3fS9b/SYIfLlEbEhKu
         SnfwYZO7KfVQ/uNvGv+Lis7zUA2/LgZprAg16U8FF4YgcPYiCghtF+uZFr+dEbosuIZ8
         sMUyc+SKv9/ks/XndtdMfQbrPccQoZHgZB2knAcJa4wJgFwttAoJEJUh/S9UFy2WsWM3
         L858KQYn3PDzteG83ra2UBUMq+6MkdmxT6H56N+EAZWU32N+a3YQ3WJ3qKgexG7+hEcz
         DqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758662987; x=1759267787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klwPCi4puQ0zuDEZyWWCXYcdBGsO/A0fjywC3l40eYA=;
        b=uJba7YMNDVguQxv79D9DH74KOdbvlLsuqJRlxvcx8bvmKD+Q2ziWsFnQNBMjk/361p
         Ve2nEDmIqNQemlevnDdVuXyVOO60oJDc2FvGRLTDqAwtQt1eNyUnFaP7+BVG9gPXj2Nx
         yDT0Kp84ujAYnWqYMOYdFphwRhnPskLSe9fkg+XFhmJEpr6GWUCW7T4p+jxcUP9N8S8N
         9aE58xSESqMk7BjZZSNMkXZb5peAqei2fz2/KOn3+7QtyWh7GOFtW/vuuFpTCCKYLmj4
         h2cvXx2jRUbKsj36Ac3ZjuD0tJuTvWreo8HOOHe57HOEq+5RKQTlL+eptOPNZaDRX2de
         HOzg==
X-Forwarded-Encrypted: i=1; AJvYcCVSH/lsZ+nCivUh2zWAnTdieRwSzM4x1H5SSReY8ZZd14IfPZDUIjIGd+OBNFboKvU6YfGQQkZ0DxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6/4TUqJuCE1Ue0OtacLNg5auPOLaXvfa3FN+B812CmNhz5NP
	oCtDFZW5ckIINyNLVEl7mGbIo+5+yXOm6ZPktefn4y1bUtpLEhZt4cgmUhHecl4TU0lzYN0ZYBc
	yLtZh/J51AnIvE2DKQPKINqSNsiaOASI=
X-Gm-Gg: ASbGnctXeclVbVUFh2XP5sk0KwVX12Sg47dTwe6ACcEPM1C2+TFZPTZAdfWWoOwIn8H
	0nFlyeVA9PmJTErW6j6PWoaS7R89b1o36UHmnNYiVJrr3L/d7cKPVOltZ2KS7OyrCCcgZTYbgsI
	iiwKwvU8KbPDz6OYM3LGBWnFpPcGKoykQicHbKOoABHMZd6OFWtn0KmUE9zvfbvSemJh3zRkfpS
	0lq1XkhcEAmrAmBLVtiYF3ZQB/bRjh/VbWNcRzgem/Ugs9SOKN67IkCEPUVm23R3nbd/otgPz3M
	Vc7AS/33KTEJ+zFSCTlyb1jUBg==
X-Google-Smtp-Source: AGHT+IHm3C1GpBA3VBrZexjxAHTLcQA1zEDuqcUGIlepgOANCbpnx97SeKPhu08lBO/7UGD9tgSCkuBSZ0I0ZfqhRPU=
X-Received: by 2002:a17:902:fd4b:b0:267:bd8d:1b6 with SMTP id
 d9443c01a7336-27cc5de0da0mr19480475ad.6.1758662987013; Tue, 23 Sep 2025
 14:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <2025092338-elbow-dash-373d@gregkh> <CANiq72k4VG4UMDJUUfD=LNM+tJmvceNDxG=A-+6GDjLzCVXurw@mail.gmail.com>
 <F14B2B5C-C361-4670-88C0-61A1EC97E630@collabora.com>
In-Reply-To: <F14B2B5C-C361-4670-88C0-61A1EC97E630@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 23:29:33 +0200
X-Gm-Features: AS18NWDubd8RGsH6mIJhWBKGluo4Gi2SmLUql2vcus2XnvSic-9i6pFMqT971zY
Message-ID: <CANiq72noNB9ctcj51sJ=vvw6PfocgWRAD7sxBJHAfbNt9ZcVaQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 3:25=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Yeah, I did not add that on purpose. What=E2=80=99s the preferred approac=
h here? I
> wonder if we can add the Rust files to the USB SUBSYSTEM entry? I can mai=
ntain
> the sample driver under a separate entry, for example.
>
> I=E2=80=99m open to any other arrangements.

Up to the subsystem maintainers, so Greg in this case I assume.

In general, maintainers may want to maintain it themselves (thus
adding the files is fine as you say); otherwise, they may prefer to
have you as co-maintainer, or perhaps a new sub-entry with you as
maintainer for the Rust part, etc.

Thanks!

Cheers,
Miguel

