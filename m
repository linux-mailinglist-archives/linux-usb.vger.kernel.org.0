Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C54B8DC2
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 11:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391415AbfITJ2f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 05:28:35 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37480 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390037AbfITJ2f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 05:28:35 -0400
Received: by mail-qt1-f195.google.com with SMTP id d2so7898721qtr.4
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MbiaQUcydykVsBCV6mANCv6GdGFxNUZcIG4z7eqBwBc=;
        b=uvj6ak6GvdEOixkEkiautlAWl/sr41LI4rNV7x5ngSbIhMdn4eGQOh31Z6swud7nVn
         Dg1YHA3EU6TlAfp3j8KSUv2I7RiSwBq32ru5RtxOTvK64UOUxbDBeaQh7rmJBzWAV/n3
         GwU/eGCQP3afybx903qME3zxpx2SrG+My3yg8PYBTyFu0WGrZSd+Zllb7ArgQ3XwMF7y
         XzOwUXPqmchHSWUBbuGl1le9G/xAfBtWxaAHTppRx/eyTsdTOMJ9PquXyFEZ/M0UFSU4
         qMTJhnTZW6JMzmWXMTkX6aQ+KGDHSgrJrko2tYndtQ9LXSy9mpvEp8d9waAxe1ij04qk
         Zp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MbiaQUcydykVsBCV6mANCv6GdGFxNUZcIG4z7eqBwBc=;
        b=eNe8+TdHnZKs8+xlJzjDrz528sggxGbuurauqm9dgoklGxQPU99VBjuIJnmNHKnWrg
         q493mw/TSheLKAGLXkAbsbaP+4xxwOJJhWHKOtOG/sKlBk28S8lNt3BP7tSHJ1B0/uJS
         7lSA4gLt95EXTyJNVjR74E+XoRips9Yfoejqd/jdPI7mjkQ4gTU5twv4ECQ9KW2pzUGj
         mMD3T7SI1sPl41ofsq5xx8u6FeHbsrG3S0VaoRdEOomudOQVIB7WHD437097pq0uzqZA
         A1hbklUI4v68Fpe7geVsCMqFOad9udOVzCggJTtpgy1zF+cqMBeIKHwgmk+3Nb27ReC4
         ftmw==
X-Gm-Message-State: APjAAAUXifK7G5pa7sIBD5BRt1JxyMgX2myyDEHQBINkQSpy7X5a4TLx
        PQfcj95Sj7gdOF0MB53GFYh6SzEEJxJuom7yqiMu3w==
X-Google-Smtp-Source: APXvYqwBAZ/O5ajitHmYHujdUn4YuEtiRpdl/6MqMSUPx211IUT0VieQMMhdXvrdQxL0LS9srHYpBhTpPUFGB7pnCm4=
X-Received: by 2002:ac8:4a8d:: with SMTP id l13mr2254572qtq.158.1568971713803;
 Fri, 20 Sep 2019 02:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d12d24058f5d6b65@google.com> <000000000000a12822058fb4f408@google.com>
 <20190920090803.GM30545@localhost> <CACT4Y+Yg5wTsMUGRmTwexKUMzi1ZxrH3k3yaMaJvLaEp7qnjSw@mail.gmail.com>
 <20190920092153.GN30545@localhost>
In-Reply-To: <20190920092153.GN30545@localhost>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 20 Sep 2019 11:28:22 +0200
Message-ID: <CACT4Y+aLCfq_eJ0w9EnWN-kiTR7qxgtq+8osCqdNw7L4NYCASg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in adu_disconnect
To:     Johan Hovold <johan@kernel.org>
Cc:     syzbot <syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        dmg@turingmachine.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 11:21 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Sep 20, 2019 at 11:13:14AM +0200, Dmitry Vyukov wrote:
> > On Fri, Sep 20, 2019 at 11:08 AM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Fri, Aug 09, 2019 at 01:24:04PM -0700, syzbot wrote:
> > > > syzbot has found a reproducer for the following crash on:
> > > >
> > > > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=13871a4a600000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=0243cb250a51eeefb8cc
> > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c4c8e2600000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d80d2c600000
> > > >
> > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > Reported-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
> > > >
> > > > usb 1-1: USB disconnect, device number 4
> > > > ==================================================================
> > > > BUG: KASAN: use-after-free in atomic64_read
> > > > include/asm-generic/atomic-instrumented.h:836 [inline]
> > > > BUG: KASAN: use-after-free in atomic_long_read
> > > > include/asm-generic/atomic-long.h:28 [inline]
> > > > BUG: KASAN: use-after-free in __mutex_unlock_slowpath+0x96/0x670
> > > > kernel/locking/mutex.c:1211
> > > > Read of size 8 at addr ffff8881d1d0aa00 by task kworker/0:1/12
> > >
> > > Let's resend and retest with commit id from latest report to make sure
> > > the patch was actually applied during the last run:
> >
> > The reply contains:
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=1440268d600000
> > that's what's being parsed and applied during testing.
>
> Thanks for confirming, but I can't seem to find that link in the report
> from syzbot:
>
>         https://lkml.kernel.org/r/000000000000b05ce40592f8521a@google.com
>
> Is it supposed to be there?

I meant the previous one:
https://lore.kernel.org/linux-usb/000000000000d290e00592e5c17d@google.com/

The one that you pointed to indeed does not have a patch (was tested
without any patches). But you did not include any in the request, so
this WAI.
