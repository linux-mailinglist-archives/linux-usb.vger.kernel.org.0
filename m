Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52273376B6
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbfFFOas (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 10:30:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51888 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727133AbfFFOas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 10:30:48 -0400
Received: (qmail 3569 invoked by uid 2102); 6 Jun 2019 10:30:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Jun 2019 10:30:47 -0400
Date:   Thu, 6 Jun 2019 10:30:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1906061025540.1641-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 6 Jun 2019, Andrea Vai wrote:

> Here I am with another question.
> What I have done so far:
> 
> - booted with the last kernel I know to be working (4.20.13-
> 200.fc29.x86_64, installed from Fedora repos), checked that test runs
> fine (2min to copy)
> - marked "git bisect good v4.20.13"
> - built the latest stable version:
>   - git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>   - cp -v /boot/config-$(uname -r) .config
>   - make -j4 && make modules_install && make install && grub2-mkconfig -o /boot/grub2/grub.cfg
>   - grubby --set-default /boot/vmlinuz-5.2.0-rc3 (the last regular file listed in "ls -lrt /boot/v*")
> - rebooted with kernel 5.2.0-rc3, ran the test, took 49min to copy
> (!), thus marked "git bisect bad"
> - built again, and it turns out to be 4.20.0 (why is it earlier than
> 4.20.13?), rebooted with 4.20.0, ran the test and it took more than 15
> minutes so I killed the cp process, and marked it BAD, and obtained:
> 
> The merge base 8fe28cb58bcb235034b64cbbb7550a8a43fd88be is bad.
> This means the bug has been fixed between
> 8fe28cb58bcb235034b64cbbb7550a8a43fd88be and
> [0f7c162c1df596e0bba04c26fc9cc497983bf32b].
> 
> The output of "git bisect log" is:
> 
> git bisect start
> # good: [0f7c162c1df596e0bba04c26fc9cc497983bf32b] Linux 4.20.13
> git bisect good 0f7c162c1df596e0bba04c26fc9cc497983bf32b
> # bad: [f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a] Linux 5.2-rc3
> git bisect bad f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
> # bad: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
> git bisect bad 8fe28cb58bcb235034b64cbbb7550a8a43fd88be
> 
> I can understand that the bug was present before 4.20.13 (is that
> reasonable?), but how can I tell bisect to start at 4.20.13, which I
> know for sure to be working, and not from 4.20.0, which I actually
> don't care about?

So what you got was a meaningless result.  Bisection works by assuming 
assuming that it's looking for a commit that introduced a problem.  If 
the earliest commit you test already has the problem (and 4.20.0 is 
earlier than 4.20.13) then bisection won't do anything.

In your case it looks like something added between 4.20.0 and 4.20.13 
caused the problem to go away!  You can still use bisection to find the 
commit which did that, but the idea is a little unintuitive.

Start out by telling git that 4.20.0 is "good" and 4.20.13 is "bad".  
Then test the intermediate commits as you have been doing, and say that 
the commit is "good" if the copy takes a long time and "bad" if the 
copy takes a short time.  That should help to find the first commit 
which caused the problem to go away.  (Assuming that the problem is 
caused by the kernel and not by something else...)

Alan Stern

