Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D483411E379
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 13:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfLMMTb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 07:19:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41979 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfLMMTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 07:19:31 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so1483453pgk.8
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2019 04:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/X8xh/5wRKUlbfi3W05BcMuT4gtDIjyn7XzEfyev8c=;
        b=n8+J7e2cgU2HadBWYBXXEBPrKY7Otzj7Yq5KPBNQQFvTeW/0sD7uGruo5O2n52c9p9
         AEmMEDuioR5+x5HAmwDFvdvoRuAPcD5gKy7au0eBgvHtKqfPlW4O/knUDg6JSSKkEGKU
         lPgY7+KkhtTgx9CdXGCuObFh6qvkXa8XcRRRgMaKi+xz63gACrJOekH4h4Y+Hz1BIy65
         f+KwE67RrClO43DR2jAEh1nhwn/jNiVbE8BcGgwxuvfqKvHVYjnqE5lxlT4EePONHjv3
         Pdp6d0m6HTpvv/mcRpKUp+t6+k00Ue9+ppzqOhF0jypjyyv5nPPsih+vCSZ3B5wTwn8Z
         WFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/X8xh/5wRKUlbfi3W05BcMuT4gtDIjyn7XzEfyev8c=;
        b=nhKX5lriSbzv8kS6VfR/IRwOQJsITHsguADMuuc0JFGSktplk9eY3DNNZpWCxHLXlv
         +9crRPU5aiuU0Iq5HI0LldXiCcfVIsrXhg/bptqJ6DU/cwHULHiuhJkzqUBHTLjKY+Qj
         umGk39emPpcfOzstP3b2RGaaBdq9/zE2JzQXKK97tXx75Id2oahGvdqeJFXs4tg2Hxf5
         GSqIuZExo3Er8aIfAHrRYq90V8rfqto/oD3AvsFcx0J4gx7ISSbEKd5dpacZlZcy2eYz
         x09y+LeGN8o7nqp6gqlDmIHLz74sZYqxHIPb7DMW3bz+MnHN1NdjCkUG6Q4eV7M9OXr5
         +5Ig==
X-Gm-Message-State: APjAAAVI7K7xK4yHBr+LFTMCzMLI/7p2OVVm+2Nawb3Lio9sOm8gGp7A
        7vuoMgmLitkDv5BkjzuuzLE2YL+3+Xacwr+NYOZS0g==
X-Google-Smtp-Source: APXvYqx7s4jjP99Y5DwZEnhc/D/rb9PvIjnZ7SaMLaKjpN5PmJ/GJcspCC4VpgMCFyjT7C+XDZBopZ+gR10q471s07U=
X-Received: by 2002:a63:31d0:: with SMTP id x199mr16819942pgx.286.1576239568350;
 Fri, 13 Dec 2019 04:19:28 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+zTprgU-kp3cOL2S6Wo1tgqL-1sCkEi3Bb8o0BAG71y-A@mail.gmail.com>
 <0000000000006e704d059994d315@google.com>
In-Reply-To: <0000000000006e704d059994d315@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 13 Dec 2019 13:19:16 +0100
Message-ID: <CAAeHK+xSWEFUA7DQyhm90uiwggx60gYa8q7QqzOWp7DX_xWSWg@mail.gmail.com>
Subject: Re: Re: general protection fault in usb_set_interface
To:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, mans@mansr.com,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 13, 2019 at 1:16 PM syzbot
<syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com> wrote:
>
> > On Mon, Sep 16, 2019 at 3:29 PM syzbot
> > <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com> wrote:
>
> >> Hello,
>
> >> syzbot found the following crash on:
>
> >> HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> >> git tree:       https://github.com/google/kasan.git usb-fuzzer
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=158b66f1600000
> >> kernel config:
> >> https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> >> dashboard link:
> >> https://syzkaller.appspot.com/bug?extid=7fa38a608b1075dfd634
> >> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >> syz repro:
> >> https://syzkaller.appspot.com/x/repro.syz?x=14f57db9600000
> >> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127b61a5600000
>
> >> IMPORTANT: if you fix the bug, please add the following tag to the
> >> commit:
> >> Reported-by: syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com
>
> >> usb 3-1: usbvision_write_reg: failed: error -2
> >> usbvision_set_audio: can't write iopin register for audio switching
> >> kasan: CONFIG_KASAN_INLINE enabled
> >> kasan: GPF could be caused by NULL-ptr deref or user memory access
> >> general protection fault: 0000 [#1] SMP KASAN
> >> CPU: 1 PID: 1955 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> >> Google 01/01/2011
> >> RIP: 0010:usb_set_interface+0x34/0xa50 drivers/usb/core/message.c:1362
> >> Code: fc 55 53 48 83 ec 40 89 54 24 18 89 74 24 10 e8 22 1c ef fd 49 8d
> >> 7c
> >> 24 48 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f
> >> 85 fb 08 00 00 49 8b 44 24 48 49 8d 7c 24 18 48 89
> >> RSP: 0018:ffff8881cb19fd50 EFLAGS: 00010206
> >> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
> >> RDX: 0000000000000009 RSI: ffffffff834ebe7e RDI: 0000000000000048
> >> RBP: ffff8881cb8e4200 R08: ffffffff88d21878 R09: ffffed103971cb43
> >> R10: ffff8881cb19fdc8 R11: ffff8881cb8e5a17 R12: 0000000000000000
> >> R13: ffff8881cb8e5a10 R14: ffff8881cb8e4cc8 R15: ffff8881cb8e5178
> >> FS:  00007f4f60b6d700(0000) GS:ffff8881db300000(0000)
> >> knlGS:0000000000000000
> >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> CR2: 00007f4f6060c330 CR3: 00000001cc3a8000 CR4: 00000000001406e0
> >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >> Call Trace:
> >>    usbvision_radio_close+0x105/0x250
> >> drivers/media/usb/usbvision/usbvision-video.c:1114
> >>    v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
> >>    __fput+0x2d7/0x840 fs/file_table.c:280
> >>    task_work_run+0x13f/0x1c0 kernel/task_work.c:113
> >>    tracehook_notify_resume include/linux/tracehook.h:188 [inline]
> >>    exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
> >>    prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
> >>    syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
> >>    do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
> >>    entry_SYSCALL_64_after_hwframe+0x49/0xbe
> >> RIP: 0033:0x7f4f6069b2b0
> >> Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8
> >> c0
> >> 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff
> >> ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
> >> RSP: 002b:00007ffde2d50ee8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> >> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007f4f6069b2b0
> >> RDX: 00007f4f60951df0 RSI: 0000000000000001 RDI: 0000000000000003
> >> RBP: 0000000000000000 R08: 00007f4f60951df0 R09: 000000000000000a
> >> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
> >> R13: 00007ffde2d51040 R14: 0000000000000000 R15: 0000000000000000
> >> Modules linked in:
> >> ---[ end trace 62bd2b7512ab49ee ]---
> >> RIP: 0010:usb_set_interface+0x34/0xa50 drivers/usb/core/message.c:1362
> >> Code: fc 55 53 48 83 ec 40 89 54 24 18 89 74 24 10 e8 22 1c ef fd 49 8d
> >> 7c
> >> 24 48 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f
> >> 85 fb 08 00 00 49 8b 44 24 48 49 8d 7c 24 18 48 89
> >> RSP: 0018:ffff8881cb19fd50 EFLAGS: 00010206
> >> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
> >> RDX: 0000000000000009 RSI: ffffffff834ebe7e RDI: 0000000000000048
> >> RBP: ffff8881cb8e4200 R08: ffffffff88d21878 R09: ffffed103971cb43
> >> R10: ffff8881cb19fdc8 R11: ffff8881cb8e5a17 R12: 0000000000000000
> >> R13: ffff8881cb8e5a10 R14: ffff8881cb8e4cc8 R15: ffff8881cb8e5178
> >> FS:  00007f4f60b6d700(0000) GS:ffff8881db300000(0000)
> >> knlGS:0000000000000000
> >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> CR2: 00007f4f6060c330 CR3: 00000001cc3a8000 CR4: 00000000001406e0
> >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
>
> >> ---
> >> This bug is generated by a bot. It may contain errors.
> >> See https://goo.gl/tpsmEJ for more information about syzbot.
> >> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> >> syzbot will keep track of this bug report. See:
> >> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >> syzbot can test patches for this bug, for details see:
> >> https://goo.gl/tpsmEJ#testing-patches
>
> > Let's retry here:
>
> > #syz test: https://github.com/google/kasan.git f0df5c1b
>
> This bug is already marked as fixed. No point in testing.
>

Hm, that explains some of the weirdness. It doesn't explain though
neither why the patch was actually tested when Alan requested it nor
why syzbot sent no reply.
