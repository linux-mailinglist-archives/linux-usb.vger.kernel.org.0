Return-Path: <linux-usb+bounces-32023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED458D00325
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 22:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8260D302C9FD
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 21:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC5F2DEA93;
	Wed,  7 Jan 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF1oV9YD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E13A0B3D;
	Wed,  7 Jan 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821436; cv=none; b=hO7scOgeHSyCqQQcBJ3LHZm88BBA8yFQ7lxSeJtJ+PFd8yrRWn40Y7xVn7kxzphL5luG5JvZF26WuMQHpmBWBizZU50EoiSjogwkXYTOjMlUbWyuyfIa+KVVZmZYb21hRXOX/Rjx3/EZa9N4YhH/Kt/3SQheHUL4YH8CEpRuwmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821436; c=relaxed/simple;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=S2edEzajqqRBSA4dRptRFF6vjo6YNig1ywpYMT+xmID6fdY3IuUJRxKAUq+f5Q5OvHUR8JW6UPFQd4O4l5E1inCkrp6cnazX2rl/4C3kNIR/tV0qH3OQT2pNvehi0Z7G7lsqGqa4u/kMcGhTxsDxss/C1cujDV2PzH2Et4ZCMnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF1oV9YD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C797C4CEF1;
	Wed,  7 Jan 2026 21:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767821435;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=WF1oV9YDVxt7sUXXxMseiO0KfdM9dATnNEXV3chTMnLTnNQA7O1P7J83u6ctLjOUF
	 VeFvPRBQtjMSzxLjow/fG2RiIVRCIP42YZh4Zf9c0xKkdAW1f4jnE2KEpQmw79Au2j
	 aBHlWkCGppyHjp1Qhu8EntcNL4cPq8W4NEULcNfN0erTJ3r5WNKoY8Ao4dQ4n+JFYm
	 m+srs+1lPirKlKOZ2GLeggjHxNiOw2cKHwuY72m1wtMCd63mASwDI1Bv0KX+yT2KwL
	 qa56OxTLt83RjN5qAb+ei+7h5YFPyGLJfOrzdU6WEWawhGB3bdI41dknQHq03wRWg0
	 5DXQ62Q6G+0ag==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 22:30:30 +0100
Message-Id: <DFIOE9PAHP27.1YKKGA6JBY4H0@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/5] rust: driver-core: use "kernel vertical" style for
 imports
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-3-dakr@kernel.org>
In-Reply-To: <20260105142123.95030-3-dakr@kernel.org>

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

