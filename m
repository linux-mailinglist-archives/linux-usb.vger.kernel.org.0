Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AE0B80A9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 20:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732777AbfISSTJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 14:19:09 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:53184 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732725AbfISSTI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 14:19:08 -0400
Received: by mail-io1-f72.google.com with SMTP id g8so6392114iop.19
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 11:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=JfKcBn0cR0MfembtRy5n0SUZ8Hi2w3rap8IaW0AEMEQ=;
        b=DfhjBZ86eS3qQQIKrfnN70Jtw6AP230UmV1uTKr2p7KsCzoUli+g4bliaDP2OUW3xU
         dbbXTyS5CngpJYnZ0g8YC/SS1EUOmdkgz6RyvLzuOOjTXMzQklrzSbmeSj9xuItSg61P
         UklwuzRXZ0VhnLTzYEqLjUivwbXejqHi86OJFll47dNM/ALY2wLZg6jC6TPfvwiHctfo
         ryav4DNt1I9qHByqGV8B9yyPXQW852kSaCw3BybVSA4wWbSvFyqwuw39bOODmjlFqOpx
         ncGhTTFe8KIAP7n6QTYAvY76IilvcVNM2zyf+qQ7I6AbGe+Aq5LKP0mDvK2d3l61/rvF
         2mtA==
X-Gm-Message-State: APjAAAX04dbiBJreIduzUI2cXL0uJHdRaDafv810cpBYvRCEpwgutT96
        wGsyEqVX+NwqxDiNL2/g+fcnsPxSoGJ+KPqW+cfkz7jYnXuD
X-Google-Smtp-Source: APXvYqwaS+Diwo+Ns0zsC0vB0wyfuRi4nbdAYs7IHnC9/RPCwC4+VLTu9H9JZFIMoRaFXukTZjsmvmcJNug9JDf8Xu+EuuDOAzax
MIME-Version: 1.0
X-Received: by 2002:a05:6638:738:: with SMTP id j24mr14132724jad.74.1568917147868;
 Thu, 19 Sep 2019 11:19:07 -0700 (PDT)
Date:   Thu, 19 Sep 2019 11:19:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047e8e70592ebfd00@google.com>
Subject: general protection fault in close_rio
From:   syzbot <syzbot+ffb8ab77a232a91eb24d@syzkaller.appspotmail.com>
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

HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10c403c9600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=ffb8ab77a232a91eb24d
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ffb8ab77a232a91eb24d@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 18871 Comm: syz-executor.4 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:dev_name include/linux/device.h:1342 [inline]
RIP: 0010:__dev_printk+0x3a/0x203 drivers/base/core.c:3335
Code: 89 f5 53 e8 6f ab d1 fe 48 85 ed 0f 84 bc 01 00 00 e8 61 ab d1 fe 48  
8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74  
05 e8 12 62 f8 fe 4c 8b 7d 50 4d 85 ff 75 27 e8 34
RSP: 0018:ffff8881d5fe7cf8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffed103abfcfa6 RCX: ffffffff8388846d
RDX: 000000000000001e RSI: ffffffff826c929f RDI: 00000000000000f0
RBP: 00000000000000a0 R08: ffff8881b2c7b000 R09: fffffbfff0e586ed
R10: ffff8881d5fe7e28 R11: ffffffff872c3767 R12: ffffffff85f2b0e0
R13: ffff8881d5fe7d50 R14: ffff8881ca3eaa08 R15: ffffffff83888440
FS:  0000555556264940(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e82d000 CR3: 00000001caefb000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  _dev_info+0xd7/0x109 drivers/base/core.c:3381
  close_rio.cold+0x1f/0x24 drivers/usb/misc/rio500.c:96
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4135d1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffe720c0770 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000006 RCX: 00000000004135d1
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 0000000000000001 R08: ffffffff81160fc4 R09: 000000004679f032
R10: 00007ffe720c0850 R11: 0000000000000293 R12: 000000000075c9a0
R13: 000000000075c9a0 R14: 0000000000760ec0 R15: 000000000075bfd4
Modules linked in:
---[ end trace a70ef99560251cf4 ]---
RIP: 0010:dev_name include/linux/device.h:1342 [inline]
RIP: 0010:__dev_printk+0x3a/0x203 drivers/base/core.c:3335
Code: 89 f5 53 e8 6f ab d1 fe 48 85 ed 0f 84 bc 01 00 00 e8 61 ab d1 fe 48  
8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74  
05 e8 12 62 f8 fe 4c 8b 7d 50 4d 85 ff 75 27 e8 34
RSP: 0018:ffff8881d5fe7cf8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffed103abfcfa6 RCX: ffffffff8388846d
RDX: 000000000000001e RSI: ffffffff826c929f RDI: 00000000000000f0
RBP: 00000000000000a0 R08: ffff8881b2c7b000 R09: fffffbfff0e586ed
R10: ffff8881d5fe7e28 R11: ffffffff872c3767 R12: ffffffff85f2b0e0
R13: ffff8881d5fe7d50 R14: ffff8881ca3eaa08 R15: ffffffff83888440
FS:  0000555556264940(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e82d000 CR3: 00000001caefb000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
