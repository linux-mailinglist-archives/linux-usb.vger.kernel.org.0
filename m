Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 958EB3B787
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389989AbfFJOhm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:37:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388932AbfFJOhl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 10:37:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA74D20679;
        Mon, 10 Jun 2019 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560177460;
        bh=NLPcsVhwonhg+PWG+96z6M5/9CdmvuvA+cQPz9sZoyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RLr1iN8puhEb8JKtzS2W2RG0vaVW0KqMrrrpPq8uRv8b8LH2Wtbvti1R9MjPSCqg/
         j5YDdqNveXkTOvYsE8IfqdleZdoozB/cD9I/gH5g86BM2F7BghG2IuzTjiNMV79S6K
         xxZL+HA8H7+YNdDbncBg1X1PEXxMk0o40WhNTejE=
Date:   Mon, 10 Jun 2019 16:37:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Slow I/O on USB media
Message-ID: <20190610143737.GA30602@kroah.com>
References: <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
 <20190604054300.GE1588@kroah.com>
 <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
 <20190605145525.GA28819@kroah.com>
 <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
 <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
 <20190605173902.GE27700@kroah.com>
 <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
 <20190606144757.GA12356@kroah.com>
 <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 08, 2019 at 09:43:11AM +0200, Andrea Vai wrote:
> Il giorno gio 6 giu 2019 alle ore 16:48 Greg KH
> <gregkh@linuxfoundation.org> ha scritto:
> >
> > On Thu, Jun 06, 2019 at 04:00:52PM +0200, Andrea Vai wrote:
> > > Il giorno mer, 05/06/2019 alle 19.39 +0200, Greg KH ha scritto:
> > > > On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> > > > [...]
> > > >
> > > > > Anyway, I know that I can do all of this in a better way, and will
> > > > let
> > > > > you know.
> > > >
> > > > Yes, please do so, your steps above do not show much.
> > >
> > > Here I am with another question.
> > > What I have done so far:
> > >
> > > - booted with the last kernel I know to be working (4.20.13-
> > > 200.fc29.x86_64, installed from Fedora repos), checked that test runs
> >
> > We have no idea what is in a random distro kernel, sorry.
> >
> > So I would start with a kernel.org kernel.  That keeps things at an even
> > level, and you are using a "known good" configuration as well.
> >
> > > fine (2min to copy)
> > > - marked "git bisect good v4.20.13"
> > > - built the latest stable version:
> > >   - git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> > >   - cp -v /boot/config-$(uname -r) .config
> > >   - make -j4 && make modules_install && make install && grub2-mkconfig -o /boot/grub2/grub.cfg
> > >   - grubby --set-default /boot/vmlinuz-5.2.0-rc3 (the last regular file listed in "ls -lrt /boot/v*")
> > > - rebooted with kernel 5.2.0-rc3, ran the test, took 49min to copy
> > > (!), thus marked "git bisect bad"
> > > - built again, and it turns out to be 4.20.0 (why is it earlier than
> > > 4.20.13?), rebooted with 4.20.0, ran the test and it took more than 15
> > > minutes so I killed the cp process, and marked it BAD, and obtained:
> > >
> > > The merge base 8fe28cb58bcb235034b64cbbb7550a8a43fd88be is bad.
> > > This means the bug has been fixed between
> > > 8fe28cb58bcb235034b64cbbb7550a8a43fd88be and
> > > [0f7c162c1df596e0bba04c26fc9cc497983bf32b].
> > >
> > > The output of "git bisect log" is:
> > >
> > > git bisect start
> > > # good: [0f7c162c1df596e0bba04c26fc9cc497983bf32b] Linux 4.20.13
> > > git bisect good 0f7c162c1df596e0bba04c26fc9cc497983bf32b
> > > # bad: [f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a] Linux 5.2-rc3
> > > git bisect bad f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
> > > # bad: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
> > > git bisect bad 8fe28cb58bcb235034b64cbbb7550a8a43fd88be
> > >
> > > I can understand that the bug was present before 4.20.13 (is that
> > > reasonable?), but how can I tell bisect to start at 4.20.13, which I
> > > know for sure to be working, and not from 4.20.0, which I actually
> > > don't care about?
> > >
> > > I am afraid I am missing something obvious, sorry
> >
> > As Alan said, 4.20 is older than 4.20.13.
> >
> > But, is the kernel.org version of 4.20.13 really "good" here?
> >
> > I would start with Linus's tree and stay away from the stable trees
> > for now.  As you end up with odd "leafs" that can confuse 'git bisect'
> > and everyone else.
> >
> > So start with 4.20.0.  Test that.  If it is "good", then great!
> 
> Hi,
>   there is also something else I don't understand.
> Every time I build a kernel, then after booting it "uname -a" shows
> something like
> 
> Linux [...] 4.19.0-rc5+ #12 SMP Sat Jun 8 00:26:42 CEST 2019 x86_64
> x86_64 x86_64 GNU/Linux
> 
> where the number after "#" increments by 1 from the previous build.
> 
> Now I have the same number (#12) after a new build, is it normal?

Maybe, sometimes an incremental build does not bump the .version number,
I don't remember exactly what causes that to increase.  It's somewhere
in the build scripts :)

> Furthermore, "ls -lrt /boot/v*" shows the last lines to be
> 
> -rw-r--r--. 1 root root 8648656  8 giu 00.35 /boot/vmlinuz-4.19.0-rc5+.old
> -rw-r--r--. 1 root root 8648656  8 giu 09.08 /boot/vmlinuz-4.19.0-rc5+
> 
> and "diff /boot/vmlinuz-4.19.0-rc5+.old /boot/vmlinuz-4.19.0-rc5+"
> shows they are identical. Why? I expected that each bisect would lead
> to a different kernel.

It should.

Are you sure they are really different?  'diff' works on text files, how
about running something like md5sum on the files to ensure they really
are, or are not, the same thing?

And sometimes, a bisection may cause things to change in files that you
do not actually require for building.  So the same output may happen.

> Assuming that the opposite can happen, does it mean that when I say
> i.e. "git bisect bad", then build a new kernel and see that is
> identical to the previous one I can run "git bisect bad" without
> booting into the new one and even making the test?
> 
> Another thing I don't understand is that I told 4.20.0 to be good, so
> I would expect that I don't need to test any older version, but as far
> as I know 4.19.0-rc5+ is older than 4.20.0, so why is it involved in
> the bisection?

Because it went down a subsystem branch that might have been based on a
much older tree.

Think about this workflow:
	- developer branches from 4.10.0
	- developer adds some patches to the branch
	- developer gets Linus to merge their branch into his 4.20-rc1
	  kernel release.

As a "point in time", between 4.19-final and 4.20-2, the development
worflow did step back to a 4.10.0 release, for those patches.

Now that's an extreme example, but lots of developers work off of the
last release (or close to it) and get their trees merged as part of the
merge window.  That is what will cause your kernel version to look like
it went back in time.

Hope this helps,

greg k-h
