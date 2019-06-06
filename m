Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833E537718
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbfFFOsA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 10:48:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728011AbfFFOsA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Jun 2019 10:48:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C6BF20684;
        Thu,  6 Jun 2019 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559832479;
        bh=2hbhdnSbQG7h+HcSn+06xQlfH6sV/oBVimuoNSdu2EU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jdXU1f1xPTZxLRr5TzQZQCYECGYwAHbL7EXDO0titA4Gig7Mjel8h+ZWiE6Y7fwYH
         PRS6lTTIc+tYvt6Ma3OLN/oBltaBxT1Fh0r1odfXqeMlwc7ZUz4UO2q0kb6kKCh+hO
         LXV/P7Ch8gxbZ1fNRGxYEsMrQs4FcfySp6gEjCHY=
Date:   Thu, 6 Jun 2019 16:47:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: Slow I/O on USB media
Message-ID: <20190606144757.GA12356@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
 <20190530132522.GA21005@kroah.com>
 <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
 <20190604054300.GE1588@kroah.com>
 <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
 <20190605145525.GA28819@kroah.com>
 <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
 <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
 <20190605173902.GE27700@kroah.com>
 <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 06, 2019 at 04:00:52PM +0200, Andrea Vai wrote:
> Il giorno mer, 05/06/2019 alle 19.39 +0200, Greg KH ha scritto:
> > On Wed, Jun 05, 2019 at 06:23:58PM +0200, Andrea Vai wrote:
> > [...]
> > 
> > > Anyway, I know that I can do all of this in a better way, and will
> > let
> > > you know.
> > 
> > Yes, please do so, your steps above do not show much.
> 
> Here I am with another question.
> What I have done so far:
> 
> - booted with the last kernel I know to be working (4.20.13-
> 200.fc29.x86_64, installed from Fedora repos), checked that test runs

We have no idea what is in a random distro kernel, sorry.

So I would start with a kernel.org kernel.  That keeps things at an even
level, and you are using a "known good" configuration as well.

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
> 
> I am afraid I am missing something obvious, sorry

As Alan said, 4.20 is older than 4.20.13.

But, is the kernel.org version of 4.20.13 really "good" here?

I would start with Linus's tree and stay away from the stable trees
for now.  As you end up with odd "leafs" that can confuse 'git bisect'
and everyone else.

So start with 4.20.0.  Test that.  If it is "good", then great!

If not, then maybe you are not really using the same kernel
configuration that Fedora is, _or_ Fedora has some odd kernel patch
added that makes things an order of magnitude faster :)

thanks,

greg k-h
