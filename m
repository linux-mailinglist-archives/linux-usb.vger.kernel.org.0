Return-Path: <linux-usb+bounces-2768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E47E7A35
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 09:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46AF2816EC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281813C3C;
	Fri, 10 Nov 2023 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g+QazQqV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5F7E9
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 08:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC2FC433C7;
	Fri, 10 Nov 2023 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699605498;
	bh=PK1GkP+CRvrpK5hxzUQzj2w72P4wxfJVIt/yBBjv5qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+QazQqVR6PPjd6tJgrpux0j4i7yMQqC1b3pDQVp+ESNko/FmiFJ2tDtYZMKPXEda
	 Ow0lUk/RdVMo+vNSOHZriA5wRY0rjDET+5M+wULos6EUJyzbhX1ZQz0I6NMKdrKUrO
	 ZG0NXgCBiO0kF2DGD1O56vrd/tiCnQPIxfJYxY8c=
Date: Fri, 10 Nov 2023 09:38:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ariel marcovitch <arielmarcovitch@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Gaps in logs while using usb-serial as a console
Message-ID: <2023111049-boat-approach-6504@gregkh>
References: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
 <2023103052-unpeeled-calibrate-ae48@gregkh>
 <CAFGKuwp7JH8H9vjz8iJ24R9TRW0GDE-O96VBAG4L8X4DhTabXg@mail.gmail.com>
 <2023103003-defection-recess-cf49@gregkh>
 <CAFGKuwpSEW4G6CFY10x29a5L53je2mQDO=dm1Tw3gtzqTVky3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFGKuwpSEW4G6CFY10x29a5L53je2mQDO=dm1Tw3gtzqTVky3A@mail.gmail.com>

On Thu, Nov 09, 2023 at 08:55:49PM +0200, ariel marcovitch wrote:
> Hello and sorry for the delay
> 
> On Mon, 30 Oct 2023 at 10:30, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Oct 30, 2023 at 10:15:30AM +0200, ariel marcovitch wrote:
> > > > Please realize that usb-serial console was the result of me loosing a
> > > > drunken bet.  It's amazing it works at all.  For "fake" devices like
> > > LOL your drunken bet was quite helpful to some people
> > > Because modern PCs come without a serial port, I wanted to use it to
> > > see early logs on my crashing kernel without having to use printk
> > > delay and things like that.
> > > I'm curious as to how kernel people debug PCs in general...
> >
> > We use a usb debug port connection (it's a special cable).
> Interesting
> What makes it work well as opposed to usb-serial? Is it a less
> complicated format?

Yes, it looks like a serial console you just write the characters to and
they come out the other end.  No messing around with USB stuff.

> What code is responsible for this feature?

drivers/usb/host/xhci-dbgtty.c

> > > In any case, the usb-serial setup was quite weird as it required two
> > > usb-serial and a gender changer
> >
> > Yes, that's normal.
> >
> > > > this, that use the generic usb-serial code, yes, you will have overruns
> > > > and other problems, that's just part of how it works (i.e. not well.)
> > > >
> > > > For something like qemu, please use a real console, like the serial port
> > > > (i.e. a fake serial port), not the fake usb-serial port.
> > > Yeah I was just using it to demonstrate the problem (I agree it is
> > > quite weird to use usb-serial as a console for qemu)
> > > I experienced the same problem with a real usb-serial device, then I
> > > tried to use emulation so I can debug it more easily
> >
> > Which real usb-serial device?  That matters as it's up to the individual
> > driver to handle the flow control properly.
> Oh sorry I really thought I mentioned but it seems I missed it: pl2302
> Isn't the problem generic, though? (The speed of the device may make some
> difference probably)

The type of device and the speed it is sending out the characters makes
all the difference here.  A pl2303 device is a very tiny and dumb uart
with almost no buffer in it at all.  Overruns will happen if you try to
use a console to get boot messages.

> > > > So this is "working as designed" in that it wasn't designed at all and
> > > > again, it is a miracle any data is flowing there at all :)
> > > I see...
> > > However it may be possible to fix it without much effort, so why not?
> > > Something like checking the return value for the console's write
> > > function seems reasonable to me anyway...
> >
> > But overflows for buffers can not be handled by consoles like this
> >
> > > Besides, don't other types of consoles have the same problem (being
> > > initialized late, getting a lot of data, losing some of it)?
> >
> > Yes, they do have that problem, this is not unique.  You can just see it
> > very easily when using the generic usb-serial driver as there is almost
> > no buffering at all in it other than what the tty layer provides.
> >
> > Adding larger buffers can help with this, but where do you stop?  What
> > is the proper buffer size to always use?
> Specifically, since we are talking about data coming from the console,
> and it saves the full log anyway (or at least buffers a lot of it, in
> a configurable manner),
> why can't it make the per-console seq track the actual data that was
> able to be sent?
> It sound reasonable for me, is it really that bad?

Try changing it and see!  :)

It's complex stuff, there is buffering already, but for slow devices
with no additional buffers in them, you will have overruns.

But hey, I could be totally wrong here, patches are always gladly
reviewed for this stuff if you find some places that could be improved.

thanks,

greg k-h

