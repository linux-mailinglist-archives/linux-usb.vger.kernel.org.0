Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3194171EC6
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 15:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387757AbgB0OaO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 09:30:14 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:42110 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731609AbgB0OaN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 09:30:13 -0500
Received: by mail-il1-f197.google.com with SMTP id 142so2098234ilc.9
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 06:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=3OqgC76fP0kjr4YLlTCi5pI1Jn450qdTK4H06iwYFuo=;
        b=rltawF+qE2e9v1cJTk2hvP5WQA6vT6AbFO0+e20t3hdIzEQk5oe1Xhsy64mut25PxW
         H1TMqKupRlTrQr1TO/Glh0pzW1wbbX0Pzuzhx5iYx5aRnYvEJ1e0f0dbX4dPzX0H9s7F
         LY92MkdeQ+e6Ds1bcBxtcKgX/BxvCfIJ430ZxisccmkqPLYAEZJP4rj6mJoI23DLnaMO
         66no/iigwHA5h6tFOuCy5ykZsjqhX+hHRs1dusmSvvBgBuaz0ELe/NseJdOZoh5KtgwN
         LCNTJtuWRUu/BzgYO133p4NskBCkOOYdX5jcknPbPELYst731Oj5tltduAnkLdI55mUB
         fgrg==
X-Gm-Message-State: APjAAAVtZrJHRyUPvA1uoNrwVam3SEMXmBmmhObqzjpkeCmql4n+aURd
        Idd+bpXzP5j6mNlGh2KB4yNR6jkgVmLLxol9NrYXaDxqjhRk
X-Google-Smtp-Source: APXvYqyyKQLeoDGp37+l5UbpfajaWovqQx98PMmc8wp3dDkJQyiWlUoq3cSrJpwleoRuSJ7Laig7RixfHHf7hJweWjXQiqvzgF9v
MIME-Version: 1.0
X-Received: by 2002:a92:af4b:: with SMTP id n72mr6123945ili.288.1582813812041;
 Thu, 27 Feb 2020 06:30:12 -0800 (PST)
Date:   Thu, 27 Feb 2020 06:30:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000033087059f8f8fa3@google.com>
Subject: BUG: soft lockup in sys_exit_group
From:   syzbot <syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        namit@vmware.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d6ff8147 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=147a92c3e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90a3d9bed5648419
dashboard link: https://syzkaller.appspot.com/bug?extid=cce32521ee0a824c21f7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147f1d09e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c88e45e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#0 stuck for 123s! [syz-executor413:1795]
Modules linked in:
irq event stamp: 35154
hardirqs last  enabled at (35153): [<ffffffff810047c1>] trace_hardirqs_on_thunk+0x1a/0x1c arch/x86/entry/thunk_64.S:41
hardirqs last disabled at (35154): [<ffffffff810047dd>] trace_hardirqs_off_thunk+0x1a/0x1c arch/x86/entry/thunk_64.S:42
softirqs last  enabled at (33516): [<ffffffff85c00673>] __do_softirq+0x673/0x950 kernel/softirq.c:319
softirqs last disabled at (33499): [<ffffffff811584b8>] invoke_softirq kernel/softirq.c:373 [inline]
softirqs last disabled at (33499): [<ffffffff811584b8>] irq_exit+0x178/0x1a0 kernel/softirq.c:413
CPU: 0 PID: 1795 Comm: syz-executor413 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__read_once_size include/linux/compiler.h:199 [inline]
RIP: 0010:check_kcov_mode kernel/kcov.c:155 [inline]
RIP: 0010:write_comp_data+0x17/0x70 kernel/kcov.c:208
Code: d0 76 07 48 89 34 d1 48 89 11 c3 0f 1f 84 00 00 00 00 00 65 4c 8b 04 25 00 0f 02 00 65 8b 05 78 b1 c2 7e a9 00 01 1f 00 75 51 <41> 8b 80 b0 12 00 00 83 f8 03 75 45 49 8b 80 b8 12 00 00 45 8b 80
RSP: 0018:ffff8881cdf77a38 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000002 RBX: 0000000000000001 RCX: ffffffff8134f89f
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000005
RBP: ffff8881cdf77b08 R08: ffff8881ce40b100 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffff8881ce5839c0 R15: ffff8881db233dc0
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe6518f0000 CR3: 0000000007021000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 csd_lock_wait kernel/smp.c:109 [inline]
 smp_call_function_single+0x2df/0x3a0 kernel/smp.c:311
 smp_call_function_many_cond+0x25e/0x900 kernel/smp.c:439
 flush_tlb_others arch/x86/include/asm/paravirt.h:68 [inline]
 flush_tlb_mm_range+0x1e8/0x3e0 arch/x86/mm/tlb.c:798
 tlb_flush arch/x86/include/asm/tlb.h:24 [inline]
 tlb_flush_mmu_tlbonly include/asm-generic/tlb.h:424 [inline]
 tlb_flush_mmu_tlbonly include/asm-generic/tlb.h:414 [inline]
 tlb_flush_mmu+0x274/0x630 mm/mmu_gather.c:248
 tlb_finish_mmu+0x93/0x420 mm/mmu_gather.c:328
 exit_mmap+0x298/0x4d0 mm/mmap.c:3128
 __mmput kernel/fork.c:1082 [inline]
 mmput+0xce/0x3d0 kernel/fork.c:1103
 exit_mm kernel/exit.c:485 [inline]
 do_exit+0xaa0/0x2c50 kernel/exit.c:788
 do_group_exit+0x125/0x340 kernel/exit.c:899
 __do_sys_exit_group kernel/exit.c:910 [inline]
 __se_sys_exit_group kernel/exit.c:908 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:908
 do_syscall_64+0xb6/0x5a0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4436c8
Code: Bad RIP value.
RSP: 002b:00007ffd45d85c48 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004436c8
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004c3e28 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 80603de77cf35948 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d7f20 R14: 0000000000000000 R15: 0000000000000000
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:line6_midibuf_read+0x486/0xa30 sound/usb/line6/midibuf.c:215
Code: 08 48 01 c1 48 89 0c 24 e8 97 4f 85 fc 44 89 f6 89 df e8 7d 50 85 fc 44 39 f3 0f 8d b4 02 00 00 e8 7f 4f 85 fc 48 8b 74 24 18 <48> 63 d3 48 8b 3c 24 e8 fe d2 ad fc 01 5d 10 e8 66 4f 85 fc 31 ff
RSP: 0018:ffff8881db3099e8 EFLAGS: 00000006
RAX: ffff8881da213100 RBX: 0000000000000000 RCX: ffffffff84ba0d63
RDX: 0000000000000100 RSI: ffff8881cdc8c81c RDI: 0000000000000004
RBP: ffff8881d4e6b4a0 R08: ffff8881da213100 R09: ffffed103a9cd641
R10: ffffed103a9cd640 R11: ffff8881d4e6b200 R12: 0000000000000001
R13: 000000000000001c R14: 00000000000003e4 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe6518f0000 CR3: 00000001cf791000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 line6_data_received+0x318/0x520 sound/usb/line6/driver.c:305
 __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1648
 usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1713
 dummy_timer+0x1258/0x32ae drivers/usb/gadget/udc/dummy_hcd.c:1966
 call_timer_fn+0x195/0x6f0 kernel/time/timer.c:1404
 expire_timers kernel/time/timer.c:1449 [inline]
 __run_timers kernel/time/timer.c:1773 [inline]
 __run_timers kernel/time/timer.c:1740 [inline]
 run_timer_softirq+0x5f9/0x1500 kernel/time/timer.c:1786
 __do_softirq+0x21e/0x950 kernel/softirq.c:292
 invoke_softirq kernel/softirq.c:373 [inline]
 irq_exit+0x178/0x1a0 kernel/softirq.c:413
 exiting_irq arch/x86/include/asm/apic.h:546 [inline]
 smp_apic_timer_interrupt+0x141/0x540 arch/x86/kernel/apic/apic.c:1146
 apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
 </IRQ>
RIP: 0010:default_idle+0x28/0x300 arch/x86/kernel/process.c:696
Code: cc cc 41 56 41 55 65 44 8b 2d 94 c9 72 7a 41 54 55 53 0f 1f 44 00 00 e8 16 bb b5 fb e9 07 00 00 00 0f 00 2d 3a 5f 53 00 fb f4 <65> 44 8b 2d 70 c9 72 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffff8881da22fda8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffff8881da213100 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da21394c
RBP: ffffed103b442620 R08: ffff8881da213100 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000001 R14: ffffffff87e60000 R15: 0000000000000000
 cpuidle_idle_call kernel/sched/idle.c:154 [inline]
 do_idle+0x3e0/0x500 kernel/sched/idle.c:269
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
 start_secondary+0x2a4/0x390 arch/x86/kernel/smpboot.c:264
 secondary_startup_64+0xb6/0xc0 arch/x86/kernel/head_64.S:242


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
