Return-Path: <linux-usb+bounces-32010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C66CFEA46
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA4F8301F03E
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D85364051;
	Wed,  7 Jan 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xPUO4lek"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C5364043;
	Wed,  7 Jan 2026 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798611; cv=none; b=MU6Zf/GbjDNTEuAw6EM3adglsuXbi7xaPonlSg5aufyZP82h+jhZkSMeoveF2mEXqunSZ6elZ/UIFYS9TgvFm5/cMH+gDCzPjmCW8JT7visrIu5b2fdPXu/wPAqPZli2sod5N6WSh2BNqE7pXDz1OlVt3HCOJUYslJnWISrb3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798611; c=relaxed/simple;
	bh=YUToSmLkRZf+1MSstU1sGilEXg9ESeb1aIf/9FjcHCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbMV9a7x6ruy3HH+aZ56xQgk1QDLO6h7UwYXKIHNUVu+4+zquZGY/1M/Wgd9hgDj0/9yjpQg61FOLDfq+cs96fGy3PLn4AVcXwsXNWu1nYa/BtqJXJyD1kYIEajsWFUDtvD8GkPED+RUmeuBV3gIoAwcq6V/CsfCW5W7o+5qT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xPUO4lek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169E5C19422;
	Wed,  7 Jan 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798610;
	bh=YUToSmLkRZf+1MSstU1sGilEXg9ESeb1aIf/9FjcHCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xPUO4leki+CzNQCYCb3tu0q9uwWEFnbYA0j5aLkzmrr8qssnJr9x/DOyfMnEsYT09
	 d4/UKh3tqC1AzI8mcvS5VodWDbqGXWXoiHydKsVa+lQvnbHaCnU+VVkyaFKX2zCtl3
	 FCxhHO32yqwnUTnzhuXiHBLf6B+uD1T5qM60VNuY=
Date: Wed, 7 Jan 2026 16:09:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] rust: platform: use "kernel vertical" style for
 imports
Message-ID: <2026010756-remarry-pebbly-30ad@gregkh>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105142123.95030-2-dakr@kernel.org>

On Mon, Jan 05, 2026 at 03:19:43PM +0100, Danilo Krummrich wrote:
> Convert all imports to use "kernel vertical" style.
> 
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
> 
> While at it, drop unnecessary imports covered by prelude::*.
> 
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

