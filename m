Return-Path: <linux-usb+bounces-32007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD343CFEAC4
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98293307CF1F
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B822535F8B8;
	Wed,  7 Jan 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DhB2eXJI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3687335F8A6;
	Wed,  7 Jan 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798569; cv=none; b=FwxaKx4wspB6lxGLQwkb40UUMfK4mdVTAH9cxHVZHTVl5q0VJRea6AQIDZM65QiBFxHin9wXL/1MVGfjD1VGYUypweSdwrVT19xfETVJx9JsdN0YVR70R4NwW2YrIxrBDjVfz3RDWn0+AdfzEbeNwCSBk5T0Ua/s2vpX7bSTHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798569; c=relaxed/simple;
	bh=R7dfa7Jo2aqE5IAC7RTt9oluIXiX6KZLg6IluUq7y6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZNVNQ+IWdSjYxOx6VMWE231PFXv3k792xXMSp63aac4H38L5CvXnudiB5XmDjUGxzQvVL+QK0/cj4sJ87rDLkbE/hfMDy25px3/tUahNLuCXUZGMZg9rpbLi1/462aEbJPTLoSmj+xb5L6GoNxNeeCn85yltG8dJ8YuExuuwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DhB2eXJI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE6DC19422;
	Wed,  7 Jan 2026 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798569;
	bh=R7dfa7Jo2aqE5IAC7RTt9oluIXiX6KZLg6IluUq7y6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhB2eXJIUy22tXUmlhuKzKoKqKOlHW+QL7KWoUOM9zjUCRS3L59C5TBMH5SXDR0oI
	 Zp/BAh5K0cGaWKJN1psjDJqRKN41cu31tDBpzb/u+27y6Qo7drzWVYFUOMUS0X9Azi
	 biloH00XIGDjHkOC74fZWe2y7X9djUQwcZi7hI6o=
Date: Wed, 7 Jan 2026 16:09:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: usb: use "kernel vertical" style for imports
Message-ID: <2026010718-ensnare-epidermal-19ff@gregkh>
References: <20260105142123.95030-1-dakr@kernel.org>
 <20260105142123.95030-4-dakr@kernel.org>
 <DFHR4WMDV5U7.KFFXHIYXI6M3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFHR4WMDV5U7.KFFXHIYXI6M3@kernel.org>

On Tue, Jan 06, 2026 at 08:26:40PM +0100, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 3:19 PM CET, Danilo Krummrich wrote:
> > Convert all imports to use "kernel vertical" style.
> >
> > With this, subsequent patches neither introduce unrelated changes nor
> > leave an inconsistent import pattern.
> >
> > While at it, drop unnecessary imports covered by prelude::*.
> >
> > Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> > @Greg: If you agree I will take this through the driver-core tree. I will have
> > driver-core patches building on top of this.
> 
> Nevermind, I don't need it in the driver-core tree after all. :)

Ok, I'll take it through the usb one now, thanks.

greg k-h

