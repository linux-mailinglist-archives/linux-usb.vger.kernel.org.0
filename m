Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24735980EC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 19:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbfHURCN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 13:02:13 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32862 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbfHURCM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 13:02:12 -0400
Received: by mail-pl1-f194.google.com with SMTP id go14so1656104plb.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJ36s1T0jnvqQERpixZKelYrvGY6b1bz0sqK6PkmcpI=;
        b=RS9HWexqDCmjf0CFSr4AoEpAAojNC6eJVXGECcoGklbLcjbR2149Ex+k6fX++RMwZ8
         QF8+o66F7sl13xBQht9dGb8icMY6Q4WtYfIGlzOprEj5d9ny0bmmeQI+TO/xpkNmoTvI
         jB95BYtsSFPpzhjzc+9Fgp3uOfwFhytO8mkEnV9HTH3A6vDlpBykeJngHXSLrsYZe2uB
         a7M/J4XPjISTTdE5bxpAp2XhmvlfJbVevd0MET7Qj0H8t8dqMBO2cBoadSyM7sc5Bpjt
         UoJBNXUD3Pdww4o13XnKXmCR0aRLvThDMHoRrEDSXGvBgenA0tRWUyoYa41bCpEY2jD8
         KBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJ36s1T0jnvqQERpixZKelYrvGY6b1bz0sqK6PkmcpI=;
        b=J/13cVVTU2MG8ylIzs1I15+UPstbjvvS1PxPnU8qW/5IYoGzq7zfU/aaphGIMjQzM2
         8DCnddosEwSw+PjIX0dsFchudGpt4CW5NHOHbVzwvMPQ8T9l+FpaaM9WZL4LiPBltd/Z
         Cu28hZ5kK6z5VEyS55A+fEXUyKDnoQbnWnLzZGEl5Suf/RfybpWnQOOuEMb/X3RvZH+Q
         DYbqYaZmGKeJGiHos0Dq/mS5XzEP6OxLOBJqGuYbwhWivVtPZ0+NRQkjKI+1MXsdovxH
         oDGn2oWhiCurcsFx+AQmc2MPhq5gcNqKVFpnz8BAcPHDatSmJ31RuV3kyBjrU4oUgq1b
         zeHQ==
X-Gm-Message-State: APjAAAUQVwEEHUu68YZjgk+l5nZWEBNyv7AkiWuXpblppmtwIZI7kCJ+
        +Oquq0v4n+f8gX8CCy40QnRROpZ4BP0QZhi+GZX/oQ==
X-Google-Smtp-Source: APXvYqzETicEqvBR6WzqqgBWQW1/FscsUxWIVurvsqgxvQzgid8JXBviHr0c1vdkpmul99j7RQPMURJdOmmU7UgrHhY=
X-Received: by 2002:a17:902:ab96:: with SMTP id f22mr35680272plr.147.1566406931446;
 Wed, 21 Aug 2019 10:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000da6cf8058f87bfde@google.com>
In-Reply-To: <000000000000da6cf8058f87bfde@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 19:02:00 +0200
Message-ID: <CAAeHK+wv5RNY1G9ZUYjV50yWQZm6sD1GFsP7H90iXkkTae=8tw@mail.gmail.com>
Subject: Re: WARNING in hiddev_ioctl/usb_submit_urb
To:     syzbot <syzbot+5ef817fc02cd64d038a3@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 7, 2019 at 4:28 PM syzbot
<syzbot+5ef817fc02cd64d038a3@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=14f54e26600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=5ef817fc02cd64d038a3
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+5ef817fc02cd64d038a3@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> usb 4-1: BOGUS urb xfer, pipe 2 != type 2
> WARNING: CPU: 0 PID: 7794 at drivers/usb/core/urb.c:477
> usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 0 PID: 7794 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #25
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   panic+0x2a3/0x6da kernel/panic.c:219
>   __warn.cold+0x20/0x4a kernel/panic.c:576
>   report_bug+0x262/0x2a0 lib/bug.c:186
>   fixup_bug arch/x86/kernel/traps.c:179 [inline]
>   fixup_bug arch/x86/kernel/traps.c:174 [inline]
>   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
> RIP: 0010:usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
> Code: 4d 85 ed 74 2c e8 28 76 ed fd 4c 89 f7 e8 c0 6d 1a ff 41 89 d8 44 89
> e1 4c 89 ea 48 89 c6 48 c7 c7 60 e7 18 86 e8 3d 47 c3 fd <0f> 0b e9 20 f4
> ff ff e8 fc 75 ed fd 4c 89 f2 48 b8 00 00 00 00 00
> RSP: 0018:ffff8881b01178a0 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
> RDX: 000000000000549e RSI: ffffffff8128a0fd RDI: ffffed1036022f06
> RBP: 0000000000000000 R08: ffff8881cfd11800 R09: fffffbfff11acda9
> R10: fffffbfff11acda8 R11: ffffffff88d66d47 R12: 0000000000000002
> R13: ffff8881cd771828 R14: ffff8881c87e22a0 R15: ffff8881d3f1ac00
>   usb_start_wait_urb+0x108/0x2b0 drivers/usb/core/message.c:57
>   usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
>   usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
>   usb_get_string+0xac/0x1a0 drivers/usb/core/message.c:693
>   usb_string_sub+0x8b/0x3d0 drivers/usb/core/message.c:737
>   usb_string+0x32b/0x480 drivers/usb/core/message.c:836
>   hiddev_ioctl_string.isra.0+0xf5/0x1d0 drivers/hid/usbhid/hiddev.c:576
>   hiddev_ioctl+0x5b8/0x1550 drivers/hid/usbhid/hiddev.c:682
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x459829
> Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f8529fb1c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
> RDX: 00000000200001c0 RSI: 0000000081044804 RDI: 0000000000000004
> RBP: 000000000075c1c0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8529fb26d4
> R13: 00000000004c2249 R14: 00000000004d55f8 R15: 00000000ffffffff
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

Looks like the same bug:

#syz dup: general protection fault in __pm_runtime_resume
