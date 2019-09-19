Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0AC6B7A2D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 15:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732271AbfISNJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 09:09:13 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39850 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730838AbfISNJN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 09:09:13 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so1893547pgi.6
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b7eB2Zj0HMh+W1nUIU3X2oj3xDi67z7zqFrF3NQgu6w=;
        b=Gh1PJb4k9dC4So0WrZHGTSEMtfNWz5B6hV9FfAhQayjN0gLcUsyUQm7U4dAX7PtgFT
         aGSZT0ghnsD/5OmmtSGnd88iM7mzyiwug9j2/7yXfaeV1/7innuJpEpvvBWB4ngmqjQA
         g2iWLxc3fscHGG+zXZ/VvAUlQ2iHtpT2WKCBQmuCks1UHkFfHyOOicvxjtBNJpAnpwXX
         SEVCOYy9z/5KcFTw84Tk01h0fKbv66Y97XEs3RpJa6x1QimcGrFefUeWd2ENdNaN4+G0
         AogBoa29Ofd2Et4opfLNeHj2w6XO5PK29CD0aupFPA/yo4SWSYWqNLi+cprrspErsk3t
         Z6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b7eB2Zj0HMh+W1nUIU3X2oj3xDi67z7zqFrF3NQgu6w=;
        b=FmngrgnHf/DFFVcKyvj4eBKDgV1AHj3xMTRdwKf9mqJUyf99KM2soeSOLboaxAox4A
         pcn2f2H6yCqaffij25CDfpUZs7AFmGz5K676Lm5VKn6IghTl3Qsk0vOYJE5/i5T7PzbB
         SCntHZ+JFiPQnxWNX1spNFthQUrLzr0eWphErToqon57OS/6j4Ld9AKOymLNbyB0HOSj
         5N9EpjTgfrRKRZX1p6Apmm1Qg6I1638NltQGMDL1m2+c5wksLR93dDnPQ8uVyf+COqjP
         bzvn4CSNbFvnH8QL41oeJzlD+6vLYvzfcbox85SKzud4B61Sw6S6Chm+wwvRHHVe1Xzv
         SABQ==
X-Gm-Message-State: APjAAAV3DMS8rNe92ph9/3d4fRIYLd45DqhAuulBNJdyed3OGoRbYKRs
        BIb9ewJAeC5OBRZWE8lHmGOiw5KfG+1VjOBZAEwPGA==
X-Google-Smtp-Source: APXvYqy9CZ28RW2zKXiUC9d6EbgNnSdWP2+JzbdmSoIMlTI53bhmKqSgfp9RMosERJQCBAbFi870wx+/J0sJND9jXEA=
X-Received: by 2002:a63:3006:: with SMTP id w6mr9148267pgw.440.1568898551847;
 Thu, 19 Sep 2019 06:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000e669b80592ab96fc@google.com> <20190919082359.GA30545@localhost>
In-Reply-To: <20190919082359.GA30545@localhost>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 19 Sep 2019 15:09:00 +0200
Message-ID: <CAAeHK+zspPwm9vRHz3JNNzD5W+B-d4o7-br65Jcn1KCDJtBzZQ@mail.gmail.com>
Subject: Re: possible deadlock in tower_open
To:     Johan Hovold <johan@kernel.org>
Cc:     syzbot <syzbot+66935bec147fbf68d9f8@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        starblue@users.sourceforge.net,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 19, 2019 at 10:24 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Sep 16, 2019 at 06:29:12AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13c8d14e600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=66935bec147fbf68d9f8
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Unfortunately, I don't have any reproducer for this crash yet.
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+66935bec147fbf68d9f8@syzkaller.appspotmail.com
> >
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > 5.3.0-rc7+ #0 Not tainted
> > ------------------------------------------------------
> > syz-executor.1/8155 is trying to acquire lock:
> > 0000000086c1bdfc (open_disc_mutex){+.+.}, at: tower_open+0xce/0x9b0
> > drivers/usb/misc/legousbtower.c:335
> >
> > but task is already holding lock:
> > 000000000f520f73 (minor_rwsem){++++}, at: usb_open+0x23/0x270
> > drivers/usb/core/file.c:39
> >
> > which lock already depends on the new lock.
>
> This looks like a duplicate of
>
> https://lkml.kernel.org/r/000000000000d58eb90592add24e@google.com
>
> Not sure if this is the right way to report this (quoting needed?):
>
> #syz dup: possible deadlock in usb_deregister_dev (2)

Hi Johan,

You did it right, now the status is changed to "closed as dup":

https://syzkaller.appspot.com/bug?extid=66935bec147fbf68d9f8

Thanks!
