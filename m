Return-Path: <linux-usb+bounces-29439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B96BEEB95
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 20:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4AB71896BF4
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 19:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40722EC0B5;
	Sun, 19 Oct 2025 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff+dH/WY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9952EAB6A
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760900377; cv=none; b=ZOr+xxc1cBmwsLRMv6IA/YwLC3FZL5UZp/vP1FL+IQZBuGoAsSyBinzzTAxkrI8UuDsVQVTuikgHByioF8FEHewiChhuBkAf3JeRB65m1oVLC/KmzyxX2iFAfmdHgDO/pATv9XK2YFAJ5Bs/IOaoNNUd5VeF68JYdHYMvgzvdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760900377; c=relaxed/simple;
	bh=nj/PwdyUHa3EdM3zA/zRNjpb3Mt3Z/MnFk71LgogL/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGljpsfKEl+MDSxjVdec7V0dP4mcOkytbfYDpNPTrf1LKSz156GHlHH6b9wU1pWOtrSY+mm9egLXcZadcePyNxnoIQy2FN7y19Giq/wwMeRjOOC9AmB14HT9qXfAP8iqjNguWL1jQj9PkGcLb79UpSXj769sC7G7nbHCc/laG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff+dH/WY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-280fc0e9f50so6804265ad.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760900375; x=1761505175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj/PwdyUHa3EdM3zA/zRNjpb3Mt3Z/MnFk71LgogL/Y=;
        b=Ff+dH/WYrF7SlOTBPXwcBru0i1f7ilZrA+ixLMb4+Go0yhP4lG5/0/cek+wndzCs3l
         gn10Ms4HRaNjJxvxDnHOXXRJSuCAHQ9wFaVvXYNv2l8IvFFoD1mRGUb8reQrhMGRqbQr
         2A9YI34DmaAUjsTviffyEcOguEMlkWK/9EBuKhFVMvYI1zivlDZ411v4Qmi1pMmLwoen
         8x1Lfldx15SCFxAU9W8rmZtA+JBzdns6VwTARMkvKaLkE/oGOHdsrCa++x/t7AH+4a/m
         IasM+KsCbVMSXQSi4DIn1CvaB2kLK7HFUM1QKslGAX6arGlz+mC8mhLy2atFhbC9TFn9
         bB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760900375; x=1761505175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nj/PwdyUHa3EdM3zA/zRNjpb3Mt3Z/MnFk71LgogL/Y=;
        b=E/QF2KD2uSqQBA7p1pgEqwmSQzgbLkZGgF+loSRKMD8FKtSBZDaW9JEn3u5lqX7EQW
         sViYz02MwTsw3PCuLGRFuhhhAni1v7/wHy0wnK+ghshOOF+kjyb4iRWpCOc7SogO8D6X
         hIfBVjkcZQMGK54Dyp+ko/TtAr2tTEWrD/l7eL0u5lTKDSLhbzFemAXRVfpwYx3clBTo
         Wb07NCHQpZQ30SikFsds8sYQ7qEv6f94/3WFOLGKKN5/0BjgcNCNty/ONnKSBHfc2gWW
         8nabWXtYGVn0lFTZRL6jWBffDKVPzb/o4E2qph5mKMYsnvdyruDWZECsY3yr5EH01o9r
         RQUA==
X-Forwarded-Encrypted: i=1; AJvYcCUm8kjEDwOB+tPmckyKj+GnuSn7ObsK5o0AdNA9E2lW7OzF1AZBbO5RQtwddxsDhKB72rHOhaqgKKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrdMG54pqo7FoIsHCAe5lCXZNNdUpS0X7oE3vBiHU5VndvyKe
	E+gO8dWV4qYGnInHKmTDU1/48SyZFJZ0IhyS9D8OqEmaGTdcIh4dx1N3lAeP2BwH+Ueb7Dgka9Z
	dtGwDKekarHXtYa44N9cdE1Pcn5uISgA=
X-Gm-Gg: ASbGncs5SRMBIicCBZck145N3HCu/vzswY4p/+JOKiKUnLPYZxHJtvz4Ea/3CrlWgOm
	8O/cVXWFZ8DIJKaaQGLdc47CcCtnnLOYtNzjgNrQsbuOr27yuTXPJuJAPAeyfj25KdFLte8pr09
	PZy8hoEmbFrfXP8i5OZ/DVEOzyXowiXbuEMR8izUYf+cKWTnfq/4Vr5aRBw8pTOpQa9HOgMPRka
	X+1QTHM22V/p5b23hwiKoINI2dJs9yycI8anC+2Zsd8xZCiLTEez3gKQTd+kCaBfoVvkfrUIhPr
	nKuVPAj0FwEW+zSvoZ4DEMAC+f4i6CbpOpNnYwZfnye6smDZ0/E6oMpa+AH7zdk8cSNxg3B4d2T
	jpooecUx+YZqZlQ==
X-Google-Smtp-Source: AGHT+IFUNFNsgIHwngvFwlMG8aMEOLjZJdhe4E9fo3Ad+ao+mbyr4xKCUfGHRwuRI7LG09H3cfLrVwORSg5QxYsl3ks=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr69411885ad.11.1760900375198; Sun, 19 Oct 2025
 11:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016231350.1418501-1-ojeda@kernel.org> <2025101758-mystified-prideful-8016@gregkh>
In-Reply-To: <2025101758-mystified-prideful-8016@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 20:59:22 +0200
X-Gm-Features: AS18NWB0V0r9stVsy6SHvBBPktKhMWz1R1H5p861HWbvzNbwfaAR3voM0H57gac
Message-ID: <CANiq72nXw4+HesrgNqJjTy6Ji=pVqUMzx7GDO+6U9VYWezTt6Q@mail.gmail.com>
Subject: Re: [PATCH] rust: usb: fix formatting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, linux-usb@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I don't rebase my public trees, so I'll queue this up after your changes
> land.

They landed in mainline, so Linus' tree is again `rustfmt`-clean.

Thanks!

Cheers,
Miguel

