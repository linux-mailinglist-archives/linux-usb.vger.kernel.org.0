Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6E33B78C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390867AbfFJOiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:38:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388932AbfFJOiZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 10:38:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D18AF20679;
        Mon, 10 Jun 2019 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560177504;
        bh=ecw9YyF8I/9XdGMsLN6+mDIM+VGK4aqDBYv8hwLh8Ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aNVQySvkw3wbpQW3OH3gCpYnL5OwwhNHhv6UGLRpBgrQVBdU7l+HSKYCyT/VErJq0
         QEU5ansGEg+8XYFYOuyJ/xYnZPTqDKSL4dDSdYKndBCjYCiLzXy7eSSFvCkmMFMoRS
         S6SWkSDJRmxkD4GOBPIBEcpC6hy8hGSCR2v8vBsc=
Date:   Mon, 10 Jun 2019 16:38:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Slow I/O on USB media
Message-ID: <20190610143821.GB30602@kroah.com>
References: <20190604054300.GE1588@kroah.com>
 <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
 <20190605145525.GA28819@kroah.com>
 <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
 <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
 <20190605173902.GE27700@kroah.com>
 <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
 <20190606144757.GA12356@kroah.com>
 <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
 <CAOsYWL2z=Rddvu62DP+QdQOf=4FwygmLrOPS0rJ8Uc+OzLKQvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOsYWL2z=Rddvu62DP+QdQOf=4FwygmLrOPS0rJ8Uc+OzLKQvA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 08, 2019 at 11:29:16AM +0200, Andrea Vai wrote:
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
> > Furthermore, "ls -lrt /boot/v*" shows the last lines to be
> >
> > -rw-r--r--. 1 root root 8648656  8 giu 00.35 /boot/vmlinuz-4.19.0-rc5+.old
> > -rw-r--r--. 1 root root 8648656  8 giu 09.08 /boot/vmlinuz-4.19.0-rc5+
> >
> > and "diff /boot/vmlinuz-4.19.0-rc5+.old /boot/vmlinuz-4.19.0-rc5+"
> > shows they are identical. Why? I expected that each bisect would lead
> > to a different kernel.
> > Assuming that the opposite can happen, does it mean that when I say
> > i.e. "git bisect bad", then build a new kernel and see that is
> > identical to the previous one I can run "git bisect bad" without
> > booting into the new one and even making the test?
> >
> > Another thing I don't understand is that I told 4.20.0 to be good, so
> > I would expect that I don't need to test any older version, but as far
> > as I know 4.19.0-rc5+ is older than 4.20.0, so why is it involved in
> > the bisection?
> >
> > I had to "git bisect skip" one time (the kernel did not boot), but as
> > far as I know I don't think this could be related to my doubts.
> > [...]
> 
> Update:
>   I have concluded the bisection, found that
> "9cb5f4873b993497d462b9406f9a1d8a148e461b is the first bad commit",
> reverted it, and the test still fails (btw, the final kernel file,
> /boot/vmlinuz-4.19.0-rc5+, does not differ from the previous one).
> 
> So, all my doubts above are still there (and growing). What I am doing wrong?

Are you _SURE_ that a 4.20.0 release actually worked properly for you?
Did you build one and do your tests?  Or are you just relying on your
Fedora build still?

that's all I can think of here, sorry.

greg k-h
