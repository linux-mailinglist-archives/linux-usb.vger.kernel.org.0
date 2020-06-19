Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E5A2002C7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 09:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbgFSHfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 03:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgFSHfm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 03:35:42 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E561C06174E
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 00:35:42 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id r16so4025525qvm.6
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 00:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/QVsIo7vdI5nrnidTNBTw9fDsdx+LmCSq0aA9pEJ+Hw=;
        b=OjNoGqEThpZ14D6dW65mu1r/3BbDoLfceJW3AhJNJkGniqtrx4SHa191/YoBO3zzv3
         Yit54iY7uh8j5Fz32NYvZmHZ7oP36BSn8Qmo83+Bmbq73MaobK2V4E6szrvMIzT1+b2e
         cF5hfy/epr8ZTjb7JYoMJsmvMwFvtrhSyJLOpFGjdlVpIMPoyHY6gAQ5G7UcXQ+XuOkQ
         AS+mRaX2d2RNkziLIeK4+dJ2lho6xZKfoYLWspVHNywPjeJLzgALaDDQAk73RGSLrwGM
         Y0GJbNxJ83v5qGNeRRLq8D2312g+U+pYuFTZJL4rhoKoUcNpOzTpuInqxM7VryoLfvKk
         algg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/QVsIo7vdI5nrnidTNBTw9fDsdx+LmCSq0aA9pEJ+Hw=;
        b=h3uFCS/geRxCWkswIaiW1CivpK1uFjQcJeoPGPjuSjpBuxDeH+4YEVWIrWfNRpvMeI
         hK2erKI70xhnUOXbx1K6ywEmRj7eMCJLrJvNQlvD+jvdp14ewkppNVbvTWWyOoFZJrdu
         DeZMfldYWRON2NLZQ95v0Y9mvkRvcMHRuOa4hGSjQzmxPNRD+pBPSULep/bNDRcjG4WZ
         CmqZ9lW13pVs93BUsRkGX1cyLK/X1yaMDu3sYewpkDqRar5obKwj+troEcxzwxUjgqDd
         QNCp4UFncjprVNfhEQgI/0a6tZLW3HD7sc+Z5XxVYCAyDHiBM4+cBoi3pU0JSq3LjDJY
         gsVg==
X-Gm-Message-State: AOAM532Q8VVtpG9M6mUt0ArpAxt41RDMpwDvCqI4jXoLu2X+lo8dnl59
        z5sQvVQWyhwkZx5f4ZUxqnntlP/ldDU3qQortcFelA==
X-Google-Smtp-Source: ABdhPJyoRnMo+OvlO+KW1lDs//Lq6KD/mmkJQFVdqrH9wLhknIfgxoNtMdnIv3TZeR87OMxQCbFC3hcRdZfJHiHv3xk=
X-Received: by 2002:a05:6214:1342:: with SMTP id b2mr7654724qvw.80.1592552141501;
 Fri, 19 Jun 2020 00:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000004a76305a8624d22@google.com> <20200619070527.GA544353@kroah.com>
In-Reply-To: <20200619070527.GA544353@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 19 Jun 2020 09:35:30 +0200
Message-ID: <CACT4Y+YEYT17HH=vh9XtRi7uRiY=db6u-L0dRYs7msF1jNX5Xw@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in is_dynamic_key
To:     Greg KH <greg@kroah.com>, syzkaller <syzkaller@googlegroups.com>
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

On Fri, Jun 19, 2020 at 9:07 AM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Jun 18, 2020 at 02:17:15PM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    b791d1bd Merge tag 'locking-kcsan-2020-06-11' of git://git..
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13f305a9100000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=16c2467d4b6dbee2
> > dashboard link: https://syzkaller.appspot.com/bug?extid=42bc0d31b9a21faebdf8
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136ad566100000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10138f7a100000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+42bc0d31b9a21faebdf8@syzkaller.appspotmail.com
> >
> > INFO: trying to register non-static key.
> > the code is fine but needs lockdep annotation.
>
> Why is INFO: triggering syzbot?

This is a kernel bug, no?

And there are lots of other kernel bug types that start with INFO:
https://github.com/google/syzkaller/blob/master/pkg/report/linux.go#L1302

The rules to understand when linux kernel has bugged are insanely
complex in syzkaller:
https://github.com/google/syzkaller/blob/master/pkg/report/linux.go#L914-L1685
(+hundreds of hardcoded function names and file names above).
