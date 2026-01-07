Return-Path: <linux-usb+bounces-32008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A1CFEB2A
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5651B310997C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9FA361DB8;
	Wed,  7 Jan 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RxrWvC2E"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FB3612F8;
	Wed,  7 Jan 2026 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798582; cv=none; b=ahcjLhJKmMIAwy+oN8YzV09z2Y5OzQwaloOaO+OkfvugcyURbHyDt4EUwqqfYHdVeFgWpKKbhkA0+2Oc+i90hOexqisfQwuOJNDQifIH57Owrw1CpW7xVrC3Mm9Y2+HuT5MQbGUjsilYgJ/YLz/6UPLxCoz0pPYLmO9gTKkFMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798582; c=relaxed/simple;
	bh=NGNgNL+FKGpgUa4+ZN3QdwJfKg5r7UY5CkOjWeKE28A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSfKtu0A4Ka0ja/94IkYShoywmOStHky2OABkQppoALDEABD6xWu2twcMiOodKud5mX7Ktl89qnadhcKSrXsru9eZM0mBYOOuDhuG3SURgquIKPDqoc4rg+koX4YwC6to5nehixGOJCo8yaOIO5liatnMre+hTPvrE+VGmWbQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RxrWvC2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25B2C4CEF1;
	Wed,  7 Jan 2026 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798582;
	bh=NGNgNL+FKGpgUa4+ZN3QdwJfKg5r7UY5CkOjWeKE28A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RxrWvC2EpRW9x1zZE1qI1Kg7Cp8cTfHvry2XSeUnM7u1o8wNMdmKyLZC+GAa0bKJI
	 qtk/Hv2qd7YMtUzl94vh6gEUp/Up/ygvuZb0tEtfOOf0pCm6f9A9wP/WJJKgeHTDoh
	 lQl4sY2Veht5uqekxxyS0OoJApTCD74np6Xq0hyU=
Date: Wed, 7 Jan 2026 16:09:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 5/5] rust: faux: use "kernel vertical" style for imports
Message-ID: <2026010734-darkness-daytime-2795@gregkh>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105142123.95030-5-dakr@kernel.org>

On Mon, Jan 05, 2026 at 03:19:46PM +0100, Danilo Krummrich wrote:
> Convert all imports to use "kernel vertical" style.
> 
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
> 
> While at it, drop unnecessary imports covered by prelude::*.
> 
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/faux.rs | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> index 7fe2dd197e37..43b4974f48cd 100644
> --- a/rust/kernel/faux.rs
> +++ b/rust/kernel/faux.rs
> @@ -6,8 +6,17 @@
>  //!
>  //! C header: [`include/linux/device/faux.h`](srctree/include/linux/device/faux.h)
>  
> -use crate::{bindings, device, error::code::*, prelude::*};
> -use core::ptr::{addr_of_mut, null, null_mut, NonNull};
> +use crate::{
> +    bindings,
> +    device,
> +    prelude::*, //
> +};
> +use core::ptr::{
> +    addr_of_mut,
> +    null,
> +    null_mut,
> +    NonNull, //
> +};
>  
>  /// The registration of a faux device.
>  ///
> -- 
> 2.52.0
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


