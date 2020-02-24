Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB9216AB19
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 17:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgBXQOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 11:14:40 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43405 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgBXQOj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 11:14:39 -0500
Received: by mail-pl1-f195.google.com with SMTP id p11so4237500plq.10
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 08:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UNCPDhY2rBi3SKiGAc64x5UFQgTRx5e56yo7dkev/24=;
        b=sJmbsmwR6bcWllqxgVn8BygS5XA3EAIPcJNmFUi4aLASR48L3gS37YAJa9jF1vytX9
         OCz/nm3XPUlz/n3DALojC2+gw/TM6lUuQJ/qObnvHaiylbmkEENUg3vvvjslVka9aeeN
         FDoGZgMzPDaoIRbZxt0KK+M8YjFTBIStk+b+42cyMnSPHEeftqPlqBMGiX1IBbTwoxwy
         QAYUe7cKpHc5odKqaJ28LkMk0CisrmO8PAxU/do7mAfOnBZT2p72DSdeQqbkrS2frH3U
         S1I+RCw/WlxAg73158fyqFbzBYwzL1Bkt4v183osjbcgOMux4R0Tn3jolfbtIsL1B18k
         orTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UNCPDhY2rBi3SKiGAc64x5UFQgTRx5e56yo7dkev/24=;
        b=k/trAzvPb4zOy+vZmoPDN1E3Y6USwx68irBvZjbCpoxF7e4hm6Or0L8w89FBMoqJ2L
         GFG/GyNUtmZOsxEeTvxaOG1cZRRHqmUTf1qAzO5cc76fpESvQLDj/1EI73RLV4eyajKW
         C5PuMmwSgvXcrZmy6ArQVvLWFMOFiuYayN5KDnJM3HKYA6/0aRN2CQWMccVo4GLBiZTv
         +ZtY2kBIIpwvfE2ydVzxKc0OzrJ0hmsD01Hotuj5+pBJUm7YsTUKPTD+upEaPKPziVZL
         FsRjI6uPiyyiEM8fdQWWZZ3pXvlqnkVzR+WvW4MeQUbWQrMji3b8gqN066DivES5zdfz
         RUOQ==
X-Gm-Message-State: APjAAAWE1Mmum3BDkNpwKNI5xKxWD6aldJzVPxhf0v3fNqWd9nmjVYUu
        UGqeI30+4Ak3/4ux5SFBJXewoQulU3WY/kU8lmYeXg==
X-Google-Smtp-Source: APXvYqwEO19ym1rQgbvAzn0qCjC/bIx9lh8iZOfduzyeDaY/Z2z0u8K18I3iutG4FujiM2k8vObhxg8pTrzBn9i5TMY=
X-Received: by 2002:a17:902:8486:: with SMTP id c6mr52636096plo.147.1582560878971;
 Mon, 24 Feb 2020 08:14:38 -0800 (PST)
MIME-Version: 1.0
References: <000000000000058a87059f1882b9@google.com> <Pine.LNX.4.44L0.2002211138300.1488-100000@iolanthe.rowland.org>
 <CAAeHK+yGS+wj5ovxu5P2Wyc=hgcmwEgK8LJ62+_T25vv8JOaOA@mail.gmail.com> <CAAeHK+wdVKrmQq1aDqJALMmCUAWfDuz4LT0pm4cYJpH_MfSO+w@mail.gmail.com>
In-Reply-To: <CAAeHK+wdVKrmQq1aDqJALMmCUAWfDuz4LT0pm4cYJpH_MfSO+w@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 24 Feb 2020 17:14:28 +0100
Message-ID: <CAAeHK+zMNKSUo4PoJLRaHcGRx66890HBkSET_NA5o8rwcTbZag@mail.gmail.com>
Subject: Re: WARNING in dummy_free_request
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+55ae006e0a1feae5aeab@syzkaller.appspotmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 24, 2020 at 4:48 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Feb 21, 2020 at 7:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Fri, Feb 21, 2020 at 5:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, 21 Feb 2020, syzbot wrote:
> > >
> > > > Hello,
> > > >
> > > > syzbot found the following crash on:
> > > >
> > > > HEAD commit:    7f0cd6c7 usb: gadget: add raw-gadget interface
> > > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=17b58e5ee00000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=f10b12ae04e03319
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=55ae006e0a1feae5aeab
> > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > >
> > > > Unfortunately, I don't have any reproducer for this crash yet.
> > > >
> > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > Reported-by: syzbot+55ae006e0a1feae5aeab@syzkaller.appspotmail.com
> > > >
> > > > ------------[ cut here ]------------
> > > > WARNING: CPU: 1 PID: 19332 at drivers/usb/gadget/udc/dummy_hcd.c:679 dummy_free_request+0x6c/0x80 drivers/usb/gadget/udc/dummy_hcd.c:679
> > > > Kernel panic - not syncing: panic_on_warn set ...
> > > > CPU: 1 PID: 19332 Comm: syz-executor.5 Not tainted 5.6.0-rc1-syzkaller #0
> > > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > > Call Trace:
> > > >  __dump_stack lib/dump_stack.c:77 [inline]
> > > >  dump_stack+0xef/0x16e lib/dump_stack.c:118
> > > >  panic+0x2aa/0x6e1 kernel/panic.c:221
> > > >  __warn.cold+0x2f/0x30 kernel/panic.c:582
> > > >  report_bug+0x27b/0x2f0 lib/bug.c:195
> > > >  fixup_bug arch/x86/kernel/traps.c:174 [inline]
> > > >  fixup_bug arch/x86/kernel/traps.c:169 [inline]
> > > >  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
> > > >  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
> > > >  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
> > > > RIP: 0010:dummy_free_request+0x6c/0x80 drivers/usb/gadget/udc/dummy_hcd.c:679
> > > > Code: c5 75 22 e8 26 06 96 fd 48 89 ef e8 3e 54 be fd 5b 5d e9 17 06 96 fd e8 12 06 96 fd 0f 0b 5b 5d e9 09 06 96 fd e8 04 06 96 fd <0f> 0b eb d5 48 89 ef e8 08 ae be fd eb c2 66 0f 1f 44 00 00 41 56
> > > > RSP: 0018:ffff8881c9eafdd8 EFLAGS: 00010016
> > > > RAX: 0000000000040000 RBX: ffff8881d0d5aa10 RCX: ffffc900012a0000
> > > > RDX: 000000000000012f RSI: ffffffff83a95c1c RDI: ffff8881d4d501c8
> > > > RBP: ffff8881d0d5aa00 R08: ffff8881d0f9b100 R09: ffffed103b666a84
> > > > R10: ffffed103b666a83 R11: ffff8881db33541b R12: 0000000000000212
> > > > R13: ffff8881ca832008 R14: 0000000000000000 R15: ffff8881ca832180
> > > >  raw_ioctl_ep_disable drivers/usb/gadget/legacy/raw_gadget.c:814 [inline]
> > > >  raw_ioctl+0x1281/0x19e0 drivers/usb/gadget/legacy/raw_gadget.c:1031
> > >
> > > Andrey:
> > >
> > > This could be a bug in your raw_gadget driver.  This particular WARN is
> > > triggered when a gadget driver tries to call usb_ep_free_request() for
> > > a request that is still in flight.
> >
> > Hi Alan,
> >
> > It might. It's not obvious what's wrong though. raw_ioctl_ep_disable()
> > calls usb_ep_disable()->dummy_disable() first, that supposedly does
> > list_del_init(&req->queue). And then it calls
> > usb_ep_free_request()->dummy_free_request(), which for some reason
> > still causes the warning. And a racy queueing of another request
> > should be prevented by the disabling flag.
> >
> > I'll take a closer look on Monday.
>
> OK, I see the issue, will post v6 with a fix soon.

#syz invalid
