Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894262403DE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 11:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHJJP3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 05:15:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgHJJP3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 05:15:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07DC220709;
        Mon, 10 Aug 2020 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597050928;
        bh=smvATPrkA9cVoK/6b0awysZIlKaEosKpKu7koIrCUME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WkbEoDMdY+UZuUN7tf1nCkEc1z5ImR7ikGJNLQLeP3SMPl4uX79cGyMNqIYfshLNs
         X7i1RiW5I1q7ygYSLrcbHF+EFLZRp4F1illaSTRuEKxN9zSUt0sYRahgY3C/sEkv5B
         JBDmyTpZ6hrpDnEQ8Cv2tqhxY6LuIg4IlseD+PG0=
Date:   Mon, 10 Aug 2020 11:15:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>, balbi@kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alexander Potapenko <glider@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: KMSAN: kernel-infoleak in raw_ioctl
Message-ID: <20200810091538.GA2273701@kroah.com>
References: <000000000000ce85c405ac744ff6@google.com>
 <20200810074706.GD1529187@kroah.com>
 <CACT4Y+aS6oangE4BzhCfx3gs9guAW=zQpwN1LP+yB3kza68xFw@mail.gmail.com>
 <20200810090833.GA2271719@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810090833.GA2271719@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 11:08:33AM +0200, Greg KH wrote:
> On Mon, Aug 10, 2020 at 11:00:07AM +0200, Dmitry Vyukov wrote:
> > On Mon, Aug 10, 2020 at 9:46 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Aug 09, 2020 at 09:27:18AM -0700, syzbot wrote:
> > > > Hello,
> > > >
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    ce8056d1 wip: changed copy_from_user where instrumented
> > > > git tree:       https://github.com/google/kmsan.git master
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=141eb8b2900000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=a7e220df5a81d1ab400e
> > > > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > > > userspace arch: i386
> > > >
> > > > Unfortunately, I don't have any reproducer for this issue yet.
> > >
> > > The irony of a kernel module written for syzbot testing, causing syzbot
> > > reports....
> > 
> > The raw gadget and KCOV are also kernel code and subject to all the
> > same rules as any other kernel code from syzkaller point of view.
> > 
> > But I think the root cause of this bug is the origin of the uninitialized-ness:
> > 
> > Local variable ----buf.i@asix_get_phy_addr created at:
> >  asix_read_cmd drivers/net/usb/asix_common.c:312 [inline]
> >  asix_read_phy_addr drivers/net/usb/asix_common.c:295 [inline]
> >  asix_get_phy_addr+0x4d/0x290 drivers/net/usb/asix_common.c:314
> >  asix_read_cmd drivers/net/usb/asix_common.c:312 [inline]
> >  asix_read_phy_addr drivers/net/usb/asix_common.c:295 [inline]
> >  asix_get_phy_addr+0x4d/0x290 drivers/net/usb/asix_common.c:314
> 
> read buffers sent to USB hardware are ment to be filled in by the
> hardware with the data received from it, we do not zero-out those
> buffers before passing the pointer there.
> 
> Perhaps with testing frameworks like the raw usb controller, that might
> cause a number of false-positives to happen?

Ah, wait, that buffer is coming from the stack, which isn't allowed in
the first place :(

So that should be changed anyway to a dynamic allocation, I'll go write
up a patch...

thanks,

greg k-h
