Return-Path: <linux-usb+bounces-32024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C9D0034C
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 22:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D87D305F32B
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 21:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5E32EAD1B;
	Wed,  7 Jan 2026 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7jLNW0A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F52E7F20;
	Wed,  7 Jan 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821450; cv=none; b=NQZq0riIzAd+0AqcxRpkHYSd3hmL+g5QTmD0kCQbbSy3JPcYcGgoEUrHynkPRn8o2ChUJOrLQLVtw5KzKmuF1arsXlXJVG4WiWDYMbxrj2kEr0GNbKBWeEcEnqyrYmF9Qi1WGFzr6HHihE5JU01hFSqCB9OTa9WqdjU9I0QED2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821450; c=relaxed/simple;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=XRjJqfvxixBODd41jt2lPqaOS/mqY8jjZDKkIArf1wjDGRJS/378FJuL3TYvaWCYfrdDBbtM+B+hICCiaOPsx6mr9+B9NReD7m08Hg8zUg7WQEwPQQhSKzkKCuITab5AWnhHuBBpBrgegMEFfyRKjjXEXRtBxInDPAofBO0fj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7jLNW0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32401C4CEF1;
	Wed,  7 Jan 2026 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767821450;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=h7jLNW0AbahXy2Ghkj2S2SzUOCxcHgYVyI3ZjKaXZh6mnibJT1lBYLypiPP0EJ6LF
	 QHGLHhVGJIopi3BSw4huOabhpbNr+GHWSyeWRpaOsdOzY1C9vQQPE4d3tpoywfLa1/
	 NLF2P6p8LTd8AR/E45cFa13CXeEif0eIuEuoKtft/KPSqPygLO20RtVwlt/+JBgWOo
	 DvxcBn1edd+zLDBb66F8I6J8Jn6vIqaENN2vn3OJ5GfmLtpB3VZwp/TmlSQ0xefe0U
	 AvG5ygfU6C7jKLvwgp/wE96qs/uBLvp3SxjK6fYjjjRpWdxkJCm1n/X69RBnDVhoVc
	 pKVT3xy4cPWJA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 22:30:45 +0100
Message-Id: <DFIOEGHXC1P7.39XP584UDB7R6@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 5/5] rust: faux: use "kernel vertical" style for imports
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-5-dakr@kernel.org>
In-Reply-To: <20260105142123.95030-5-dakr@kernel.org>

On Mon Jan 5, 2026 at 3:19 PM CET, Danilo Krummrich wrote:
> Convert all imports to use "kernel vertical" style.
>
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>
> While at it, drop unnecessary imports covered by prelude::*.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!

