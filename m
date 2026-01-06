Return-Path: <linux-usb+bounces-31966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBC7CFAA8E
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 20:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1F8B305CCE4
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 19:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19D92D0625;
	Tue,  6 Jan 2026 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqGu9clP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FFE2BE7BA;
	Tue,  6 Jan 2026 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727605; cv=none; b=cO/jDLD/O+hqFJ/6a11Yhh3gGS5LyrAt0YgRQ3LgsAlTssHM1Zw0IaMwLMYwoFzLpCp7Z+WuMr05QU1tDGqSNOy5q1/gowxF5Kl/Tf7gTbHAAjYhzFjA5EEStHrBSv5NKPIYqQ5ALjnaCEhhLoJs+PgPxNEg9gsccwwyBMdMPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727605; c=relaxed/simple;
	bh=H9CwKd1Zo+82+Kr6mdQrbeO7lfxsnEAhikrL7JR3tmo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UmB/GbEm+kM4uwDzTlfe1b6waaX7v868YIMcAQsMNBZHpXf8Fq74MGu7qbFzHYdcALA0OBcGJvAPliVRS3OG7K+IOQQ6x6Hz+ugdlmhrVWMLdP/8QTBPiqdxy895mcFLdlbEVKE8EnPKsjgYQe/g+EjYmqXlwOdMDrwtbx373j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqGu9clP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4217C116C6;
	Tue,  6 Jan 2026 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767727605;
	bh=H9CwKd1Zo+82+Kr6mdQrbeO7lfxsnEAhikrL7JR3tmo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lqGu9clPcFo2Gz0DsGxHJsrrAeT2YYnDSr8GUi+q2iFueg//yz5gB8iObLMVsZNRS
	 Es4ijZfGFeF5B47iehjD6AUhBpqcmXkuTmoi1tvuryXV+MJAQ6c1QmIoJAebT881Cu
	 aHYvscprWfhCYI4cua23q/wx4wy86T89tOeC/0C6gqkVqILFFeQXw50Qk4N/MzCu3F
	 iMcJ4TxpFAPuClFxLNxdaaWc+la+dtKB8T5QuQsYNGJS3V4eqXv+tAGT4ouXjrthGo
	 eN2WX0LWMkMx/ruXENrGaxLxXHYSOhdgLO50DJkTnaH31dI6NyWFxArmYz4NK8VoXU
	 hr4JcRDhipL6w==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 20:26:40 +0100
Message-Id: <DFHR4WMDV5U7.KFFXHIYXI6M3@kernel.org>
Subject: Re: [PATCH 4/5] rust: usb: use "kernel vertical" style for imports
Cc: <rafael@kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
To: <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-4-dakr@kernel.org>
In-Reply-To: <20260105142123.95030-4-dakr@kernel.org>

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
> ---
> @Greg: If you agree I will take this through the driver-core tree. I will=
 have
> driver-core patches building on top of this.

Nevermind, I don't need it in the driver-core tree after all. :)

