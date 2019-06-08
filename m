Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D44A39B8D
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2019 09:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfFHHnZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jun 2019 03:43:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41024 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFHHnZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jun 2019 03:43:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so4232576wrm.8
        for <linux-usb@vger.kernel.org>; Sat, 08 Jun 2019 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKqc0lzP47gMzHzMD6emb7W7zB5bOawpgd0Vsnvec/4=;
        b=iudRtLU6O/K5MoUTfgrPaw4epasI3YCxKnb1oGvltkC1G6tEPW4a6JJAcQyZH664vc
         LoqCuyuAlyaui2PQVSC0lWa/bhazRmS+qHaEBilFsL6qiIVufEEQULf31aDb/VRMI9to
         gw/uxxy9pm/eea+nH8qEpigAWF6CnsjYhZjXoXjy7Pvh4Y7SNI8Zlqfg2HocO6QteCP0
         3EO3Z7gltOFwCULDNUxT7IrdE7hfOMSBaF6f1O1DB53oYUGiVv7wexW4q67hYGOtWURE
         NnW0Pcm3YJNMP2UE5Zwmxe4syk6o1UiEBlwo+fwt9vEfY+QAmWYc9ZpUtExmT66JNm5f
         6qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKqc0lzP47gMzHzMD6emb7W7zB5bOawpgd0Vsnvec/4=;
        b=D+8ziFlvo5gffEg2l9QpjYeidK0f4a1R1hsGz33N9aJSRW2i5hD6Sz0pQ8S+mmTEPh
         V6Giholwb4puAZit6yZaXJ7WEqetDjCfLO0wpLhYQy9WwBUCeDCrUZCfMp5Dbazs9zj+
         MuAXeIrgFT4mJ3ERT5C/TgwyaVuFr3Vm6cQheFIsQ3FVkhKDQp0LqrVAD8Cy6zBJ3ZWF
         6GIVl7+84xtjMhMLjdvKMCcx+odRL8N575wcN6cDg+ECXr2eMfGjB1pSZtPfbUCQfolX
         e9FgdFVtqHFWnmGzqtIwlzpi/oIhUlo7WRfgNk5+dETMQ3Hkkf/gPZVV16wCJNpLBXgi
         t7YA==
X-Gm-Message-State: APjAAAWG+UeN2XwD7W8yvHn5yibr4rb084KoLTPikjZKgBih8JgL4CU4
        4cq2+c8KjVQ1QwPOkTYlmLtfTahp0BwAJdkHWcGX8nDpGDI=
X-Google-Smtp-Source: APXvYqwVHkTTl2RtzFd3SNTiyl6Mtkz55AiLKBMcIwBqmlgsxBJAZvMghvJhtM2H68AISr2J0Qj9Px0vWtCZJt80u7E=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr12976555wrl.27.1559979803087;
 Sat, 08 Jun 2019 00:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
 <20190530132522.GA21005@kroah.com> <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
 <20190604054300.GE1588@kroah.com> <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
 <20190605145525.GA28819@kroah.com> <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
 <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it> <20190605173902.GE27700@kroah.com>
 <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it> <20190606144757.GA12356@kroah.com>
In-Reply-To: <20190606144757.GA12356@kroah.com>
From:   Andrea Vai <andrea.vai@unipv.it>
Date:   Sat, 8 Jun 2019 09:43:11 +0200
Message-ID: <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
Subject: Re: Slow I/O on USB media
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno gio 6 giu 2019 alle ore 16:48 Greg KH
<gregkh@linuxfoundation.org> ha scritto:
>
> On Thu, Jun 06, 2019 at 04:00:52PM +0200, Andrea Vai wrote:
> > Il giorno mer, 05/06/2019 alle 19.39 +0200, Greg KH ha scritto:
> > > On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> > > [...]
> > >
> > > > Anyway, I know that I can do all of this in a better way, and will
> > > let
> > > > you know.
> > >
> > > Yes, please do so, your steps above do not show much.
> >
> > Here I am with another question.
> > What I have done so far:
> >
> > - booted with the last kernel I know to be working (4.20.13-
> > 200.fc29.x86_64, installed from Fedora repos), checked that test runs
>
> We have no idea what is in a random distro kernel, sorry.
>
> So I would start with a kernel.org kernel.  That keeps things at an even
> level, and you are using a "known good" configuration as well.
>
> > fine (2min to copy)
> > - marked "git bisect good v4.20.13"
> > - built the latest stable version:
> >   - git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> >   - cp -v /boot/config-$(uname -r) .config
> >   - make -j4 && make modules_install && make install && grub2-mkconfig -o /boot/grub2/grub.cfg
> >   - grubby --set-default /boot/vmlinuz-5.2.0-rc3 (the last regular file listed in "ls -lrt /boot/v*")
> > - rebooted with kernel 5.2.0-rc3, ran the test, took 49min to copy
> > (!), thus marked "git bisect bad"
> > - built again, and it turns out to be 4.20.0 (why is it earlier than
> > 4.20.13?), rebooted with 4.20.0, ran the test and it took more than 15
> > minutes so I killed the cp process, and marked it BAD, and obtained:
> >
> > The merge base 8fe28cb58bcb235034b64cbbb7550a8a43fd88be is bad.
> > This means the bug has been fixed between
> > 8fe28cb58bcb235034b64cbbb7550a8a43fd88be and
> > [0f7c162c1df596e0bba04c26fc9cc497983bf32b].
> >
> > The output of "git bisect log" is:
> >
> > git bisect start
> > # good: [0f7c162c1df596e0bba04c26fc9cc497983bf32b] Linux 4.20.13
> > git bisect good 0f7c162c1df596e0bba04c26fc9cc497983bf32b
> > # bad: [f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a] Linux 5.2-rc3
> > git bisect bad f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
> > # bad: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
> > git bisect bad 8fe28cb58bcb235034b64cbbb7550a8a43fd88be
> >
> > I can understand that the bug was present before 4.20.13 (is that
> > reasonable?), but how can I tell bisect to start at 4.20.13, which I
> > know for sure to be working, and not from 4.20.0, which I actually
> > don't care about?
> >
> > I am afraid I am missing something obvious, sorry
>
> As Alan said, 4.20 is older than 4.20.13.
>
> But, is the kernel.org version of 4.20.13 really "good" here?
>
> I would start with Linus's tree and stay away from the stable trees
> for now.  As you end up with odd "leafs" that can confuse 'git bisect'
> and everyone else.
>
> So start with 4.20.0.  Test that.  If it is "good", then great!

Hi,
  there is also something else I don't understand.
Every time I build a kernel, then after booting it "uname -a" shows
something like

Linux [...] 4.19.0-rc5+ #12 SMP Sat Jun 8 00:26:42 CEST 2019 x86_64
x86_64 x86_64 GNU/Linux

where the number after "#" increments by 1 from the previous build.

Now I have the same number (#12) after a new build, is it normal?
Furthermore, "ls -lrt /boot/v*" shows the last lines to be

-rw-r--r--. 1 root root 8648656  8 giu 00.35 /boot/vmlinuz-4.19.0-rc5+.old
-rw-r--r--. 1 root root 8648656  8 giu 09.08 /boot/vmlinuz-4.19.0-rc5+

and "diff /boot/vmlinuz-4.19.0-rc5+.old /boot/vmlinuz-4.19.0-rc5+"
shows they are identical. Why? I expected that each bisect would lead
to a different kernel.
Assuming that the opposite can happen, does it mean that when I say
i.e. "git bisect bad", then build a new kernel and see that is
identical to the previous one I can run "git bisect bad" without
booting into the new one and even making the test?

Another thing I don't understand is that I told 4.20.0 to be good, so
I would expect that I don't need to test any older version, but as far
as I know 4.19.0-rc5+ is older than 4.20.0, so why is it involved in
the bisection?

I had to "git bisect skip" one time (the kernel did not boot), but as
far as I know I don't think this could be related to my doubts.

Current output of "git bisect log" is

git bisect start
# good: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
git bisect good 8fe28cb58bcb235034b64cbbb7550a8a43fd88be
# bad: [01047631df813f6247185547c3778c80af088a20] Merge tag
'xfs-5.2-fixes-2' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
git bisect bad 01047631df813f6247185547c3778c80af088a20
# bad: [bcd49c3dd172c38e14faf151adca63c8db4c9557] Merge branch
'x86-cleanups-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad bcd49c3dd172c38e14faf151adca63c8db4c9557
# bad: [fcf010449ebe1db0cb68b2c6410972a782f2bd14] Merge tag
'kgdb-4.21-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux
git bisect bad fcf010449ebe1db0cb68b2c6410972a782f2bd14
# bad: [e0c38a4d1f196a4b17d2eba36afff8f656a4f1de] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect bad e0c38a4d1f196a4b17d2eba36afff8f656a4f1de
# bad: [c2f1f3e0e17d94ab0c66d83e669492cb9e9a3698] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next
git bisect bad c2f1f3e0e17d94ab0c66d83e669492cb9e9a3698
# bad: [b3cc2bfe7244e848f5e8caa77bbdc72c04abd17c] Merge tag
'i3c/for-4.21' of
git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux
git bisect bad b3cc2bfe7244e848f5e8caa77bbdc72c04abd17c
# bad: [2ac5e38ea4203852d6e99edd3cf11f044b0a409f] Merge drm/drm-next
into drm-intel-next-queued
git bisect bad 2ac5e38ea4203852d6e99edd3cf11f044b0a409f
# skip: [63ac3328f0d1d37f286e397b14d9596ed09d7ca5] drm/i915: fix
broadwell EU computation
git bisect skip 63ac3328f0d1d37f286e397b14d9596ed09d7ca5
# bad: [ca05359f1e64cf8303ee532e50efe4ab7563d4a9] dma-buf: allow
reserving more than one shared fence slot
git bisect bad ca05359f1e64cf8303ee532e50efe4ab7563d4a9
# bad: [21ebe615c16994f340fe2b6735aad31fd1d0014c] drm: Remove
transitional helpers
git bisect bad 21ebe615c16994f340fe2b6735aad31fd1d0014c
# bad: [a0d4d42cb5854400baa47bf63d9aae65fa9f484e] drm/bochs: Replace
drm_gem_object_unreference_unlocked with put function
git bisect bad a0d4d42cb5854400baa47bf63d9aae65fa9f484e

Many thanks,
Andrea
