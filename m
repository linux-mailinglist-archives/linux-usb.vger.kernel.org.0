Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDEA32B355
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2019 13:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfE0LiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 May 2019 07:38:08 -0400
Received: from mail-it1-f197.google.com ([209.85.166.197]:53978 "EHLO
        mail-it1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfE0LiH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 May 2019 07:38:07 -0400
Received: by mail-it1-f197.google.com with SMTP id m14so15678509itl.3
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2019 04:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=3ofJz0VOtKLU8MeevgDTLa64a60th9mQF2FKBUhaEfo=;
        b=paDYKo/zKeKQv2gKnLSKuFDmAS9mCZkHDRGICcyyJIoBLPp3eHzP1AqphOFcgH8ZNu
         Vy6yjpIh2cTubTjmgZFEWQKwBa6QmAi3H1453DceQDhofeZmNRfGJlp7ajb5f0eSUlzi
         FlWr2MTvszbYe+e7nq7zrSplPv9VXiIpuIw0EzSJqx+D1zN/3+F03A7Lnr/qrgrapM+n
         FiIFvVUYVRyfJ/q5H9pkvG11s+UyH057FxVa+cwcZhdV+8HcbskwZZiEnWa7FRZGuUN3
         UnvlS7FgBy8u5lZyphHl53TKLJ2Wg4Lr/5vIPB4mWY/LW8152i/aS6VJyywCYkR/HeBd
         gZww==
X-Gm-Message-State: APjAAAWtcKGkr7vbQnxcRFXddWuBaPJ8VoeSbIEco1qny+U+2pbS0dyq
        cpoHK6ocFRP4ps7hDnNrk/Cj6hD/pHOv/rz1NiDw4a7Yb5HA
X-Google-Smtp-Source: APXvYqx3RE6uJKijGeIKhmkzojrhR8IqNMfF5lo/O5KVrJ1mEjMuBtHdWc7JwKkln31iNhl+Vphvgo3ijbgtwRp9AlqVFXgYeGkv
MIME-Version: 1.0
X-Received: by 2002:a6b:5812:: with SMTP id m18mr1656876iob.13.1558957086368;
 Mon, 27 May 2019 04:38:06 -0700 (PDT)
Date:   Mon, 27 May 2019 04:38:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005a6b660589dcfb60@google.com>
Subject: WARNING in line6_pcm_acquire
From:   syzbot <syzbot+192a537b5c634febc6cf@syzkaller.appspotmail.com>
To:     alsa-devel@alsa-project.org, andreyknvl@google.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, perex@perex.cz,
        syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=169fe1f8a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95aff7278e7ff25e
dashboard link: https://syzkaller.appspot.com/bug?extid=192a537b5c634febc6cf
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+192a537b5c634febc6cf@syzkaller.appspotmail.com

------------[ cut here ]------------
do not call blocking ops when !TASK_RUNNING; state=1 set at  
[<000000009424b595>] do_nanosleep+0x107/0x6a0 kernel/time/hrtimer.c:1675
WARNING: CPU: 0 PID: 4661 at kernel/sched/core.c:6136  
__might_sleep+0x135/0x190 kernel/sched/core.c:6136
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 4661 Comm: syz-executor.4 Not tainted 5.1.0-rc3+ #8
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x292/0x5e1 kernel/panic.c:214
  __warn.cold+0x20/0x53 kernel/panic.c:571
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:973
RIP: 0010:__might_sleep+0x135/0x190 kernel/sched/core.c:6136
Code: 65 48 8b 1c 25 c0 de 01 00 48 8d 7b 10 48 89 fe 48 c1 ee 03 80 3c 06  
00 75 2b 48 8b 73 10 48 c7 c7 c0 ec c5 85 e8 c6 4b f6 ff <0f> 0b e9 46 ff  
ff ff e8 2f d0 45 00 e9 29 ff ff ff e8 25 d0 45 00
RSP: 0018:ffff8881db207b48 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8881c7d71800 RCX: 0000000000000000
RDX: 0000000000000100 RSI: ffffffff8127bbcd RDI: ffffed103b640f5b
RBP: ffffffff85c622c0 R08: ffff8881c7d71800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000038c
R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff849f6d40
  __mutex_lock_common kernel/locking/mutex.c:908 [inline]
  __mutex_lock+0xc8/0x12b0 kernel/locking/mutex.c:1072
  line6_pcm_acquire+0x30/0x210 sound/usb/line6/pcm.c:311
  call_timer_fn+0x15c/0x5e0 kernel/time/timer.c:1325
  expire_timers kernel/time/timer.c:1362 [inline]
  __run_timers kernel/time/timer.c:1681 [inline]
  __run_timers kernel/time/timer.c:1649 [inline]
  run_timer_softirq+0x586/0x1400 kernel/time/timer.c:1694
  __do_softirq+0x21f/0x8bc kernel/softirq.c:293
  invoke_softirq kernel/softirq.c:374 [inline]
  irq_exit+0x17c/0x1a0 kernel/softirq.c:414
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0xf1/0x490 arch/x86/kernel/apic/apic.c:1062
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:807
  </IRQ>
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:81 [inline]
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160  
[inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x40/0x50  
kernel/locking/spinlock.c:184
Code: e8 25 19 bc fb 48 89 ef e8 dd f7 bc fb f6 c7 02 75 11 53 9d e8 a1 fd  
d8 fb 65 ff 0d 0a 59 99 7a 5b 5d c3 e8 d2 fb d8 fb 53 9d <eb> ed 0f 1f 40  
00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 65 ff
RSP: 0018:ffff8881b13ffba8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000246 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881c7d72034
RBP: ffff8881db224a80 R08: ffff8881c7d71800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffff8881db224b00 R14: ffff8881db224b00 R15: ffff8881db224a80
  unlock_hrtimer_base kernel/time/hrtimer.c:878 [inline]
  hrtimer_start_range_ns+0x5b0/0xad0 kernel/time/hrtimer.c:1109
  hrtimer_start_expires include/linux/hrtimer.h:409 [inline]
  do_nanosleep+0x19b/0x6a0 kernel/time/hrtimer.c:1676
  hrtimer_nanosleep+0x258/0x510 kernel/time/hrtimer.c:1733
  __do_sys_nanosleep kernel/time/hrtimer.c:1767 [inline]
  __se_sys_nanosleep kernel/time/hrtimer.c:1754 [inline]
  __x64_sys_nanosleep+0x19d/0x220 kernel/time/hrtimer.c:1754
  do_syscall_64+0xbd/0x500 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x486570
Code: 00 00 48 c7 c0 d4 ff ff ff 64 c7 00 16 00 00 00 31 c0 eb be 66 0f 1f  
44 00 00 83 3d e1 01 5d 00 00 75 14 b8 23 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 b4 e0 f8 ff c3 48 83 ec 08 e8 ea 53 fd ff
RSP: 002b:00007ffc588bb088 EFLAGS: 00000246 ORIG_RAX: 0000000000000023
RAX: ffffffffffffffda RBX: 00000000000a95fa RCX: 0000000000486570
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffc588bb090
RBP: 00000000000002d5 R08: 0000000000000001 R09: 00000000027fc940
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000008
R13: 00007ffc588bb0e0 R14: 00000000000a8e2a R15: 00007ffc588bb0f0
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
