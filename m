Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1864814EB9C
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 12:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgAaLTx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 06:19:53 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44609 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgAaLTw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 06:19:52 -0500
Received: by mail-qt1-f196.google.com with SMTP id w8so5055068qts.11
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JuxQ2IVVlVoLuO0eTjuowA3+M+OiUgmRfbBJD8WPsXU=;
        b=CZuh6loLgjkzh89KA1WQODtu2dgyG+3HcB10oQnaaw6A2Qlc0ATkZZ26LiFytGggi4
         ku/hYC3dIf76kFN3E8bfDc0XcDFwaJpVNEP4IWlsBRTVwpv1p73S8BV26eo/ZY0CCndu
         pxY2zvVjoJlCcSZ9q8BYrOa/EewBQeLSIUG2TqGk3qEWxGAK+3d7gDP5+FRgGkKW71N5
         acFI5wPH/785+cRvsGkS9N/eVUlShY8alu4BjVhhh/AcjcLD9/8t1UpJAJG5xvTKLe//
         XNK5THLSPoCMXQ9z5DsywsLhnj62JDs6Ast7wmmKmnmFjENQqTDPCShyiKnfJlgcsiiy
         Hrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JuxQ2IVVlVoLuO0eTjuowA3+M+OiUgmRfbBJD8WPsXU=;
        b=es8+nAA/tDe077dmYf9H3BtrFFv1NJ/rp6hV7qgnIcaFPm2QNNrE0p0Q30Pr7kAlnR
         WyV1Wrl+mh2a3ld+9M97kUAW9F4tMhPGYd4rPckQgYEZ46lHjPWaC5yLkcmvMcLKyHx9
         jyA4BILr1N8j9xcpKuw8X7pGKg9iyZ53PIokn+9A6Qwx4IjcNTdvwpx2YPrCLvXPuMQH
         qGeguA6YsWOlrAn/EB72YnA958YIuMHytsrdhqEi6spc3bWeqzZIh57fSqKpaygERzle
         vtKPEBhCV7P9sPS5foKbfls4hnzQSYUhQf/5znyNsgz9Q4aEa+yd7vGc3NRL4JSMcaOO
         BfAw==
X-Gm-Message-State: APjAAAUqL6anWZKdRisVE7PTgzq8qWnyGWMgcOEy2zj1kmBw5UZ+TCwa
        Z1SmOJGh2L2npGb6BHLZhpmEcX3hLg6b2Uoom87ywA==
X-Google-Smtp-Source: APXvYqykzjqCqULFjWHyCxcAvAnl56/gS8zskpQw2A9JB9vK277HVECFwHo3bHmrXozamp68YQRK+x92sZ4kLEImwC0=
X-Received: by 2002:ac8:1b18:: with SMTP id y24mr10047527qtj.158.1580469590962;
 Fri, 31 Jan 2020 03:19:50 -0800 (PST)
MIME-Version: 1.0
References: <00000000000095e1d8059d4675ac@google.com> <20200131090510.7112-1-hdanton@sina.com>
 <20200131101644.GE11068@kadam>
In-Reply-To: <20200131101644.GE11068@kadam>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 31 Jan 2020 12:19:39 +0100
Message-ID: <CACT4Y+YmUBUzZQNrHZtCV-LDxvmgoJtaoPYYP9OgRpAa59qF-g@mail.gmail.com>
Subject: Re: [PATCH] usb: core: urb: change a dev_WARN() to dev_err() for syzbot
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        syzkaller <syzkaller@googlegroups.com>,
        Eric Dumazet <edumazet@google.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Hillf Danton <hdanton@sina.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        ingrassia@epigenesys.com, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 31, 2020 at 11:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jan 31, 2020 at 05:05:10PM +0800, Hillf Danton wrote:
> >
> > On Fri, 31 Jan 2020 08:06:52 +0300 Dan Carpenter wrote:
> > > We changed this from dev_err() to dev_WARN() in commit 0cb54a3e47cb
> > > ("USB: debugging code shouldn't alter control flow").
> > >
> > > The difference between dev_WARN() and dev_err() is that dev_WARN()
> > > prints a stack trace and if you have panic on OOPS enabled then it leads
> > > to a panic.  The dev_err() function just prints the error message.
> > >
> > > Back in the day we didn't have usb emulators fuzz testing the kernel
> > > so dev_WARN() didn't cause a problem for anyone, but these days the
> >
> > Another free option is perhaps to keep the devoted bot agile if it's
> > difficult to list anybody who was mauled by its articulate reports.
>
> It's difficult to parse this email.  I get that you're being sarcastic
> but I can't tell what you're being sarcastic about.  :P
>
> I think you're basically saying that syzbot should maintain a white
> list of ignored Oopses.  There are two problems with this:  1) Other
> people run syzbot so everyone has to run into this bug and then add it
> to their own white list.  2)  If the kernel OOpes here then we cannot
> test what happens next so it could be hiding bugs.
>
> One idea is that there could be a kernel function which generates a
> stack trace but is not an Oops.

Yes, this is needed for any kernel testing: not just syzbot, and not
just syzkaller, and not just fuzzing, literally for any kernel
testing.

We need a way to easily distinguish between kernel bugs and not bugs
in a black-and-white manner. Otherwise, of practical options testing
systems can either ignore lots of kernel bugs during testing
(unfortunately I see this happening, if it does not panic the system,
it's being ignored); or attach a human expert in each system to read
logs of each test run to sort kernel messages into bugs and non-bugs.
Both of these are not good options.

This is not about stack traces. There is already a function that does
this (print_stack() or something), and it's fine to print stacks (if
necessary, it produces lots of output so should not be taken lightly).
The way syzkaller detects these now is by "WARNING:" prefix.

This is also not about the exact way these are spelled out. We could
make "WARNING:" mean an invalid user input and use something else for
kernel bugs. But it just seems that WARNING===kernel bug is a really
good starting point (lots of debugging tools use it). Especially
taking into account the general recommendation of "don't panic kernel
if it can proceed", as the result lots of BUGs (in the sense that
these are kernel bugs) were turned into WARNINGs (or written out as
WARNINGs initially). Otherwise BUG would be a good marking for bugs,
except that it's not recommended to use in most cases.

I see lots of people also mention panic_on_warn in the context of
these reports. panic_on_warn here is only a red herring. It really
does not change anything. We could remove it, but still report
WARNINGs. But syzkaller also reports some things that don't panic
anyway. This is really about the criteria for kernel bug vs non-bug
(something that needs to be reported or not).

I would assume this criteria is also important for kernel developers
(people reading/writing code), especially for new subsystems. If I see
a WARNING in code (or just any kind of assertion), it's useful to know
whether it's something that can't happen under any circumstances and
if it happens it's really a serious logical flow somewhere; versus
just invalid input/rare/unexpected runtime condition. The first
category can be used as a basis for building my understanding of the
code. Not being able to understand type of assertion confuses you both
ways: if you think it's something that can't happen but at the same
time you see a way it can be violated, you question your understanding
of the code. Or the other way around, you are trying to figure out the
way how condition can become true, but you can only conclude that it's
always false, you also question your understanding of the code.

There were proposals to add a parallel set of macros, say, NOTICE
(name is obviously discussable). That would print something different
from WARNING: and optionally with a stack trace. Maybe also a parallel
set of _once and _ratelimited versions (esp since these can be
triggered). These would very unambiguously mean "this can be triggered
by users/devices; on low-memory, etc". But there was not enough
interest at the time and the discussion quickly died. Maybe it's time
to revive it.
You can imagine some value-added features on top: e.g. command
line/sysctl option to disable that output entirely, or reduce it to 1
line (no stack), if there are too many of these (we know these can be
triggered!), or if nobody is simply looking for them anyway (true for
most users).

+Eric, Steve, who got these WARNING-not-a-kernel-bug reports recently too
