Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBEFB3B795
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390888AbfFJOkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:40:12 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35248 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2389520AbfFJOkL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 10:40:11 -0400
Received: (qmail 3552 invoked by uid 2102); 10 Jun 2019 10:40:10 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Jun 2019 10:40:10 -0400
Date:   Mon, 10 Jun 2019 10:40:10 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <CAOsYWL2z=Rddvu62DP+QdQOf=4FwygmLrOPS0rJ8Uc+OzLKQvA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906101030280.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 8 Jun 2019, Andrea Vai wrote:

> Il giorno sab 8 giu 2019 alle ore 09:43 Andrea Vai
> <andrea.vai@unipv.it> ha scritto:
> >
> >[...]
> >
> > Hi,
> >   there is also something else I don't understand.
> > Every time I build a kernel, then after booting it "uname -a" shows
> > something like
> >
> > Linux [...] 4.19.0-rc5+ #12 SMP Sat Jun 8 00:26:42 CEST 2019 x86_64
> > x86_64 x86_64 GNU/Linux
> >
> > where the number after "#" increments by 1 from the previous build.
> >
> > Now I have the same number (#12) after a new build, is it normal?

That number is set up by the kernel's build system, and it is 
automatically incremented each time you build a kernel (look for a file 
named ".version" in the top-level kernel source directory).  It should 
be different each time.

> > Furthermore, "ls -lrt /boot/v*" shows the last lines to be
> >
> > -rw-r--r--. 1 root root 8648656  8 giu 00.35 /boot/vmlinuz-4.19.0-rc5+.old
> > -rw-r--r--. 1 root root 8648656  8 giu 09.08 /boot/vmlinuz-4.19.0-rc5+
> >
> > and "diff /boot/vmlinuz-4.19.0-rc5+.old /boot/vmlinuz-4.19.0-rc5+"
> > shows they are identical. Why? I expected that each bisect would lead
> > to a different kernel.

Maybe you aren't building or installing the kernels correctly.

> > Assuming that the opposite can happen, does it mean that when I say
> > i.e. "git bisect bad", then build a new kernel and see that is
> > identical to the previous one I can run "git bisect bad" without
> > booting into the new one and even making the test?

Yes, except that the new kernel should never be identical to the old 
one.

> > Another thing I don't understand is that I told 4.20.0 to be good, so
> > I would expect that I don't need to test any older version, but as far
> > as I know 4.19.0-rc5+ is older than 4.20.0, so why is it involved in
> > the bisection?

I don't know.

> > I had to "git bisect skip" one time (the kernel did not boot), but as
> > far as I know I don't think this could be related to my doubts.
> > [...]
> 
> Update:
>   I have concluded the bisection, found that
> "9cb5f4873b993497d462b9406f9a1d8a148e461b is the first bad commit",
> reverted it, and the test still fails (btw, the final kernel file,
> /boot/vmlinuz-4.19.0-rc5+, does not differ from the previous one).

It sounds like you did not do the bisection or testing correctly.

> So, all my doubts above are still there (and growing). What I am doing wrong?

Without knowing exactly what you are doing, it's impossible to say what 
you're doing wrong.  Some possibilities include:

	Not setting up the .config file properly for each build.

	Not installing the new kernel in the right place.

	Booting some kernel other than the new one when you test.

Sometimes doing "make clean" before each build will help.

Also, it's possible that what you're testing for isn't caused by the 
kernel in the first place (i.e., running the test several times under 
the _same_ kernel might give different results).  In that case, 
bisection would be pointless.

Alan Stern

