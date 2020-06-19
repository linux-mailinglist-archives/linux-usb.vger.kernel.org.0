Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AF52004B7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 11:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729474AbgFSJMC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 05:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbgFSJMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 05:12:01 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0157AC06174E
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 02:12:00 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id z1so6673992qtn.2
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZm/Dv2gv2S4mPzi42PRb1N9Pqh4ZokOAGqo/pMNcMA=;
        b=VytsxRKTx0n7WLTWBi0Pmso7d51f00PbLG08PSFnHEm2kkBgQHlT0mJ1Z3QLYwuBt6
         Rs7+dGS0ZQuTt8+QUG9FqPxTkYrSEswwi6LmSrR7YsBhaZYvibheKJoftKvfJwuoxmiJ
         2YWCxSuYErTzU4+xr5/AKKXCQHehYgmEj7oSJb1LuBn5HoLKMw6yZvrns9E7tuA1uYLC
         xrMurefwWVVYhlgjJIwOrNG4/2pRsMzlu7TFGS0XWsQrOmxxrOI7C3fsnJtW5mAx6T5q
         e5/dMq4XqBY4MBYEVUpxNdV6e8vrKvosd6WgXReUSU/NseyrDMzyveUi+6+QteysIs0b
         rwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZm/Dv2gv2S4mPzi42PRb1N9Pqh4ZokOAGqo/pMNcMA=;
        b=njlKxyu0aUT+AmrpBlgN2O3fQR9htPsK7hHtvH/g2J6O9WgIoMkwjA+eDru/f2ixlG
         tZSOtt18jc2xWgjhXcRq1uJtAeN5KCZR3KDlyUgIbay6IMgBsg7SoP0V/iMWXbq6x4f2
         qO9VN+nNtx5IeY3kJAWyLwQBHs6lO29u7Dl3+PIopCHu70gfHl9INeOht8cRg/vZKLCf
         EOsc+fhUEGUtJCdl7u0ftsdy8xHoto2A5ewbwg1tLeCQCcDnkirm8Cfh9muTqus+qmz8
         dqY+MSKdWidNWTgfcY5pTUrsjYyYnBG288e33WI6iUrW28ACqPVs5epPyBV1dgim1QwK
         VRHg==
X-Gm-Message-State: AOAM532hmsr1n6XszrSwx2dP1M+T1tigz3J0zUXptEycjtME7x9cyelf
        4matEXy1KWl0Pvg4ndoB1yJMU6HGiTqwj9rpxUufXQ==
X-Google-Smtp-Source: ABdhPJySrprZSukJb40HvvDyyST2qfLDrpLeTDMYys4wdTg8X3DlyODHvYwiq+lFPqv78ttJ+tnc0Mmaiiw+wKGBLsE=
X-Received: by 2002:ac8:5541:: with SMTP id o1mr810061qtr.57.1592557918638;
 Fri, 19 Jun 2020 02:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000004a76305a8624d22@google.com> <20200619070527.GA544353@kroah.com>
 <CACT4Y+YEYT17HH=vh9XtRi7uRiY=db6u-L0dRYs7msF1jNX5Xw@mail.gmail.com> <20200619074700.GA8425@kroah.com>
In-Reply-To: <20200619074700.GA8425@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 19 Jun 2020 11:11:47 +0200
Message-ID: <CACT4Y+Yraydg=Ov1Ps0xVtGc1Xx69M+GKSmF0HZushjWHpabTg@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in is_dynamic_key
To:     Greg KH <greg@kroah.com>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        syzbot <syzbot+42bc0d31b9a21faebdf8@syzkaller.appspotmail.com>,
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

On Fri, Jun 19, 2020 at 10:31 AM Greg KH <greg@kroah.com> wrote:
>
> On Fri, Jun 19, 2020 at 09:35:30AM +0200, Dmitry Vyukov wrote:
> > On Fri, Jun 19, 2020 at 9:07 AM Greg KH <greg@kroah.com> wrote:
> > >
> > > On Thu, Jun 18, 2020 at 02:17:15PM -0700, syzbot wrote:
> > > > Hello,
> > > >
> > > > syzbot found the following crash on:
> > > >
> > > > HEAD commit:    b791d1bd Merge tag 'locking-kcsan-2020-06-11' of git://git..
> > > > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=13f305a9100000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=16c2467d4b6dbee2
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=42bc0d31b9a21faebdf8
> > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136ad566100000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10138f7a100000
> > > >
> > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > Reported-by: syzbot+42bc0d31b9a21faebdf8@syzkaller.appspotmail.com
> > > >
> > > > INFO: trying to register non-static key.
> > > > the code is fine but needs lockdep annotation.
> > >
> > > Why is INFO: triggering syzbot?
> >
> > This is a kernel bug, no?
> >
> > And there are lots of other kernel bug types that start with INFO:
> > https://github.com/google/syzkaller/blob/master/pkg/report/linux.go#L1302
> >
> > The rules to understand when linux kernel has bugged are insanely
> > complex in syzkaller:
> > https://github.com/google/syzkaller/blob/master/pkg/report/linux.go#L914-L1685
> > (+hundreds of hardcoded function names and file names above).
>
> I understand it's tough, but "the code is fine but needs lockdep
> annotation" feels like it's a "here's an improvement that you can make"
> type of report, not a "crash" like this message says.

Can you think of a single description that would be suitable for all
of these types of things?
I can change the wording in the static template right now. But finding
proper wording for all of these things, annotating them, updating 500
tests probably won't be high on anybody's priority list. Or do you
consider it important enough to contribute? ;)
