Return-Path: <linux-usb+bounces-31942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5BCF6055
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 00:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10EC2308E642
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 23:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7783126B5;
	Mon,  5 Jan 2026 23:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3QCJsIV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F92D7802
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767656526; cv=pass; b=NErIkpMwamvD9za/9HRHzOcCtaYQr1XKf6eGumwTAysBjx+kB5SaKGlZUl1Kt7ZWLnulqhOezYBx5/8+VWwWEeJJtyJA3CgGZSV10MmFkIHlTv94lCh82SfPwBsP1BPor9LPvoPtYXlqr0Yh5Itj4RCHTCNX/m5JRWGql3H9EkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767656526; c=relaxed/simple;
	bh=iHHgbjguAHEnXawIB+JIaSb5c9TmEty1OIPIu/hymr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvWqwa7JIVhcyzGGq3WfzvMOSzmQHGoHHduLv8GQkRc4hx8T6dbjc19p01njEbDArlWbtl9I3Kzabu2rYbWMastHTAL1XS4OWYOkJAOK594HPMn0Sq/abYys6Rc7CszkSBZVqhAv+wD06bms+84C3pROOXhGnmyCwC+My9REvLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3QCJsIV; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f3018dfc3so1242345ad.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 15:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767656524; cv=none;
        d=google.com; s=arc-20240605;
        b=Xquy+HMHH6iBJkWHp2J5ECKoQecfjIYyrFUiUKTPWoz/C0vAB81Eu6Fm/zF+DfSvVX
         Yot7SSkyX/u3Fo4o5HkgiP0D/VcPDEMudMv4BzzhLYyJmnaVzAsOF29CXxAz3K95kdFR
         maEaGQBB7mzqJHUinaBI5lT6DYv4AQ1oXdWERYWyKdYDxJZWihP2ISnPTDZkZycOs5yx
         VmOD8RoiB2DQp6bLjNK0K8zf/pp+HNILgU4BCMhb63crVodMlLi5kLvib2+50GuNQDyO
         SYKbMNw563UdJYU+oXn/sr3r6X2tM1Us8GpQHamQJjIirnpZD0YF19GJZO9Y1y19pgLt
         cqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OIRkwOggpsjKhMAOp1NcMVugg4CNhuGbCDvh2b7ZpY=;
        fh=iorFa/1Tyo/sY0sa89CPDsitdxqBDpM/M6r+7CfEO2o=;
        b=S6l1cMjXN2l2cZv/YMhqwgIIXDG5yiDR7+XrNTNA7l+bU/pxh9b/l4Mopeu2BSvs6+
         wNtHEklyDNWrzHxR//S3obaM+sQ4XPE/SF6I9DVdBnFIlVv1dM2wRt7/slMMGtChfJbW
         J3IRhc8i8qM9Gk0b5gU832LCSjrrqbxezNS4sYVCMApIm7PzkXdP2XwQ4ZxCVcn6wYZr
         MzZ6D5YOOQq5aZEek+KUy5ZNfXDS9No1fmMmCJCqN/oeeou+JO7sO7K3KceTSflcUJ8K
         YtD233VbWy8j0unl9ouDTU+r/GVW7al/sokhid6UlLfkOQ5gM2F7SpmLF69UODCrseAt
         PslQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767656524; x=1768261324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OIRkwOggpsjKhMAOp1NcMVugg4CNhuGbCDvh2b7ZpY=;
        b=G3QCJsIVUl5PmeVliCwr6uK3TOKpq2i0wh70OvvaZELC6p/ov9bIP/KyyeCQAQxabz
         o7BJLN9wfFDl73d0vELDosum2OlY9CtxSWnzxwLhVJpCsx8ITB6W9pH3SK9koRn3H4L4
         9pIkZFQ4PbRITXldAtv+qUySaW4n3QhU6pMGGA2PGmoCCHABGBVQ0lrJ3I6A91+eiISd
         61pgU3TpKzQTULeD9y3WOOLV8qsQB0ShcRO5+sdckubujaPBHvN96mk/n28quq9mhlTd
         zUpqx0Zp0cK9R4qEcBtAX7lAlmTsue4eNNQVLWiudYGrBQbVqE7cwX0TJYfEtdkK44v7
         rekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767656524; x=1768261324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OIRkwOggpsjKhMAOp1NcMVugg4CNhuGbCDvh2b7ZpY=;
        b=dRMH+4zUsU/bIQvBNUDXKz7RZ6TJTJsQdQZom8HHyJBnyMurOctpmlZGGMeAi6D+cC
         9VZtz3H2itutSdG0e9DAG2bjh4foo+ead3xfYBxwCMkwGuB395gPH+ET7LQAZAEcday1
         gTewnuizADecspm4+fm8qNX3DldxPqNVmfv1Ff2jl2v5i0o/13r16eMTS6Y88HIxy39E
         duZK8GJjsXv5rg7tO7ehqG8tUOvhNDNeJwMbowNOZbV5ViB0DmxkHCv69c/uRLZMzPYI
         97Ot8KFri3owPu6KYTdtgtSzpS4YGWiJd0EnfPlIXBCNSmX8tUiTUQLtaAg8C1Cbtqb+
         Lbyg==
X-Forwarded-Encrypted: i=1; AJvYcCUVVPte3BsIK7WylTXSaBouQd1M2a32JIu+mg5oEoIsKw2Z1t/NJMVg4S/V9RvBNNGQLktqMnNzG4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUSdFR8hYcrGLwl4pOelsgg+fW5+XyEyb8oTuD4gU7Z2iofo3
	3CsxJEWjhFeyl3Gx0LA1dYQa3vaznLcxz5ivM0qeZIMRyMuaM1B1qJby95SLzLU/txzymF9zgkl
	JGRusbEZqW5uvoceEqJycVwpwg8zu0Tw=
X-Gm-Gg: AY/fxX4YyNwu/gtwV7SKSuaRC35CepfbIOTQQAEmzFhzOzYyyp5BcKdgcPtpitODJHD
	p5OBjSmH1Z5A7i1OqXFwC9H18rSpC3NnDkWYbOyIR6Hh9xvJv8XcsP7SId8N9FLwQjT5qXzE6tb
	GRDXcF6uQXKmmTD0O5uE3efE2n+0zzoL3ghKE+X+6Gs9yCaa8nVVklKiTPtvH761begkRbIBGcP
	DKlSB5C/UhvfLBA4E4xB508EJltWwMceGl8OZwHZ38n+HZnuWGC+WVYnUI+7u5HUyeRxIH64RqM
	QF/cqQg0snzLFc1n5rDa/2WNxvVlwm8OI0ncjroe2g2X6eUcAAHaeVEPwCrjTw6TPjmukA9I50i
	GUfgvHKjCG4dy
X-Google-Smtp-Source: AGHT+IHtZqfgcxY4U36jBsJ7UTPxgybxSMEYTuEWxlYn9nLq+LfP9R0P9A6u0QbTqI8EnTkrMBGSLIWCgjZUK6s/rA8=
X-Received: by 2002:a05:7300:23ce:b0:2ae:593b:2163 with SMTP id
 5a478bee46e88-2b16f90b9b6mr423352eec.4.1767656524191; Mon, 05 Jan 2026
 15:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105142123.95030-1-dakr@kernel.org> <20260105142123.95030-4-dakr@kernel.org>
 <D5B126F1-B6F5-410F-9BE9-FA688C990A10@collabora.com>
In-Reply-To: <D5B126F1-B6F5-410F-9BE9-FA688C990A10@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jan 2026 00:41:51 +0100
X-Gm-Features: AQt7F2otFkC_ACq4yRMksDcIl_LQ7lbWRdk9Ag5enV_KwstxHXVYbXxmNGCRsuM
Message-ID: <CANiq72m5fiupZBaiyJZO5aykA382FrYutW15VPpxWzrhfGip7g@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: usb: use "kernel vertical" style for imports
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 8:36=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> OOC: can rustfmt do this, or is it a manual process for the time being?

It does it if you add the `//`, but adding the `//` is manual, i.e. it
will do what you want but you have to trigger it by having the `//`:

    https://docs.kernel.org/rust/coding-guidelines.html#imports

The goal is that `rustfmt` does exactly this, but without having to
write the `//` (and without needing/adding the `//` itself).

I hope that helps!

Cheers,
Miguel

