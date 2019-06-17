Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCB654887C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 18:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfFQQO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 12:14:29 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55780 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726715AbfFQQO3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 12:14:29 -0400
Received: (qmail 3842 invoked by uid 2102); 17 Jun 2019 12:14:27 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Jun 2019 12:14:27 -0400
Date:   Mon, 17 Jun 2019 12:14:27 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <01c48aab5eedb26db5ccd389293a975ca3ac197b.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1906171202580.1738-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 17 Jun 2019, Andrea Vai wrote:

> Il giorno lun, 10/06/2019 alle 10.40 -0400, Alan Stern ha scritto:
> > On Sat, 8 Jun 2019, Andrea Vai wrote:
> > 
> > [...]
> 
> Hi,
>   I have concluded the (third) bisect, and still haven't come to an
> end, but I have collected as much information as I can:
> 
> - I started again from:
> cd /NoBackup/kernel
> rm -rf linux
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> cd linux
> cp /boot/config-4.20.13-200.fc29.x86_64 .config
> git bisect start
> git bisect good v4.20
> 
> - To build each kernel, I have created a build script that simply
> does:
> make clean && make -j4 && make modules_install && make install &&
> grub2-mkconfig -o /boot/grub2/grub.cfg && ls -lrt /boot/v*
> 
> - Then, used grubby --set-default to set the last kernel built (took
> from the output of the last command of the build script)
> 
> - Rebooted and check with "uname -a" that the correct kernel is
> actually the last built, comparing the # in the output of "uname -a"
> with the content of the .version file;
> 
> - Do the test, using a script I created:
> 
> logfile=...
> echo -n "Inizio: " | tee -a $logfile
> date | tee -a $logfile
> uname -a | tee -a $logfile
> touch inizio
> mount UUID="05141239-4ea5-494d-aa91-acd67db89ce5" /mnt/pendrive
> cp /NoBackup/buttare/ubuntu-14.04.5-desktop-i386.iso /mnt/pendrive
> umount /mnt/pendrive
> echo -n "...fine: " | tee -a $logfile
> date | tee -a $logfile
> touch fine
> 
> Then, from the script output and the log file, I ran "git bisect bad"
> each time the time taken was more than the time resulting with the
> "good" kernel(s) (then started again with the build, and so on).
> 
> That happened ALL times, so I never encountered a kernel that made me
> say "git bisect good".

Really?  That strongly suggests that the 4.20 kernel also should have
been marked bad.  Did you really test it exactly the same way as all
the others?  That is, did you go through the entire procedure starting
with "git checkout v4.20", then running the build script, then the
reboot and "uname -a", and then the test script?

Or did you just run a few tests with the Fedora 4.20.13 kernel and
assume that the results would be the same as those?

> Usually, the time took more than 20 minutes
> (remember, the good kernel takes 1min15sec to copy), except a couple
> of cases where it took 11 and 15 minutes. I assumed that a "good"
> kernel would be one that behaves the same as the "original good" one
> (1:15 min), but may I be wrong in this assumption? Note that the
> 1:15min time is measured when the system usually makes (lot of) other
> work, because it's the kernel I use regularly (i.e., also when I don't
> do the tests).
> 
> Also, to answer to Alan:
> 
>    Also, it's possible that what you're testing for isn't caused by
>    the 
>    kernel in the first place (i.e., running the test several times
>    under 
>    the _same_ kernel might give different results).  In that case, 
>    bisection would be pointless.
> 
> I have tried to exclude it by doing many tries (10) for some kernels.
> I should have done it for all the kernels I built, but for now I did
> it for the last one (see below) and "good" one (4.20) only, because I
> would like to be sure the good one really runs fine, and in this case
> the results are very homogeneous: average time is 1:12 (m:s), and the
> standard deviation is 3 seconds.
> 
> For the other kernels I did one only try each, and they give very
> different results among each other, spacing from 55min to 6min (other
> examples are 38, 11, 22, 28, 23, 25, 15, 22, 30, 13 min), but even
> with the best case the result was some 5 times slower than the "good"
> one, so I marked it as "bad".
> 
> The ".config" file was never touched by me manually (I noticed that
> sometimes I had to reply to some questions to configure the kernel,
> and in those cases the .config content changed. Those cases were
> frequent at the beginning of the bisect, and never happened after the
> 7th, 8th step roughly).
> 
> The last bisect command showed:
> 
> a1cccdcf330e2a59b72b1588a7ef87cbaaa8a4e9 is the first bad commit
> commit a1cccdcf330e2a59b72b1588a7ef87cbaaa8a4e9
> Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Date:   Thu Sep 20 12:27:04 2018 +0200
> 
>     drm/i915: Clean up casts to crtc_state in
> intel_atomic_commit_tail()
>     
>     Use old/new_intel_crtc_state, and get rid of all the conversion
> casts
>     where they don't add anything.
>     
>     Signed-off-by: Maarten Lankhorst <
> maarten.lankhorst@linux.intel.com>
>     Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>     Link: 
> https://patchwork.freedesktop.org/patch/msgid/20180920102711.4184-2-maarten.lankhorst@linux.intel.com
> 
> 
> And reverting it may have helped "a little", but didn't make the
> problem disappear: 10 tries gave 4:47 +/- 2:01 minutes (but note that
> I didn't do the 10 trials for the preceding kernel, and the only trial
> on it gave 6:25 min).

If _all_ the kernels you built and tested were bad then you probably 
did not start the bisection from the right commit.

> By the way, I noticed an error ("Unexpected system error") reported
> sometimes by the Fedora ABRT tool, that states "this is not a software
> bug, the kernel log indicates it is a hardware error", or something
> similar (sorry, at the moment I don't know exactly where to find it).

Did you look in the kernel log?

> I have described as accurately 	as possible the steps I took because I
> hope that you can find some mistakes in them. Sorry if it turns out to
> be boring.
> 
> What do you suggest me?

Compare the mainstream 4.20 kernel with the Fedora 4.20.13 kernel.  
Also, maybe compare the mainstream 4.20.13 with Fedora's 4.20.13.

Alan Stern

