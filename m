Return-Path: <linux-usb+bounces-30020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719DC2E6A0
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 00:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9A0F6346A3E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 23:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF132FE593;
	Mon,  3 Nov 2025 23:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onQiEfqu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1301F142E83;
	Mon,  3 Nov 2025 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762213062; cv=none; b=km5VNILlQbs0mAjAwrBUKuPyLXqDcPMXZ9iEMX38sN9BqFw8kyNVYrWTRh0itoqneFWG62iFtwOs48x03TPAASrePe5nuYYehCR6jnX+OdaBPdwvaw14MAT605hZV35CP1aXyL/lybbpSNw361Yg2WIP7W01my5dKO8UgLuHvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762213062; c=relaxed/simple;
	bh=8HTv02BxgiBJZRh6i+1z5CPjbod6as9D0bXvV+isc/Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=XuuJXcErXycgFLX1947V+O0vdXed+Z4zVZMiYkQKroVt5Hb4JgMhosQcwv8nIaFq8nr78Wxn0SWp9XgjlrnlabYN16Hv7DM30FKwKjcd6lj/E6ht4KOfC4p3RqWRnvzW/cFbbudQdfZIS75GBqlSVan9lt/nGCP4tySFK4VPL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onQiEfqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3D8C4CEE7;
	Mon,  3 Nov 2025 23:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762213061;
	bh=8HTv02BxgiBJZRh6i+1z5CPjbod6as9D0bXvV+isc/Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=onQiEfquhPreI/eeJXpTNkPmOnmgfE9QnDgfevZO3VhijmCyeWE5G7Jm7vOSzQWub
	 JdOc/YZydiD+Zr2UoNx5uLhpwOMWKjGgHV6s7jai0KFPeiBAVqsBPxSd5/G53icgcy
	 NvP30a5eBH81rI54S7yi4ljK0HzyVOJeHd0EEZ25JsSaB43wLHuy9B8D7WbusCHO+3
	 UW1LlF7itKw1EuIJRvF47ysFBZoxv2+EGI8POOGv5braSNHQ6Lgta27yAfe/NDh1/0
	 OoycjFU0rYg/rL9RW+i6cAqMq2tig1Aj9L9lezJ1K2QyqWX5lYhZhrR5omuYEdkrM5
	 QmEg6+LlNtnuw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 00:37:37 +0100
Message-Id: <DDZGE6LFGGOR.1XAJXZ2WT74JN@kernel.org>
Subject: Re: [PATCH] rust: usb: fix broken call to T::disconnect()
Cc: <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>
To: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251103110115.1925072-1-dakr@kernel.org>
In-Reply-To: <20251103110115.1925072-1-dakr@kernel.org>

On Mon Nov 3, 2025 at 12:01 PM CET, Danilo Krummrich wrote:
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

Applied to driver-core-next, thanks!

