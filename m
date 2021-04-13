Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4763435D9A1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 10:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240812AbhDMIIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 04:08:47 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:53335 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239527AbhDMIIq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 04:08:46 -0400
Received: by mail-io1-f70.google.com with SMTP id p79so6467296iod.20
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 01:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Y/oDACJtgLinpTpc1ULu2CK8rCzMbC+DVtin1IyEpTA=;
        b=XuNoUxR6tgz2ujCJh/mItXxQJOYeZDbqhpyqZHtm3SAgBnrt4eX2Gn4pxUjS9xL6D/
         F/SgrKfhes6s42+Nn4KJhMIIXJJs/jSfr6Z43gwh3bqaTGibKg/7popBq0MU1x/PvqSI
         exC8XsSyMtuYIw20iQxFLROwgzWagA++jYa51eBpVTVMmG8Xv8K+qHYVDvIoyU01/wME
         kPiUsHoyGo6OWS1W3CroXB3QhDGNzItM1oDBS1UPLEbkTd5u1zJqplQvAHOljHLVIUyj
         5O2ioAML4pImir1urK4cCMZHHKBDP5Xv8qcoi9aWVIBcFIv2OaBst+3xBojs2deGkc8f
         yqUQ==
X-Gm-Message-State: AOAM531V9/fZOMRAtVVBLJOsw6QkrhzKEBmcZYPZzShvr663yVVxZri+
        eUz+AeGvmj+EouNRvtpqW5DrkSw0MiRqgnEfrAQ+A6ByeaXE
X-Google-Smtp-Source: ABdhPJyk8tvo/hpIfraWlryo6+YOX+fsTD8hAmNjGaTBrqniv2eUUTI+KoZGA2vA0h/He0fkX08RQ5QnkvOIeeqF+f+B8laIqg++
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:11a9:: with SMTP id 9mr16160389ilj.288.1618301305601;
 Tue, 13 Apr 2021 01:08:25 -0700 (PDT)
Date:   Tue, 13 Apr 2021 01:08:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000075c58405bfd6228c@google.com>
Subject: [syzbot] general protection fault in gadget_setup
From:   syzbot <syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com>
To:     andreyknvl@gmail.com, balbi@kernel.org, dan.carpenter@oracle.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    0f4498ce Merge tag 'for-5.12/dm-fixes-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=124adbf6d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=daeff30c2474a60f
dashboard link: https://syzkaller.appspot.com/bug?extid=eb4674092e6cc8d9e0bd
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
CPU: 1 PID: 5016 Comm: systemd-udevd Not tainted 5.12.0-rc4-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:__lock_acquire+0xcfe/0x54c0 kernel/locking/lockdep.c:4770
Code: 09 0e 41 bf 01 00 00 00 0f 86 8c 00 00 00 89 05 48 69 09 0e e9 81 00 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <80> 3c 02 00 0f 85 5b 31 00 00 49 81 3e c0 13 38 8f 0f 84 d0 f3 ff
RSP: 0000:ffffc90000ce77d8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000004 RSI: 1ffff9200019cf0c RDI: 0000000000000020
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000006 R12: ffff88801295b880
R13: 0000000000000000 R14: 0000000000000020 R15: 0000000000000000
FS:  00007fcd745f98c0(0000) GS:ffff88802cb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe279f7d87 CR3: 000000001c7d4000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 lock_acquire kernel/locking/lockdep.c:5510 [inline]
 lock_acquire+0x1ab/0x740 kernel/locking/lockdep.c:5475
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x39/0x50 kernel/locking/spinlock.c:159
 gadget_setup+0x4e/0x510 drivers/usb/gadget/legacy/raw_gadget.c:327
 dummy_timer+0x1615/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1903
 call_timer_fn+0x1a5/0x6b0 kernel/time/timer.c:1431
 expire_timers kernel/time/timer.c:1476 [inline]
 __run_timers.part.0+0x67c/0xa50 kernel/time/timer.c:1745
 __run_timers kernel/time/timer.c:1726 [inline]
 run_timer_softirq+0xb3/0x1d0 kernel/time/timer.c:1758
 __do_softirq+0x29b/0x9f6 kernel/softirq.c:345
 invoke_softirq kernel/softirq.c:221 [inline]
 __irq_exit_rcu kernel/softirq.c:422 [inline]
 irq_exit_rcu+0x134/0x200 kernel/softirq.c:434
 sysvec_apic_timer_interrupt+0x45/0xc0 arch/x86/kernel/apic/apic.c:1100
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
RIP: 0033:0x560cfc4a02ed
Code: 4c 39 c1 48 89 42 18 4c 89 52 08 4c 89 5a 10 48 89 1a 0f 87 7b ff ff ff 48 89 f8 48 f7 d0 48 01 c8 48 83 e0 f8 48 8d 7c 07 08 <48> 8d 0d 34 d9 02 00 48 63 04 b1 48 01 c8 ff e0 0f 1f 00 48 8d 0d
RSP: 002b:00007ffe279f9dd0 EFLAGS: 00000246
RAX: 0000000000000000 RBX: 0000560cfcd88e40 RCX: 0000560cfcd72af0
RDX: 00007ffe279f9de0 RSI: 0000000000000007 RDI: 0000560cfcd72af0
RBP: 00007ffe279f9e70 R08: 0000000000000000 R09: 0000000000000020
R10: 0000560cfcd72af7 R11: 0000560cfcd73530 R12: 0000560cfcd72af0
R13: 0000000000000000 R14: 0000560cfcd72b10 R15: 0000000000000001
Modules linked in:
---[ end trace ab0f6632fdd289cf ]---
RIP: 0010:__lock_acquire+0xcfe/0x54c0 kernel/locking/lockdep.c:4770
Code: 09 0e 41 bf 01 00 00 00 0f 86 8c 00 00 00 89 05 48 69 09 0e e9 81 00 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <80> 3c 02 00 0f 85 5b 31 00 00 49 81 3e c0 13 38 8f 0f 84 d0 f3 ff
RSP: 0000:ffffc90000ce77d8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000004 RSI: 1ffff9200019cf0c RDI: 0000000000000020
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000006 R12: ffff88801295b880
R13: 0000000000000000 R14: 0000000000000020 R15: 0000000000000000
FS:  00007fcd745f98c0(0000) GS:ffff88802cb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe279f7d87 CR3: 000000001c7d4000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
