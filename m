Return-Path: <linux-usb+bounces-31938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E8CF565D
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 20:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2F81301B673
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 19:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBF531ED86;
	Mon,  5 Jan 2026 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Dnzlbt6D"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A982D594B;
	Mon,  5 Jan 2026 19:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767641811; cv=pass; b=CnV8Lrz892+Ens0il3i8T/BpYVK1gRIC3JvxoEO9dVrHIo8N9GTPPYI233SzZ9Sii7Y5h/uSGwlbTR9vYpA9fGcsRLlT//9M5dYGC3Z/XtZLZfjHpTdyfLvKcAQTPzHpnwR5AV60i7ixOo27RBotE5RaI+rWaxBKRoKT7Ma4pMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767641811; c=relaxed/simple;
	bh=NOLzM3hfyYjnd/RZuThB1GmZd6pLgrUCAyjtSpPqeGQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NyK44CWp4we5lQ1rFXNZQdS9qe1NW4FjMfqhIRR3bI165XMWR5a6AR1IMk4oQcGiBOKAfTisU86eMrdMkcfiHkgeMdxvhSoFgr+GDhvNBWT0hD/J2c05NjI7yhi8IMhe5RPjb3RQBNjb7V0TKaRocrCqi1YiHyKdOwMEJ0JSozg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Dnzlbt6D; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767641795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mJ7ocap0z00LzgH6dUA/QnPOo5XlSO9gF7V5DvCF1lXDKp9LP9iheJwDtg3FMsXVe3rHNec/NuD+aUqa1vf2ur+8mhxHt6lYBsUxHwBpHgwLvVLf5bUWT0rF4xRvUCnbQJm7t0e4HNX2IkiO5/07+6OQOpLHk4juoGRIlc+pRxo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767641795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V8rkArDroROGCqjbxcdHVXYkVb4w45VDAC6IIJgz/y4=; 
	b=nQoPePk0HiOuTGYrm/Go1BskLaff+ZzDudmDDsdxsiY4tru4c+RrJa11WOiweGorzLMDN8lLHbEyBhC8xS1SPhpITclWYfL44H2j7KnYKSKu8/6joAd58nBIOzdu+xNOeY6g86+NTOGAuehF4aoTJFe+dqqyNNvgooQwL4/dpRw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767641795;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=V8rkArDroROGCqjbxcdHVXYkVb4w45VDAC6IIJgz/y4=;
	b=Dnzlbt6DeFuxjTl4Zbw0GKuVnMZQhl5l980ZbbXV7m93tJUeMS5VBGdgM+16BpwR
	970Ph3YJK5ITScmJGkWoF+1OmhyD6RspElJKQpvRGEIJ3VJcmfGAn2qbscmsvNVeIKa
	f1AjAkkBhxojX1J7WkqandXjRA9RQHQpvR/SEq1Q=
Received: by mx.zohomail.com with SMTPS id 1767641792993582.2537549424134;
	Mon, 5 Jan 2026 11:36:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 4/5] rust: usb: use "kernel vertical" style for imports
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260105142123.95030-4-dakr@kernel.org>
Date: Mon, 5 Jan 2026 16:36:17 -0300
Cc: gregkh@linuxfoundation.org,
 rafael@kernel.org,
 ojeda@kernel.org,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 david.m.ertman@intel.com,
 ira.weiny@intel.com,
 leon@kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5B126F1-B6F5-410F-9BE9-FA688C990A10@collabora.com>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-4-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 5 Jan 2026, at 11:19, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Convert all imports to use "kernel vertical" style.
>=20
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>=20
> While at it, drop unnecessary imports covered by prelude::*.
>=20
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> @Greg: If you agree I will take this through the driver-core tree. I =
will have
> driver-core patches building on top of this.
> ---
> rust/kernel/usb.rs              | 21 +++++++++++++++------
> samples/rust/rust_driver_usb.rs | 10 +++++++++-
> 2 files changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
> index d10b65e9fb6a..99b07b5ac491 100644
> --- a/rust/kernel/usb.rs
> +++ b/rust/kernel/usb.rs
> @@ -6,14 +6,23 @@
> //! C header: [`include/linux/usb.h`](srctree/include/linux/usb.h)
>=20
> use crate::{
> -    bindings, device,
> -    device_id::{RawDeviceId, RawDeviceIdIndex},
> +    bindings,
> +    device,
> +    device_id::{
> +        RawDeviceId,
> +        RawDeviceIdIndex, //
> +    },
>     driver,
> -    error::{from_result, to_result, Result},
> +    error::{
> +        from_result,
> +        to_result, //
> +    },
>     prelude::*,
> -    str::CStr,
> -    types::{AlwaysRefCounted, Opaque},
> -    ThisModule,
> +    types::{
> +        AlwaysRefCounted,
> +        Opaque, //
> +    },
> +    ThisModule, //
> };
> use core::{
>     marker::PhantomData,
> diff --git a/samples/rust/rust_driver_usb.rs =
b/samples/rust/rust_driver_usb.rs
> index 4eaad14867b2..ab72e99e1274 100644
> --- a/samples/rust/rust_driver_usb.rs
> +++ b/samples/rust/rust_driver_usb.rs
> @@ -3,7 +3,15 @@
>=20
> //! Rust USB driver sample.
>=20
> -use kernel::{device, device::Core, prelude::*, sync::aref::ARef, =
usb};
> +use kernel::{
> +    device::{
> +        self,
> +        Core, //
> +    },
> +    prelude::*,
> +    sync::aref::ARef,
> +    usb, //
> +};
>=20
> struct SampleDriver {
>     _intf: ARef<usb::Interface>,
> --=20
> 2.52.0
>=20
>=20

OOC: can rustfmt do this, or is it a manual process for the time being?

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


