Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF7DBCA03
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 16:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436912AbfIXOTJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 10:19:09 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:40421 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394680AbfIXOTI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 10:19:08 -0400
Received: by mail-io1-f71.google.com with SMTP id r20so3327093ioh.7
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 07:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=4WCI/8Wqn0NEN6qtZrVOjHXS2Epttr/1ag+Os3By8oI=;
        b=RmhtFdM11sZ+i4SQ6+pJvH7ZVqVCWwcDwm8pHsJ6mO/pQkF3Su/1wtuPSwoRA3+y3B
         Pk02npnfNuPpDwULYJKqNHQp/F77YxaIN090lJ/3k/HL7RRBuI3U2v+RLm0PbHFcsvVv
         1ox9L90mTSJmeeTh0VGOkaaGIo+LkY9Q9iKQ09Ox3ojhu4DUCuaZ2Ad1PJFt1bYf1vPl
         yDU78Vc/dcUZhMa3LF0cawLkCauEaH3AWQKu6XI1BreiH9JcCD8zuE5no+3u2eVqWvJo
         iOM2NWrWY6PU+9+HGj/1Lt6wY0lKybhQmnJd/S13Kdort1Z8xbcjxuoAwXw4dg0uQYhh
         Htvg==
X-Gm-Message-State: APjAAAVkDl1/Ca79qKCx9vGvsotVQ2l9YxNGwS7jEeQkIplh2m9GSbQD
        YfEofwT17NYyaBvfVbKLvffrXjgF+TCKglDN+pHe7Lu/gDCN
X-Google-Smtp-Source: APXvYqxZErJq8RgrHmQGUjIaf/b6OTC2jg8vElKXW7W12Jkd0R6WuMAunvOfzS3k8XX0fSys/sEII5d+/0roGa/NSaD4EqAB0iqo
MIME-Version: 1.0
X-Received: by 2002:a6b:5003:: with SMTP id e3mr3797485iob.208.1569334748047;
 Tue, 24 Sep 2019 07:19:08 -0700 (PDT)
Date:   Tue, 24 Sep 2019 07:19:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000030f35305934d3804@google.com>
Subject: general protection fault in open_rio
From:   syzbot <syzbot+dbd38fbb686a9681143a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d9e63adc usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1602b303600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4fa60e981ee8e6a
dashboard link: https://syzkaller.appspot.com/bug?extid=dbd38fbb686a9681143a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+dbd38fbb686a9681143a@syzkaller.appspotmail.com

usb 4-1: Rio opened.
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 1 PID: 6898 Comm: syz-executor.1 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:dev_name include/linux/device.h:1342 [inline]
RIP: 0010:__dev_printk+0x3a/0x203 drivers/base/core.c:3335
Code: 89 f5 53 e8 0f 01 d0 fe 48 85 ed 0f 84 bc 01 00 00 e8 01 01 d0 fe 48  
8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74  
05 e8 32 e7 f6 fe 4c 8b 7d 50 4d 85 ff 75 27 e8 d4
RSP: 0018:ffff8881cf697830 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffed1039ed2f0d RCX: ffffc900012d0000
RDX: 000000000000001e RSI: ffffffff826e3b9f RDI: 00000000000000f0
RBP: 00000000000000a0 R08: ffff8881cf37c800 R09: fffffbfff0e98bf9
R10: ffff8881cf697960 R11: ffffffff874c5fc7 R12: ffffffff85f2e160
R13: ffff8881cf697888 R14: ffff8881ca024528 R15: ffff8881ca024528
FS:  00007f175b8c8700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30627000 CR3: 00000001cbb1f000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  _dev_info+0xd7/0x109 drivers/base/core.c:3381
  open_rio drivers/usb/misc/rio500.c:75 [inline]
  open_rio+0xaa/0xc0 drivers/usb/misc/rio500.c:59
  usb_open+0x1df/0x270 drivers/usb/core/file.c:48
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3408 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3525
  do_filp_open+0x1a1/0x280 fs/namei.c:3555
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4138f1
Code: 75 14 b8 02 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 19 00 00 c3 48  
83 ec 08 e8 0a fa ff ff 48 89 04 24 b8 02 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fa ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007f175b8c77a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000004138f1
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007f175b8c77d0
RBP: 000000000075bf20 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000064 R11: 0000000000000293 R12: 00007f175b8c86d4
R13: 00000000004c8d40 R14: 00000000004dfe48 R15: 00000000ffffffff
Modules linked in:
---[ end trace 2b1b73a1ede24824 ]---
RIP: 0010:dev_name include/linux/device.h:1342 [inline]
RIP: 0010:__dev_printk+0x3a/0x203 drivers/base/core.c:3335
Code: 89 f5 53 e8 0f 01 d0 fe 48 85 ed 0f 84 bc 01 00 00 e8 01 01 d0 fe 48  
8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74  
05 e8 32 e7 f6 fe 4c 8b 7d 50 4d 85 ff 75 27 e8 d4
RSP: 0018:ffff8881cf697830 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffed1039ed2f0d RCX: ffffc900012d0000
RDX: 000000000000001e RSI: ffffffff826e3b9f RDI: 00000000000000f0
RBP: 00000000000000a0 R08: ffff8881cf37c800 R09: fffffbfff0e98bf9
R10: ffff8881cf697960 R11: ffffffff874c5fc7 R12: ffffffff85f2e160
R13: ffff8881cf697888 R14: ffff8881ca024528 R15: ffff8881ca024528
FS:  00007f175b8c8700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30627000 CR3: 00000001cbb1f000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
