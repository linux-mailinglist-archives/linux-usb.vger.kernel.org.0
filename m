Return-Path: <linux-usb+bounces-32009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE7CFEB24
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2969430EFEE5
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597483624BA;
	Wed,  7 Jan 2026 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UYn6hfE1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50473624A4;
	Wed,  7 Jan 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798600; cv=none; b=fK0MWnSRGwN3QvZOmlZR/3nVPFO4QaurikAVGCaQGw5va3ziqNt6bB9/S4KV7pipXHwdU5lJ6AJKi/42XQL5rsGZhznTZURU6frFozCnCBOwp3qUsgHYd7MBtRB0QoA9RL5QXftD2aYX4G1hMUqM9exrFfuDTtIxSxVAic8LuI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798600; c=relaxed/simple;
	bh=9OrlLxcnIrEXu+rXYIRyuleTGrrCATqLvd4kx1aBn8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy4tUfsnXgNjfJEHhS9v8szDEfvzB38q6wP+D2/oMPLZIL50qsZCyuqBJm95PFl1HPl8RCJaIgCoHbgn1NyZHXaCGqZi1v8z5UGhl6l0+NBa1npYLILbIvejRnbTmP5MjaL9OGKSM9gVBnD38nE5KZEiSVySuaiG4cYnCb1T94g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UYn6hfE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE9FC4CEF1;
	Wed,  7 Jan 2026 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798600;
	bh=9OrlLxcnIrEXu+rXYIRyuleTGrrCATqLvd4kx1aBn8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYn6hfE13U2nWSQMR0h72e+mIePXEIqsSkTjRWy982t988lvmex5l/MjRw4OkT+vJ
	 mHz0phoDdUJSb3eFHi/qUfFWiyJ//wvaDENGxXU5CZb7H7EiEHzhbeyUeV6pbZdd2j
	 LEEpNwxg2lttai+dvUem+h6eTacnqR5rdHCZFa9w=
Date: Wed, 7 Jan 2026 16:09:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/5] rust: driver-core: use "kernel vertical" style for
 imports
Message-ID: <2026010745-disk-attendee-4f08@gregkh>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105142123.95030-3-dakr@kernel.org>

On Mon, Jan 05, 2026 at 03:19:44PM +0100, Danilo Krummrich wrote:
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

