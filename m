Return-Path: <linux-usb+bounces-32022-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E1D002B6
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 22:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C923130388BF
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 21:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FD52C3277;
	Wed,  7 Jan 2026 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvsNy1IZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F03277C9A;
	Wed,  7 Jan 2026 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821395; cv=none; b=XUKdMXKla12mhmPkh2FxJFzr1aFoYhJL7grCUzJGOWYSCGZQTchMEOb4N7WxRa/F/Pl+uQnvDnTKopNdfE4R+EHBV3kb3fidI2V83+42jvk0m2ufVaVLHveYxA/q3qHJO1WUOaWAyvNsZKJ6WP8GKwShAKOBM2K9Wf/PW0Dtzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821395; c=relaxed/simple;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fvbxUNoUn1xEdk5+4W/IHSWRu0lF8pNiCKFglsCrYxJUx6GdXjlfWw9mnWktb3jNcDd6gmTOOydiu7UlrSSJaT1+FKE8/xDPMjArAiBwSG0MOxxrP65fTbotCoJIwVnOAkJk0VflLdVx12NUlZQIX1D3nbTDbVadPZQDK9B8RnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvsNy1IZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB677C4CEF1;
	Wed,  7 Jan 2026 21:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767821394;
	bh=pm770hh4O2MaMARtanwz/nSS37WcPCggw0QXX3rwW8k=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tvsNy1IZhziPI+V9Fi1q9W512vzG4W69TGfaoMPlhiEaHBKIPp9QsoHLAb1o+bEP9
	 raQLbTLVmlqMjsHy1sF+ip9IJ8CNo23ci68hj4zW9/N2s33Qq+gAe2nMXaAG8LQQxA
	 VWMcJlZcIeDnYZkkvXiwMIdktYl6iA6ew47bMowRBP+xu2knyh6GqrM/LpNc+LQfB3
	 ZSBO+HAi6+v+DMntEZ4HMzLxE1aXcHXUydOE80qf5HBltHZes3rz/nqQPVQgOQENDh
	 pwlDclM7DzHvqu/s7jWlur+ScQ2uMqlqmGQ6tzdaFTNXYQQTuKT3GxhDLdS3XaqhFq
	 2qpNyqckVkvOg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 22:29:50 +0100
Message-Id: <DFIODR2LNBXU.HETW2POPHBNA@kernel.org>
Subject: Re: [PATCH 2/5] rust: platform: use "kernel vertical" style for
 imports
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-2-dakr@kernel.org>
In-Reply-To: <20260105142123.95030-2-dakr@kernel.org>

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

