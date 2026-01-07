Return-Path: <linux-usb+bounces-32006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2AECFF39C
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 18:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A77BD34E7843
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 16:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C235F35C19F;
	Wed,  7 Jan 2026 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZUBJdvKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313A35B159;
	Wed,  7 Jan 2026 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798559; cv=none; b=DFYoH+PcXT4ol9FHY54VHMhSDIDeVPZpJRmNPgUbIj82CDEFDPHxK1IPMqUqBy8XQEBDARKI7sZa39P0MK2Sd88f2mifjwjYofRPOE5Jde11K2nCdfUdthUO8EHQ0kof5vwSGC2bfWtwxds1J4nAgpy+Ti1+rnS3V5XAPRm/52Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798559; c=relaxed/simple;
	bh=PpsW+euC7M6ZozyWvwTJ3UgWNQyzkWKrZPR+j+zZxGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQWcOIKKN8JIFN58ikovWRC+8sAKmjvrzUVO4NAFMaXl9NRWZ/UP0eCT1qGUwUVK1D62nQNwNrunlgL+6SHUKsH39WIoKujbWE7RlmIcexVScuUxKVHfcmZ9ZVINOuAqSpSeZ38/G/eUOV6FQ2SF9GPyBwtZDFtLXbmPy3B+ko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZUBJdvKp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59DDC4CEF1;
	Wed,  7 Jan 2026 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798558;
	bh=PpsW+euC7M6ZozyWvwTJ3UgWNQyzkWKrZPR+j+zZxGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUBJdvKpErgdkPaDFdy+Xw0Zt38czXyvyNq62S9VFPWbgnZmWzK5K1EtVjbWnSkLF
	 TxxKqdRsgYbx6icl2eLgXGLdfqdUaNGEAAD+PCAgSqxjBmG3thdBSzjHgyh0C6N0d/
	 JVXgFV2a7VA5jf7x56H4b5RuF+oxmVei7yiOnKtI=
Date: Wed, 7 Jan 2026 16:09:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] rust: auxiliary: use "kernel vertical" style for
 imports
Message-ID: <2026010707-riverbank-grape-6ba3@gregkh>
References: <20260105142123.95030-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105142123.95030-1-dakr@kernel.org>

On Mon, Jan 05, 2026 at 03:19:42PM +0100, Danilo Krummrich wrote:
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
>  rust/kernel/auxiliary.rs              | 21 ++++++++++++++++-----
>  samples/rust/rust_driver_auxiliary.rs |  8 +++++---
>  2 files changed, 21 insertions(+), 8 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

