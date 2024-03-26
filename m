Return-Path: <linux-usb+bounces-8430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3188C94D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 17:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C56F1F678A4
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2805613CC6C;
	Tue, 26 Mar 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JkAbGBK4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C313CA91
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711470589; cv=none; b=AzJ0jsNZ6pLd2zHz85tOAa6wsjOJTUf3tfOTQm0/4BqQB0alS5fpiZ3aHb/AbJGKVk0ggye+Hk051G7wIza4tzCvjKDIlkG1bSlozWsnvwvp5Yq7P2jjT3TnbSr1k58pb3Sfu4IySVy+idUiao+PmowyG0rfMgSrQdXBbbMJ1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711470589; c=relaxed/simple;
	bh=F/nQxQG4XDNsLPgXO/xkzcIi1zob3Yvqnl/y7yiMPZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1V34kLr0k6aHq0uDT9ojzngfzCglUOC3Grd5XKCIuG1DDBv4addu9bnhvKwZWaTZTL+nYu1b8uzGxRTaLAUGfSWajCWLZ6gOReTxssvOCRUmV0ID7i8b2fiy5VyEOpbyFSF4oSRvoWdbvOuCrgzS+zCF040VgLWUQxpZk8KgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JkAbGBK4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E03C433F1;
	Tue, 26 Mar 2024 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711470589;
	bh=F/nQxQG4XDNsLPgXO/xkzcIi1zob3Yvqnl/y7yiMPZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkAbGBK4mvQyFav79U44hWS0uWQ42Ol2xvWsZXyZ8A8G6U/+dw30Fgqmo/7HeS0cR
	 9oUJxOly5V2pDh19w+fvpLzj8QVEgLQlndwR3ORjs3AeUttXjoepg3aqH8VZi9nFwl
	 nQs5Q76Hcv1l3zTiZ6bVsB6QflwN5GTSMe/Y8CmU=
Date: Tue, 26 Mar 2024 17:29:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ira Weiny <ira.weiny@intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] USB: gadget: dummy_hcd: switch char * to u8 *
Message-ID: <2024032600-chain-spree-24aa@gregkh>
References: <20240326160342.3588864-2-gregkh@linuxfoundation.org>
 <CAHk-=whpUh+G_DzR1WpgTeELGk2q4fRuFu9BV77XUp7mGX7+oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whpUh+G_DzR1WpgTeELGk2q4fRuFu9BV77XUp7mGX7+oQ@mail.gmail.com>

On Tue, Mar 26, 2024 at 09:16:12AM -0700, Linus Torvalds wrote:
> On Tue, 26 Mar 2024 at 09:03, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > The function handle_control_request() casts the urb buffer to a char *,
> > and then treats it like a unsigned char buffer when assigning data to
> > it.  On some architectures, "char" is really signed, so let's just
> > properly set this pointer to a u8 to take away any potential problems as
> > that's what is really wanted here.
> [..]
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> 
> Well, I assume this goes back to the discussions almost two years ago
> that then just led us to use '-funsigned-char' for the kernel.

Yes.

> So the patch is still correct, but it's not like it's strictly
> necessary. I have no idea how this re-surfaced now.

It was in my really old patch queue and I noticed it had never been
updated or merged, so I dug it up and fixed it based on Alan's review.

thanks,

greg k-h

