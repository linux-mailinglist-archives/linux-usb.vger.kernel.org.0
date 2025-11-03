Return-Path: <linux-usb+bounces-30021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C6C2E6A6
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 00:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4DC93AC3F7
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 23:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77672FF161;
	Mon,  3 Nov 2025 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YrdDVAN/"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61B142E83;
	Mon,  3 Nov 2025 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762213126; cv=pass; b=bbBMjHIsqc+x7eF9lMa7wJ+bxoXao7yR+5v70CrxhieV5y9sMvtvAOTzL/bSW+whcw5dQiikUid/INy/N1WMhgQofLABsQr+1l6w9dhOaSS94ZRDnVD3zbHyIBrfnaNk9TRPkGjzvKQ2MER1raE7Sd7/JzRzfuHf2VZDjvsfzcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762213126; c=relaxed/simple;
	bh=A50Rv1o0Jt3Q5xXv7H6QT2yWLBCn/ScfiTnTZV9HB58=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FrCphGyHF1xxEReDl8ieZOfnpuiuPKfTcMNXxkWazOpa7grpnwVwHlTeQCABROzRTLqtmc+jl35+kMn1Q7rbTW1sB6YLG8R68feYowTpyPl7LTh4RtVTBk1pX7NZj57F99733MEv5FSQxSIcbwiuVApEmxa3uZ7OnpRQBDuJvCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YrdDVAN/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1762213089; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a5w+EmAcWY2QXP8vcMYJQ9lfzJv4bU8MR3IX7ee5FwiSmi5hQa00UwNlcEmXS+s78XZ6yvDk4GAuuOba6PPVJLQ4UVX8TVI5iEWX/XqVwcRkkGz5Yz4tqActaTUk23Mirh7/DmouhUHO9fhkNzqnZmqXl3riPxKmGEYe5TKQxbw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762213089; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cRYT5JYMwZ5awj7Wgf1cYack2fgITfSaZS66KZyPmVc=; 
	b=c3WSycc1kZQmf3lkbTW4LhSde/MxgQyEC/X9cT2MwbEp03XF1pkQscBAycVod9q9pGMdoU5bhBxcyMNKkJXTd87QrwgFYx6ZVb15d9nU8ZnQs3M/A71Y52+uxVNlwM30oaFq1bhOn/2GBnlobI21CmeUphrFnpeKQ2CMUFB+JiU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762213089;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=cRYT5JYMwZ5awj7Wgf1cYack2fgITfSaZS66KZyPmVc=;
	b=YrdDVAN/uw0KX4Cb6+OrXgKy4uL2YV5BHSssApDT0CDuBJJJ1I8Trg/85TB4USVs
	waAy74ljhVpg2mLWxZ53aBzyh91WRo//oO4xYndjrhMnBavk6+8HaKwX9M9+7ZfLVsV
	r+UFRQCHoEkPwtsQ9oCZPKFY3reabXImSNnN0UPQ=
Received: by mx.zohomail.com with SMTPS id 1762213087015438.9339792174984;
	Mon, 3 Nov 2025 15:38:07 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: usb: fix broken call to T::disconnect()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251103110115.1925072-1-dakr@kernel.org>
Date: Mon, 3 Nov 2025 20:37:43 -0300
Cc: gregkh@linuxfoundation.org,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 linux-usb@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Thorsten Leemhuis <linux@leemhuis.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EED41CE3-66AE-46C3-BC29-3B2206B0633F@collabora.com>
References: <20251103110115.1925072-1-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 3 Nov 2025, at 08:01, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> A refactoring of Device::drvdata_obtain() broke T::disconnect() in the
> USB abstractions.
>=20
> """
> error[E0599]: no method named `data` found for struct =
`core::pin::Pin<kbox::Box<T, Kmalloc>>` in the current scope
>  --> rust/kernel/usb.rs:92:34
>   |
> 92 |         T::disconnect(intf, data.data());
>   |                                  ^^^^ method not found in =
`core::pin::Pin<kbox::Box<T, Kmalloc>>`
>=20
> error: aborting due to 1 previous error
>=20
> For more information about this error, try `rustc --explain E0599`.
> make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
> make[1]: *** =
[/builddir/build/BUILD/kernel-6.18.0-build/kernel-next-20251103/linux-6.18=
.0-0.0.next.20251103.436.vanilla.fc44.x86_64/Makefile:1316: prepare] =
Error 2
> make: *** [Makefile:256: __sub-make] Error 2
> """
>=20
> This slipped through, since the USB abstractions are globally =
disabled.
> However, the USB tree recently enabled them, hence it showed up in
> linux-next.
>=20
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: =
https://lore.kernel.org/all/1c8afbc0-e888-4702-9e4e-fa8aef0f97ae@leemhuis.=
info/
> Fixes: 6bbaa93912bf ("rust: device: narrow the generic of =
drvdata_obtain()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/usb.rs | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
> index 92215fdc3c6a..534e3ded5442 100644
> --- a/rust/kernel/usb.rs
> +++ b/rust/kernel/usb.rs
> @@ -89,7 +89,7 @@ extern "C" fn disconnect_callback(intf: *mut =
bindings::usb_interface) {
>         // and stored a `Pin<KBox<T>>`.
>         let data =3D unsafe { dev.drvdata_obtain::<T>() };
>=20
> -        T::disconnect(intf, data.data());
> +        T::disconnect(intf, data.as_ref());
>     }
> }
>=20
> --=20
> 2.51.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


