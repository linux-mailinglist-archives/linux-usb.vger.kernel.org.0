Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9626E175B75
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 14:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgCBNXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 08:23:13 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:42761 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbgCBNXN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 08:23:13 -0500
Received: by mail-il1-f198.google.com with SMTP id 142so10916798ilc.9
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2020 05:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=INLdR03jthaU6g+HiuNN1pfeqcUJ4RF41DZCoI0qMTY=;
        b=oYmUdUHUxoU1UiYNfosnKY6OYp1g5EfiwbIJ/mCnt65ltxrKdP2tJF+wE+wr8H9o0U
         3xzvg8pki6HgnE34hCmgtCXWn9180kOECMOpNaSIvhk5dUwmb9DGjfD8AAvqW9cYZVQ6
         ZZGpqa4QIwd+NyS11j8FaeDhfyQwzmrJLPhvjuwuAck5vrrANGK08QAr6lfzBbsuqgrJ
         Ion1lCCr6uoeQvm12VJ9npfx5Y4NrCP7XVBu14lSbI4SKx75ebjHirGTSPtxdL+eSlNX
         tWd0ewNYykGmbK2cNKC4nV/UpvqvkylBRQEyiPf9MwcMu6sMgHEsLe5Zp8IESxXAu3LG
         rSMg==
X-Gm-Message-State: APjAAAW7LUaSaYQ17+xPj/WYQfpf2T8INLb06bhgDEMzeOG2bYS28KB1
        2o8Oad6l1aoj1G3i9o90bXQrLM28G4+PIkIVTRGAA3yRu7oD
X-Google-Smtp-Source: APXvYqxBaOUZQUks29QG6L9pI8wsbB87LR6Uea2v2CMxOgabiRBo7Pe+5KCCSAdPwdlG1G9OUIdsJIo3T1ENamqHtGC2jIUZSR5f
MIME-Version: 1.0
X-Received: by 2002:a5e:930a:: with SMTP id k10mr13198718iom.132.1583155390805;
 Mon, 02 Mar 2020 05:23:10 -0800 (PST)
Date:   Mon, 02 Mar 2020 05:23:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b17a3d059fdf1646@google.com>
Subject: BUG: soft lockup in do_signal
From:   syzbot <syzbot+6679cb9a68b09bc3e24a@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=173e6d29e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90a3d9bed5648419
dashboard link: https://syzkaller.appspot.com/bug?extid=6679cb9a68b09bc3e24a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b252c3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14b57d09e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6679cb9a68b09bc3e24a@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#1 stuck for 122s! [syz-executor188:1805]
Modules linked in:
irq event stamp: 133304
hardirqs last  enabled at (133303): [<ffffffff810047c1>] trace_hardirqs_on_thunk+0x1a/0x1c arch/x86/entry/thunk_64.S:41
hardirqs last disabled at (133304): [<ffffffff810047dd>] trace_hardirqs_off_thunk+0x1a/0x1c arch/x86/entry/thunk_64.S:42
softirqs last  enabled at (133302): [<ffffffff85c00673>] __do_softirq+0x673/0x950 kernel/softirq.c:319
softirqs last disabled at (133295): [<ffffffff811584b8>] invoke_softirq kernel/softirq.c:373 [inline]
softirqs last disabled at (133295): [<ffffffff811584b8>] irq_exit+0x178/0x1a0 kernel/softirq.c:413
CPU: 1 PID: 1805 Comm: syz-executor188 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:csd_lock_wait kernel/smp.c:109 [inline]
RIP: 0010:smp_call_function_single+0x2d3/0x3a0 kernel/smp.c:311
Code: 83 64 0a 00 48 8b 54 24 08 4c 89 f9 8b 7c 24 14 48 8d 74 24 40 e8 cd f9 ff ff 41 89 c4 eb 07 e8 63 64 0a 00 f3 90 8b 5c 24 58 <31> ff 83 e3 01 89 de e8 c1 65 0a 00 85 db 75 e5 e8 48 64 0a 00 e9
RSP: 0018:ffff8881cd7577c0 EFLAGS: 00000293 ORIG_RAX: ffffffffffffff13
RAX: ffff8881ce3b9880 RBX: 0000000000000003 RCX: ffffffff8134f89f
RDX: 0000000000000000 RSI: ffffffff8134f88d RDI: 0000000000000005
RBP: ffff8881cd757898 R08: ffff8881ce3b9880 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000001 R14: ffff8881cdad1940 R15: ffff8881db333dc0
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007faa7dcafe4c CR3: 0000000007021000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
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
 get_signal+0x480/0x2470 kernel/signal.c:2734
 do_signal+0x88/0x1490 arch/x86/kernel/signal.c:813
 exit_to_usermode_loop+0x1a2/0x200 arch/x86/entry/common.c:160
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x44a089
Code: Bad RIP value.
RSP: 002b:00007faa7dcb0d98 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00000000006dbc48 RCX: 000000000044a089
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00000000006dbc48
RBP: 00000000006dbc40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc4c
R13: 000000000000009f R14: 000000000000b1ee R15: 00000000000000e7
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:check_kcov_mode kernel/kcov.c:153 [inline]
RIP: 0010:__sanitizer_cov_trace_pc+0x9/0x50 kernel/kcov.c:187
Code: cc 65 48 8b 04 25 00 0f 02 00 48 8b 80 c8 12 00 00 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 65 48 8b 04 25 00 0f 02 00 <65> 8b 15 c8 b1 c2 7e 81 e2 00 01 1f 00 48 8b 34 24 75 2b 8b 90 b0
RSP: 0018:ffff8881db2099e0 EFLAGS: 00000086
RAX: ffffffff8702cc40 RBX: 00000000000000ff RCX: ffffffff84ba0aae
RDX: 00000000000000ff RSI: 0000000000000000 RDI: 0000000000000001
RBP: ffff8881d54e68a0 R08: ffffffff8702cc40 R09: ffffed103aa9cd41
R10: ffffed103aa9cd40 R11: ffff8881d54e6a00 R12: 0000000000000012
R13: 000000000000001b R14: 00000000000003e5 R15: 0000000000000055
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb1cd436000 CR3: 00000001d35ba000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 midibuf_message_length sound/usb/line6/midibuf.c:18 [inline]
 line6_midibuf_read+0x1cb/0xa30 sound/usb/line6/midibuf.c:160
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
RSP: 0018:ffffffff87007d80 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffffffff8702cc40 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffffff8702d48c
RBP: fffffbfff0e05988 R08: ffffffff8702cc40 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffffffff87e60000 R15: 0000000000000000
 cpuidle_idle_call kernel/sched/idle.c:154 [inline]
 do_idle+0x3e0/0x500 kernel/sched/idle.c:269
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
 start_kernel+0xde3/0xe27 init/main.c:992
 secondary_startup_64+0xb6/0xc0 arch/x86/kernel/head_64.S:242


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
