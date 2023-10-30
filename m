Return-Path: <linux-usb+bounces-2340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652477DB526
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 09:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE2E1C2087D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFC1D286;
	Mon, 30 Oct 2023 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cn3QcCi9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92BD2FA
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 08:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DA7C433C7;
	Mon, 30 Oct 2023 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698654619;
	bh=0UimFwwOXgzTlodgzdl7ZzZqU/y6LF8gHiLYvuFrwC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cn3QcCi9Gk5JXC4nGvd8HJvk1R9BTyA46Zf/w6/gxGOf7nXin+kTsmd5qeCY4zXsM
	 ioUUsqX/MHFSJJHhudmv1VuW4zWQ8w6L3BmXFdkeN6OP26kNPr7DqVNcbsmi6jSgVK
	 IvgicuqynQtxtIf64GriJEwqcc21BWOgxWUSD204=
Date: Mon, 30 Oct 2023 09:30:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ariel marcovitch <arielmarcovitch@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Gaps in logs while using usb-serial as a console
Message-ID: <2023103003-defection-recess-cf49@gregkh>
References: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
 <2023103052-unpeeled-calibrate-ae48@gregkh>
 <CAFGKuwp7JH8H9vjz8iJ24R9TRW0GDE-O96VBAG4L8X4DhTabXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFGKuwp7JH8H9vjz8iJ24R9TRW0GDE-O96VBAG4L8X4DhTabXg@mail.gmail.com>

On Mon, Oct 30, 2023 at 10:15:30AM +0200, ariel marcovitch wrote:
> > Please realize that usb-serial console was the result of me loosing a
> > drunken bet.  It's amazing it works at all.  For "fake" devices like
> LOL your drunken bet was quite helpful to some people
> Because modern PCs come without a serial port, I wanted to use it to
> see early logs on my crashing kernel without having to use printk
> delay and things like that.
> I'm curious as to how kernel people debug PCs in general...

We use a usb debug port connection (it's a special cable).

> In any case, the usb-serial setup was quite weird as it required two
> usb-serial and a gender changer

Yes, that's normal.

> > this, that use the generic usb-serial code, yes, you will have overruns
> > and other problems, that's just part of how it works (i.e. not well.)
> >
> > For something like qemu, please use a real console, like the serial port
> > (i.e. a fake serial port), not the fake usb-serial port.
> Yeah I was just using it to demonstrate the problem (I agree it is
> quite weird to use usb-serial as a console for qemu)
> I experienced the same problem with a real usb-serial device, then I
> tried to use emulation so I can debug it more easily

Which real usb-serial device?  That matters as it's up to the individual
driver to handle the flow control properly.

> > So this is "working as designed" in that it wasn't designed at all and
> > again, it is a miracle any data is flowing there at all :)
> I see...
> However it may be possible to fix it without much effort, so why not?
> Something like checking the return value for the console's write
> function seems reasonable to me anyway...

But overflows for buffers can not be handled by consoles like this

> Besides, don't other types of consoles have the same problem (being
> initialized late, getting a lot of data, losing some of it)?

Yes, they do have that problem, this is not unique.  You can just see it
very easily when using the generic usb-serial driver as there is almost
no buffering at all in it other than what the tty layer provides.

Adding larger buffers can help with this, but where do you stop?  What
is the proper buffer size to always use?

Overall, if you are going to be doing lots of debugging of early-boot
and console logs, I recommend getting a usb debug cable instead, sorry.
usb-serial console is just "best effort" and we're happy that any data
flows out of the thing at all :)

thanks,

greg k-h

