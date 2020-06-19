Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129A72005F1
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 12:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732302AbgFSKDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 06:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732173AbgFSKDc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 06:03:32 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A15C0613EE
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 03:03:32 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id r22so6878925qke.13
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8DYaPsmppM0sgbh+UYRCRa1mxzMOQySNgQhc+XtzMY=;
        b=LhYLDWTFV8stciw/4NPHZwh1ChTNSwDuGBQLbq6uVdi9h2RmqVx0ESCMP/YYzNzXFh
         /tKk+aFKH5JZPLjf+rwRO4YCzec0IKB6Hw1LSrs2GPsq4a7g0en0I68/Rfs4smALoEGY
         CB6vzHXv0BBLeYsCgayECZecaRK2Uakyi6Fkvmb8doALibxn6k4zv1sDdba4Y2zc5qF/
         kBm1hiWuzpm6/mdive/8mNYQrrWPB6TtoR7W2obK7Dpxxh3wnDRyux31zuwrbSDHZGwo
         KWezgyb9WvcLQVE03DHphU/AhZLxoaTGd7Rtr4H4RP8NDP7fBM4JMm7zmBlxkt3aTgsM
         VIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8DYaPsmppM0sgbh+UYRCRa1mxzMOQySNgQhc+XtzMY=;
        b=YXcARfrQPt22Mh1enrAhGWMUNKGCSonTdrsAS7t+8nvZqO00YoGwmCPUOSyO2I9niz
         mP/TIo7rn5RDhjEpKjJTKM2tJ9we+SctzmXLlFKmvyoXEJSpl1ormPaVlt9H7rcgarMb
         wn2XH9YIpcX+jBUclLqbNu+ON/QZ+r+kQBFdBmFQWE+SVbV6jPVfAEclIot0cxU5om9R
         RMus+HrP0qh0Hf+daQBJNH5IXhfNbqQD+Ah/uR11DGF4GqtcvScNx7sE1jv2L3Zytz32
         wQqkt1M+7/Gbp6U+tmeQd/icQ1YciVmZJDCqdE8HHx5CXNzRrk97ei4VnkAVVxfZENxA
         nGMA==
X-Gm-Message-State: AOAM531wXYwRE3iXZWVO49WgsFGsLMDsGabHTUcKzWsoIFPiBFU7ZtBJ
        yt3oMgB6oszMrsim+DpE40HskKJ4Tvb6KQrwxxCP2A==
X-Google-Smtp-Source: ABdhPJxifGE3fnyRBfGTNL6pkICqzSciyH5HGqR77gMyCCQPv/1kjs6tfGcjF4qZ3/SA0l02vWp+9xLA8PRpxCiJTh8=
X-Received: by 2002:a37:4851:: with SMTP id v78mr2548951qka.256.1592561011729;
 Fri, 19 Jun 2020 03:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000004a76305a8624d22@google.com> <20200619095342.GT576905@hirez.programming.kicks-ass.net>
In-Reply-To: <20200619095342.GT576905@hirez.programming.kicks-ass.net>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 19 Jun 2020 12:03:20 +0200
Message-ID: <CACT4Y+aWkGTGXB+h1Hp1yxmrTBRDn1r4YHSQ6-SUK4SHn9serQ@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in is_dynamic_key
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     syzbot <syzbot+42bc0d31b9a21faebdf8@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Borislav Petkov <bp@alien8.de>, devel@etsukata.com,
        "H. Peter Anvin" <hpa@zytor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 11:53 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jun 18, 2020 at 02:17:15PM -0700, syzbot wrote:
>
> > INFO: trying to register non-static key.
> > the code is fine but needs lockdep annotation.
> > turning off the locking correctness validator.
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  <IRQ>
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0xf6/0x16e lib/dump_stack.c:118
> >  assign_lock_key kernel/locking/lockdep.c:894 [inline]
> >  register_lock_class+0x1442/0x17e0 kernel/locking/lockdep.c:1206
> >  arch_stack_walk+0x81/0xf0 arch/x86/kernel/stacktrace.c:25
> >  lock_downgrade+0x720/0x720 kernel/locking/lockdep.c:4624
> >  is_dynamic_key+0x1b0/0x1b0 kernel/locking/lockdep.c:1176
> >  trace_hardirqs_off+0x50/0x1f0 kernel/trace/trace_preemptirq.c:83
> >  __lock_acquire+0x101/0x6270 kernel/locking/lockdep.c:4259
> >  save_stack+0x32/0x40 mm/kasan/common.c:50
>
> So I'm thinking this is in fact:
>
>         spin_lock_irqsave(&depot_lock, flags);
>
> from lib/stackdepot.c:stack_depot_save(), which has gone missing from
> the stack due to tail-call optimizations.
>
> Now depot_lock is declared thusly:
>
>   static DEFINE_SPINLOCK(depot_lock);
>
> and I'm trying to figure out how lockdep manages to conclude that isn't
> static storage.... most odd.

Note there also was something wrong with the unwinder:
https://syzkaller.appspot.com/x/log.txt?x=13f305a9100000
(or with something else in the kernel), so potentially it did not
happen save_stack.

In fact, Andrey just reverted this parsing of questionable frames in syzkaller:
https://github.com/google/syzkaller/commit/4d2d1ebee3b65c404576d1c8573a0ec48b03b883
(was done because of what turned out to be ORC unwinder bug, which was fixed).

So potentially we just need to close this is invalid now.
