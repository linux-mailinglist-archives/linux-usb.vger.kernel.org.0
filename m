Return-Path: <linux-usb+bounces-32197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2DD13B5E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 16:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF79F30090E1
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E8E3612E2;
	Mon, 12 Jan 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XKIOSV2t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE983612C6
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232087; cv=none; b=UWO/i7UnceFq9Gcovdmy6JwpM9F1jpXjwyhfeOxaFxvcdV+U1mPpbOS5TJDxRlkGihgxvmAPLqbeFX1/v3qpYwqWq8LgzZ4fQKbkiaB1Mp2frHFs3hyT/0p2OdMjy95cTuf+4BiEvgvop3ctzzl2GFBBlAwO+0uDiH13Ojk2dMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232087; c=relaxed/simple;
	bh=s6EznykqrP/F+nG9EBSEEX5NUjzWXxqBqj7KLutlW/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GCH9v9hRzfjUUAuMvfIHFakPToEWg8NSEjEkUAhBdi2lEdn30gx9rql9YcPM08i6dqhbzOYRiUCch/vjiQnsckGpcui6rgWnLw9hok0QNdG8foX0dorJJnFusOFsmRuOl7zWTh6mAtE5cCS/UVmupAijZqqsxkuwHwWI5ytCCzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XKIOSV2t; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d4029340aso67344885e9.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 07:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768232083; x=1768836883; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEwDDJTfrVrFOxZl4FAKmDVtMP/Lxo1p2Wt2dLR6YMI=;
        b=XKIOSV2tKPecBYD5a7DwPkTDOgIR3CIz1Vf9j90JmUrV9bwYwhhNWN+Y0uIva/ucCi
         o9CA4HxtWozUG0qGobGKmBkd6ngvBgC3RvTImtWLe0MszerF1byOY4kv9Avy4I8iqHoV
         lRQfNqRscDQ7FojnjA54KBv0iZ/tmC0k+fZhvcYzrHgEf8X8Em5O3urhQf7SfB4Mqmq8
         NMbj4X1Xm8M1WEg7cVBOGA8lFWbwbTUTzOBpJgZKAOwvKArnZQAnXgMeaPbBydSrBe/i
         HFn4O4ifePRptaBZ9OujOkOMPHI0vLQAZQhBg9HV2p2eP21JBAAM0Ow6aJWjL4jnECoX
         E34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232083; x=1768836883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEwDDJTfrVrFOxZl4FAKmDVtMP/Lxo1p2Wt2dLR6YMI=;
        b=jCHX6TVuABmkfLDEBHcClKfBeuCI4lEaqxkrV3YwEBXVQsGLlAi76oPdJhxnYZdllq
         xuKrm6LrGMr2ZR3BcFXVXCgNVKN9unuFFII/lfqYzqjJ/g895cQVA3syPTO7SsX8uCMu
         L01jFNiW4xLiuGYsvk/557a//w7L4jbMqMPQaAeogP8m1f4jI9P0SptirR1IeWFyjgNs
         Fv5qhejxmg4ac2XUroArjWwNe0/AkA7cLHZEZMYQBf+bQcT/3q0KmMhYpJ/nEUPbbNcJ
         Nd+qFbBzyrj3mc+YwqGFPP+N0nWK952Dx6KiXInD7RQCZxP8JN04rR+02PEPHObGT52X
         w/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw2OwmWr7rN0WWPnyhm1lvSIifd44/ownOx5nNYbOFuMLL4feF8+Z9UBRKui7sh/KYUt/xamnBf+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVTxrk+F+gU8KDa3sziqJhmnOmtbX1fSkQVbSck6EhaPLbQZ1
	j95LX+8Nc82uuTSXLXs6W9e2E1k6iecew0CZJGV3Gn/qLtHNGa/IEoqC8Bny6cih2wHS1tGXPVb
	mzesOh8d/mXtbqqeQUg==
X-Google-Smtp-Source: AGHT+IF2pkR80bdpFTRy3maBMZNDzCR8VeScBbIruZWtCzdu+/XDr5Lim5Am3othwewKWoKXkQzlZG5TEHYl8kE=
X-Received: from wmbjp9.prod.google.com ([2002:a05:600c:5589:b0:477:9bcb:dd8b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3143:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-47d84b179f7mr226113455e9.13.1768232083524;
 Mon, 12 Jan 2026 07:34:43 -0800 (PST)
Date: Mon, 12 Jan 2026 15:34:42 +0000
In-Reply-To: <DFII83QY76O0.2PKZ73WCTVGPR@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260107103511.570525-1-dakr@kernel.org> <aV6BHw-Liv0SVAwO@google.com>
 <DFII83QY76O0.2PKZ73WCTVGPR@kernel.org>
Message-ID: <aWUUkvdKsRVJqfE2@google.com>
Subject: Re: [PATCH 0/6] Address race condition with Device::drvdata()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	igor.korotin.linux@gmail.com, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, wsa+renesas@sang-engineering.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 07, 2026 at 05:40:20PM +0100, Danilo Krummrich wrote:
> On Wed Jan 7, 2026 at 4:51 PM CET, Alice Ryhl wrote:
> > If a &Device<Bound> lets you access a given value, then we must not
> > destroy that value until after the last &Device<Bound> has expired.
> >
> > A &Device<Bound> lets you access the driver private data. And a
> > &Device<Bound> lets you access the contents of a Devres<T>.
> >
> > Thus, the last &Device<Bound> must expire before we destroy driver
> > private data or values inside of Devres<T>. Etc.
> 
> Yes, the last &Device<Bound> must expire before we destroy the device private
> data. This is exactly what is achieved by this patch. The device private data is
> destroyed after all devres callbacks have been processed, which guarantees that
> there can't be any contexts left that provide a &Device<Bound>.
> 
> As for the values inside of a Devres<T>, this is exactly what I refer to in my
> paragraph above talking about the unsoundness of the devres cleanup ordering in
> Rust.
> 
> I also mention that I'm already working on a solution and it is in fact pretty
> close to the solution you propose below, i.e. a generic mechanism to support
> multiple devres domains (which I also see advantages for in C code).
> 
> As mentioned, this will also help with getting the required synchronize_rcu()
> calls down to exactly one per device unbind.
> 
> Technically, we could utilize such a devres domain for dropping the device
> private data, but there is no need to have a separate domain just for this, we
> already have a distinct place for dropping and freeing the device private data
> after the device has been fully unbound, which is much simpler than a separate
> devres domain.
> 
> Now, you may argue we don't need a separate devres domain, and that we could use
> the non-early devres domain. However, this would have the following implication:
> 
> In the destructor of the device private data, drivers could still try to use
> device resources stored in the device private data through try_access(), which
> may or may not succeed depending on whether the corresponding Devres<T>
> containers are part of the device private data initializer or whether they have
> been allocated separately.
> 
> Or in other words it would leave room for drivers to abuse this behavior.
> 
> Therefore, the desired order is:
> 
>   1. Driver::unbind() (A place for drivers to tear down the device;
>      registrations are up - unless explicitly revoked by the driver (this is a
>      semantic choice) - and device resources are accessible.)
> 
>   2. devm_early_* (Drop all devres guarded registrations.)
> 
>   3. No more &Device<Bound> left.
> 
>   4. devm_* (Drop all device resources.)
> 
>   5. No more device resources left.
> 
>   6. Drop and free device private data. (try_access() will never succeed in the
>      destructor of the device private data.

so your private data is just the first devres resource ;)

Ok. I'm worried that when you fix Devres, you have to undo changes you
made here. But I guess that's not the end of the world (and maybe you
don't have to).

Concept SGTM. I have not yet reviewed patches in details, but

Acked-by: Alice Ryhl <aliceryhl@google.com>

Alice

