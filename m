Return-Path: <linux-usb+bounces-32021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E120D002AD
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 22:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CB8B3021071
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 21:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E22C3277;
	Wed,  7 Jan 2026 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXwn5Jda"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96A277C9A;
	Wed,  7 Jan 2026 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821365; cv=none; b=mzkITT6S/6BlgP08qsHbbJdH1WtC4tCHEcXmCpC3RLcCsH96tLcgDXP/1jZygiq2i0zYyblevuNs7Bgndiq+MoPZ9sV4woml0ujM2OMfKieBIVnIc2m78JP3yerQrlttGaC/4Ahvq01gJyeGat/AD3+CB4PC0K15aFux5eYWon0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821365; c=relaxed/simple;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=mCAt1oc3umwBfIXXyvIKYXvGhGHGOEFu18pGXrLg/tnQsCQgiGeTWdRFB+lKoA3E97krpoMCIEpcNPfmn3K/z562AE35MWzH0adfCCZ/TUT3Vv7HJvCXut2dT76AD5P6ioE5BNAaCAfKye065/7QGcGNWusQaPpc5AOw49UJGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXwn5Jda; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9283EC4CEF1;
	Wed,  7 Jan 2026 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767821364;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=qXwn5Jda0GWsfHNPYITlcuA16Vxr0+P9lSRk9DGFkjEs9HMXMe+9bVK13atzBOU0C
	 EDFcme+JU+TwUIPp58nZ7bA01q5/NF6hCz6+TFLqnzQ5QT/h7jirOHnamp9QykbHr8
	 vLb2UKwVglDoNffGZ0kfnzKGnQ5wVkOMT7e7RHpyyRjKXgOVzGNOzrcStESK7twOgN
	 UOVqYDabgW5/mIlX3bb17D10nS+BnLJIrvEwxzz/0KmVVjONIUfr2eJ2NfHuDqP7T2
	 Dl+p74tsUG7WalXW03IrR3LKvU44KblxAePIW0y401l+wzD6Gsz2zZHz1G4bQ5y0/M
	 zZlk/MYftq6Hw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 22:29:19 +0100
Message-Id: <DFIODD3AJUDB.1YR5XJSI07V3V@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/5] rust: auxiliary: use "kernel vertical" style for
 imports
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
References: <20260105142123.95030-1-dakr@kernel.org>
In-Reply-To: <20260105142123.95030-1-dakr@kernel.org>

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

